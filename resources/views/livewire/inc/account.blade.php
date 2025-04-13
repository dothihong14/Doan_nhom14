<nav class="woocommerce-MyAccount-navigation">
    <ul>
        <li
            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard {{ request()->is('my-account') ? 'is-active' : '' }}">
            <a
                href="/my-account/">Bảng điều khiển</a>
        </li>
        <li
            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders {{ request()->is('my-account/orders') ? 'is-active' : '' }}">
            <a
                href="/my-account/orders/">Đơn hàng</a>
        </li>
        <li
            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--downloads {{ request()->is('my-account/reservations') ? 'is-active' : '' }}">
            <a
                href="/my-account/reservations/">Đặt bàn</a>
        </li>
        <li
            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--edit-account {{ request()->is('my-account/edit-account') ? 'is-active' : '' }}">
            <a
                href="/my-account/edit-account/">Thông tin tài khoản</a>
        </li>
        <li
            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout {{ request()->is('my-account/logout') ? 'is-active' : '' }}">
            <a
                href="/my-account/logout/">Đăng xuất</a>
        </li>
    </ul>
</nav>
