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
            if (videoDiv) {
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

        var popupSpeed = 100;
        var $popup = $('<div id="popup" class="hide col-xs-6 col-sm-2 col-md-3 col-lg-offset-1 col-lg-2 tbl"><div class="popup-image"></div></div></div></div>');

        var $popupImg = $('.popup-image', $popup);
        $('body > .container-fluid').append($popup);
        var onEvent = false;
        var touching = false;
        var mouseover = false;

        var popupClose = function (e) {
            mouseover = false;
            $popup.addClass('hide');
            $popupImg.unbind('touchstart', popupClose).unbind('click', popupClose);
        };


        var popupOpen = function (e) {
            e.stopPropagation();
            if (e.type == 'touchstart') {
                touching = true;
            }
            else if (e.type == 'mouseover') {
                mouseover = true;
            }

            var $this = $(e.target);
            $popup.removeClass('hide');
            $popupImg.css({backgroundImage: 'url(' + $this.data('src') + ')'});
            var touchInterval = null;
            if (!mouseover) {
                touchInterval = setInterval(function () {
                    clearInterval(touchInterval);
                    popupClose();
                }, 5000);
            }
            $(e.target).on('mouseleave', function() {
                if( touchInterval ) {
                    clearInterval(touchInterval);
                }
                popupClose();
            });
        };
        $popupImg.on('touchend', function () {
            touching = false;
        });
        $('.popup').on('touchstart click mouseover', popupOpen);


    });


})();
