<?php

namespace App\Filament\Resources;

use App\Filament\Resources\WarehouseReceiptResource\Pages;
use App\Filament\Resources\WarehouseReceiptResource\RelationManagers;
use App\Models\Restaurant;
use App\Models\User;
use App\Models\WarehouseReceipt;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class WarehouseReceiptResource extends Resource
{
    protected static ?string $model = WarehouseReceipt::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $title = 'Phiếu nhập kho';
    protected static ?string $modelLabel = 'Phiếu nhập kho';
    protected static ?string $pluralModelLabel = 'Phiếu nhập kho';
    protected static ?int $navigationSort = 99;


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Thông tin phiếu nhập kho')
                    ->schema([
                        Forms\Components\Select::make('restaurant_id')
                            ->label('Cơ sở')
                            ->options(Restaurant::all()->pluck('name', 'id'))
                            ->required()
                            ->reactive()
                            ->searchable()
                            ->visible(fn () => !auth()->user()->restaurant_id)
                            ->afterStateUpdated(function (callable $get, callable $set) {
                                $details = $get('details') ?? [];

                                if (empty($details)) {
                                    return;
                                }

                                $restaurantId = $get('restaurant_id');
                                if (!$restaurantId) {
                                    return;
                                }

                                $validIngredientIds = \App\Models\Ingredient::where('restaurant_id', $restaurantId)
                                    ->pluck('id')
                                    ->toArray();

                                foreach ($details as $index => $detail) {
                                    $currentIngredientId = $detail['ingredient_id'] ?? null;

                                    if ($currentIngredientId && !in_array($currentIngredientId, $validIngredientIds)) {
                                        $set("details.{$index}.ingredient_id", null);
                                        $set("details.{$index}.actual_quantity", null);
                                        $set("details.{$index}.unit_price", null);
                                    }
                                }
                            }),
                        Forms\Components\DatePicker::make('import_date')
                            ->label('Ngày nhập')
                            ->required(),
                        Forms\Components\Select::make('imported_by')
                            ->label('Người nhập')
                            ->default(auth()->user()->id)
                            ->options(\App\Models\User::all()->pluck('name', 'id'))
                            ->searchable()
                            ->required(),
                        Forms\Components\TextInput::make('supplier')
                            ->label('Nhà cung cấp')
                            ->required()
                            ->maxLength(255),
                    ])
                    ->columns(3),

                Forms\Components\Section::make('Chi tiết nhập kho')
                    ->schema([
                        Forms\Components\Repeater::make('details')
                            ->label('Chi tiết nhập kho')
                            ->relationship('details')
                            ->schema([
                                Forms\Components\Select::make('ingredient_id')
                                    ->label('Nguyên liệu')
                                    ->options(function (callable $get) {
                                        if (!auth()->user()->restaurant_id) {
                                            $restaurantId = $get('../../restaurant_id');
                                            if (!$restaurantId) {
                                                return [];
                                            }
                                            return \App\Models\Ingredient::where('restaurant_id', $restaurantId)
                                                ->pluck('name', 'id');
                                        }
                                        return \App\Models\Ingredient::all()->pluck('name', 'id');
                                    })
                                    ->required()
                                    ->searchable()
                                    ->reactive(),
                                Forms\Components\TextInput::make('actual_quantity')
                                    ->label('Số lượng thực tế')
                                    ->numeric()
                                    ->required(),
                                Forms\Components\TextInput::make('unit_price')
                                    ->label('Đơn giá')
                                    ->numeric()
                                    ->prefix('₫')
                                    ->required(),
                            ])
                            ->columns(3),
                    ])
                    ->columnSpan('full'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('ID')
                    ->sortable(),
                Tables\Columns\TextColumn::make('import_date')
                    ->label('Ngày nhập')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Người nhập')
                    ->searchable(),
                Tables\Columns\TextColumn::make('supplier')
                    ->label('Nhà cung cấp')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Ngày tạo')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Ngày cập nhật')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
            ])
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
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListWarehouseReceipts::route('/'),
            'create' => Pages\CreateWarehouseReceipt::route('/create'),
            'edit' => Pages\EditWarehouseReceipt::route('/{record}/edit'),
        ];
    }
}
