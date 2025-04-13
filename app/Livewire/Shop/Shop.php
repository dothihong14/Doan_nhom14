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
    public $sort_by = 'default'; // Giá trị trạng thái, không phải tên cột
    public $sort_direction = 'desc'; // Hướng mặc định cho created_at
    public $page = 1;

    protected $queryString = [
        'category_id',
        'search',
        'price_min',
        'price_max',
        'sort_by',
        'sort_direction',
        'page' => ['except' => 1],
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
        $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Sản phẩm đã được thêm vào giỏ hàng!']);
    }

    public function buyNow($id)
    {
        CartManagement::addItemToCart($id, 1);
        return redirect('/checkout');
    }

    public function sortBy($field)
    {
        if ($field == 'default') {
            $this->sort_by = 'default';
            $this->sort_direction = 'desc';
        } elseif ($field == 'price-asc') {
            $this->sort_by = 'price';
            $this->sort_direction = 'asc';
        } elseif ($field == 'price-desc') {
            $this->sort_by = 'price';
            $this->sort_direction = 'desc';
        }

        $this->resetPage();
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

        if ($this->sort_by == 'price') {
            $query->orderBy('price', $this->sort_direction);
        } else {
            $query->orderBy('created_at', 'desc');
        }

        $dishes = $query->whereBetween('price', [$this->price_min, $this->price_max])
            ->where('status', 'available')
            ->paginate(9);

        $topSellingDishes = Dish::orderBy('sold_quantity', 'desc')
            ->where('status', 'available')
            ->take(4)
            ->get();

        $categories = FoodCategory::withCount('dishes')->get();
        $dishCount = Dish::count();

        return view('livewire.shop.shop', [
            'dishes' => $dishes,
            'categories' => $categories,
            'topSellingDishes' => $topSellingDishes,
            'dishCount' => $dishCount,
            'sort_by' => $this->sort_by,
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
}
