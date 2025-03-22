<div id="content" class="site-content" tabindex="-1">
    <div class="col-full">

        <div class="woocommerce"></div>
        <div id="primary" class="content-area">
            <main id="main" class="site-main">
                <header class="woocommerce-products-header">

                </header>
                <div class="woocommerce-notices-wrapper"></div>
                <div class="delicioz-sorting"> <a href="#" class="filter-toggle" aria-expanded="false">
                        <i class="delicioz-icon-sliders-v"></i><span>Filter</span></a>

                    <p class="woocommerce-result-count">
                        Showing {{ $dishes->firstItem() }}&ndash;{{ $dishes->lastItem() }} of {{ $dishes->total() }}
                        results
                    </p>
                </div>
                <div class="delicioz-products-spacing ">
                    <ul class="delicioz-products products columns-3">
                        @foreach ($dishes as $dish)
                            <li
                                class="product type-product post-480 status-publish first instock product_cat-desserts product_cat-recipes product_tag-desserts product_tag-recipes has-post-thumbnail shipping-taxable purchasable product-type-simple">
                                <div class="product-block">
                                    <div class="product-transition"><img width="300" height="300"
                                            src="{{ Storage::url($dish->image) }}"
                                            class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt=""
                                            loading="lazy" sizes="(max-width: 300px) 100vw, 300px" />

                                        <a href="/product/{{ $dish->slug }}"
                                            class="woocommerce-LoopProduct-link woocommerce-loop-product__link"></a>
                                    </div>
                                    <div class="product-caption">
                                        <h3 class="woocommerce-loop-product__title"><a
                                                href="/product/{{ $dish->slug }}">{{ $dish->name }}</a></h3>
                                        <div class="count-review">
                                            <div class="star-rating" role="img" aria-label="Rated 4.75 out of 5"><span
                                                    style="width:95%">Rated
                                                    <strong class="rating">4.75</strong> out of 5</span></div>
                                            <span></span>
                                        </div>
                                        <span class="price"><span class="woocommerce-Price-amount amount"><bdi><span
                                                        class="woocommerce-Price-currencySymbol"></span>{{ number_format($dish->price, 0, ',', '.') }}
                                                    VNĐ</bdi></span></span>
                                        <div class="product-caption-bottom"><a
                                                class="button product_type_simple add_to_cart_button ajax_add_to_cart"
                                                wire:click="addToCart({{ $dish->id }})">Mua Ngay</a></div>
                                    </div>
                                </div>
                            </li>
                        @endforeach

                    </ul>
                </div>
                <nav class="woocommerce-pagination">
                    <ul class='page-numbers'>
                        @if ($dishes->onFirstPage())
                            <li><span aria-current="page" class="page-numbers current">{{ $dishes->currentPage() }}</span>
                            </li>
                        @else
                            <li><a class="page-numbers" wire:click.prevent="gotoPage(1)">1</a></li>
                        @endif

                        @for ($i = 2; $i <= $dishes->lastPage(); $i++)
                            <li>
                                @if ($i == $dishes->currentPage())
                                    <span aria-current="page" class="page-numbers current">{{ $i }}</span>
                                @else
                                    <a class="page-numbers" wire:click.prevent="gotoPage({{ $i }})">{{ $i }}</a>
                                @endif
                            </li>
                        @endfor

                        @if ($dishes->hasMorePages())
                            <li>
                                <a class="next page-numbers" wire:click.prevent="nextPage">
                                    <span></span><i class="delicioz-icon delicioz-icon-angle-right"></i>
                                </a>
                            </li>
                        @endif
                    </ul>
                </nav>
            </main><!-- #main -->
        </div><!-- #primary -->
        <div id="secondary" class="widget-area" role="complementary">
            <div id="woocommerce_product_categories-2" class="widget woocommerce widget_product_categories">
                <span class="gamma widget-title">Danh mục món ăn</span>
                <div class="widget-content">
                    <ul class="product-categories">
                        @foreach ($categories as $category)
                            <li class="cat-item cat-item-42"><a
                                    onclick="window.location.href='/shop?category={{ $category->id }}'">{{ $category->name }}</a>
                                <span class="count">({{ $category->dishes_count }})</span>
                            </li>
                        @endforeach

                    </ul>
                </div>
            </div>
            <div id="woocommerce_product_categories-2" class="widget woocommerce widget_product_categories">
                <span class="gamma widget-title">Danh mục nhà hàng</span>
                <div class="widget-content">
                    <ul class="product-categories">
                        @foreach ($restaurants as $restaurant)
                            <li class="cat-item cat-item-42"><a
                                    onclick="window.location.href='/shop?restaurant={{ $restaurant->id }}'">{{ $restaurant->name }}</a>
                                <span class="count">({{ $restaurant->dishes_count }})</span>
                            </li>
                        @endforeach

                    </ul>
                </div>
            </div>

            <div id="woocommerce_products-2" class="widget woocommerce widget_products"><span
                    class="gamma widget-title">Best Seller</span>
                <div class="widget-content">
                    <ul class="product_list_widget">
                        @foreach ($topSellingDishes as $dish)
                        <li class="product">
                            <div class="product-list-inner">
                                <div class="product-image">
                                    <a href="/product/{{ $dish->slug }}" class="menu-thumb">
                                        <img width="300" height="300"
                                            src="{{ Storage::url($dish->image) }}"
                                            class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt=""
                                            loading="lazy" /> </a>
                                </div>

                                <div class="product-content">
                                    <h3 class="woocommerce-loop-product__title"><a
                                            href="/product/{{ $dish->slug }}">{{ $dish->name }}</a></h3>
                                    <div class="count-review">
                                        <div class="star-rating" role="img" aria-label="Rated 4.50 out of 5"><span
                                                style="width:90%">Rated
                                                <strong class="rating">4.50</strong> out of 5</span></div>
                                        <span></span>
                                    </div>
                                    <span class="price"><span class="woocommerce-Price-amount amount"><bdi><span
                                                    class="woocommerce-Price-currencySymbol"></span>{{ number_format($dish->price, 0, ',', '.') }}
                                                    VNĐ</bdi></span></span>
                                </div>

                            </div>
                        </li>
                        @endforeach

                    </ul>
                </div>
            </div>

            <div id="block-9" class="widget widget_block">
                <div data-elementor-type="section" data-elementor-id="537" class="elementor elementor-537">
                    <div class="elementor-section elementor-top-section elementor-element elementor-element-23c4c6e elementor-section-boxed elementor-section-height-default elementor-section-height-default"
                        data-id="23c4c6e" data-element_type="section">
                        <div class="elementor-container elementor-column-gap-no">
                            <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-b418e07"
                                data-id="b418e07" data-element_type="column">
                                <div class="elementor-widget-wrap elementor-element-populated">
                                    <div class="elementor-element elementor-element-f852d15 elementor-position-above elementor-cta--valign-top elementor-type-button-default elementor-bg-transform elementor-bg-transform-zoom-in elementor-widget elementor-widget-delicioz-banner"
                                        data-id="f852d15" data-element_type="widget"
                                        data-widget_type="delicioz-banner.default">
                                        <div class="elementor-widget-container">
                                            <a href="/delicioz/menu-list-01/"
                                                class="elementor-cta--skin-cover elementor-cta elementor-delicioz-banner">
                                                <div class="elementor-cta__bg-wrapper">
                                                    <div class="elementor-cta__bg-overlay"></div>
                                                    <div class="elementor-cta__bg elementor-bg"
                                                        style="background-image: url(/delicioz/wp-content/uploads/2022/07/banner-sidebar.jpg);">
                                                    </div>
                                                </div>
                                                <div class="elementor-cta__content">
                                                    <div class="elementor-cta__content_inner">
                                                        <div
                                                            class="elementor-cta__subtitle elementor-cta__content-item elementor-content-item">
                                                            <div>Special offers</div>
                                                        </div>

                                                        <h3
                                                            class="elementor-cta__title elementor-cta__content-item elementor-content-item">
                                                            Organic Cravings Menu </h3>



                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- #secondary -->

    </div><!-- .col-full -->
</div><!-- #content -->
{{-- <div>
    <div>
        <h2>Danh mục</h2>
        <ul>
            @foreach ($categories as $category)
            <li onclick="window.location.href='/shop?category={{ $category->id }}'">{{ $category->name }}
                ({{ $category->dishes_count }})</li>
            @endforeach
        </ul>
    </div>

    <div>
        <h2>Lọc theo giá</h2>
        <input type="number" wire:model="price_min" placeholder="Giá tối thiểu">
        <input type="number" wire:model="price_max" placeholder="Giá tối đa">
    </div>

    <div>
        <h2>Sắp xếp theo</h2>
        <button wire:click="sortBy('price')">Giá</button>
        <button wire:click="sortBy('created_at')">Ngày tạo</button>
        <button wire:click="sortBy('sold_quantity')">Lượt bán</button>
    </div>

    <div>
        <h2>Món ăn</h2>
        <ul>
            @foreach ($dishes as $dish)
            <li>{{ $dish->name }} - {{ $dish->price }} VNĐ</li>
            @endforeach
        </ul>
    </div>

    {{ $dishes->links() }} <!-- Phân trang -->
</div> --}}