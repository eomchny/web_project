const c_BtnWidth1 = 250;
const c_BtnHeight1 = 179;
const c_BtnTop1 = 300;
const c_BtnBtw1 = 50;

const c_BtnWidth2 = 718;
const c_BtnHeight2 = 180;
const c_BtnTop2 = 400;
const c_BtnBtw2 = 23;

const c_width1 = 1024;
const c_ArWidth1 = 55;
const c_ArHeight1 = 55;
const c_ArTop1 = 122;
const c_ArLeft11 = 239;
const c_ArLeft12 = 492;
const c_ArLeft13 = 730;

const c_width2 = 799;
const c_ArWidth2 = 80;
const c_ArHeight2 = 80;
const c_ArLeft2 = 347;
const c_ArTop21 = 269;
const c_ArTop22 = 466;
const c_ArTop23 = 660;

const c_gWidth1 = 175;
const c_gHeight1 = 25;
const c_gTop1 = 2;
const c_Margin1 = 5;

const c_gWidth2 = 136.5;
const c_gHeight2 = 19.5;
const c_gTop2 = 1.5;
const c_Margin2 = 3;

var n_Btn1Left = 0;
var n_Btn2Top = 0;
var n_width0 = 0;
var wScale = 0;


function showWindowSize() {
  n_width0 = document.getElementById('baseimg1').clientWidth;
	
  // 縮尺率計算
  if (c_width1 > n_width0){
    wScale = n_width0 / c_width1;
  } else {
    wScale = 1;
  }

  // 画面幅の確認
  // 横幅計算(800px)以上
  if ($('#tFlow1').css('display') == 'block') {
    n_Btn1Left = (n_width0 - ((c_BtnWidth1 * wScale * 3) + (c_BtnBtw1 * wScale * 2))) / 2;

    $('#glink').css({
      width: (c_gWidth1 * wScale) + "px",
      height: (c_gHeight1 * wScale) + "px",
      top: (c_gTop1 * wScale) + "px",
      left: (n_width0 - (c_gWidth1 * wScale) - c_Margin1)  + "px"
    });

	$('.square').css({
      top: (c_BtnTop1 * wScale) + "px",
      width: (c_BtnWidth1 * wScale) + "px",
      height: (c_BtnHeight1 * wScale) + "px"
    });
	
    //  アニメーション用 
    $('#square1').css({
      left: n_Btn1Left + "px"
    });
    $('#square2').css({
      left: (n_Btn1Left + ((c_BtnWidth1 + c_BtnBtw1) * wScale)) + "px"
    });
    $('#square3').css({
      left: (n_Btn1Left + ((c_BtnWidth1 + c_BtnBtw1) * 2 * wScale)) + "px"
    });


    n_width0 = document.getElementById('tFlow1').clientWidth;

    // 縮尺率計算
    if (c_width1 > n_width0){
      wScale = n_width0 / c_width1;
    } else {
      wScale = 1;
    }

	// 矢印
    $('.ar_box1').css({
      top: (c_ArTop1 * wScale) + "px",
      width: (c_ArWidth1 * wScale) + "px",
      height: (c_ArHeight1 * wScale) + "px"
    });

    $('#ar_pos11').css({
      left: (c_ArLeft11 * wScale) + "px"
    });
    $('#ar_pos12').css({
      left: (c_ArLeft12 * wScale) + "px"
    });
    $('#ar_pos13').css({
      left: (c_ArLeft13 * wScale) + "px"
    });

  // 横幅計算(800px)未満
  } else {
	n_width0 = document.getElementById('baseimg2').clientWidth;
  
    // 縮尺率計算
    wScale = n_width0 / c_width2;

    $('#glink').css({
      width: (c_gWidth2) + "px",
      height: (c_gHeight2) + "px",
      top: (c_gTop2) + "px",
      left: (n_width0 - (c_gWidth2) - c_Margin2)  + "px"
    });	  
	  
    n_Btn2Top = c_BtnTop2 * wScale;
  
	$('.square2').css({
      left: ((n_width0-(c_BtnWidth2 * wScale)) / 2) + "px",
      width: (c_BtnWidth2 * wScale) + "px",
      height: (c_BtnHeight2 * wScale) + "px"
    });
	
    //  アニメーション用 
    $('#square4').css({
      top: n_Btn2Top + "px"
    });
    $('#square5').css({
      top: (n_Btn2Top + ((c_BtnHeight2 + c_BtnBtw2) * wScale)) + "px"
    });
    $('#square6').css({
      top: (n_Btn2Top + ((c_BtnHeight2 + c_BtnBtw2) * 2 * wScale)) + "px"
    });
  
    n_width0 = document.getElementById('tFlow2').clientWidth;

    // 縮尺率計算
    if (c_width2 > n_width0){
      wScale = n_width0 / c_width2;
    } else {
      wScale = 1;
    }

    $('.ar_box2').css({
      left: (c_ArLeft2 * wScale) + "px",
      width: (c_ArWidth2 * wScale) + "px",
      height: (c_ArHeight2 * wScale) + "px"
    });

    $('#ar_pos21').css({
      top: (c_ArTop21 * wScale) + "px"
    });
    $('#ar_pos22').css({
      top: (c_ArTop22 * wScale) + "px"
    });
    $('#ar_pos23').css({
      top: (c_ArTop23 * wScale) + "px"
    });
  }

}

// セールスポイントアニメーション
function firstrect() {
  $("#square1").delay(0500).animate({ opacity: 1 }, { duration: 1000, easing: 'linear' });
  $("#square2").delay(1500).animate({ opacity: 1 }, { duration: 1000, easing: 'linear' });
  $("#square3").delay(2500).animate({ opacity: 1 }, { duration: 1000, easing: 'linear' });

  $("#square4").delay(0500).animate({ opacity: 1 }, { duration: 1000, easing: 'linear' });
  $("#square5").delay(1500).animate({ opacity: 1 }, { duration: 1000, easing: 'linear' });
  $("#square6").delay(2500).animate({ opacity: 1 }, { duration: 1000, easing: 'linear' });
}

// 矢印アニメーション
function rect() {
	$("#ar_pos11").animate({
        opacity: ".2"
    }, 500).animate({
        opacity: "1"
    }, 500);
	
    $("#ar_pos12").delay(500).animate({
        opacity: ".2"
    }, 500).animate({
        opacity: "1"
    }, 500);
	
    $("#ar_pos13").delay(1000).animate({
        opacity: ".2"
    }, 500).animate({
        opacity: "1"
    }, 500);

    $("#ar_pos21").animate({
        opacity: ".2"
    }, 500).animate({
        opacity: "1"
    }, 500);
	
    $("#ar_pos22").delay(500).animate({
        opacity: ".2"
    }, 500).animate({
        opacity: "1"
    }, 500);
	
    $("#ar_pos23").delay(1000).animate({
        opacity: ".2"
    }, 500).animate({
        opacity: "1"
    }, 500);
	setTimeout("rect()", 2500);   //アニメーションを繰り返す間隔
}

window.onload = $(function () {   // jQueryのアニメが画像読み込み前に始めるのを回避するためload後アニメ開始
	setTimeout('firstrect()');    //セールポイント アニメーションを実行
    setTimeout('rect()');         //矢印 アニメーションを実行
});

$(window).ready(showWindowSize);  // ページ表示時に要素位置計算(初回)

$(window).resize(showWindowSize); // リアルタイムリサイズ
