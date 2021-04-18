var mql = window.matchMedia("screen and (max-width: 768px)");
mql.addListener(function (e) {
    if (e.matches) {
        //mobile
        var list = document.getElementsByClassName("test");
        var black = document.getElementsByClassName("black");
        for (var i = 0; i < list.length; i++) {
            list[i].style.width = "100%";
            list[i].style.height = "20vh";

            black[i].style.backgroundColor = "rgba( 0, 0, 0, 0.5 )"
            black[i].style.color = "white";
        }

    } else {
        var list = document.getElementsByClassName("test");
        for (var i = 0; i < list.length; i++) {
            list[i].style.width = "33.33%";
            list[i].style.height = "100vh";
        }
    }
});

function changeWidth(n) {
    var windowSize = window.innerWidth;
    if (windowSize > 768) {
        var list = document.getElementsByClassName("test");
        var black = document.getElementsByClassName("black");

        for (var i = 0; i < list.length; i++) {
            if (i == n) {
                list[i].style.width = "50%";
                black[i].style.backgroundColor = "rgba( 0, 0, 0, 0 )"
                black[i].style.color = "black";
            } else {
                list[i].style.width = "25%";
                black[i].style.backgroundColor = "rgba( 0, 0, 0, 0.5 )"
                black[i].style.color = "white";
            }
        }

    }
}

function returnWidth() {
    var windowSize = window.innerWidth;
    if (windowSize > 768) {
        var list = document.getElementsByClassName("test");
        var black = document.getElementsByClassName("black");
        for (var i = 0; i < list.length; i++) {
            list[i].style.width = "33.3%";
            black[i].style.backgroundColor = "rgba( 0, 0, 0, 0.5 )"
            black[i].style.color = "white";
        }
    }
}

function openNav() {
    var nav = document.getElementById("navMenu");
    var btn = document.getElementById("navBtn");

    if (nav.style.opacity == "" || nav.style.opacity == "0") {
        nav.style.zIndex = "12";
        nav.style.opacity = "1";

    } else {
        nav.style.zIndex = "8";
        nav.style.opacity = "0";
    }

}

onscroll = function () {
    var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
    var header = document.getElementById("header");

    if (nVScroll > 150) {
        header.style.backgroundColor = "black";
    } else {
        header.style.backgroundColor = "";
    }
};
