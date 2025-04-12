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
                ->label('Món ăn')
                ->searchable(),

            Forms\Components\TextInput::make('quantity')
                ->required()
                ->numeric()
                ->default(1)
                ->minValue(1)
                ->label('Số lượng'),
            Forms\Components\Select::make('type')
                ->label('Loại')
                ->options([
                    'dine_in' => 'Trực tiếp',
                    'take_away' => 'Mang về',
                ])
                ->default('dine_in')
                ->reactive()
                ->required(),
            Forms\Components\Select::make('status')
                ->options([
                    'pending' => 'Chưa làm',
                    'doing' => 'Đang chế biến',
                    'done' => 'Đã làm xong',
                    'served' => 'Đã phục vụ',
                ])
                ->label('Trạng thái')
                ->default('pending')
                ->required()
        ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('TableDishRelationManager')
            ->columns([
                Tables\Columns\TextColumn::make('dish.name')->label('Món ăn'),
                Tables\Columns\TextColumn::make('quantity')->label('Số lượng'),
                Tables\Columns\TextColumn::make('type')
                    ->label('Loại')
                    ->formatStateUsing(function ($state) {
                        return match ($state) {
                            'delivery' => 'Trực tuyến',
                            'dine_in' => 'Trực tiếp',
                            'take_away' => 'Mang về',
                            default => 'Không xác định',
                        };
                    }),

//                Tables\Columns\TextColumn::make('created_at')->label('Thời gian phục vụ')->dateTime(),
                Tables\Columns\SelectColumn::make('status')->label('Trạng thái')
                    ->options([
                        'pending' => 'Chưa làm',
                        'doing' => 'Đang chế biến',
                        'done' => 'Đã làm xong',
                        'served' => 'Đã phục vụ',
                    ]),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label('Thêm món ăn')
                    ->using(function (array $data, string $model): \Illuminate\Database\Eloquent\Model {
                        $table = $this->getOwnerRecord();
                        $data['table_id'] = $table->id;
                        $data['type'] = 'face_to_face';
                        return $model::create($data);
                    }),
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
