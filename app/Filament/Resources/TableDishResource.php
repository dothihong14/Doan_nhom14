<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TableDishResource\Pages;
use App\Filament\Resources\TableDishResource\RelationManagers;
use App\Models\Dish;
use App\Models\TableDish;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use App\Models\Table as TableModel;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use ValueError;

class TableDishResource extends Resource
{
    protected static ?string $model = TableDish::class;
    protected static ?string $navigationGroup = 'Quản lý Nhà Hàng';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách lên món';
    }
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('dish_id')
                    ->options(Dish::all()->pluck('name', 'id'))
                    ->label('Món ăn')
                    ->required()
                ,
                Forms\Components\Select::make('table_id')
                    ->options(TableModel::all()->pluck('table_number', 'id'))
                    ->label('Bàn')
                    ->required()
                  ,
                Forms\Components\TextInput::make('quantity')
                    ->label('Số lượng')
                    ->required()
                    ->numeric(),
                Forms\Components\DateTimePicker::make('served_at')
                    ->label('Thời gian phục vụ')
                    ->nullable(),
                Forms\Components\Select::make('status')
                    ->options([
                        'pending' => 'Chưa phục vụ',
                        'served' => 'Đã phục vụ',
                    ])
                    ->label('Trạng thái')
                    ->default('pending')
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('dish.name')
                    ->label('Món ăn')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('table.table_number')
                    ->label('Bàn')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('quantity')
                    ->label('Số lượng')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('served_at')
                    ->label('Thời gian phục vụ')
                    ->dateTime()
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('status')
                    ->label('Trạng thái')
                    ->badge()
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')

                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('dish_id')
                    ->options(Dish::all()->pluck('name', 'id'))
                    ->label('Món ăn'),
                Tables\Filters\SelectFilter::make('table_id')
                    ->options(TableModel::all()->pluck('table_number', 'id'))
                    ->label('Bàn'),
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'pending' => 'Chưa phục vụ',
                        'served' => 'Đã phục vụ',
                    ])
                    ->label('Trạng thái'),
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
            'index' => Pages\ListTableDishes::route('/'),
            'create' => Pages\CreateTableDish::route('/create'),
            'edit' => Pages\EditTableDish::route('/{record}/edit'),
        ];
    }
}
