<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MaterialTransactionResource\Pages;
use App\Models\MaterialTransaction;
use App\Models\Restaurant;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use App\Filament\Resources\WarehouseReceiptResource\RelationManagers;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
class MaterialTransactionResource extends Resource
{
    protected static ?string $model = MaterialTransaction::class;

    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $navigationLabel = 'Phiếu Xuất Kho';
    protected static ?string $title = 'Phiếu Xuất Kho';
    protected static ?string $pluralTitle = 'Phiếu Xuất Kho';
    protected static ?string $pluralModelLabel = 'Phiếu Xuất Kho';
    protected static ?string $modelLabel = 'Phiếu Xuất Kho';
    protected static ?string $navigationIcon = 'heroicon-o-arrow-path';

    public static function getPluralModelLabel(): string
    {
        return 'Phiếu xuất kho';
    }
    protected static ?int $navigationSort = 98;

    /**
     * @param Form $form
     * @return Form
     */
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Thông tin phiếu xuất kho')
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
                                        $set("details.{$index}.reason", null);
                                        $set("details.{$index}.image_url", null);
                                    }
                                }
                            }),
                        Forms\Components\DatePicker::make('export_date')
                            ->label('Ngày xuất')
                            ->required(),
                        Forms\Components\Select::make('exported_by')
                            ->label('Người xuất')
                            ->options(User::all()->pluck('name', 'id'))
                            ->searchable()
                            ->required(),
                    ])
                    ->columns(3),

                Forms\Components\Section::make('Chi tiết xuất kho')
                    ->schema([
                        Forms\Components\Repeater::make('details')
                            ->label('Chi tiết xuất kho')
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
                                    ->required()
                                    ->rules(function (callable $get) {
                                        $ingredientId = $get('ingredient_id');
                                        $restaurantId = $get('../../restaurant_id');
                                        if (!$ingredientId || !$restaurantId) {
                                            return [];
                                        }
                                        $ingredient = \App\Models\Ingredient::where('id', $ingredientId)
                                            ->where('restaurant_id', $restaurantId)
                                            ->first();
                                        if (!$ingredient) {
                                            return [];
                                        }
                                        return ['max:' . $ingredient->quantity_in_stock];
                                    }),
                                Forms\Components\Select::make('reason')
                                    ->label('Lý do')
                                    ->options([
                                        'Nguyên liệu hỏng' => 'Nguyên liệu hỏng',
                                        'Xuất cơ sở khác' => 'Xuất cơ sở khác',
                                        'Khác' => 'Khác'
                                    ])
                                    ->reactive()
                                    ->required()
                                    ->afterStateUpdated(function (callable $set, $state) {
                                        if ($state !== 'Nguyên liệu hỏng') {
                                            $set('image_url', null);
                                        }
                                    }),
                                Forms\Components\TextInput::make('custom_reason')
                                    ->label('Lý do khác')
                                    ->required(fn (callable $get) => $get('reason') === 'Khác')
                                    ->visible(fn (callable $get) => $get('reason') === 'Khác')
                                    ->maxLength(255)
                                    ->reactive(),
                                Forms\Components\FileUpload::make('image_url')
                                    ->label('Hình ảnh')
                                    ->image()
                                    ->disk('public')
                                    ->directory('exports')
                                    ->required(fn (callable $get) => $get('reason') === 'Nguyên liệu hỏng')
                                    ->visible(fn (callable $get) => $get('reason') === 'Nguyên liệu hỏng')
                                    ->acceptedFileTypes(['image/*']),
                            ])
                            ->mutateRelationshipDataBeforeFillUsing(function (array $data): array {
                                $fixedReasons = ['Nguyên liệu hỏng', 'Xuất cơ sở khác', 'Khác'];
                                if (!in_array($data['reason'], $fixedReasons)) {
                                    $data['custom_reason'] = $data['reason'];
                                    $data['reason'] = 'Khác';
                                }
                                return $data;
                            })
                            ->mutateRelationshipDataBeforeSaveUsing(function (array $data): array {
                                if ($data['reason'] === 'Khác' && !empty($data['custom_reason'])) {
                                    $data['reason'] = $data['custom_reason'];
                                }
                                unset($data['custom_reason']);
                                return $data;
                            })
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
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->label('Cơ sở')
                    ->searchable(),
                Tables\Columns\TextColumn::make('export_date')
                    ->label('Ngày xuất')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Người xuất')
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
            ->filters([])
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
        return [
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMaterialTransactions::route('/'),
            'create' => Pages\CreateMaterialTransaction::route('/create'),
            'edit' => Pages\EditMaterialTransaction::route('/{record}/edit'),
        ];
    }
}
