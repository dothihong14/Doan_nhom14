<?php

namespace App\Http\Controllers;
use App\Models\Order;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function print(Order $order)
    {
        $pdf = Pdf::loadView('pdf.order', ['order' => $order]);
        return $pdf->stream('order_' . $order->order_code . '.pdf');
    }
}
