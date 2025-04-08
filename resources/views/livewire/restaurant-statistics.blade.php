<div >
    <div id="statisticsContent" style="width: 600px;">
        <h1 style="text-align: center; font-size: 24px; margin-bottom: 20px;">Thống Kê Cơ Sở {{ $restaurant->name }}  - Tháng {{ date('m') }}</h1>

    <h2 style="text-align: center; font-size: 24px; margin-bottom: 20px;">Thống Kê Doanh Thu Hóa Đơn  - Tháng {{ date('m') }}</h2>
    <canvas id="myChart"></canvas>
    <h2 style="text-align: center; font-size: 24px; margin-top: 40px;">Thống Kê Doanh Thu Đơn Hàng - Tháng {{ date('m') }}</h2>
    <canvas id="orderRevenueChart"></canvas>

<br>

    <h2 style="text-align: center; font-size: 24px; margin-top: 40px;">Thống Kê Số Lượng Đặt Chỗ - Tháng {{ date('m') }}</h2>
    <canvas id="reservationChart"></canvas>

    <h2 style="text-align: center; font-size: 24px; margin-top: 40px;">Thống Kê Số Lượng Khách Hàng Mới - Tháng {{ date('m') }}</h2>
    <canvas id="customerChart"></canvas>
</div>



    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
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
    <script>
        function printPDF() {
            // Select the element to be printed
            const element = document.getElementById('statisticsContent');

            // Options for the pdf
            const options = {
                margin:       1,
                filename:     'thong_ke_nha_hang.pdf',
                image:        { type: 'jpeg', quality: 1 },
                html2canvas:  { scale: 1 },
                jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
            };

            // Create the pdf
            html2pdf().from(element).set(options).save();
        }
        setTimeout(() => {
            printPDF();
        }, 1000);
    </script>
</div>