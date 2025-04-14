<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\Auth;
use App\Models\Invoice;
use App\Models\Order;
use Illuminate\Support\Carbon;

class RevenueByLocationWidget extends ChartWidget
{
    protected static ?string $heading = 'Doanh Thu Theo Cơ Sở';

    public ?string $filter = '30'; // Mặc định là 30 ngày

    protected function getFilters(): ?array
    {
        return [
            '7' => '7 Ngày',
            '30' => '30 Ngày',
            '90' => '90 Ngày',
            '365' => '1 Năm',
            'custom' => 'Tùy chỉnh',
        ];
    }

    protected function getData(): array
    {
        if (!Auth::check()) {
            return [
                'labels' => [],
                'datasets' => [],
            ];
        }

        // Xác định khoảng thời gian dựa trên bộ lọc
        $days = $this->filter !== 'custom' ? (int) $this->filter : 30;
        $startDate = Carbon::now()->subDays($days);
        $endDate = Carbon::now();

        // Nếu chọn tùy chỉnh, sử dụng khoảng thời gian từ form
        if ($this->filter === 'custom') {
            $startDate = request()->query('start_date')
                ? Carbon::parse(request()->query('start_date'))
                : Carbon::now()->subDays(30);
            $endDate = request()->query('end_date')
                ? Carbon::parse(request()->query('end_date'))
                : Carbon::now();
        }

        // Lấy doanh thu từ invoices
        $invoiceRevenues = Invoice::whereBetween('created_at', [$startDate, $endDate])
            ->whereNotNull('restaurant_id')
            ->whereNotNull('created_at')
            ->selectRaw('restaurant_id, DATE(created_at) as date, SUM(COALESCE(final_amount, 0)) as total')
            ->groupBy('restaurant_id', 'date')
            ->get();

        // Lấy doanh thu từ orders
        $orderRevenues = Order::whereBetween('created_at', [$startDate, $endDate])
            ->whereNotNull('restaurant_id')
            ->whereNotNull('created_at')
            ->selectRaw('restaurant_id, DATE(created_at) as date, SUM(COALESCE(final_amount, 0)) as total')
            ->groupBy('restaurant_id', 'date')
            ->get();

        // Tạo mảng để lưu trữ tổng doanh thu theo restaurant_id và date
        $revenueData = [];

        // Xử lý dữ liệu từ invoices
        foreach ($invoiceRevenues as $invoice) {
            if (!isset($invoice->restaurant_id) || !isset($invoice->date)) {
                \Illuminate\Support\Facades\Log::warning('Skipping invoice with missing restaurant_id or date', ['invoice' => $invoice]);
                continue;
            }
            $key = $invoice->restaurant_id . '|' . $invoice->date;
            if (!isset($revenueData[$key])) {
                $revenueData[$key] = [
                    'restaurant_id' => $invoice->restaurant_id,
                    'date' => $invoice->date,
                    'total' => 0,
                ];
            }
            $revenueData[$key]['total'] += $invoice->total;
        }

        // Xử lý dữ liệu từ orders và cộng dồn
        foreach ($orderRevenues as $order) {
            if (!isset($order->restaurant_id) || !isset($order->date)) {
                \Illuminate\Support\Facades\Log::warning('Skipping order with missing restaurant_id or date', ['order' => $order]);
                continue;
            }
            $key = $order->restaurant_id . '|' . $order->date;
            if (!isset($revenueData[$key])) {
                $revenueData[$key] = [
                    'restaurant_id' => $order->restaurant_id,
                    'date' => $order->date,
                    'total' => 0,
                ];
            }
            $revenueData[$key]['total'] += $order->total;
        }

        // Chuyển mảng thành collection để tiếp tục xử lý
        $revenues = collect(array_values($revenueData));

        // Kiểm tra nếu không có dữ liệu
        if ($revenues->isEmpty()) {
            return [
                'labels' => [],
                'datasets' => [],
            ];
        }

        // Tạo nhãn (labels) cho trục X
        $labels = $revenues->pluck('date')->unique()->sort()->values()->toArray();

        // Tạo dữ liệu cho từng cơ sở
        $datasets = [];
        $restaurants = $revenues->groupBy('restaurant_id');

        // Định nghĩa mảng màu
        $colors = [
            ['border' => 'rgb(75, 192, 192)', 'background' => 'rgba(75, 192, 192, 0.2)'],
            ['border' => 'rgb(255, 99, 132)', 'background' => 'rgba(255, 99, 132, 0.2)'],
            ['border' => 'rgb(54, 162, 235)', 'background' => 'rgba(54, 162, 235, 0.2)'],
        ];

        $colorIndex = 0;
        foreach ($restaurants as $restaurant_id => $restaurantRevenues) {
            $restaurant = \App\Models\Restaurant::find($restaurant_id);
            $label = $restaurant ? $restaurant->name : 'Unknown (' . $restaurant_id . ')';

            // Tạo mảng dữ liệu cho từng ngày
            $data = [];
            foreach ($labels as $date) {
                $revenueForDate = $restaurantRevenues->firstWhere('date', $date);
                $data[] = $revenueForDate ? (float) $revenueForDate['total'] : 0;
            }

            // Chọn màu từ mảng $colors
            $color = $colors[$colorIndex % count($colors)];

            $datasets[] = [
                'label' => $label,
                'data' => $data,
                'borderColor' => $color['border'],
                'backgroundColor' => $color['background'],
                'fill' => true, // Điền màu dưới đường biểu đồ
                'tension' => 0.3, // Độ cong của đường (line chart)
            ];

            $colorIndex++;
        }

        return [
            'labels' => $labels,
            'datasets' => $datasets,
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }

    protected function getFormSchema(): array
    {
        if ($this->filter === 'custom') {
            return [
                \Filament\Forms\Components\DatePicker::make('start_date')->label('Từ ngày'),
                \Filament\Forms\Components\DatePicker::make('end_date')->label('Đến ngày'),
            ];
        }
        return [];
    }
}
