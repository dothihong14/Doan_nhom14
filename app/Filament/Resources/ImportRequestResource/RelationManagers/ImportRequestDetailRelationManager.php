<?php

namespace App\Filament\Resources\ImportRequestResource\RelationManagers;

use App\Models\ImportRequestDetail;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Forms;

class ImportRequestDetailRelationManager extends RelationManager
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
                Forms\Components\TextInput::make('requested_quantity')
                    ->label('Số lượng yêu cầu')
                    ->required(),
            ]);
    }

    public function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('ingredient.name')
                    ->label('Nguyên liệu'),
                Tables\Columns\TextColumn::make('requested_quantity')
                    ->label('Số lượng yêu cầu'),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label('Thêm mục yêu cầu'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }
}