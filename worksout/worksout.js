function menu_pc_open() {
    var menu = document.getElementById("menu_pc");
    var btn = document.getElementById("headerBtn");


    if (menu.style.display != "block") {
        menu.style.display = "block";
        btn.className = "glyphicon glyphicon-remove";
    } else {
        menu.style.display = "none";
        btn.className = "glyphicon glyphicon-menu-hamburger";
    }
}

function menu_mobile_open() {
    var menu = document.getElementById("menu_phone");
    var btn = document.getElementById("headerBtnPhone");
    var screen = document.getElementById("mobile_menu_screen");

    if (menu.style.display != "block") {
        screen.style.display = "block";
        menu.style.display = "block";
        btn.className = "glyphicon glyphicon-remove";
    } else {
        screen.style.display = "none";
        menu.style.display = "none";
        btn.className = "glyphicon glyphicon-menu-hamburger";
    }
}

function mobile_close() {
    var menu = document.getElementById("menu_phone");
    var btn = document.getElementById("headerBtnPhone");
    var screen = document.getElementById("mobile_menu_screen");

    screen.style.display = "none";
    menu.style.display = "none";
    btn.className = "glyphicon glyphicon-menu-hamburger";

}

function search_open() {
    var menu = document.getElementById("searchBox");
    var btn = document.getElementById("searchBtn");

    btn.style.display = "none";
    menu.style.display = "block";
}