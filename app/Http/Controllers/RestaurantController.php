<?php

namespace App\Http\Controllers;

use App\Models\Restaurant;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    public function print(Restaurant $restaurant)
    {
        $pdf = Pdf::loadView('pdf.restaurant-statistics', ['id' => $restaurant->id]);
        return $pdf->download('restaurant-statistics.pdf');
    }
}
