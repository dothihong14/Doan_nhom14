<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Promotion as PromotionModel;

class Promotion extends Component
{
    use WithPagination;

    public function render()
    {
        // Fetch promotions with pagination (6 per page)
        $promotions = PromotionModel::orderBy('created_at', 'desc')->paginate(6);

        return view('livewire.promotion', [
            'promotions' => $promotions,
        ]);
    }
}