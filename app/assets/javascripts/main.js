(function () {

    function is_touch_device() {
        return (('ontouchstart' in window)
        || (navigator.MaxTouchPoints > 0)
        || (navigator.msMaxTouchPoints > 0));
    }

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
        var touchInterval = null;
        var popupTouchInterval = null;
        var popupOpened = false;

        var popupAutoOrClickClose = function (e) {
            if (e) {
                e.stopPropagation();
            }
            if (touchInterval) {
                clearInterval(touchInterval);
            }
            if (popupTouchInterval) {
                clearInterval(popupTouchInterval);
            }
            if (!popupOpened) {
                return;
            } else {
                $popup.addClass('hide');
                $popupImg.unbind('touchstart', popupAutoOrClickClose);
                popupOpened = false;
            }
            //.unbind(, popupAutoOrClickClose);
        };

        var popupOpen = function (e) {
            e.stopPropagation();
            if (popupOpened) {
                return;
            } else {
                popupOpened = true;
            }
            var $this = $(e.target);
            if (e.type == 'touchstart') {
                //alert('touch start');
                touchInterval = setInterval(function () {
                    clearInterval(touchInterval);
                    popupAutoOrClickClose();
                }, 5000);
                popupTouchInterval = setInterval(function () {
                    $popupImg.on('touchstart', popupAutoOrClickClose);
                }, 500);

            }
            $popup.removeClass('hide');
            $popupImg.css({backgroundImage: 'url(' + $this.data('src') + ')'});

            $this.on('mouseleave', popupAutoOrClickClose);
        };
        //$popupImg.on('touchend', function () {
        //    touching = false;
        //});
        if( is_touch_device() ) {
            $('.popup').on('touchstart', popupOpen);
        } else {
            $('.popup').on('mouseenter', popupOpen);
        }



    });


})();
