<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TableDishRelationManagerResource\RelationManagers\TableDishRelationManagerRelationManager;
use App\Filament\Resources\TableResource\Pages;
use App\Filament\Resources\TableResource\RelationManagers;
use App\Models\Reservation;
use App\Models\Restaurant;
use App\Models\Table as TableModel;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class TableResource extends Resource
{
    protected static ?string $model = TableModel::class;
    protected static ?string $navigationGroup = 'Quản lý Nhà Hàng';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách bàn';
    }
    protected static ?string $navigationIcon = 'heroicon-o-table-cells'; // Bàn làm việc
    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
{
    return $form
        ->schema([
            Forms\Components\Section::make('Thông tin bàn')
                ->description('Chọn nhà hàng và nhập thông tin bàn.')
                ->schema([
                    Forms\Components\Select::make('restaurant_id')
                        ->options(Restaurant::all()->pluck('name', 'id'))
                        ->required()
                        ->label('Nhà hàng'),

                        Forms\Components\TextInput::make('table_number')
                        ->required()
                        ->numeric()
                        ->unique(TableModel::class, 'table_number', ignoreRecord: true) // Ensure uniqueness, ignoring current record
                        ->label('Số bàn'),
                ]),

            Forms\Components\Section::make('Trạng thái bàn')
                ->description('Chọn trạng thái hiện tại của bàn.')
                ->schema([
                    Forms\Components\Select::make('status')
                        ->options([
                            'available' => 'Có sẵn',
                            'occupied' => 'Đã sử dụng',
                            'reserved' => 'Đã đặt',
                        ])
                        ->required()
                        ->label('Trạng thái')
                        ,
                        Forms\Components\Select::make('reservation_id')
                        ->options(Reservation::all()->pluck('reservation_code', 'id'))
                        ->label('Mã đặt bàn')
                        ->searchable()
                        ,
                ]),
        ]);
}

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->sortable()
                    ->searchable()

                    ->label('ID')
                    ->toggleable(isToggledHiddenByDefault: true),
                    Tables\Columns\TextColumn::make('table_number')
                    ->numeric()
                    ->sortable()
                    ->searchable()
                    ->label('Mã bàn'),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->sortable()
                    ->searchable()
                    ->label('Nhà hàng'),

                    Tables\Columns\TextColumn::make('status')
                    ->label('Trạng thái')
                    ->badge(fn($record) => match ($record->status) {
                        'available' => 'success',
                        'occupied' => 'danger',
                        'reserved' => 'warning',
                        default => 'secondary', // Fallback for undefined statuses
                    })
                   ,
                    Tables\Columns\TextColumn::make('reservation.reservation_code')
                    ->label('Mã đặt bàn')
                    ->searchable()

                   ,

                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày tạo')

                   ,
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày cập nhật')
                    ->toggleable(isToggledHiddenByDefault: true)
                   ,
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('restaurant_id')
                    ->options(Restaurant::all()->pluck('name', 'id'))
                    ->label('Nhà hàng'),
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'available' => 'Có sẵn',
                        'occupied' => 'Đã sử dụng',
                        'reserved' => 'Đã đặt',
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
            TableDishRelationManagerRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTables::route('/'),
            'create' => Pages\CreateTable::route('/create'),
            'edit' => Pages\EditTable::route('/{record}/edit'),
        ];
    }


}
