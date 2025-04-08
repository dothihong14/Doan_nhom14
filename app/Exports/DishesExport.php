<?php

namespace App\Exports;

use App\Models\Dish;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class DishesExport implements FromCollection, WithHeadings
{
    protected $restaurantId;

    public function __construct($restaurantId)
    {
        $this->restaurantId = $restaurantId;
    }

    public function collection()
    {
        // Lấy tháng hiện tại
        $startOfMonth = Carbon::now()->startOfMonth();
        $endOfMonth = Carbon::now()->endOfMonth();

        // Lấy danh sách món ăn và số lượt bán
        return Dish::with(['orderItems' => function ($query) use ($startOfMonth, $endOfMonth) {
            $query->whereHas('order', function ($query) use ($startOfMonth, $endOfMonth) {
                $query->where('restaurant_id', $this->restaurantId)
                    ->whereBetween('created_at', [$startOfMonth, $endOfMonth]);
            });
        }])
        ->get()
        ->map(function ($dish) {
            // Tính tổng số lượt bán cho món ăn trong tháng hiện tại
            $totalSold = $dish->orderItems->sum('quantity');
            // Tính doanh thu
            $revenue = $totalSold * $dish->price;

            return [
                'ID' => $dish->id,
                'Tên món ăn' => $dish->name,
                'Giá' => $dish->price,
                'Số lượt bán' => $totalSold ?? 0, // Thêm số lượt bán vào kết quả
                'Doanh thu' => $revenue ?? 0, // Thêm doanh thu vào kết quả
            ];
        });
    }

    public function headings(): array
    {
        return [
            'ID',
            'Tên món ăn',
            'Giá',
            'Số lượt bán', // Thêm tiêu đề cho số lượt bán
            'Doanh thu', // Thêm tiêu đề cho doanh thu
        ];
    }
}