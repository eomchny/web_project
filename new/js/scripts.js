$('#notice_list').load('notice.md');
$('#quest_list').load('question.md');

$('.advantage_title').click(function () {
    if ($(this).next().css('height') == '0px') {
        $(this).next().css('height', '100px');
        $(this).find('span').attr('class', 'glyphicon glyphicon-triangle-top');
    } else {
        $(this).next().css('height', '0px');
        $(this).find('span').attr('class', 'glyphicon glyphicon-triangle-bottom notice_btn');
    }
});

$('#top_btn').click(function () {
    $('html,body').animate({
        scrollTop: 0
    }, 400);
});

$('#menu_btn').click(function () {
    if ($('#menu').css('width') == "0px") {
        $('#menu').css('width', '100%');
    } else {
        $('#menu').css('width', '0px');
    }
});

$('.move_btn').click(function () {
    var id = $(this).data('id');
    var target_data = '[data-val=' + id + ']';
    var target_obj = $(target_data).offset();
    $('html').animate({
        scrollTop: target_obj.top
    }, 400);
});

AOS.init({
    offset: 100,
    duration: 1500
});
