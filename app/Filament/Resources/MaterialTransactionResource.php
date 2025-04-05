<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MaterialTransactionResource\Pages;
use App\Filament\Resources\MaterialTransactionResource\RelationManagers;
use App\Models\MaterialTransaction;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class MaterialTransactionResource extends Resource
{
    protected static ?string $model = MaterialTransaction::class;

    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $navigationLabel = 'Lịch sử nguyên liệu';
    protected static ?string $title = 'Lịch sử nguyên liệu';
    protected static ?string $pluralTitle = 'Lịch sử nguyên liệu';
    protected static ?string $pluralModelLabel = 'Lịch sử nguyên liệu';
    protected static ?string $modelLabel = 'Lịch sử nguyên liệu';
    protected static ?string $navigationIcon = 'heroicon-o-arrow-path';

    public static function getPluralModelLabel(): string
    {
        return 'Lịch sử nguyên liệu';
    }
    protected static ?int $navigationSort = 98;



    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('ingredient_id')
                    ->relationship('ingredient', 'name')
                    ->label('Nguyên liệu')
                    ->required()
                  ,
                Forms\Components\TextInput::make('reason')
                    ->label('Lý do')
                    ->required(),
                Forms\Components\TextInput::make('quantity')
                    ->label('Số lượng')
                    ->required()
                    ->numeric(),
                Forms\Components\Select::make('type')
                    ->options([
                        'import' => 'Nhập',
                        'export' => 'Xuất',
                    ])
                    ->label('Loại')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('ingredient.image')
                    ->label('Ảnh')
                 ,
                Tables\Columns\TextColumn::make('ingredient.name')
                    ->label('Nguyên liệu')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\BadgeColumn::make('quantity')
                    ->color(fn ($record) => $record->type === 'import' ? 'success' : 'danger')
                ->label('Số lượng')
                ->formatStateUsing(function ($state, $record) {
                    return $record->type === 'import' ? '+' . $state : '-' . $state; // Thêm dấu + hoặc - dựa trên loại
                })
                ->sortable(),
                Tables\Columns\TextColumn::make('reason')
                    ->label('Lý do')
                    ->searchable(),

                Tables\Columns\TextColumn::make('type')
                    ->label('Loại')
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
                    // Tables\Actions\EditAction::make()
                    //     ->label('Chỉnh Sửa'), // Đổi nhãn sang tiếng Việt
                    // Tables\Actions\DeleteAction::make()
                    //     ->label('Xóa'), // Đổi nhãn sang tiếng Việt
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    // Tables\Actions\DeleteBulkAction::make()
                    //     ->label('Xóa'), // Đổi nhãn sang tiếng Việt
                        ExportBulkAction::make()
                        ->label('Xuất Excel'), // Đổi nhãn sang tiếng Việt

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
            'index' => Pages\ListMaterialTransactions::route('/'),
            'create' => Pages\CreateMaterialTransaction::route('/create'),
            // 'edit' => Pages\EditMaterialTransaction::route('/{record}/edit'),
        ];
    }
}
