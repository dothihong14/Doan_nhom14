<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class UserResource extends Resource
{
    protected static ?int $navigationSort = 100;

    protected static ?string $model = User::class;

    protected static ?string $navigationGroup = 'Quản lý hệ thống';
    public static function getPluralModelLabel(): string
    {
        return 'Danh sách tài khoản';
    }

    protected static ?string $navigationIcon = 'heroicon-o-user-circle';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // Thông tin cá nhân
                Forms\Components\Section::make('Thông tin cá nhân')->schema([
                    // Forms\Components\TextInput::make('name')
                    //     ->label('Tên')
                    //     ->required()
                    //     ->maxLength(255),
                    Forms\Components\FileUpload::make('avatar_url')
                        ->label('Ảnh đại diện')
                        ->image()
                        ->avatar(),
                    Forms\Components\TextInput::make('email')
                        ->label('Email')
                        ->email()
                        ->required()
                        ->maxLength(255),
                    // Forms\Components\TextInput::make('address')
                    //     ->label('Địa chỉ')
                    //     ->required()
                    //     ->maxLength(255),
                    // Forms\Components\TextInput::make('phone')
                    //     ->label('Số điện thoại')
                    //     ->required()
                    //     ->maxLength(255),
                    // Forms\Components\Checkbox::make('is_locked')
                    //     ->label('Khóa tài khoản'),
                    // Forms\Components\TextInput::make('loyalty_points')
                    //     ->label('Điểm thưởng')
                    //     ->required()
                    //     ->maxLength(255),
                ]),
                // Quyền
                Forms\Components\Section::make('Quyền')->schema([
                    Forms\Components\CheckboxList::make('roles')
                        ->label('Vai trò')
                        ->relationship('roles', 'name')
                        ->searchable(),
                        Forms\Components\Select::make('restaurant_id')
                        ->label('Cơ sở')
                        ->relationship('restaurant', 'name')
                       ,
                ]),

                // Mật khẩu
                Forms\Components\Section::make('Mật khẩu')->schema([
                    Forms\Components\TextInput::make('password')
                    ->password()
                    ->minLength(8)
                    ->dehydrateStateUsing(fn($state) => bcrypt($state))
                    ->dehydrated(fn($state) => filled($state))
                    ->label('Password'),
                ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('ID')
                    ->sortable(),
                Tables\Columns\ImageColumn::make('avatar_url')
                    ->label('Ảnh đại diện')
                    ->circular(),
                // Tables\Columns\TextColumn::make('name')
                //     ->label('Tên')
                //     ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->label('Email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('roles.name')
                    ->label('Chức vụ')
                    ->badge()
                    ->color('success'),
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->label('Cơ sở')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->label('Ngày tạo')
                    ->sortable()
                  ,
                Tables\Columns\TextColumn::make('updated_at')
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
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
