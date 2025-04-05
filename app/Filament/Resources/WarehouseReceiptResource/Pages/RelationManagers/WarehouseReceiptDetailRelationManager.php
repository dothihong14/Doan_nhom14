<?php

namespace App\Filament\Resources\WarehouseReceiptResource\RelationManagers;

use App\Models\Ingredient;
use App\Models\WarehouseReceiptDetail;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Forms;

class WarehouseReceiptDetailRelationManager extends RelationManager
{
    protected static string $relationship = 'details';

    protected static ?string $recordTitleAttribute = 'id';

    public function form(Forms\Form $form): Forms\Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('ingredient_id')
                    ->relationship('ingredient', 'name')
                    ->label('Nguyên liệu')
                    ->required(),
                Forms\Components\TextInput::make('actual_quantity')
                    ->label('Số lượng thực tế')
                    ->numeric()
                    ->required(),
                Forms\Components\TextInput::make('unit_price')
                    ->label('Đơn giá')
                    ->numeric()
                    ->prefix('₫')
                    ->required(),
            ]);
    }

    public function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('ingredient.name')
                    ->numeric()
                    ->label('Nguyên liệu'),
                Tables\Columns\TextColumn::make('actual_quantity')
                    ->numeric()
                    ->label('Số lượng thực tế')
                    ->formatStateUsing(function ($state, $record) {
                        return $state . ' ' . '(' . Ingredient::find($record->ingredient_id)->unit . ')';
                    }),
                Tables\Columns\TextColumn::make('unit_price')
                    ->numeric()
                    ->label('Đơn giá')
                    ->money('VND'),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label('Thêm mục nhập kho'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }
}