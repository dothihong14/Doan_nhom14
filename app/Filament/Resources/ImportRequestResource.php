<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ImportRequestResource\Pages;
use App\Filament\Resources\ImportRequestResource\RelationManagers;
use App\Models\ImportRequest;
use App\Models\Restaurant;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ImportRequestResource extends Resource
{
    protected static ?string $model = ImportRequest::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Quản lý Nguyên Liệu';
    protected static ?string $title = 'Phiếu yêu cầu nhập hàng';
    protected static ?string $modelLabel = 'Phiếu yêu cầu nhập hàng';
    protected static ?string $pluralModelLabel = 'Phiếu yêu cầu nhập hàng';
    protected static ?int $navigationSort = 99;

    public static function form(Form $form): Form
    {
        return $form->schema([
            Forms\Components\Section::make('Thông tin')
                ->label('Thông tin')
                ->schema([
                    Forms\Components\Select::make('restaurant_id')
                        ->label('Cơ sở')
                        ->options(Restaurant::all()->pluck('name', 'id'))
                        ->required()
                        ->reactive()
                        ->searchable()
                        ->visible(fn () => !auth()->user()->restaurant_id)
                        ->afterStateUpdated(function (callable $get, callable $set) {
                            $details = $get('details') ?? [];

                            if (empty($details)) {
                                return;
                            }

                            $restaurantId = $get('restaurant_id');
                            if (!$restaurantId) {
                                return;
                            }

                            $validIngredientIds = \App\Models\Ingredient::where('restaurant_id', $restaurantId)
                                ->pluck('id')
                                ->toArray();

                            foreach ($details as $index => $detail) {
                                $currentIngredientId = $detail['ingredient_id'] ?? null;

                                if ($currentIngredientId && !in_array($currentIngredientId, $validIngredientIds)) {
                                    $set("details.{$index}.ingredient_id", null);
                                    $set("details.{$index}.actual_quantity", null);
                                    $set("details.{$index}.reason", null);
                                }
                            }
                        }),
                    Forms\Components\DateTimePicker::make('request_date')
                        ->label('Ngày yêu cầu')
                        ->default(now()->format('Y-m-d'))
                        ->required(),
                    Forms\Components\Select::make('requested_by')
                        ->label('Người yêu cầu')
                        ->options(User::all()->pluck('name', 'id'))
                        ->required()
                        ->default(auth()->user()->id),
                    Forms\Components\Select::make('status')
                        ->label('Trạng thái')
                        ->options([
                            'pending' => 'Chờ xác nhận',
                            'approved' => 'Đã xác nhận',
                            'rejected' => 'Đã từ chối',
                        ])
                        ->default('pending')
                        ->required()
                        ->disabled(fn ($livewire) => $livewire instanceof \Filament\Resources\Pages\CreateRecord)
                        ->dehydrated(fn () => auth()->user()->can('update_status_import::request'))
                        ->disabled(fn () => !auth()->user()->can('update_status_import::request')),
                ]),
            Forms\Components\Section::make('Chi tiết')
                ->label('Chi tiết')
                ->schema([
                    Forms\Components\Repeater::make('details')
                        ->relationship('details')
                        ->label('Chi tiết')
                        ->schema([
                            Forms\Components\Select::make('ingredient_id')
                                ->label('Nguyên liệu')
                                ->options(function (callable $get) {
                                    if (!auth()->user()->restaurant_id) {
                                        $restaurantId = $get('../../restaurant_id');
                                        if (!$restaurantId) {
                                            return [];
                                        }
                                        return \App\Models\Ingredient::where('restaurant_id', $restaurantId)
                                            ->pluck('name', 'id');
                                    }
                                    return \App\Models\Ingredient::all()->pluck('name', 'id');
                                })
                                ->required()
                                ->searchable()
                                ->reactive(),
                            Forms\Components\TextInput::make('requested_quantity')
                                ->label('Số lượng yêu cầu')
                                ->required(),
                        ])->columns(2),
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
                Tables\Columns\TextColumn::make('restaurant.name')
                    ->visible(fn () => !auth()->user()->restaurant_id)
                    ->label('Cơ sở')
                    ->searchable(),
                Tables\Columns\TextColumn::make('request_date')
                    ->label('Ngày yêu cầu')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Người yêu cầu')
                    ->searchable(),
                Tables\Columns\TextColumn::make('status')
                    ->label('Trạng thái')
                    ->formatStateUsing(function ($state) {
                        return [
                            'pending' => 'Chờ xác nhận',
                            'approved' => 'Đã xác nhận',
                            'rejected' => 'Đã từ chối',
                        ][$state] ?? ucfirst($state);
                    }),

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
            ->filters([])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make()
                        ->label('Xem'),
                    Tables\Actions\EditAction::make()
                        ->label('Chỉnh Sửa'),
                    Tables\Actions\DeleteAction::make()
                        ->label('Xóa'),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->label('Xóa'),
                ]),
            ])
            ->recordAction('view')
            ->recordUrl(null);;
    }

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function getNavigationBadgeColor(): ?string
    {
        return 'success';
    }

    public static function getRelations(): array
    {
        return [
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListImportRequests::route('/'),
            'create' => Pages\CreateImportRequest::route('/create'),
            'edit' => Pages\EditImportRequest::route('/{record}/edit'),
        ];
    }
}
