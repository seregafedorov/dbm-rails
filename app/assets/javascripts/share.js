(function () {
    Share = {
        go: function (_element, _options) {
            var
                self = Share,
                options = $.extend(
                    {
                        type: 'vk',    // тип соцсети
                        url: location.href,  // какую ссылку шарим
                        count_url: location.href,  // для какой ссылки крутим счётчик
                        title: document.title, // заголовок шаринга
                        image: '',             // картинка шаринга
                        text: ''             // текст шаринга
                    },
                    $(_element).data(), // Если параметры заданы в data, то читаем их
                    _options            // Параметры из вызова метода имеют наивысший приоритет
                );

            if (self.popup(link = self[options.type](options)) === null) {
                // Если не удалось открыть попап
                if ($(_element).is('a')) {
                    // Если это <a>, то подставляем адрес и просим браузер продолжить переход по ссылке
                    $(_element).prop('href', link);
                    return true;
                }
                else {
                    // Если это не <a>, то пытаемся перейти по адресу
                    location.href = link;
                    return false;
                }
            }
            else {
                // Попап успешно открыт, просим браузер не продолжать обработку
                return false;
            }
        },

        // ВКонтакте
        vk: function (_options) {
            var options = $.extend({
                url: location.href,
                title: document.title,
                image: '',
                text: ''
            }, _options);

            return 'http://vkontakte.ru/share.php?'
                + 'url=' + encodeURIComponent(options.url)
                + '&title=' + encodeURIComponent(options.title)
                + '&description=' + encodeURIComponent(options.text)
                + '&image=' + encodeURIComponent(options.image)
                + '&noparse=true';
        },

        // Facebook
        fb: function (_options) {
            var options = $.extend({
                url: location.href,
                title: document.title,
                image: '',
                text: ''
            }, _options);


//                app_id=145634995501895
//
//                    &href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2F
//            &redirect_uri=https%3A%2F%2Fdevelopers.facebook.com%2Ftools%2Fexplorer

            return 'https://www.facebook.com/dialog/share?display=popup'
                + '&app_id=' + options.appId
                + '&href=' + encodeURIComponent(options.url)
                + '&redirect_uri=' + encodeURIComponent(options.url);
        },

        // Твиттер
        tw: function (_options) {
            var options = $.extend({
                url: location.href,
                count_url: location.href,
                title: document.title
            }, _options);

            return 'http://twitter.com/share?'
                + 'text=' + encodeURIComponent(options.title)
                + '&url=' + encodeURIComponent(options.url)
                + '&counturl=' + encodeURIComponent(options.count_url);
        },

        // Открыть окно шаринга
        popup: function (url) {
            return window.open(url, '', 'toolbar=0,status=0,scrollbars=1,width=626,height=436');
        }
    };

    $(document).on('click', '.social-share', function(event){
        event.preventDefault();
        Share.go(this);
    });
})();


