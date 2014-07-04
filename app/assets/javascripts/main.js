(function () {

    $(document).on('ready', function () {
        var $carouselElement = $('#carousel')
        $carouselElement.carousel({
            interval: false
        });

        $('#carousel').on('click', function(){
            $carouselElement.carousel('next');
        });
    });

})();