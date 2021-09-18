    var stage = 0; //스테이지 번호
    var block_num = [2, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    var score = 0; //점수
    var timer_obj;
    var click = 0;
    upStage(); //content를 비우고 블럭을 출력한다.
    $('.time').text(30 + "秒");

    $(document).on("click", '.obj', function () {
        if (click === 0) {
            timer(29);
        }

        if ($(this).hasClass("false_target") === true) {
            AudioPlay(true);
            plusScore();
            setStage();
            upStage();
        } else {
            AudioPlay(false);
        }
        click++;
    });

    function upStage() {
        const content = $('#content');
        $('#content').empty();
        var stage_num = stage.toString();
        var block_ = "block" + stage_num;

        var obj_num = 0;
        var false_target = parseInt((Math.random() * (block_num[stage] * block_num[stage])));
        for (var i = 0; i < block_num[stage]; i++) {
            for (var j = 0; j < block_num[stage]; j++) {
                if (obj_num == false_target) {
                    content.append("<div class='" + block_ + " obj false_target'></div>");
                } else {
                    content.append("<div class='" + block_ + " obj true_target'></div>");
                }
                obj_num++;
            }
        }
        //블럭을 그린다.

        getColor();
    }

    function getColor() {
        var r = parseInt(Math.random() * 255);
        var g = parseInt(Math.random() * 255);
        var b = parseInt(Math.random() * 255);
        var true_color = "rgb(" + r + "," + g + "," + b + ")"
        var false_color = "rgb(" + (r - 15) + "," + (g - 15) + "," + (b - 15) + ")"
        $('.true_target').css("background-color", true_color);
        $('.false_target').css("background-color", false_color);
    }

    function plusScore() {
        score++;
        $('.score').text(score);
    }

    function setStage() {
        if (score === 3) {
            stage++;
        } else if (score === 6) {
            stage++;
        } else if (score === 9) {
            stage++;
        } else if (score === 12) {
            stage++;
        } else if (score === 15) {
            stage++;
        } else if (score === 18) {
            stage++;
        } else if (score === 21) {
            stage++;
        } else if (score === 24) {
            stage++;
        } else if (score === 27) {
            stage++;
        }
    }

    function timer(param) {
        var time = param; //기준시간 작성
        var sec = ""; //초

        timer_obj = setInterval(function () {
            $('.time').text(time + "秒");
            sec = time;
            time--;

            //타임아웃 시
            if (time < 0) {
                clearInterval(timer_obj); //setInterval() 실행을 끝냄
                $('#result_score').text(score + "点");
                $('#result').css("display", "block");
            }
        }, 1000);
    }

    function AudioPlay(correct) {
        if (correct) {
            var audio = new Audio('correct.mp3');
            audio.play();
        } else {
            var audio = new Audio('failed.mp3');
            audio.play();
        }
    }

    $('#btn_replay').click(function () {
        stage = 0;
        upStage();

        click = 0;

        score = 0;
        $('.score').text(score);

        clearInterval(timer_obj);
        $('.time').text("30秒");

        $('#result').css("display", "none");
        $('#center_ad').css("display", "block");
    });

    $('#close').click(function () {
        $('#center_ad').css("display", "none");
    });

    $(window).ready(function () {
        $(".snsList li a").click(function () {
            shareAct(this);
        });
    });

    function shareAct(a) {
        var snsCode = $(a).attr('id');
        var cUrl = "https://eomchny.github.io/web_project/colorGame";
        var title = "まちがいドン！";
        switch (snsCode) {
            case "vIconTw":
                cUrl = 'https://twitter.com/intent/tweet?text=' + title + ':&url=' + cUrl;
                break;
            case "vIconTg":
                cUrl = 'https://telegram.me/share/url?url=' + cUrl;
                break;
            case "vIconFb":
                cUrl = 'http://www.facebook.com/sharer/sharer.php?u=' + cUrl;
                break;
        }
        window.open(cUrl, '', 'width=600,height=300,top=100,left=100,scrollbars=yes');
    }
