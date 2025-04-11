<?php

namespace App\Filament\Resources;

use App\Filament\Resources\IngredientResource\Pages;
use App\Filament\Resources\IngredientResource\RelationManagers;
use App\Models\Ingredient;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class IngredientResource extends Resource
{
    protected static ?int $navigationSort = 97;


    protected static ?string $model = Ingredient::class;
    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $modelLabel = 'Quản lý nguyên liệu';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách nguyên liệu';
    }

    protected static ?string $navigationIcon = 'heroicon-o-cube';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Card::make()
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->label('Tên nguyên liệu')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\FileUpload::make('image')
                            ->label('Ảnh')
                            ->image()
                            ->required()
                            ->imageEditor(),

                        Forms\Components\TextInput::make('quantity_in_stock')
                            ->label('Số lượng trong kho')
                            ->required()
                            ->integer()
                            ->numeric(),

                        Forms\Components\TextInput::make('minimum_threshold')
                            ->label('Ngưỡng tối thiểu')
                            ->numeric(),

                        Forms\Components\TextInput::make('unit')
                            ->label('Đơn vị')
                            ->maxLength(255),

                        Forms\Components\Select::make('restaurant_id')
                            ->relationship('restaurant', 'name')
                            ->label('Nhà hàng')
                            ->required()
                            ->visible(fn () => !auth()->user()->restaurant_id),
                        Forms\Components\Select::make('status')
                            ->label('Trạng thái')
                            ->options([
                                'in_stock' => 'còn ',
                                'low_stock' => 'sắp hết',
                                'out_of_stock' => 'hết hàng',
                            ])
                            ->required(),
                        Forms\Components\DatePicker::make('expiration_date')
                            ->label('Ngày hạn sử dụng')
                            ->required(),
                    ])
                    ->columns(2) // Chia thành 2 cột trong section
                    ->label('Thông tin nguyên liệu'),
            ]);
    }
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image')
                    ->label('Ảnh')
                    ,
                Tables\Columns\TextColumn::make('name')
                    ->label('Tên nguyên liệu')
                    ->searchable(),
                Tables\Columns\SelectColumn::make('status')
                    ->label('Trạng thái')
                    ->options([
                        'in_stock' => 'còn ',
                        'low_stock' => 'sắp hết',
                        'out_of_stock' => 'hết hàng',
                    ]),
                    Tables\Columns\TextInputColumn::make('quantity_in_stock')
                    ->label('Số lượng thực tế')
                    ->sortable()
                    ->afterStateUpdated(function ($state, $record) {
                        // Cập nhật số lượng trong kho khi có thay đổi
                        $record->quantity_in_stock = $state;
                        $record->save();
                    }),
                Tables\Columns\TextColumn::make('minimum_threshold')
                    ->label('Ngưỡng tối thiểu')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('quantity_auto_updated')
                    ->label('Số lượng tự động cập nhật')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('unit')
                    ->label('Đơn vị')
                    ->searchable(),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->label('Nhà hàng')
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->numeric()
                    ->sortable(),
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
                Tables\Filters\SelectFilter::make('status')
                    ->label('Trạng thái')
                    ->options([
                        'in_stock' => 'còn ',
                        'low_stock' => 'sắp hết',
                        'out_of_stock' => 'hết hàng',
                    ]),
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
            'index' => Pages\ListIngredients::route('/'),
            'create' => Pages\CreateIngredient::route('/create'),
            'edit' => Pages\EditIngredient::route('/{record}/edit'),
        ];
    }
}
