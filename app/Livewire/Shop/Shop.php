<?php

namespace App\Livewire\Shop;

use App\Helpers\CartManagement;
use App\Models\Restaurant;
use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Dish;
use App\Models\FoodCategory;

class Shop extends Component
{
    use WithPagination;

    public $category_id;
    public $search = '';
    public $price_min = 0;
    public $price_max = 10000000;
    public $sort_by = 'created_at';
    public $sort_direction = 'asc';
    public $page = 1; // Thêm thuộc tính này
    protected $queryString = [
        'category_id',
        'search',
        'price_min',
        'price_max',
        'sort_by',
        'sort_direction',
        'page' => ['except' => 1], // Giữ trang hiện tại trong query
    ];

    public function mount()
    {
        if (request()->get('category')) {
            $this->category_id = request()->get('category');
        }
        $this->search = request()->get('search');
    }
    public function addToCart($id)
    {
        CartManagement::addItemToCart($id, 1);
        return redirect('/cart');
    }
    public function buyNow($id)
    {
        CartManagement::addItemToCart($id, 1);
        return redirect('/checkout');
    }
    public function render()
    {
        $query = Dish::query();

        if ($this->category_id) {
            $query->where('food_category_id', $this->category_id);
        }


        if ($this->search) {
            $query->where('name', 'like', '%' . $this->search . '%');
        }

        $dishes = $query->whereBetween('price', [$this->price_min, $this->price_max])
            ->where('status', 'available')
            ->orderBy($this->sort_by, $this->sort_direction)
            ->paginate(9);
        $topSellingDishes = Dish::orderBy('sold_quantity', 'desc')->where('status', 'available')->take(4)->get();
        $categories = FoodCategory::withCount('dishes')->get();
        return view('livewire.shop.shop', [
            'dishes' => $dishes,
            'categories' => $categories,
            'topSellingDishes' => $topSellingDishes,
        ]);
    }

    public function updatedPriceMin($value)
    {
        $this->price_min = $value;
    }

    public function updatedPriceMax($value)
    {
        $this->price_max = $value;
    }

    public function sortBy($field)
    {
        // Toggle sort direction
        if ($this->sort_by === $field) {
            $this->sort_direction = $this->sort_direction === 'asc' ? 'desc' : 'asc';
        } else {
            $this->sort_by = $field;
            $this->sort_direction = 'asc';
        }
    }
}
