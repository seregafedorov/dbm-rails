(function() {
    $(function() {
        var translations_fix;
        translations_fix = function() {
            return $(".activeadmin-translations > ul").each(function() {
                var $contents, $dom, $tabs;
                $dom = $(this);
                if (!$dom.data("ready")) {
                    $dom.data("ready", true);
                    $tabs = $("li > a", this);
                    $contents = $(this).siblings("fieldset");
                    $tabs.click(function() {
                        var $tab;
                        $tab = $(this);
                        $tabs.not($tab).removeClass("active");
                        $tab.addClass("active");
                        $contents.hide();
                        $contents.filter($tab.attr("href")).show();
                        return false;
                    });
                    $tabs.eq(0).click();
                    return $tabs.each(function() {
                        var $content, $tab, containsErrors;
                        $tab = $(this);
                        $content = $contents.filter($tab.attr("href"));
                        containsErrors = $content.find(".input.error").length > 0;
                        return $tab.toggleClass("error", containsErrors);
                    });
                }
            });
        };
        $(document.body).on("click", "a", function() {
            return setTimeout(function() {
                return translations_fix();
            }, 50);
        });
        return translations_fix();
    });

}).call(this);
