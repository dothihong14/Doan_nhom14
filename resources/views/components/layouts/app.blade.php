<!DOCTYPE html>
<html lang="vi" data-theme="light">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="icon" href="/logo.png" type="image/x-icon">
    @livewireStyles
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>

<body>
{{ $slot }}
@livewireScripts
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
    console.log('Toastr script loaded');
    window.addEventListener('livewire:initialized', () => {
        console.log('Livewire initialized');
        Livewire.on('showToastr', (event) => {
            console.log('Toastr event received:', event);
            const data = Array.isArray(event) && event.length > 0 ? event[0] : event;
            const { type, message } = data;
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "toastClass": "custom-toastr"
            };

            if (type === 'success') {
                toastr.success(message);
            } else if (type === 'error') {
                toastr.error(message);
            }
        });
    });
</script>
</body>
<style>
    img.hfe-site-logo-img.elementor-animation- {
        height: 80px !important;
    }
    @media (max-width: 768px) {
        img.hfe-site-logo-img.elementor-animation- {
            height: 50px !important;
        }
    }
    .toast-top-right {
        top: 140px !important;
        right: 12px;
    }

    .toast-success {
        background-color: #28a745 !important;
        opacity: 1 !important;
    }

    .toast-error {
        background-color: #dc3545 !important;
        opacity: 1 !important;
    }
</style>
</html>
