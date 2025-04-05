<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Đặt Chỗ</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
        }
        p {
            font-size: 16px;
            line-height: 1.6;
            margin: 10px 0;
        }
        .label {
            font-weight: bold;
            color: #555;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #777;
            border-top: 1px solid #eee;
            padding-top: 10px;
        }
        .highlight {
            background-color: #f9f9f9;
            border-left: 5px solid #4CAF50;
            padding: 10px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thông Tin Đặt Chỗ</h1>
        <div class="highlight">
            <p><span class="label">Tên:</span> {{ $reservation->name }}</p>
            <p><span class="label">Điện Thoại:</span> {{ $reservation->phone }}</p>
            <p><span class="label">Ngày Đặt:</span> {{ $reservation->reservation_day }}</p>
            <p><span class="label">Số Người:</span> {{ $reservation->number_of_people }}</p>
            <p><span class="label">Thời Gian Đặt:</span> {{ $reservation->reservation_time }}</p>
            <p><span class="label">Nhà Hàng:</span> {{ $reservation->restaurant->name }}</p>
            <p><span class="label">Địa Chỉ:</span> {{ $reservation->restaurant->address }}</p>
            <p><span class="label">Ghi Chú:</span> {{ $reservation->notes }}</p>
            <p><span class="label">Mã Đặt Chỗ:</span> {{ $reservation->reservation_code }}</p>
        </div>
        <div class="footer">
            Cảm ơn bạn đã chọn chúng tôi!
        </div>
    </div>
</body>
</html>