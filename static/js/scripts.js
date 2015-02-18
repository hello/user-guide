function initializeJS() {

    //tool tips
    $('.tooltips').tooltip();

    //popovers
    $('.popovers').popover();

    //sidebar dropdown menu
    $('#sidebar .sub-menu > a').click(function () {
        // Close previous open submenu
        var last = $('.sub.open', $('#sidebar'));
        $(last).slideUp(50);
        $(last).removeClass("open");
        $('.menu-arrow', $(last).parent()).addClass('fa-angle-right');
        $('.menu-arrow', $(last).parent()).removeClass('fa-angle-down');

        // Toggle current submenu
        var sub = $(this).next();
        if (sub.is(":visible")) {
            $('.menu-arrow', this).addClass('fa-angle-right');
            $('.menu-arrow', this).removeClass('fa-angle-down');
            sub.slideUp(50);
            $(sub).removeClass("open")
        } else {
            $('.menu-arrow', this).addClass('fa-angle-down');
			$('.menu-arrow', this).removeClass('fa-angle-right');
            sub.slideDown(50);
            $(sub).addClass("open")
        }

        // Center chosen menu on screen
        $(this).parent().prev().ScrollTo();
    });


    // sidebar menu toggle
    function responsiveView() {
        var wSize = $(window).width();
        
        if (wSize <= 768) {
            // $(window).scroll(function() { alert("Scrolled"); });
            $('#container').addClass('sidebar-close');
            $('#sidebar > ul').hide();

            $('.toggle-nav').click(function () {
                if ($('#sidebar > ul').is(":visible")) {
                    $('#main-content').hide();
                    $('.navigation').hide();
                }
                else {
                    $('#main-content').show();
                    $('.navigation').show();   
                }
            });
        }
        
        if (wSize > 768) {
            $('#container').removeClass('sidebar-close');
            $('#sidebar > ul').show();
        }
    }
    
    $(window).load(function() {
        responsiveView();
    });

    $(window).resize(function() {
        if (!/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            responsiveView();    
        }
    });

    $('.toggle-nav').click(function () {
        var sidebarWidth = $("#sidebar").width();
        if ($('#sidebar > ul').is(":visible") === true) {
            $('#main-content').css({
                'margin-left': '0px'
            });
            $('#sidebar').css({
                'margin-left': '-'+ sidebarWidth +'px'
            });
            $('#sidebar > ul').hide();
            $("#container").addClass("sidebar-closed");
        } else {
            $('#main-content').css({
                'margin-left': sidebarWidth + 'px'
            });
            $('#sidebar > ul').show();
            $('#sidebar').css({
                'margin-left': '0'
            });
            $("#container").removeClass("sidebar-closed");
        }
    });

    //bar chart
    if ($(".custom-custom-bar-chart")) {
        $(".bar").each(function () {
            var i = $(this).find(".value").html();
            $(this).find(".value").html("");
            $(this).find(".value").animate({
                height: i
            }, 2000)
        })
    }
    //adjust nav bars height
    $(".navigation").css("height", $('.panel-body').height());
}

$(document).ready(function(){
    initializeJS();
});

