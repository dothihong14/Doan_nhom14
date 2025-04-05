<?php

namespace App\Filament\Widgets;

use App\Models\Reservation;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class ReservationStats extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            $this->createStat('Lịch đặt bàn hôm nay', 'today'),
            $this->createStat('Lịch đặt bàn tuần này', 'week'),
            $this->createStat('Lịch đặt bàn tháng này', 'month'),
            $this->createStat('Lịch đặt bàn năm này', 'year'),
        ];
    }

    protected function createStat(string $label, string $period): Stat
    {
        $currentCount = $this->getReservationCount($period);
        $previousCount = $this->getPreviousReservationCount($period);
        $percentageChange = $this->calculatePercentageChange($currentCount, $previousCount);

        // Determine color based on percentage change
        $color = $percentageChange > 0 ? 'text-green-500' : ($percentageChange < 0 ? 'text-red-500' : 'text-gray-500');

        return Stat::make($label, $currentCount)
            ->description($percentageChange . '% so với kỳ trước')
            ->color($color);
    }

    protected function getReservationCount(string $period): int
    {
        switch ($period) {
            case 'today':
                return Reservation::whereDate('reservation_time', now()->toDateString())->count();
            case 'week':
                return Reservation::whereBetween('reservation_time', [now()->startOfWeek(), now()->endOfWeek()])->count();
            case 'month':
                return Reservation::whereMonth('reservation_time', now()->month)->count();
            case 'year':
                return Reservation::whereYear('reservation_time', now()->year)->count();
            default:
                return 0;
        }
    }

    protected function getPreviousReservationCount(string $period): int
    {
        switch ($period) {
            case 'today':
                return Reservation::whereDate('reservation_time', now()->subDay()->toDateString())->count();
            case 'week':
                return Reservation::whereBetween('reservation_time', [now()->subWeek()->startOfWeek(), now()->subWeek()->endOfWeek()])->count();
            case 'month':
                return Reservation::whereMonth('reservation_time', now()->subMonth()->month)->count();
            case 'year':
                return Reservation::whereYear('reservation_time', now()->subYear()->year)->count();
            default:
                return 0;
        }
    }

    protected function calculatePercentageChange(int $current, int $previous): string
    {
        if ($previous === 0) {
            return $current > 0 ? '100%' : '0%'; // Handle case when previous is zero
        }
        $change = (($current - $previous) / $previous) * 100;
        return number_format($change, 2);
    }
}