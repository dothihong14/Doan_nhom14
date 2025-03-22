<!DOCTYPE html>
<html>
<head>
    <title>Reservation Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            line-height: 1.5;
            margin: 10px 0;
        }
        .label {
            font-weight: bold;
            color: #555;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reservation Details</h1>
        <p><span class="label">Name:</span> {{ $reservation->name }}</p>
        <p><span class="label">Phone:</span> {{ $reservation->phone }}</p>
        <p><span class="label">Reservation Day:</span> {{ $reservation->reservation_day }}</p>
        <p><span class="label">Number of People:</span> {{ $reservation->number_of_people }}</p>
        <p><span class="label">Reservation Time:</span> {{ $reservation->reservation_time }}</p>
        <p><span class="label">Restaurant:</span> {{ $reservation->restaurant->name }}</p>
        <p><span class="label">Notes:</span> {{ $reservation->notes }}</p>
        <p><span class="label">Reservation Code:</span> {{ $reservation->reservation_code }}</p>
        <div class="footer">
            Thank you for choosing us!
        </div>
    </div>
</body>
</html>