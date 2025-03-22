(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        elementorFrontend.hooks.addAction('frontend/element_ready/delicioz-post-grid.default', ($scope) => {
            let $carousel = $('.delicioz-carousel', $scope);
            if ($carousel.length > 0) {
                let data = $carousel.data('settings');
                delicioz_slick_carousel_init($carousel, data);
            }
        });
    });
})(jQuery);


