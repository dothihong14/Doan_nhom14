<?php

namespace App\Filament\Resources;

use App\Filament\Resources\WarehouseReceiptResource\Pages;
use App\Filament\Resources\WarehouseReceiptResource\RelationManagers;
use App\Models\User;
use App\Models\WarehouseReceipt;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class WarehouseReceiptResource extends Resource
{
    protected static ?string $model = WarehouseReceipt::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $title = 'Phiếu nhập kho';
    protected static ?string $pluralModelLabel = 'Phiếu nhập kho';
    protected static ?int $navigationSort = 99;


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\DatePicker::make('import_date')
                    ->label('Ngày nhập')
                    ->required(),
                Forms\Components\Select::make('imported_by')
                    ->label('Người nhập')
                    ->default(auth()->user()->id)
                    ->options(User::all()->pluck('name', 'id'))
                    ->required(),
                Forms\Components\TextInput::make('supplier')
                    ->label('Nhà cung cấp')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('import_date')
                    ->label('Ngày nhập')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Người nhập')
                    ->searchable(),
                Tables\Columns\TextColumn::make('supplier')
                    ->label('Nhà cung cấp')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Ngày tạo')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
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
            RelationManagers\WarehouseReceiptDetailRelationManager::class,
        ];
    }
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListWarehouseReceipts::route('/'),
            'create' => Pages\CreateWarehouseReceipt::route('/create'),
            'edit' => Pages\EditWarehouseReceipt::route('/{record}/edit'),
        ];
    }
}
