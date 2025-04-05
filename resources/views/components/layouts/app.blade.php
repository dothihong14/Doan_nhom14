<!DOCTYPE html>
<html lang="vi" data-theme="light">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="icon" href="/logo.png" type="image/x-icon">
    @livewireStyles
</head>

<body>
    {{ $slot }}
    @livewireScripts
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
</style>
</html>
