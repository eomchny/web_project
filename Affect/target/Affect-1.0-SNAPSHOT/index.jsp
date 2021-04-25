<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- ViewPort -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Affect</title>
</head>

<style>
    body {
        background-color: black;
    }

    .wrap {
        position: relative;
        top: 100px;
    }

    .logoWrap {
        text-align: right;
    }


    #logo {
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 250%;
    }

    .menuWrap,
    .joinWrap,
    .loginWrap,
    .aboutWrap,
    .mailWrap,
    .forgotWrap {
        text-align: right;
        margin-top: 4%;
    }

    #menuUl {
        list-style: none;
        padding: 0px;
        margin: 0px;
    }

    .menuLi {
        margin-top: 5%;
    }

    .link {
        color: white;
        text-decoration: none;
    }

    .link:hover {
        color: white;
        text-decoration: none;
        border-bottom: 1px solid white;
    }

    .link:visited {
        color: white;
    }

    .joinInformation,
    .loginInformation,
    .forgotInformation {
        background-color: black;
        border: none;
        text-align: right;
        margin-bottom: 5%;
        color: white;
        border-bottom: 1px solid white;
        padding-bottom: 5px;
        width: 100%;
    }

    #joinSubmitBtn,
    #loginSubmitBtn,
    #forgotSubmitBtn {
        width: 100%;
        background-color: black;
        text-align: right;
        font-weight: bold;
        color: white;
        border-radius: 5px;
        margin-bottom: 5%;
        border: none;
    }

    .closeBtn {
        width: 100%;
        background-color: black;
        text-align: right;
        font-weight: bold;
        color: white;
        border-radius: 5px;
        border: none;
    }



    .joinWrap,
    .loginWrap,
    .aboutWrap,
    #joinErrorMsg,
    #loginErrorMsg,
    .mailWrap,
    #forgotErrorMsg,
    .forgotWrap,
    #passwordLengthErrorMsg,
    #idLengthErrorMsg{
        display: none;
    }

    #joinErrorMsg,
    #loginErrorMsg,
    #forgotErrorMsg,
    #joinPasswordCheck,
    #passwordLengthErrorMsg,
    #idLengthErrorMsg{
        color: darkred;
    }

    .aboutInformation {
        color: #b2b2b2;
    }



    #map {
        width: 100%;
    }

    .aboutCloseBtn {
        background-color: black;
        width: 100%;
        text-align: right;
        border: none;
        font-weight: bold;
    }



    .mailForm {
        background-color: #222222;
        margin-bottom: 4%;
        width: 100%;
        border: none;
        text-align: right;
        color: white;
        padding-top: 1%;
        padding-bottom: 1%;
    }

    #mailContent {
        height: 200px;
    }

    .mailSendBtn {
        background-color: black;
        color: white;
        font-weight: bold;
        width: 45%;
        border: none;
        text-align: right;
        margin-bottom: 4%
    }

    .thankyou_message {
        color: white;
    }
</style>

<script>

	function init(){
		
	}
	
    function loginOpen() {
        var menuDiv = document.getElementById("menuWrap");
        var loginDiv = document.getElementById("loginWrap");
        var msg = document.getElementById("loginErrorMsg");

        msg.style.display = "none";
        menuDiv.style.display = "none";
        loginDiv.style.display = "block";
    }

    function loginClose() {
        var menuDiv = document.getElementById("menuWrap");
        var loginDiv = document.getElementById("loginWrap");

        menuDiv.style.display = "block";
        loginDiv.style.display = "none";
    }

    function forgotOpen() {
        var menuDiv = document.getElementById("menuWrap");
        var forgotDiv = document.getElementById("forgotWrap");
        var msg = document.getElementById("forgotErrorMsg");

        msg.style.display = "none";
        menuDiv.style.display = "none";
        forgotDiv.style.display = "block";
    }

    function forgotClose() {
        var menuDiv = document.getElementById("menuWrap");
        var forgotDiv = document.getElementById("forgotWrap");

        menuDiv.style.display = "block";
        forgotDiv.style.display = "none";
    }

    function joinOpen() {
        var menuDiv = document.getElementById("menuWrap");
        var joinDiv = document.getElementById("joinWrap");
        var msg = document.getElementById("joinErrorMsg");

        msg.style.display = "none";

        menuDiv.style.display = "none";
        joinDiv.style.display = "block";
    }

    function joinClose() {
        var menuDiv = document.getElementById("menuWrap");
        var joinDiv = document.getElementById("joinWrap");

        menuDiv.style.display = "block";
        joinDiv.style.display = "none";
    }

    function aboutOpen() {
        var menuDiv = document.getElementById("menuWrap");
        var aboutDiv = document.getElementById("aboutWrap");

        menuDiv.style.display = "none";
        aboutDiv.style.display = "block";
    }

    function aboutClose() {
        var menuDiv = document.getElementById("menuWrap");
        var aboutDiv = document.getElementById("aboutWrap");

        menuDiv.style.display = "block";
        aboutDiv.style.display = "none";
    }

    function mailOpen() {
        var menuDiv = document.getElementById("menuWrap");
        var mailDiv = document.getElementById("mailWrap");

        menuDiv.style.display = "none";
        mailDiv.style.display = "block";
    }

    function mailClose() {
        var menuDiv = document.getElementById("menuWrap");
        var mailDiv = document.getElementById("mailWrap");
        var mailMsg = document.getElementById("thankyou_message");

        mailMsg.style.display = "none";
        menuDiv.style.display = "block";
        mailDiv.style.display = "none";
    }

    function joinCheck() {
        var joinFileds = document.getElementsByClassName("joinInformation");
        var msg = document.getElementById("joinErrorMsg");

        for(var i=0; i<joinFileds.length; i++){
            if (joinFileds[i].value.length === 0) {
                msg.style.display = "block";
                return false;
            }
        }
    }

    function loginCheck() {
        var joinFileds = document.getElementsByClassName("loginInformation");
        var msg = document.getElementById("loginErrorMsg");

        if (joinFileds[0].value == "") {
            msg.style.display = "block";
            return false;
        } else if (joinFileds[1].value == "") {
            msg.style.display = "block";
            return false;
        }
    }

    function forgotCheck() {
        var forgotFileds = document.getElementsByClassName("forgotInformation");
        var msg = document.getElementById("forgotErrorMsg");

        if (forgotFileds[0].value == "") {
            msg.style.display = "block";
            return false;
        } else if (forgotFileds[1].value == "") {
            msg.style.display = "block";
            return false;
        }
    }
    
    window.addEventListener("keyup", function() {
        var checkKey = document.getElementById("joinPasswordCheck");
        var password = document.getElementById("joinPassword");
        var submit = document.getElementById("joinSubmitBtn");
        
        if(password.value == checkKey.value){
            checkKey.style.color = "green";
            submit.disabled = false;
        }
        else if(password.value != checkKey.value){
            checkKey.style.color = "darkred";
            submit.disabled = true;
        }
        
    });
</script>

<%
    /*
    페이지 구동시에 status 매개변수를 확인한다.
    null값이면 무시하고, 아니면 해당 매개변수에 따라서 동작을 달리함.
     */
	String status = request.getParameter("status");
	if(status == null){}
	else if(status.equals("logout")){
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
%>

<body onload="init()">
    <div class="container wrap">
        <div class="row logoWrap">
            <div class="col-xs-6 col-xs-offset-3">
                <a href="" id="logo">Affect</a>
            </div>
        </div>

        <div class="row menuWrap" id="menuWrap">
            <div class="col-xs-6 col-xs-offset-3">
                <ul id="menuUl">
                    <li class="menuLi"><span class="link" onclick="aboutOpen()">ABOUT</span></li>
                    <li class="menuLi"><span class="link" onclick="loginOpen()">SIGN IN</span></li>
                    <li class="menuLi"><span class="link" onclick="joinOpen()">SIGN UP</span></li>
                    <li class="menuLi"><span class="link" onclick="forgotOpen()">FORGOT PASSWORD</span></li>
                    <li class="menuLi"><a href="main.jsp" class="link">SHOP</a></li>
                    <li class="menuLi"><a href="" class="link">HELP</a></li>
                    <li class="menuLi"><a href="https://www.instagram.com/eomchny/" class="link" target="_blank">INSTAGRAM</a></li>
                    <li class="menuLi"><a href="lookbookPage.jsp" class="link">LOOKBOOK</a></li>
                    <li class="menuLi"><span class="link" onclick="mailOpen()">CONTACT US</span></li>
                </ul>
            </div>
        </div>

        <div class="row joinWrap" id="joinWrap">
            <div class="col-xs-6 col-xs-offset-3">
                <!--회원가입-->
                <form action="join.user" method="post" onsubmit="return joinCheck()">
                    <input type="text" name="id" class="joinInformation" placeholder="Account" maxlength="20" minlength="3">
                    <input type="password" name="password" class="joinInformation" placeholder="Password" id="joinPassword" maxlength="20" minlength="7">
                    <input type="password" name="passwordCheck" class="joinInformation" placeholder="Check Password" id="joinPasswordCheck" maxlength="20" minlength="7">
                    <input type="text" name="name" class="joinInformation" placeholder="Name" maxlength="13">
                    <input type="text" name="mail" class="joinInformation" placeholder="Mail" maxlength="43">

                    <p id="joinErrorMsg">please fill all fields</p>
                    <input type="submit" value="SIGN UP" id="joinSubmitBtn">
                </form>

                <button class="closeBtn" onclick="joinClose()">Back</button>
            </div>
        </div>

        <div class="row loginWrap" id="loginWrap">
            <div class="col-xs-6 col-xs-offset-3">
                <!--로그인-->
                <form action="login.user" method="post" onsubmit="return loginCheck()">
                    <input type="text" name="id" class="loginInformation" placeholder="Account"  maxlength="20">
                    <input type="password" name="password" class="loginInformation" placeholder="Password" maxlength="20">

                    <p id="loginErrorMsg">please fill all fields</p>

                    <input type="submit" value="SIGN IN" id="loginSubmitBtn">
                </form>

                <button class="closeBtn" onclick="loginClose()">Back</button>
            </div>
        </div>

        <div class="row forgotWrap" id="forgotWrap">
            <div class="col-xs-6 col-xs-offset-3">
                <!--비밀번호 찾기-->
                <form action="forgotPassword.user" method="post" onsubmit="return forgotCheck()">
                    <input type="text" name="id" class="forgotInformation" placeholder="Account">
                    <input type="text" name="mail" class="forgotInformation" placeholder="Mail">

                    <p id="forgotErrorMsg">please fill all fields</p>

                    <input type="submit" value="SUBMIT" id="forgotSubmitBtn">
                </form>

                <button class="closeBtn" onclick="forgotClose()">Back</button>
            </div>
        </div>


        <div class="row aboutWrap" id="aboutWrap">
            <div class="col-xs-6 col-xs-offset-3">
                <!--ABOUT-->
                <iframe id="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3169.1430101777!2d126.711996415645!3d37.41009454082898!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7a15ac169d6d%3A0xe067c7e0b11fd8da!2z7J247LKc6rSR7Jet7IucIOuCqOuPmeq1rCDrhbztmIQy64-ZIO2YuOq1rO2PrOuhnCAyOTQ!5e0!3m2!1sko!2skr!4v1614578954968!5m2!1sko!2skr" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

                <p class="aboutInformation">Affect</p>
                <p class="aboutInformation">SINCE 2021.03.01</p>
                <p class="aboutInformation">Fashion, Acc</p>
                <p class="aboutInformation">TEL 010-9378-6988</p>
                <p class="aboutInformation">Hogupro-ro 294, Namdong-gu, Incheon,
                    Republic of Korea</p>

                <button class="aboutCloseBtn" onclick="aboutClose()">Close</button>
            </div>
        </div>


        <div class="row mailWrap" id="mailWrap">
            <div class="col-xs-6 col-xs-offset-3">
                <!--Contact Us-->
                <form class="gform" method="post" action="https://script.google.com/macros/s/AKfycbwNXXFXmrLOsekV1g0F62uPa1M0e7i4lMhfbkLQ/exec">

                    <!-- Customise the Thankyou Message People See when they submit the form: -->
                    <div class="thankyou_message" id="thankyou_message" style="display:none;">
                        <span>Thanks for the comments!<br>
                            We will respond as soon as possible.</span>
                    </div>
                    <br>

                    <input type="text" name="name" class="mailForm" placeholder="Title" required>
                    <textarea name="message" class="mailForm" placeholder="Message" id="mailContent" required></textarea>
                    <input type="text" name="email" class="mailForm" placeholder="Your Email Address" required><br>
                    <button class="mailSendBtn">Send</button><br>
                </form>
                <button class="mailSendBtn" onclick="mailClose()">Back</button>


            </div>
        </div>

    </div>


    <script data-cfasync="false" type="text/javascript" src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>


</body></html>