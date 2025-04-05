<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hóa đơn {{ $invoice->invoice_code }}</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; margin: 0; padding: 0; }
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            background-color: #f9f9f9;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo img {
            max-width: 150px; /* Adjust as necessary */
        }
        h1 {
            color: red;
            font-weight: bold;
            font-size: 24px;
            text-align: center;
        }
        h2 {
            color: #333;
            font-size: 20px;
        }
        p {
            color: #555;
        }
        table {
            width: 100%;
            line-height: 1.6;
            text-align: left;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        td {
            background-color: #fff;
        }
        h3 {
            margin-top: 20px;
            text-align: right;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="invoice-box">

        <h1>{{ $invoice->restaurant->name }}</h1>
        <h2>Hóa đơn: {{ $invoice->invoice_code }}</h2>
        <p>Ngày tạo: {{ $invoice->created_at->format('d/m/Y H:i') }}</p>

        <table>
            <tr>
                <th>Món ăn</th>
                <th>SL</th>
                <th>Đơn giá</th>
                <th>Thành tiền</th>
            </tr>
            @foreach ($invoice->invoiceItems as $item)
                <tr>
                    <td>{{ $item->dish->name }}</td>
                    <td>{{ $item->quantity }}</td>
                    <td>{{ number_format($item->unit_price, 0, ',', '.') }} VNĐ</td>
                    <td>{{ number_format($item->total_price, 0, ',', '.') }} VNĐ</td>
                </tr>
            @endforeach
        </table>

        <h3>Tổng cộng: {{ number_format($invoice->total_amount, 0, ',', '.') }} VNĐ</h3>
    </div>
</body>
</html>