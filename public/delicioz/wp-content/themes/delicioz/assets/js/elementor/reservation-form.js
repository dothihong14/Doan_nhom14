(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        elementorFrontend.hooks.addAction('frontend/element_ready/delicioz-reservation-form.default', ($scope) => {
            $('.delicioz-datepicker').each(function () {
                var $this = $(this);
                var dateToday = new Date();
                $this.datepicker({
                    dateFormat: "dd/mm/yy",
                    minDate: dateToday,
                });
            });
        });
    });
})(jQuery);
