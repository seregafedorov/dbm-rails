(function () {

    $(document).on('ready', function () {
        var $carouselElement = $('#carousel')
        $carouselElement.carousel({
            interval: false
        });

        $('#carousel').on('click', function () {
            $carouselElement.carousel('next');
        });

        $(document).on('click', '.video-div-inner-close', function (e) {
            var videoDiv = $(e.target).closest('.video-div');
            if(videoDiv) {
                videoDiv.remove();
            }

        });

        $('.vimeo-preview').on('click', function (e) {
            var vimeoId = $(e.target).data('vimeo-id');
            console.log(vimeoId);
            var videoDiv = $('<div class="video-div"><div class="video-div-inner-close">CLOSE</div>' +
                '<div class="video-div-inner">' +
                '<div class="embed-responsive embed-responsive-16by9">' +
                '<iframe src="//player.vimeo.com/video/' + vimeoId + '" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""/>' +
                '</div>' +
                '</div>' +
                '</div>');
            $('body').append(videoDiv);
        });

    });

})();
