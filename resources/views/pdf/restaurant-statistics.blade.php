<div>
    <h2 style="text-align: center; font-size: 24px; margin-bottom: 20px;">Thống Kê Hóa Đơn  - Tháng {{ date('m') }}</h2>
    <canvas id="myChart"></canvas>
    <h2 style="text-align: center; font-size: 24px; margin-top: 40px;">Thống Kê  Đơn Hàng - Tháng {{ date('m') }}</h2>
    <canvas id="orderRevenueChart"></canvas>


    <h2 style="text-align: center; font-size: 24px; margin-top: 40px;">Thống Kê Đặt Chỗ - Tháng {{ date('m') }}</h2>
    <canvas id="reservationChart"></canvas>

    <h2 style="text-align: center; font-size: 24px; margin-top: 40px;">Thống Kê Khách Hàng Mới - Tháng {{ date('m') }}</h2>
    <canvas id="customerChart"></canvas>



    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        const ctx = document.getElementById('myChart');

        new Chart(ctx, {
            type: 'line', // Changed to line chart
            data: {
                labels: {!! json_encode($dateRange) !!},
                datasets: [

                    {
                        label: 'Doanh Thu',
                        data: {!! json_encode($dailyRevenue) !!},
                        fill: false,
                        borderColor: 'rgba(54, 162, 235, 1)',
                        tension: 0.1 // Smooth line
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Giá Trị'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        }
                    }
                }
            }
        });

    </script>
    <script>
          const orderRevenueCtx = document.getElementById('orderRevenueChart');
        new Chart(orderRevenueCtx, {
            type: 'line',
            data: {
                labels: {!! json_encode($dateRange) !!},
                datasets: [
                    {
                        label: 'Doanh Thu Đơn Hàng',
                        data: {!! json_encode($dailyOrderRevenue) !!},
                        fill: false,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        tension: 0.1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Giá Trị'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        },
                        type: 'category',
                    }
                }
            }
        });
        </script>
        <script>
               const reservationCtx = document.getElementById('reservationChart');
        new Chart(reservationCtx, {
            type: 'line',
            data: {
                labels: {!! json_encode($dateRange) !!},
                datasets: [
                    {
                        label: 'Số Lượng Đặt Chỗ',
                        data: {!! json_encode($dailyReservations) !!},
                        fill: false,
                        borderColor: 'rgba(255, 206, 86, 1)',
                        tension: 0.1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Số Lượng'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        },
                        type: 'category',
                    }
                }
            }
        });
    </script>
    <style>
        h2 {
            color: #333;
            font-family: 'Arial', sans-serif;
            margin-bottom: 20px;
        }
        canvas {
            max-width: 100%;
            height: auto;
        }
    </style>
    <script>
           const customerCtx = document.getElementById('customerChart');
        new Chart(customerCtx, {
            type: 'line',
            data: {
                labels: {!! json_encode($dateRange) !!},
                datasets: [
                    {
                        label: 'Số Khách Hàng',
                        data: {!! json_encode($dailyCustomers) !!},
                        fill: false,
                        borderColor: 'rgba(153, 102, 255, 1)',
                        tension: 0.1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Số Lượng'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        },
                        type: 'category',
                    }
                }
            }
        });
    </script>
</div>