<%@page import="DTO.user_dto"%>

<!DOCTYPE html>
<html lang="en">

<style>
    .headerContainer {
        background-color: black;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .logoCol {
        text-align: right;
    }

    #logo,
    #navBtn {
        color: white;
        font-weight: bold;
        font-size: 160%;
        background-color: black;
        border: none;
    }

    #logo {
        text-decoration: none;
    }

    #navWrap {
        background-color: black;
        text-align: center;
        display: none;
    }

    #navUl,#categoryUl {
        padding: 0px;
        margin: 0px;
        list-style: none;
    }

    .navLi {
        padding-top: 0.8%;
        padding-bottom: 0.8%
    }

    .navLi:hover {
        background-color: #c3bebe;
    }

    .menuList {
        color: white;
        text-decoration: none;
    }

    .menuList:hover {
        text-decoration: none;
        color: black;
        font-weight: bold;
    }
    
    #categoryUl{
        display: none;
    }
    
    #loginBox{
        background-color: black;
        display: none;
    }
    
    .headerLogin{
        border: none;
        margin-top: 5px;
        margin-bottom: 5px;
        width: 175px;
    }
    
    .headerLoginBtn{
        border: none;
        width: 175px;
        margin-top: 5px;
        color : black;
        background-color: white;
    }
    
    #searchBtn{
        display: none;
    }
    
    #searchBar{
        border: none;
        width: 50%;
        text-align: center;
        padding-top: 4px;
        padding-bottom: 4px;
    }
    
    #searchBox{
        padding-top: 15px;
    }
</style>

<script>
    function navOpen() {
        var nav = document.getElementById("navWrap");
        var navBtn = document.getElementById("navBtn");

        if (nav.style.display == "block") {
            navBtn.className = "glyphicon glyphicon-align-justify";
            nav.style.display = "none";
        } else {
            navBtn.className = "glyphicon glyphicon-remove";
            nav.style.display = "block";
        }
    }
    
    function categoryOpen() {
        var category = document.getElementById("categoryUl");
        
        if(category.style.display=="block"){
            category.style.display="none";
        }else{
            category.style.display="block";
        }
    }
    
    function loginOpen() {
        var login = document.getElementById("loginBox");
        
        if(login.style.display=="block"){
            login.style.display="none";
        }else{
            login.style.display="block";
        }
    }
    
    function init(){
        var navBtn = document.getElementById("navBtn");
        navBtn.className = "glyphicon glyphicon-align-justify";
    }
</script>


<%
user_dto user = (user_dto)session.getAttribute("user");
%>

<body onload="init()">
    <div style="background-color: black">
        <div class="container headerContainer">
            <div class="row">
                <div class="col-xs-4">
                    <button id="navBtn" onclick="navOpen()"><span class="" aria-hidden="true"></span></button>
                </div>

                <div class="col-xs-4">
                </div>

                <div class="col-xs-4 logoCol">
                    <a href="main.jsp" id="logo">Affect</a>
                </div>
            </div>
        </div>
    </div>

    <div id="navWrap">
        <ul id="navUl">
        	<div id="searchBox">
                <form action="" method="get">
                    <input type="text" name="keyword" id="searchBar" placeholder="Search..">
                    <input type="submit" id="searchBtn">
                </form>
            </div>

            <a href="main.jsp" class="menuList">
                <li class="navLi">
                    shop
                </li>
            </a>
        
        	<a class="menuList" id="categoryBtn" onclick="categoryOpen()">
                <li class="navLi">
                    category
                </li>
            </a>

            <ul id="categoryUl">
                <a href="main.jsp?category=top" class="menuList">
                    <li class="navLi">
                        TOP
                    </li>
                </a>
                <a href="main.jsp?category=bottom" class="menuList">
                    <li class="navLi">
                        BOTTOM
                    </li>
                </a>
                <a href="main.jsp?category=headwear" class="menuList">
                    <li class="navLi">
                        HEADWEAR
                    </li>
                </a>
                <a href="main.jsp?category=acc" class="menuList">
                    <li class="navLi">
                        ACC
                    </li>
                </a>
                <a href="main.jsp?category=shoes" class="menuList">
                    <li class="navLi">
                        SHOES
                    </li>
                </a>
                <a href="main.jsp?category=etc" class="menuList">
                    <li class="navLi">
                        ETC
                    </li>
                </a>
            </ul>

            <!--세션에서 유저가 정보가 null이면 로그인 버튼과 누르면 로그인 박스게 나오게끔 한다.-->
            <%if(user==null){%>
            <a class="menuList" id="loginBtn" onclick="loginOpen()">
               <li class="navLi">
                    login
                </li>
            </a>
            
            <div id="loginBox">
                <form action="login.user" method="post">
                    <input type="text" name="id" class="headerLogin"><br>
                    <input type="password" name="password" class="headerLogin"><br>
                    <input type="submit" value="login" class="headerLoginBtn">
                </form>
            </div>
            <%}%>

            <a href="lookbookPage.jsp" class="menuList">
                <li class="navLi">
                    lookbook
                </li>
            </a>
            <a href="https://www.instagram.com/eomchny/" class="menuList" target="_blank">
                <li class="navLi">
                    instagram
                </li>
            </a>

            <!--user정보가 있으면(로그인 되어 세션에 유저정보가 존재하면
            마이페이지가 보이게 한다.
            로그아웃 버튼을 누르면 index페이지로 돌아가고, status매개변수로 logout을 주어서 index페이지에서 로그아웃하도록 함.-->
            <%if(user == null){}
            else{%>
            	<a href="mypage.jsp" class="menuList">
                    <li class="navLi">
                        mypage
                    </li>
            	</a>
            	
            	<a href="index.jsp?status=logout" class="menuList">
                    <li class="navLi">
                        logout
                    </li>
                </a>
            <%}%>
        </ul>
    </div>
</body></html>