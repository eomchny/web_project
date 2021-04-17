function init() {
    var brandLogo = document.getElementById("brandLogoTop");
    brandLogo.style.opacity = "3";
}

$(window).scroll(function () {
    if ($(this).scrollTop() > 250) {
        document.getElementById("header").style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
    } else {
        document.getElementById("header").style.backgroundColor = '';
    }
});

function navOpen() {
    var len = window.innerWidth;
    var menu = document.getElementById("nav");
    if (menu.style.width == '0%' || menu.style.width == '') {
        if (len < 550) {
            menu.style.width = '50%';
        } else {
            menu.style.width = '100%';
        }

    } else {
        menu.style.width = '0%';
    }
}

$(document).ready(function () {
    $('#topBtn').click(function () {
        $('html').animate({
            scrollTop: 0
        }, 400);

    });

});