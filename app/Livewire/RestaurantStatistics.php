<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Invoice;
use App\Models\Restaurant;
use App\Models\Order;
use App\Models\Reservation;
use App\Models\Customer; // Import the Customer model
use Carbon\Carbon;
use Barryvdh\DomPDF\Facade\Pdf;

class RestaurantStatistics extends Component
{
    public $restaurantId;
    public $restaurant;
    public $dailyInvoices = [];
    public $dailyRevenue = [];
    public $dailyOrderRevenue = [];
    public $dailyReservations = [];
    public $dailyCustomers = []; // New property for daily customers

    public function mount($id)
    {
        $this->restaurantId = $id;
        $this->restaurant = Restaurant::find($this->restaurantId);

        // Fetch daily data for the current month
        $this->fetchDailyStatistics();
    }

    public function fetchDailyStatistics()
    {
        $startOfMonth = Carbon::now()->startOfMonth();
        $endOfMonth = Carbon::now()->endOfMonth();

        $this->dailyInvoices = [];
        $this->dailyRevenue = [];
        $this->dailyOrderRevenue = [];
        $this->dailyReservations = [];
        $this->dailyCustomers = []; // Initialize the new property

        // Generate dates for the current month
        $dateRange = [];
        for ($date = clone $startOfMonth; $date <= $endOfMonth; $date->addDay()) {
            $formattedDate = $date->format('Y-m-d'); // Store in Y-m-d format for querying
            $dateRange[] = $date->format('d/m'); // Store in d/m format for the chart

            // Fetch data for invoices
            $this->dailyInvoices[] = Invoice::where('restaurant_id', $this->restaurantId)
                ->whereDate('created_at', $formattedDate)
                ->count();

            $this->dailyRevenue[] = Invoice::where('restaurant_id', $this->restaurantId)
                ->whereDate('created_at', $formattedDate)
                ->sum('total_amount');

            // Fetch order revenue for the current date
            $this->dailyOrderRevenue[] = Order::where('restaurant_id', $this->restaurantId)
                ->whereDate('created_at', $formattedDate)
                ->sum('total_amount');

            // Fetch daily reservations
            $this->dailyReservations[] = Reservation::where('restaurant_id', $this->restaurantId)
                ->whereDate('reservation_day', $formattedDate)
                ->count();

            // Fetch daily customers
            $this->dailyCustomers[] = Customer::whereDate('created_at', $formattedDate)
                ->count(); // Assuming 'created_at' is the date the customer was added
        }

        return $dateRange;
    }
    public function generatePDF()
    {
        $dateRange = $this->fetchDailyStatistics(); // Ensure dateRange is updated

        $pdf = PDF::loadView('restaurant-statistics-pdf', [
            'restaurant' => $this->restaurant,
            'dailyInvoices' => $this->dailyInvoices,
            'dailyRevenue' => $this->dailyRevenue,
            'dailyReservations' => $this->dailyReservations,
            'dailyCustomers' => $this->dailyCustomers,
            'dateRange' => $dateRange,
        ]);

        return $pdf->download('thong_ke_nha_hang.pdf');
    }
    public function render()
    {

        return view('livewire.restaurant-statistics', [
            'restaurant' => $this->restaurant,
            'dailyInvoices' => $this->dailyInvoices,
            'dailyRevenue' => $this->dailyRevenue,
            'dailyOrderRevenue' => $this->dailyOrderRevenue,
            'dailyReservations' => $this->dailyReservations,
            'dailyCustomers' => $this->dailyCustomers, // Pass new data to the view
            'dateRange' => $this->fetchDailyStatistics(), // Ensure dateRange is updated
        ]);
    }
}