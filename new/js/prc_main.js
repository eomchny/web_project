var n_width0 = 0;
const c_width = 1024;
const c_BtnWidth = 250;
const c_BtnHeight = 179;
const c_BtnTop = 320;
const c_BtnBtw = 50;
var wval = 0;
var wScale = 0;

function showWindowSize() {
  n_width0 = document.getElementById('topimg').clientWidth;
  var n_Btn1Left = (c_width - (c_BtnWidth * 3 + c_BtnBtw * 2)) / 2;

    // 縮尺率計算
    if (c_width > n_width0){
      wScale = n_width0 / c_width;
    } else {
      wScale = 1;
    }	
	
  wval = (c_BtnTop * wScale);

  $('.square').css({
    top: wval + "px",
    width: (c_BtnWidth * wScale) + "px",
    height: (c_BtnHeight * wScale) + "px"
  });

  //  アニメーション用 
  $('#square1').css({
    opacity: 1,
    left: (n_Btn1Left * wScale) + "px"
  });
  $('#square2').css({
    opacity: 1,
    left: ((n_Btn1Left + c_BtnWidth + c_BtnBtw) * wScale) + "px"
  });
  $('#square3').css({
    opacity: 1,
    left: ((n_Btn1Left + ((c_BtnWidth + c_BtnBtw) * 2)) * wScale) + "px"
  });
}

function initshowWindowSize() {
  showWindowSize();
	
  /* Animation Start(本番時はloop:false) */
  var timeline = anime.timeline({
    direction: 'alternate',
    loop: false,
    delay: 2000
  });

  timeline
    .add({
      targets: '#square1',
      opacity: 1.0,
      offset: '-=1000'
    })
    .add({
      targets: '#square2',
      opacity: 1.0,
      offset: '-=1200'
    })
    .add({
      targets: '#square3',
      opacity: 1.0,
      offset: '-=1400'
    });

}

function resizeshowWindowSize() {
  showWindowSize();
}

$(window).ready(initshowWindowSize);

$(window).resize(resizeshowWindowSize);
