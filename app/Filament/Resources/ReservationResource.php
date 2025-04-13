<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ReservationResource\Pages;
use App\Filament\Resources\ReservationResource\RelationManagers;
use App\Models\Reservation;
use App\Models\Restaurant;
use App\Models\User;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\DB;

class ReservationResource extends Resource
{
    protected static ?string $model = Reservation::class;
    protected static ?string $navigationGroup = 'Quản lý Nhà Hàng';
    protected static ?string $navigationLabel = 'Lịch đặt bàn';
    protected static ?string $modelLabel = 'Lịch đặt bàn';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách đặt bàn';
    }
    protected static ?string $navigationIcon = 'heroicon-o-calendar';
    protected static ?int $navigationSort = 1;


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Thông tin người đặt')
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->required()
                            ->maxLength(255)
                            ->label('Tên'),
                        Forms\Components\TextInput::make('phone')
                            ->tel()
                            ->inputMode('numeric')
                            ->required()
                            ->maxLength(255)
                            ->label('Số điện thoại')
                            ->regex('/^0(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-9]|9[0-9])[0-9]{7}$/')
                            ->validationMessages([
                                'regex' => 'Số điện thoại không đúng định dạng Việt Nam (ví dụ: 0912345678).',
                            ]),
                    ])->columns(2),

                Forms\Components\Section::make('Thông tin đặt chỗ')
                    ->schema([
                        Forms\Components\Select::make('user_id')
                            ->options(User::all()->pluck('name', 'id'))
                            ->label('Tài khoản người dùng'),
                        Forms\Components\Select::make('restaurant_id')
                            ->options(Restaurant::all()->pluck('name', 'id'))
                            ->label('Cơ sở')
                            ->required()
                            ->visible(fn () => !auth()->user()->restaurant_id)
                            ->reactive(),
                        Forms\Components\TextInput::make('number_of_people')
                            ->required()
                            ->numeric()
                            ->reactive()
                            ->label('Số lượng người'),
                        Forms\Components\DatePicker::make('reservation_day')
                            ->required()
                            ->label('Ngày đặt')
                            ->default(Carbon::today())
                            ->reactive(),
                        Forms\Components\TimePicker::make('reservation_time')
                            ->required()
                            ->label('Thời gian đặt')
                            ->default(Carbon::now())
                            ->reactive(),
//                        Forms\Components\Select::make('table_id')
//                            ->label('Chọn bàn')
//                            ->options(function (callable $get) {
//                                $restaurantId = auth()->user()->restaurant_id ?? $get('restaurant_id');
//                                if (!$restaurantId) {
//                                    return [];
//                                }
//
//                                $reservationDay = $get('reservation_day') ?? Carbon::today()->toDateString();
//                                $reservationTime = $get('reservation_time') ? Carbon::parse($get('reservation_time')) : Carbon::now();
//                                $numberOfPeople = $get('number_of_people') ?? 9999;
//
//                                return \App\Models\Table::query()
//                                    ->where('restaurant_id', $restaurantId)
//                                    ->where('status', 'available')
//                                    ->where('number_guest', '>=', $numberOfPeople)
//                                    ->whereDoesntHave('reservations', function ($query) use ($reservationDay, $reservationTime) {
//                                        $query->where('reservation_day', $reservationDay)
//                                            ->whereRaw(
//                                                '? BETWEEN DATE_SUB(CAST(reservation_time AS TIME), INTERVAL 1 HOUR) AND CAST(reservation_time AS TIME)',
//                                                [$reservationTime->format('H:i:s')]
//                                            );
//                                    })
//                                    ->pluck('table_code', 'id')
//                                    ->toArray();
//                            })
//                            ->searchable()
//                            ->required(),

                        Forms\Components\Select::make('table_id')
                            ->label('Chọn bàn')
                            ->options(function (callable $get, $record) {
                                $restaurantId = auth()->user()->restaurant_id ?? $get('restaurant_id');
                                if (!$restaurantId) {
                                    return [];
                                }

                                $reservationDay = $get('reservation_day') ?? Carbon::today()->toDateString();
                                $reservationTime = $get('reservation_time') ? Carbon::parse($get('reservation_time')) : Carbon::now();
                                $numberOfPeople = $get('number_of_people') ?? 9999;

                                $query = \App\Models\Table::query()
                                    ->where('restaurant_id', $restaurantId)
                                    ->where('status', 'available')
                                    ->where('number_guest', '>=', $numberOfPeople)
                                    ->whereDoesntHave('reservations', function ($query) use ($reservationDay, $reservationTime) {
                                        $query->where('reservation_day', $reservationDay)
                                            ->whereRaw(
                                                '? BETWEEN DATE_SUB(CAST(reservation_time AS TIME), INTERVAL 1 HOUR) AND CAST(reservation_time AS TIME)',
                                                [$reservationTime->format('H:i:s')]
                                            );
                                    });

                                if ($record && $record->table_id) {
                                    $query->orWhere('id', $record->table_id);
                                }

                                $tables = $query->pluck('table_code', 'id')->toArray();
                                \Illuminate\Support\Facades\Log::info('Table options for select', ['tables' => $tables]);

                                return $tables;
                            })
                            ->getOptionLabelFromRecordUsing(function ($record) {
                                \Illuminate\Support\Facades\Log::info('Table record for label', [
                                    'id' => $record->id,
                                    'table_code' => $record->table_code ?? 'Not found',
                                ]);
                                return $record->table_code ?? 'Unknown';
                            })
                            ->searchable()
                            ->required(),

                        Forms\Components\Textarea::make('notes')
                            ->required()
                            ->maxLength(255)
                            ->label('Ghi chú'),
                    ])->columns(3),

                Forms\Components\Section::make('Trạng thái')
                    ->schema([
                        Forms\Components\Select::make('status')
                            ->required()
                            ->options([
                                'pending' => 'Chờ xác nhận',
                                'confirmed' => 'Đã xác nhận',
                                'completed' => 'Đã hoàn thành',
                                'cancelled' => 'Đã hủy',
                            ])
                            ->default('confirmed')
                            ->disabled()
                            ->label('Trạng thái'),
                    ]),
            ]);
    }
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->numeric()
                    ->searchable()
                    ->label('Tên người đặt')
                    ->sortable(),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->numeric()
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->searchable()
                    ->label('Tên nhà hàng')
                    ->sortable(),
                Tables\Columns\SelectColumn::make('table_id')
                    ->options(function ($record) {
                        $restaurantId = $record->restaurant_id;
                        $reservationDay = $record->reservation_day;
                        $reservationTime = Carbon::parse($record->reservation_time);

                        $tables = \App\Models\Table::query()
                            ->where('restaurant_id', $restaurantId)
                            ->where('status', 'available')
                            ->where('number_guest', '>=', $record->number_of_people)
                            ->whereDoesntHave('reservations', function ($query) use ($reservationDay, $reservationTime, $record) {
                                $query->where('reservation_day', $reservationDay)
                                    ->where('id', '!=', $record->id)
                                    ->where(function ($subQuery) use ($reservationTime) {
                                        $subQuery->whereRaw(
                                            '? BETWEEN DATE_SUB(CAST(reservation_time AS TIME), INTERVAL 1 HOUR) AND CAST(reservation_time AS TIME)',
                                            [$reservationTime->format('H:i:s')]
                                        );
                                    });
                            })
                            ->pluck('table_code', 'id')
                            ->toArray();

                        return $tables;
                    })
                    ->searchable()
                    ->label('Chọn bàn')
                    ->sortable(),
                Tables\Columns\TextColumn::make('number_of_people')
                    ->numeric()
                    ->label('Số lượng người')
                    ->sortable(),
                Tables\Columns\TextColumn::make('reservation_time')
                    ->sortable()
                    ->searchable()
                    ->label('Giờ đặt')
                   ,
                Tables\Columns\TextColumn::make('notes')
                    ->searchable()
                    ->label('Ghi chú')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->label('Tên người đặt'),
                Tables\Columns\TextColumn::make('phone')
                    ->searchable()
                    ->label('Số điện thoại'),
                Tables\Columns\TextColumn::make('reservation_day')
                    ->searchable()
                    ->sortable()
                    ->label('Ngày đặt'),
                Tables\Columns\SelectColumn::make('status')
                    ->options([
                        'pending' => 'Chờ xác nhận',
                        'confirmed' => 'Đã xác nhận',
                        'completed' => 'Đã hoàn thành',
                        'cancelled' => 'Đã hủy',
                    ])
                    ->label('Trạng thái'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->label('Ngày tạo')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->label('Ngày cập nhật')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('restaurant_id')
                    ->label('Nhà hàng')
                    ->options(Restaurant::all()->pluck('name', 'id'))
                    ->searchable()
                    ->placeholder('Chọn nhà hàng'),

                Tables\Filters\SelectFilter::make('status')
                    ->label('Trạng thái')
                    ->options([
                        'pending' => 'Chờ xác nhận',
                        'confirmed' => 'Đã xác nhận',
                        'cancelled' => 'Đã hủy',
                    ])
                    ->placeholder('Chọn trạng thái'),
            ])
            ->recordUrl(null)
            ->recordAction('view')
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Xem'),
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh Sửa'),
                    Tables\Actions\DeleteAction::make()
                        ->label('Xóa'),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->label('Xóa'),
                ]),
            ]);
    }
     public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListReservations::route('/'),
            'create' => Pages\CreateReservation::route('/create'),
            'edit' => Pages\EditReservation::route('/{record}/edit'),
        ];
    }
}
