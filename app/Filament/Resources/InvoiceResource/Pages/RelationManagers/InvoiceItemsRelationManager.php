<?php

namespace App\Filament\Resources\InvoiceResource\RelationManagers;

use App\Models\Dish;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Resources\RelationManagers\RelationManager;

class InvoiceItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'invoiceItems';
    protected static ?string $title = 'Danh sách món ăn';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách món ăn';
    }
    public function form(Form $form): Form
    {
        return $form
        ->schema([
            Forms\Components\Select::make('dish_id')
                ->label('Món ăn')
                ->options(Dish::pluck('name', 'id'))
                ->searchable()
                ->required()
                ->reactive() // Kích hoạt phản ứng khi giá trị thay đổi
                ->afterStateUpdated(fn ($state, callable $set) =>
                    $set('unit_price', Dish::find($state)?->price ?? 0) // Lấy giá từ database
                ),

            Forms\Components\TextInput::make('quantity')
                ->label('Số lượng')
                ->numeric()
                ->minValue(1)
                ->required()
                ->reactive() // Cập nhật khi số lượng thay đổi
                ->afterStateUpdated(fn ($state, callable $set, $get) =>
                    $set('total_price', $state * $get('unit_price'))
                ),

            Forms\Components\TextInput::make('unit_price')
                ->label('Đơn giá')
                ->numeric()
                ->suffix('VNĐ')
               // Không cho sửa tay
                ->required(),

                Forms\Components\TextInput::make('total_price')
                ->label('Thành tiền')
                ->numeric()
                ->suffix('VNĐ')
                ->required()
                ->dehydrated(true) // Đảm bảo giá trị này được gửi lên database
                ->reactive()
                ->afterStateUpdated(fn ($state, callable $set, $get) =>
                    $set('total_price', $get('quantity') * $get('unit_price'))
                ),

        ]);

    }

    public  function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('dish.name')
                    ->label('Món ăn')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\TextColumn::make('quantity')
                    ->label('Số lượng')
                    ->sortable(),

                Tables\Columns\TextColumn::make('unit_price')
                    ->label('Đơn giá')
                    ->money('VND')
                    ->sortable(),

                Tables\Columns\TextColumn::make('total_price')
                    ->label('Thành tiền')
                    ->money('VND')
                    ->sortable(),

            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label('Thêm mục hóa đơn'),
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->label('Chỉnh sửa'),
                Tables\Actions\DeleteAction::make()
                    ->label('Xóa'),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make()
                    ->label('Xóa hàng loạt'),
            ]);
    }
}
