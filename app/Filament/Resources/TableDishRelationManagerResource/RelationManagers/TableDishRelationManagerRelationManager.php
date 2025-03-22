<?php

namespace App\Filament\Resources\TableDishRelationManagerResource\RelationManagers;

use App\Models\Dish;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class TableDishRelationManagerRelationManager extends RelationManager
{
    protected static string $relationship = 'tableDishes';
    protected static ?string $title = 'Danh sách lên món';

      public static function getPluralModelLabel(): string
    {
        return 'Danh sách lên món';
    }
    public function form(Form $form): Form
    {
        return $form
        ->schema([
            Forms\Components\Select::make('dish_id')
                ->options(Dish::all()->pluck('name', 'id'))
                ->required()
                ->label('Món ăn'),

            Forms\Components\TextInput::make('quantity')
                ->required()
                ->numeric()
                ->label('Số lượng'),

            Forms\Components\DateTimePicker::make('served_at')
                ->label('Thời gian phục vụ')
                ->nullable()
                ,
            Forms\Components\Select::make('status')
                ->options([
                    'pending' => 'Chưa phục vụ',
                    'served' => 'Đã phục vụ',
                ])
                ->label('Trạng thái')
        ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('TableDishRelationManager')
            ->columns([
                Tables\Columns\TextColumn::make('dish.name')->label('Món ăn'),
                Tables\Columns\TextColumn::make('quantity')->label('Số lượng'),
                Tables\Columns\TextColumn::make('served_at')->label('Thời gian phục vụ')->dateTime(),
                Tables\Columns\TextColumn::make('status')->label('Trạng thái')->badge(),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
