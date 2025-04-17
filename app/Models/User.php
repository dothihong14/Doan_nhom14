<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Filament\AvatarProviders\UiAvatarsProvider;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Traits\HasRoles;
use Filament\Models\Contracts\HasAvatar;

class User extends Authenticatable implements HasAvatar
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable,HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'address',
        'phone',
        'is_locked',
        'loyalty_points',
        'avatar_url',
        'role'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
    public function getFilamentAvatarUrl(): ?string
    {

        if (empty($this->avatar_url))
            return (new UiAvatarsProvider())->get($this);

        return asset('storage/' . $this->avatar_url);
    }
    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    protected static function booted()
    {
        static::creating(function ($user) {
            if (auth()->check() && auth()->user()->restaurant_id) {
                $user->restaurant_id = auth()->user()->restaurant_id;
            }
        });

        static::updating(function ($user) {
            if (auth()->check() && auth()->user()->restaurant_id) {
                $user->restaurant_id = auth()->user()->restaurant_id;
            }
        });
    }
}
