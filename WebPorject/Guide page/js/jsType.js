window.onresize = function () {
    var x = document.documentElement.clientWidth;
    var y = document.documentElement.clientHeight;

    for (var i = 0; i < $(".box li").length; i++) {
        $(".box li").eq(i).css({"width": x, "height": y});
    }
    console.log(x + "   " + y);
};
var num = 0;
!function ($) {
    $(document).on("mousewheel DOMMouseScroll", function (e) {
        //e.preventDefault();
        var value = e.originalEvent.wheelDelta || -e.originalEvent.detail;
        //var value=e.originalEvent.wheelDelta || -e.originalEvent.detail;
        var returnValue = Math.max(-1, Math.min(1, value));
        if (returnValue > 1) {			//向上
            $("body").attr({"num": num += 1});
        } else {
            $("body").attr({"num": num -= 1});
        }
    });
}(jQuery);


