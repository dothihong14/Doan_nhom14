(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        elementorFrontend.hooks.addAction('frontend/element_ready/delicioz-testimonials.default', ($scope) => {
            let $carousel = $('.delicioz-carousel', $scope);
            let $currentItem = $('.current-item', $scope);
            if ($carousel.length > 0) {
                let data = $carousel.data('settings');
                $carousel.on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
                    var i = (currentSlide ? currentSlide : 0) + 1;
                    $currentItem.text(i + '/' + slick.slideCount);
                });
                if ($carousel.hasClass('layout-3')) {
                    let $nav = $('.testimonial-image-style', $scope);
                    $carousel.slick({
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        arrows: false,
                        fade: true,
                        asNavFor: $nav
                    });
                    $nav.slick({
                        slidesToShow: 3,
                        slidesToScroll: 1,
                        asNavFor: $carousel,
                        adaptiveHeight: false,
                        dots: false,
                        centerMode: true,
                        focusOnSelect: true,
                        arrows: false,
                        centerPadding: '0px'
                    }).on('setPosition', function (event, slick) {
                        slick.$slides.css('height', slick.$slideTrack.height() + 'px');
                    });
                } else {
                    $carousel.slick(
                        {
                            dots: data.navigation == 'both' || data.navigation == 'dots' ? true : false,
                            arrows: data.navigation == 'both' || data.navigation == 'arrows' ? true : false,
                            infinite: data.loop,
                            speed: 300,
                            slidesToShow: parseInt(data.items),
                            slidesToScroll: parseInt(data.items),
                            autoplay: data.autoplay,
                            autoplaySpeed: data.autoplaySpeed,
                            lazyLoad: 'ondemand',
                            rtl: data.rtl,
                            responsive: [
                                {
                                    breakpoint: parseInt(data.breakpoint_laptop),
                                    settings: {
                                        slidesToShow: parseInt(data.items_laptop),
                                        slidesToScroll: parseInt(data.items_laptop),
                                    }
                                },
                                {
                                    breakpoint: parseInt(data.breakpoint_tablet_extra),
                                    settings: {
                                        slidesToShow: parseInt(data.items_tablet_extra),
                                        slidesToScroll: parseInt(data.items_tablet_extra),
                                    }
                                },
                                {
                                    breakpoint: parseInt(data.breakpoint_tablet),
                                    settings: {
                                        slidesToShow: parseInt(data.items_tablet),
                                        slidesToScroll: parseInt(data.items_tablet),
                                    }
                                },
                                {
                                    breakpoint: parseInt(data.breakpoint_mobile_extra),
                                    settings: {
                                        slidesToShow: parseInt(data.items_mobile_extra),
                                        slidesToScroll: parseInt(data.items_mobile_extra),
                                    }
                                },
                                {
                                    breakpoint: parseInt(data.breakpoint_mobile),
                                    settings: {
                                        slidesToShow: parseInt(data.items_mobile),
                                        slidesToScroll: parseInt(data.items_mobile),
                                    }
                                }
                            ]
                        }
                    );
                }

            }
        });
    });

})(jQuery);
