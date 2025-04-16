<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Dish;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\TableDish;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    public static function getPluralModelLabel(): string
    {
        return 'Danh sách đơn hàng trực tuyến';
    }

    protected static ?string $navigationGroup = 'Quản lý Hóa đơn';
    protected static ?string $navigationLabel = 'Đơn hàng trực tuyến';
    protected static ?string $modelLabel = 'Đơn hàng trực tuyến';
    protected static ?string $navigationIcon = 'heroicon-o-shopping-cart';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Thông tin đơn hàng')
                    ->description('Nhập thông tin chi tiết cho đơn hàng.')
                    ->schema([
                        Forms\Components\TextInput::make('phone')
                            ->tel()
                            ->numeric()
                            ->required()
                            ->maxLength(255)
                            ->label('Số điện thoại')
                            ->regex('/^0(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-9]|9[0-9])[0-9]{7}$/')
                            ->validationMessages([
                                'regex' => 'Số điện thoại không đúng định dạng Việt Nam (ví dụ: 0912345678).',
                            ])
                            ->reactive()
                            ->afterStateUpdated(function ($state, callable $set) {
                                $user = User::where('phone', $state)->first();
                                if ($user) {
                                    $set('name', $user->name);
                                    $set('email', $user->email);
                                    $set('address', $user->address);
                                    $set('user_id', $user->id);
                                    $set('has_user', true);
                                    $set('loyalty_points', $user->loyalty_points ?? 0);
                                } else {
                                    $set('user_id', null);
                                    $set('has_user', false);
                                    $set('loyalty_points', 0);
                                }
                            })
                            ->afterStateHydrated(function ($set, $record) {
                                if ($record && $record->user_id && $record->user) {
                                    $set('phone', $record->user->phone);
                                }
                            }),

                        Forms\Components\Hidden::make('user_id'),
                        Forms\Components\Hidden::make('has_user')
                            ->default(false)
                            ->afterStateHydrated(function ($set, $record) {
                                if ($record && $record->user_id && $record->user) {
                                    $set('has_user', true);
                                }
                            }),

                        Forms\Components\TextInput::make('name')
                            ->required()
                            ->label('Tên người đặt')
                            ->afterStateHydrated(function ($set, $record) {
                                if ($record && $record->user_id && $record->user) {
                                    $set('name', $record->user->name);
                                }
                            }),

                        Forms\Components\TextInput::make('email')
                            ->label('Email')
                            ->email()
                            ->afterStateHydrated(function ($set, $record) {
                                if ($record && $record->user_id && $record->user) {
                                    $set('email', $record->user->email);
                                }
                            }),

                        Forms\Components\TextInput::make('address')
                            ->required()
                            ->label('Địa chỉ giao hàng')
                            ->afterStateHydrated(function ($set, $record) {
                                if ($record && $record->user_id && $record->user) {
                                    $set('address', $record->user->address);
                                }
                            }),

                        Forms\Components\Select::make('status')
                            ->options([
                                'pending' => 'Đang chờ',
                                'confirmed' => 'Đã xác nhận',
                                'on_the_way' => 'Đang giao hàng',
                                'delivered' => 'Đã giao hàng',
                                'canceled' => 'Đã hủy',
                            ])
                            ->required()
                            ->label('Trạng thái'),

                        Forms\Components\TextInput::make('total_amount')
                            ->required()
                            ->numeric()
                            ->readOnly()
                            ->label('Tổng đơn hàng')
                            ->reactive()
                            ->afterStateHydrated(function ($set, $get, $record) {
                                $items = $get('items') ?? ($record->items ?? []);
                                $total = collect($items)->sum('total_price');
                                $set('total_amount', $total);
                            })
                            ->afterStateUpdated(function ($set, $get) {
                                static::updateFinalAmount($set, $get);
                            }),

                        Forms\Components\Fieldset::make('loyalty_points_section')
                            ->label('Quản lý điểm tích lũy')
                            ->schema([
                                Forms\Components\Group::make()
                                    ->schema([
                                        Forms\Components\Placeholder::make('user_points')
                                            ->label('Số điểm hiện tại')
                                            ->content(function ($get) {
                                                $points = $get('loyalty_points') ?? 0;
                                                return $points > 0 ? $points . ' điểm' : 'Không có điểm';
                                            }),
                                        Forms\Components\Checkbox::make('point_discount_amount')
                                            ->label('Đổi điểm')
                                            ->reactive()
                                            ->default(false)
                                            ->afterStateUpdated(function ($state, callable $set, $get) {
                                                static::updateFinalAmount($set, $get);
                                            })
                                            ->dehydrated(true)
                                            ->dehydrateStateUsing(function ($state) {
                                                return (bool) $state;
                                            }),
                                    ])
                                    ->columns(2),

                                Forms\Components\Hidden::make('point_discount')
                                    ->default(0)
                                    ->dehydrated(true)
                                    ->dehydrateStateUsing(function ($state, $get) {
                                        $points = 0;
                                        if ($get('point_discount_amount') && $get('has_user')) {
                                            $points = $get('loyalty_points') ?? 0;
                                        }
                                        return $points;
                                    }),

                                Forms\Components\Placeholder::make('point_discount_amount')
                                    ->label('Số điểm quy đổi')
                                    ->content(function ($get) {
                                        if ($get('point_discount_amount')) {
                                            $points = $get('loyalty_points') ?? 0;
                                            return number_format($points) . ' điểm';
                                        }
                                        return 'Không áp dụng điểm';
                                    })
                                    ->visible(fn($get) => $get('point_discount_amount')),

                                Forms\Components\Hidden::make('loyalty_points')
                                    ->default(0)
                                    ->dehydrated(true)
                                    ->afterStateHydrated(function ($set, $record) {
                                        if ($record && $record->user_id && $record->user) {
                                            $set('loyalty_points', $record->user->loyalty_points ?? 0);
                                        }
                                    }),
                            ])
                            ->visible(fn($get) => $get('has_user')),

                        Forms\Components\TextInput::make('final_amount')
                            ->required()
                            ->numeric()
                            ->readOnly()
                            ->label('Tổng thanh toán')
                            ->reactive()
                            ->afterStateHydrated(function ($set, $get, $record) {
                                static::updateFinalAmount($set, $get);
                            }),

                        Forms\Components\Select::make('payment_method')
                            ->options([
                                'cod' => 'Thanh toán tiền mặt',
                                'bank' => 'Chuyển khoản',
                            ])
                            ->required()
                            ->label('Phương thức thanh toán'),

                        Forms\Components\Select::make('payment_status')
                            ->options([
                                'unpaid' => 'Chưa thanh toán',
                                'paid' => 'Đã thanh toán',
                            ])
                            ->required()
                            ->label('Trạng thái thanh toán'),

                        Forms\Components\DateTimePicker::make('created_at')
                            ->label('Ngày đặt hàng')
                            ->default(now()),

                        Forms\Components\Select::make('restaurant_id')
                            ->relationship('restaurant', 'name')
                            ->required()
                            ->label('Nhà hàng')
                            ->visible(fn () => !auth()->user()->restaurant_id),

                        Forms\Components\Textarea::make('notes')
                            ->label('Ghi chú')
                            ->rows(3),
                    ])
                    ->columns(4),

                Section::make('Chi tiết hóa đơn')
                    ->schema([
                        Forms\Components\Repeater::make('items')
                            ->label('Món ăn')
                            ->relationship('items')
                            ->schema([
                                Forms\Components\Select::make('dish_id')
                                    ->label('Món ăn')
                                    ->options(Dish::pluck('name', 'id'))
                                    ->required()
                                    ->reactive()
                                    ->afterStateUpdated(function ($state, callable $set, $get) {
                                        $dish = Dish::find($state);
                                        if ($dish) {
                                            $set('unit_price', $dish->price);
                                            $set('total_price', $dish->price * $get('quantity'));
                                        } else {
                                            $set('unit_price', 0);
                                            $set('total_price', 0);
                                        }
                                        static::updateTotalAndFinalAmount($set, $get);
                                    }),

                                Forms\Components\TextInput::make('quantity')
                                    ->label('Số lượng')
                                    ->required()
                                    ->numeric()
                                    ->default(1)
                                    ->reactive()
                                    ->afterStateUpdated(function ($state, callable $set, $get) {
                                        $set('total_price', $state * $get('unit_price'));
                                        static::updateTotalAndFinalAmount($set, $get);
                                    }),

                                Forms\Components\TextInput::make('unit_price')
                                    ->label('Đơn giá')
                                    ->numeric()
                                    ->suffix('VNĐ')
                                    ->required()
                                    ->readOnly(),

                                Forms\Components\TextInput::make('total_price')
                                    ->label('Thành tiền')
                                    ->numeric()
                                    ->suffix('VNĐ')
                                    ->required()
                                    ->dehydrated(true)
                                    ->reactive()
                                    ->readOnly(),
                            ])
                            ->columns(4)
                            ->afterStateUpdated(function ($set, $get) {
                                static::updateTotalAndFinalAmount($set, $get);
                            }),
                    ]),
            ]);
    }

    protected static function updateTotalAndFinalAmount(callable $set, $get)
    {
        $items = $get('items') ?? [];
        $total_amount = collect($items)->sum('total_price');
        $set('total_amount', $total_amount);

        static::updateFinalAmount($set, $get);
    }

    protected static function updateFinalAmount(callable $set, $get)
    {
        $total_amount = $get('total_amount') ?? 0;
        $point_discount = 0;

        if ($get('point_discount_amount') && $get('has_user')) {
            $points = $get('loyalty_points') ?? 0;
            $point_discount = $points;
        }

        $final_amount = $total_amount - $point_discount;
        $set('final_amount', max(0, $final_amount));
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('order_code')
                    ->searchable()
                    ->label('Mã đơn hàng'),
                Tables\Columns\TextColumn::make('name')
                    ->numeric()
                    ->searchable()
                    ->sortable()
                    ->label('Tên người đặt'),
                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->sortable()
                    ->label('Email')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\SelectColumn::make('status')
                    ->options([
                        'pending' => 'Đang chờ',
                        'confirmed' => 'Đã xác nhận',
                        'on_the_way' => 'Đang giao hàng',
                        'delivered' => 'Đã giao hàng',
                        'canceled' => 'Đã hủy',
                    ])
                    ->afterStateUpdated(function ($state, $record) {
                        if ($state == 'confirmed') {
                            $orderItems = OrderItem::where('order_id', $record->id)->get();
                            foreach ($orderItems as $item) {
                                TableDish::create([
                                    'dish_id' => $item->dish_id,
                                    'quantity' => $item->quantity,
                                    'status' => 'pending',
                                    'order_code' => $item->order->order_code,
                                ]);
                            }
                        }
                    })
                    ->label('Trạng thái'),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->label('Cơ sở'),
                Tables\Columns\TextColumn::make('total_amount')
                    ->numeric()
                    ->sortable()
                    ->money('VND')
                    ->label('Tổng tiền'),
                Tables\Columns\TextColumn::make('payment_method')
                    ->badge()
                    ->label('Phương thức thanh toán')
                    ->formatStateUsing(function ($state) {
                        return $state == 'cod' ? 'Thanh toán tiền mặt' : 'Chuyển khoản';
                    }),
                Tables\Columns\SelectColumn::make('payment_status')
                    ->options([
                        'unpaid' => 'Chưa thanh toán',
                        'paid' => 'Đã thanh toán',
                    ])
                    ->label('Trạng thái thanh toán'),
                Tables\Columns\TextColumn::make('phone')
                    ->label('Số điện thoại'),
                Tables\Columns\TextColumn::make('address')
                    ->label('Địa chỉ giao hàng'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày tạo'),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Xem'),
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh Sửa'),
                    Tables\Actions\DeleteAction::make()
                        ->label('Xóa'),
                    Tables\Actions\Action::make('print')
                        ->label('In đơn hàng')
                        ->icon('heroicon-o-printer')
                        ->url(fn (Order $record) => route('orders.print', $record))
                        ->openUrlInNewTab(),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->label('Xóa'),
                    ExportBulkAction::make(),
                ]),
            ]);
    }

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }
}
