<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ReturnIngredientResource\Pages;
use App\Filament\Resources\ReturnIngredientResource\RelationManagers;
use App\Models\Ingredient;
use App\Models\ReturnIngredient;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ReturnIngredientResource extends Resource
{
    protected static ?string $model = ReturnIngredient::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $title = 'Danh sách đổi trả nguyên liệu';
    protected static ?int $navigationSort = 100;

    protected static ?string $pluralModelLabel = 'Danh sách đổi trả nguyên liệu';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('ingredient_id')
                    ->label('Mã nguyên liệu')
                    ->options(Ingredient::all()->pluck('name', 'id'))
                    ->required()
               ,
                Forms\Components\TextInput::make('returned_quantity')
                    ->label('Số lượng trả lại')
                    ->required()
                    ->numeric(),
                Forms\Components\Textarea::make('reason')
                    ->label('Lý do trả lại')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('ingredient.name')
                    ->label('Tên nguyên liệu')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('returned_quantity')
                    ->label('Số lượng trả lại')

                    ->numeric()
                    ->formatStateUsing(function ($state, $record) {
                        return $state . ' ' . '(' . Ingredient::find($record->ingredient_id)->unit . ')';
                    })
                    ->sortable(),
                Tables\Columns\TextColumn::make('reason')
                    ->label('Lý do trả lại')

                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Ngày tạo')
                    ->dateTime()
                    ->sortable()
                ,
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
            'index' => Pages\ListReturnIngredients::route('/'),
            'create' => Pages\CreateReturnIngredient::route('/create'),
            'edit' => Pages\EditReturnIngredient::route('/{record}/edit'),
        ];
    }
}
