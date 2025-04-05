<div>
    <div class="account-wrap d-none">
        <div class="account-inner dashboard">
            @if (!auth()->check())
            <ul class="account-dashboard">
                <li>
                    <a href="/register"
                        title="Account Details">Đăng ký</a>
                </li>
                <li>
                    <a href="/login"
                        title="Account Details">Đăng nhập</a>
                </li>

            </ul>
            @else
            <ul class="account-dashboard">
                <li>
                    <a href="/my-account"
                        title="Account Details">Tài khoản</a>
                </li>
                <li>
                    <a wire:click="logout"
                        title="Account Details">Đăng xuất</a>
                </li>
            </ul>
            @endif
        </div>
    </div>
    <div class="delicioz-mobile-nav">
        <div class="menu-scroll-mobile">
            <a href="#" class="mobile-nav-close"><i class="delicioz-icon-times"></i></a>
            <div class="mobile-nav-tabs">
                <ul>
                    <li class="mobile-tab-title mobile-pages-title active" data-menu="pages">
                        <span>Menu chính</span>
                    </li>
                </ul>
            </div>
            <nav class="mobile-menu-tab mobile-navigation mobile-pages-menu active" aria-label="Mobile Navigation">
                <div class="handheld-navigation">
                    <ul id="menu-1-431e843" class="menu">
                        <li id="menu-item-75"
                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                            <a href="/"><span class="menu-title">Trang chủ</span></a>
                        </li>
                        <li id="menu-item-75"
                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                            <a href="/shop"><span class="menu-title">Thực đơn</span></a>
                        </li>
                        <li id="menu-item-75"
                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                            <a href="/restaurant"><span class="menu-title">Cơ sở</span></a>
                        </li>
                        <li id="menu-item-75"
                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                            <a href="/promotion"><span class="menu-title">Ưu đãi</span></a>
                        </li>
                        <li id="menu-item-75"
                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                            <a href="/reservation"><span class="menu-title">Đặt bàn</span></a>
                        </li>
                        <li id="menu-item-75"
                            class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                            <a href="/contact"><span class="menu-title">Liên hệ</span></a>
                        </li>

                    </ul>
                </div>
            </nav>
            <nav class="mobile-menu-tab mobile-navigation-categories mobile-categories-menu"
                aria-label="Mobile Navigation">
                <ul id="menu-1-431e843" class="menu">
                    <li id="menu-item-75" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                        <a href="/"><span class="menu-title">Trang chủ</span></a>
                    </li>
                    <li id="menu-item-75" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                        <a href="/shop"><span class="menu-title">Thực đơn</span></a>
                    </li>
                    <li id="menu-item-75" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                        <a href="/restaurant"><span class="menu-title">Cơ sở</span></a>
                    </li>
                    <li id="menu-item-75" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                        <a href="/promotion"><span class="menu-title">Ưu đãi</span></a>
                    </li>
                    <li id="menu-item-75" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                        <a href="/reservation"><span class="menu-title">Đặt bàn</span></a>
                    </li>
                    <li id="menu-item-75" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-75">
                        <a href="/contact"><span class="menu-title">Liên hệ</span></a>
                    </li>

                </ul>
            </nav>
        </div>
        <div class="delicioz-language-switcher-mobile">
            <ul class="menu">
                <li class="item">
                    <div class="language-switcher-head">
                        <img src="/delicioz/wp-content/themes/delicioz/assets/images/language-switcher/en.jpg"
                            alt="WPML">
                    </div>
                </li>
                <li class="item">
                    <div class="language-switcher-img">
                        <a href="#">
                            <img src="/delicioz/wp-content/themes/delicioz/assets/images/language-switcher/de.jpg"
                                alt="WPML">
                        </a>
                    </div>
                </li>
                <li class="item">
                    <div class="language-switcher-img">
                        <a href="#">
                            <img src="/delicioz/wp-content/themes/delicioz/assets/images/language-switcher/it.jpg"
                                alt="WPML">
                        </a>
                    </div>
                </li>
                <li class="item">
                    <div class="language-switcher-img">
                        <a href="#">
                            <img src="/delicioz/wp-content/themes/delicioz/assets/images/language-switcher/hi.jpg"
                                alt="WPML">
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="delicioz-overlay"></div>
</div>
