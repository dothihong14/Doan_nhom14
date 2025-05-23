<?php

namespace App\Filament\Resources;

use App\Exports\DishesExport;
use App\Filament\Resources\RestaurantResource\Pages;
use App\Filament\Resources\RestaurantResource\RelationManagers;
use App\Models\Restaurant;
use Barryvdh\DomPDF\Facade\Pdf;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
class RestaurantResource extends Resource
{
    protected static ?string $model = Restaurant::class;
    protected static ?string $navigationGroup = 'Quản lý Nhà Hàng';
    protected static ?string $navigationLabel = 'Cơ sở';
    protected static ?string $modelLabel = 'Cơ sở';

    protected static ?string $title = 'Cơ sở';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách Cơ sở';
    }
    protected static ?string $navigationIcon = 'heroicon-o-building-office';
    protected static ?int $navigationSort = 1;


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // Thông tin chung
                Forms\Components\Section::make('Thông tin chung')
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->label('Tên')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('location')
                            ->label('Địa điểm')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('phone')
                            ->label('Số điện thoại')
                            ->tel()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('email')
                            ->label('Email')
                            ->email()
                            ->maxLength(255),
                    ])->columns(2),

                // Hình ảnh
                Forms\Components\Section::make('Hình ảnh')
                    ->schema([
                        Forms\Components\FileUpload::make('image')
                            ->label('Tải lên hình ảnh')
                            ->image(),
                    ]),

                // Mô tả
                Forms\Components\Section::make('Mô tả')
                    ->schema([
                        Forms\Components\Textarea::make('short_description')
                            ->label('Mô tả ngắn')
                            ->columnSpanFull(),
                        Forms\Components\RichEditor::make('description')
                            ->label('Mô tả chi tiết')
                            ->columnSpanFull(),
                        Forms\Components\TextInput::make('map')
                            ->label('Bản đồ')
                            ->columnSpanFull(),
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
                Tables\Columns\ImageColumn::make('image')
                    ->label('Hình ảnh')
                    ->circular(),
                Tables\Columns\TextColumn::make('name')
                    ->label('Tên')
                    ->searchable(),
                Tables\Columns\TextColumn::make('location')
                    ->label('Địa điểm')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('phone')
                    ->label('Số điện thoại')
                    ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->label('Email')
                    ->searchable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
//                    Tables\Actions\Action::make('Xuất Báo Cáo')
//                    ->label('Xuất Báo Cáo')
//                    ->action(fn (Restaurant $record) => redirect()->route('restaurant.statistics', $record->id)) // Call the export method
//                    ->icon('heroicon-o-document-text'), // Optionally add an icon
//                    Tables\Actions\Action::make('Xuất Thống Kê')
//                    ->label('Xuất Thống Kê')
//                    ->action(fn (Restaurant $record) => self::thongke($record)) // Call the export method
//                    ->icon('heroicon-o-document-text'), // Optionally add an icon
                    Tables\Actions\ViewAction::make()

                        ->label('Xem'), // Đổi nhãn sang tiếng Việt
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh Sửa'), // Đổi nhãn sang tiếng Việt
                    // Tables\Actions\DeleteAction::make()
                    //     ->label('Xóa'), // Đổi nhãn sang tiếng Việt

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


    public static function thongke(Restaurant $restaurant)
    {
        return Excel::download(new DishesExport($restaurant->id), 'thống kê doanh thu món ăn tháng ' . date('m') . ' cơ sở ' . $restaurant->name . '.xlsx');
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
            'index' => Pages\ListRestaurants::route('/'),
            'create' => Pages\CreateRestaurant::route('/create'),
            'edit' => Pages\EditRestaurant::route('/{record}/edit'),
        ];
    }
}
