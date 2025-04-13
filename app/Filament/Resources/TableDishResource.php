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

class TableDishResource extends Resource
{
    protected static ?string $model = TableDish::class;
    protected static ?string $navigationGroup = 'Quản lý Nhà Hàng';
    protected static ?string $modelLabel = 'Danh sách lên món';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách lên món';
    }
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()->schema([
                    Forms\Components\Select::make('type')
                        ->label('Loại')
                        ->options([
                            'delivery' => 'Trực tuyến',
                            'dine_in' => 'Trực tiếp',
                            'take_away' => 'Mang đi',
                        ])
                        ->default('dine_in')
                        ->reactive()
                        ->required()
                        ->afterStateUpdated(function (callable $set, $state) {
                            if ($state === 'delivery') {
                                $set('table_id', null);
                            }
                        }),
                    Forms\Components\Select::make('table_id')
                        ->options(\App\Models\Table::all()->pluck('table_code', 'id'))
                        ->label('Bàn')
                        ->required(fn (callable $get) => $get('type') === 'dine_in')
                        ->hidden(fn (callable $get) => $get('type') === 'delivery')
                        ->dehydrated(fn (callable $get) => $get('type') === 'dine_in'),
                    Forms\Components\Select::make('dish_id')
                        ->options(\App\Models\Dish::all()->pluck('name', 'id'))
                        ->label('Món ăn')
                        ->required(),
                    Forms\Components\TextInput::make('quantity')
                        ->label('Số lượng')
                        ->required()
                        ->numeric(),
                    Forms\Components\Select::make('status')
                        ->options([
                            'pending' => 'Chưa làm',
                            'doing' => 'Đang chế biến',
                            'done' => 'Đã làm xong',
                            'served' => 'Đã phục vụ',
                        ])
                        ->label('Trạng thái')
                        ->default('pending'),
                ]),
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
                Tables\Columns\TextColumn::make('table.table_code')
                    ->label('Bàn')
                    ->searchable()
                    ->sortable()
                    ->default('-'),
                Tables\Columns\TextColumn::make('quantity')
                    ->label('Số lượng')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\SelectColumn::make('status')
                    ->label('Trạng thái')
                    ->options([
                        'pending' => 'Chưa làm',
                        'doing' => 'Đang chế biến',
                        'done' => 'Đã làm xong',
                        'served' => 'Đã phục vụ',
                    ])
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('type')
                    ->label('Loại')
                    ->formatStateUsing(function ($state) {
                        return [
                            'delivery' => 'Trực tuyến',
                            'dine_in' => 'Trực tiếp',
                            'take_away' => 'Mang đi',
                        ][$state] ?? ucfirst($state);
                    }),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Thời gian đặt')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('dish_id')
                    ->options(Dish::all()->pluck('name', 'id'))
                    ->label('Món ăn'),
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'pending' => 'Chưa làm',
                        'doing' => 'Đang chế biến',
                        'done' => 'Đã làm xong',
                        'served' => 'Đã phục vụ',
                    ])
                    ->label('Trạng thái'),
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
            'index' => Pages\ListTableDishes::route('/'),
            'create' => Pages\CreateTableDish::route('/create'),
            'edit' => Pages\EditTableDish::route('/{record}/edit'),
        ];
    }
}
