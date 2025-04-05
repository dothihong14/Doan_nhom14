<?php

namespace App\Filament\Widgets;

use App\Models\Invoice;
use App\Models\Restaurant;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;

class RestaurantRevenueWidget extends ChartWidget
{
    protected static ?string $heading = 'Doanh thu hôm nay';


    protected function getData(): array
    {
        // Lấy doanh thu của các nhà hàng trong hôm nay
        $today = now()->format('Y-m-d');
        $revenues = Invoice::select('restaurant_id', DB::raw('SUM(total_amount) as total_revenue'))
            ->whereDate('created_at', $today)
            ->groupBy('restaurant_id')
            ->get();

        // Lấy tên nhà hàng và doanh thu
        $labels = $revenues->map(function ($revenue) {
            return Restaurant::find($revenue->restaurant_id)->name; // Lấy tên nhà hàng
        })->toArray();

        $data = $revenues->pluck('total_revenue')->toArray();

        // Tạo màu sắc ngẫu nhiên cho từng thanh
        $backgroundColors = array_map(function() {
            return sprintf('rgba(%d, %d, %d, 0.5)', rand(0, 255), rand(0, 255), rand(0, 255));
        }, $data);

        return [
            'labels' => $labels, // Tên nhà hàng làm nhãn
            'datasets' => [
                [
                    'label' => 'Doanh thu',
                    'data' => $data,
                    'backgroundColor' => $backgroundColors,
                    'borderColor' => array_map(function($color) {
                        return str_replace('0.5', '1', $color); // Đổi độ trong suốt cho đường viền
                    }, $backgroundColors),
                    'borderWidth' => 1,
                ],
            ],
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }
}