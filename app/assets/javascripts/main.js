(function () {

    $(document).on('ready', function () {
        var $carouselElement = $('#carousel')
        $carouselElement.carousel({
            interval: false
        });

        $('#carousel').on('click', function () {
            $carouselElement.carousel('next');
        });

        $(document).on('click', '.video-div', function (e) {
            $(e.target).remove();

        });

        $('.vimeo-preview').on('click', function (e) {
            var vimeoId = $(e.target).data('vimeo-id');
            console.log(vimeoId);
            var videoDiv = $('<div class="video-div">' +
                '<div class="">' +
                '<iframe src="//player.vimeo.com/video/' + vimeoId + '" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""/>' +
                '</div>' +
                '</div>');
            $('body').append(videoDiv);
        });

    });

})();