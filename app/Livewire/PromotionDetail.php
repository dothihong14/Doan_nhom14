<?php

namespace App\Livewire;

use App\Models\Promotion;
use Livewire\Component;

class PromotionDetail extends Component
{
    public $promotion;
    public $promotions;
    public function mount($slug)
    {
        $this->promotion = Promotion::where('slug', $slug)->first();
        if (!$this->promotion) {
            return redirect('/promotion');
        }
        $this->promotions = Promotion::orderBy('created_at', 'desc')->limit(3)->get();
    }
    public function render()
    {
        return view('livewire.promotion-detail');
    }
}
