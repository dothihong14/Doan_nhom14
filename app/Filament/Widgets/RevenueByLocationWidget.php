<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\Auth;
use App\Models\Invoice; // Đảm bảo import mô hình Invoice
use Illuminate\Support\Carbon;

class RevenueByLocationWidget extends ChartWidget
{
    protected static ?string $heading = 'Doanh Thu Theo Cơ Sở (30 Ngày)';

    protected function getData(): array
    {
        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (Auth::check()) {
            // Lấy doanh thu theo từng cơ sở trong 30 ngày gần nhất
            $revenues = Invoice::where('created_at', '>=', Carbon::now()->subDays(30))
                ->selectRaw('restaurant_id, DATE(created_at) as date, SUM(total_amount) as total')
                ->groupBy('restaurant_id', 'date')
                ->orderBy('restaurant_id')
                ->orderBy('date')
                ->get();

            // Tạo mảng dữ liệu cho biểu đồ
            $labels = $revenues->pluck('date')->unique()->sort()->toArray();
            $datasets = [];

            // Nhóm dữ liệu theo restaurant_id
            foreach ($revenues as $revenue) {
                $datasets[$revenue->restaurant_id]['label'] =  $revenue->restaurant->name;
                $datasets[$revenue->restaurant_id]['data'][$revenue->date] = $revenue->total;
            }

            // Chuyển đổi dữ liệu thành định dạng phù hợp cho biểu đồ
            $formattedDatasets = [];
            foreach ($datasets as $dataset) {
                $formattedDatasets[] = [
                    'label' => $dataset['label'],
                    'data' => array_replace(array_fill_keys($labels, 0), $dataset['data']),
                    'borderColor' => 'rgb(75, 192, 192)', // Có thể thay đổi màu sắc cho từng cơ sở
                    'backgroundColor' => 'rgba(75, 192, 192, 0.2)',
                ];
            }

            return [
                'labels' => $labels,
                'datasets' => $formattedDatasets,
            ];
        }

        return []; // Trả về mảng rỗng nếu người dùng chưa đăng nhập
    }

    protected function getType(): string
    {
        return 'line'; // Kiểu biểu đồ: đường
    }
}