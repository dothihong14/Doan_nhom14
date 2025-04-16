<?php

namespace App\Filament\Widgets;

use App\Models\Invoice;
use App\Models\Order;
use App\Models\Restaurant;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;

class RestaurantRevenueWidget extends ChartWidget
{
    protected static ?string $heading = 'Doanh thu hôm nay';

    protected function getData(): array
    {
        $today = now()->format('Y-m-d');

        // Lấy doanh thu từ bảng invoices (status = 'paid')
        $invoiceRevenues = Invoice::select('restaurant_id', DB::raw('SUM(total_amount) as total_revenue'))
            ->whereDate('created_at', $today)
            ->where('status', 'paid')
            ->groupBy('restaurant_id');

        // Lấy doanh thu từ bảng orders (payment_status = 'paid' và status = 'delivered')
        $orderRevenues = Order::select('restaurant_id', DB::raw('SUM(total_amount) as total_revenue'))
            ->whereDate('created_at', $today)
            ->where('payment_status', 'paid')
            ->where('status', 'delivered')
            ->groupBy('restaurant_id');

        // Gộp hai kết quả bằng UNION và tính tổng doanh thu theo restaurant_id
        $revenues = DB::query()
            ->select('restaurant_id', DB::raw('SUM(total_revenue) as total_revenue'))
            ->fromSub(
                $invoiceRevenues->unionAll($orderRevenues),
                'combined_revenues'
            )
            ->groupBy('restaurant_id')
            ->get();

        // Lấy tên nhà hàng và doanh thu
        $labels = $revenues->map(function ($revenue) {
            return Restaurant::find($revenue->restaurant_id)?->name ?? 'Unknown'; // Xử lý trường hợp không tìm thấy nhà hàng
        })->toArray();

        $data = $revenues->pluck('total_revenue')->toArray();

        // Tạo màu sắc ngẫu nhiên cho từng thanh
        $backgroundColors = array_map(function () {
            return sprintf('rgba(%d, %d, %d, 0.5)', rand(0, 255), rand(0, 255), rand(0, 255));
        }, $data);

        return [
            'labels' => $labels,
            'datasets' => [
                [
                    'label' => 'Doanh thu',
                    'data' => $data,
                    'backgroundColor' => $backgroundColors,
                    'borderColor' => array_map(function ($color) {
                        return str_replace('0.5', '1', $color);
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
