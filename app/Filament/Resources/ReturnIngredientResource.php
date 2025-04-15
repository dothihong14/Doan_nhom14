<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ReturnIngredientResource\Pages;
use App\Filament\Resources\ReturnIngredientResource\RelationManagers;
use App\Models\Ingredient;
use App\Models\Restaurant;
use App\Models\ReturnIngredient;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ReturnIngredientResource extends Resource
{
    protected static ?string $model = ReturnIngredient::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $modelLabel = 'Quản lý vé đổi trả nguyên liệu';
    protected static ?string $title = 'Danh sách đổi trả nguyên liệu';
    protected static ?int $navigationSort = 100;

    protected static ?string $pluralModelLabel = 'Danh sách đổi trả nguyên liệu';

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\Section::make('Thông tin')
                ->label('Thông tin')
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
                                }
                            }
                        }),
                    Forms\Components\DatePicker::make('return_date')
                        ->label('Ngày yêu cầu trả')
                        ->default(now()->format('Y-m-d'))
                        ->required(),
                ])->columns(2),
            Forms\Components\Section::make('Chi tiết')
                ->label('Chi tiết')
                ->schema([
                    Forms\Components\Repeater::make('details')
                        ->relationship('details')
                        ->label('Chi tiết')
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
                            Forms\Components\TextInput::make('reason')
                                ->label('Lý do')
                                ->required(),
                            Forms\Components\FileUpload::make('image_url')
                                ->label('Hình ảnh')
                                ->image()
                                ->disk('public')
                                ->required()
                                ->acceptedFileTypes(['image/*']),
                        ])->columns(4),
                ]),
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
                Tables\Columns\TextColumn::make('return_date')
                    ->label('Ngày yêu cầu')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Ngày tạo')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: false),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Ngày cập nhật')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: false),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Xem'), // Đổi nhãn sang tiếng Việt
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh Sửa'), // Đổi nhãn sang tiếng Việt
                    Tables\Actions\DeleteAction::make()
                        ->label('Xóa'), // Đổi nhãn sang tiếng Việt
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->label('Xóa'), // Đổi nhãn sang tiếng Việt
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
            'index' => Pages\ListReturnIngredients::route('/'),
            'create' => Pages\CreateReturnIngredient::route('/create'),
            'edit' => Pages\EditReturnIngredient::route('/{record}/edit'),
        ];
    }
}
