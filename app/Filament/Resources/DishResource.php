<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DishResource\Pages;
use App\Filament\Resources\DishResource\RelationManagers;
use App\Models\Dish;
use App\Models\Restaurant;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class DishResource extends Resource
{
    protected static ?string $model = Dish::class;
    protected static ?string $navigationGroup = 'Quản lý Món Ăn';
    protected static ?string $navigationLabel = 'Món ăn';
    protected static ?string $title = 'Món ăn';
    protected static ?string $modelLabel = 'Món ăn';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách món ăn';
    }
    protected static ?int $navigationSort = 2;

    protected static ?string $navigationIcon = 'heroicon-o-check-badge';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Tabs::make('Thông tin món ăn')
                    ->tabs([
                        Forms\Components\Tabs\Tab::make('Chi tiết')
                            ->schema([
                                Forms\Components\Select::make('restaurant_id')
                                    ->label('Cơ sở')
                                    ->options(Restaurant::all()->pluck('name', 'id'))
                                    ->required()
                                    ->searchable()
                                    ->visible(fn () => !auth()->user()->restaurant_id),
                                Forms\Components\Select::make('food_category_id')
                                    ->relationship('food_category', 'name')
                                    ->label('Danh mục món ăn')
                                    ->required()
                                    ->columnSpanFull(),
                                Forms\Components\TextInput::make('name')
                                    ->label('Tên món ăn')
                                    ->required()
                                    ->maxLength(255)
                                    ->columnSpanFull(),
                                Forms\Components\TextInput::make('slug')
                                    ->label('Slug')
                                    ->required()
                                    ->maxLength(255)
                                    ->columnSpanFull(),
//                                Forms\Components\TextInput::make('sold_quantity')
//                                    ->label('Số lượng đã bán')
//                                    ->required()
//                                    ->numeric()
//                                    ->columnSpanFull(),
                                Forms\Components\Select::make('status')
                                    ->label('Trạng thái')
                                    ->options([
                                        'available' => 'Có sẵn',
                                        'unavailable' => 'Không có sẵn',
                                    ])
                                    ->default('available')
                                    ->columnSpanFull()
                                    ->required(),

                                Forms\Components\FileUpload::make('image')
                                    ->label('Tải lên hình ảnh')
                                    ->image()
                                    ->required()
                                    ->columnSpanFull(),
                                Forms\Components\Textarea::make('description')
                                    ->label('Mô tả')
                                    ->columnSpanFull(),
                                Forms\Components\TextInput::make('price')
                                    ->label('Giá')
                                    ->required()
                                    ->numeric()
                                    ->prefix('$')
                                    ->columnSpanFull(),
                            ]),

                        Forms\Components\Tabs\Tab::make('Công thức')
                            ->schema([
                                Forms\Components\Repeater::make('recipes')
                                    ->relationship('recipes') // Mối quan hệ với model Recipe
                                    ->schema([
                                        Forms\Components\Select::make('ingredient_id')
                                            ->relationship('ingredient', 'name')
                                            ->label('Nguyên liệu')
                                            ->required()
                                            ->columnSpanFull(),
                                        Forms\Components\TextInput::make('quantity')
                                            ->label('Khối lượng')
                                            ->required()
                                            ->numeric()
                                            ->columnSpanFull(),
                                    ])
                                    ->createItemButtonLabel('Thêm nguyên liệu')
                                    ->columnSpanFull(),
                            ]),
//                            Forms\Components\Tabs\Tab::make('Trạng thái món ăn')
//                            ->schema([
//                                Forms\Components\TextInput::make('daily_sold_quantity')
//                                    ->label('Số lượng có thể bán trong ngày')
//                                    ->required()
//                                    ->default(0)
//                                    ->minValue(0)
//                                    ->numeric()
//                                    ->columnSpanFull(),
//                                Forms\Components\Select::make('status')
//                                    ->label('Trạng thái')
//                                    ->options([
//                                        'available' => 'Có sẵn',
//                                        'unavailable' => 'Không có sẵn',
//                                    ])
//                                    ->default('available')
//                                    ->required()
//                                    ->columnSpanFull(),
//                            ]),

                    ])
                    ->columnSpanFull(), // Đặt chiều rộng cho toàn bộ tab
            ]);
    }
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image')
                    ->label('Hình ảnh'),
                Tables\Columns\TextColumn::make('name')
                    ->label('Tên món ăn')
                    ->searchable(),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->label('Cơ sở')
                    ->sortable(),
                Tables\Columns\TextColumn::make('price')
                    ->label('Giá')
                    ->money('VND')
                    ->sortable(),
                Tables\Columns\SelectColumn::make('status')
                    ->label('Trạng thái')
                    ->options([
                        'available' => 'Có sẵn',
                        'unavailable' => 'Không có sẵn',
                    ])
                    ->sortable(),
                    Tables\Columns\TextColumn::make('food_category.name')
                    ->label('Danh mục món ăn')
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
                        ExportBulkAction::make()
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
            'index' => Pages\ListDishes::route('/'),
            'create' => Pages\CreateDish::route('/create'),
            'edit' => Pages\EditDish::route('/{record}/edit'),
        ];
    }
}
