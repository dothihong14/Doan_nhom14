<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CustomerResource\Pages;
use App\Filament\Resources\CustomerResource\RelationManagers;
use App\Models\Customer;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class CustomerResource extends Resource
{
    protected static ?int $navigationSort = 2;
    protected static ?string $model = Customer::class;
    protected static ?string $navigationGroup = 'Quản lý Khách hàng';
    protected static ?string $navigationLabel = 'Khách hàng';
    protected static ?string $modelLabel = 'Khách hàng';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách khách hàng';
    }
    protected static ?string $navigationIcon = 'heroicon-o-user-group';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('email')
                    ->required()
                    ->label('Email'),
                Forms\Components\TextInput::make('name')
                    ->label('Tên khách hàng')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('address')
                    ->label('Địa chỉ')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('phone')
                    ->tel()
                    ->inputMode('numeric')
                    ->required()
                    ->maxLength(255)
                    ->label('Số điện thoại')
                    ->regex('/^0(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-9]|9[0-9])[0-9]{7}$/')
                    ->validationMessages([
                        'regex' => 'Số điện thoại không đúng định dạng Việt Nam (ví dụ: 0912345678).',
                    ]),
                Forms\Components\Toggle::make('is_locked')
                    ->required()
                    ->label('Khoá tài khoản'),
                Forms\Components\TextInput::make('loyalty_points')
                    ->required()
                    ->numeric()
                    ->default(0)
                    ->disabled()
                    ->label('Điểm thưởng'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('ID')
                    ->sortable(),
                Tables\Columns\TextColumn::make('name')
                    ->label('Tên khách hàng')
                    ->sortable(),
                Tables\Columns\TextColumn::make('email')
                    ->label('Email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('phone')
                    ->label('Số điện thoại')
                    ->searchable(),

                Tables\Columns\TextColumn::make('loyalty_points')
                    ->label('Điểm thưởng')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\SelectColumn::make('is_locked')
                    ->label('Trạng thái tài khoản')
                    ->options([
                        '0' => 'Đang hoạt động',
                        '1' => 'Đã khoá',
                    ]),
                    Tables\Columns\TextColumn::make('address')
                    ->label('Địa chỉ')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày tạo')
                   ,
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->label('Ngày cập nhật')
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
                        ExportBulkAction::make()
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
            'index' => Pages\ListCustomers::route('/'),
            'create' => Pages\CreateCustomer::route('/create'),
            'edit' => Pages\EditCustomer::route('/{record}/edit'),
        ];
    }
}
