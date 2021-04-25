<%@page import="DTO.user_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <%
            	if(user==null){%>
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
                    
                    <input type="hidden" name="loginStatus" value="lookbookPageLogin" style="display: none">
                </form>
            </div>
            	
            	<%	
            	}
            %>

            <a href="main.jsp" class="menuList">
                <li class="navLi">
                    SHOP
                </li>
            </a>
            
            <a href="" class="menuList">
                <li class="navLi">
                    community
                </li>
            </a>

            <a href="https://www.instagram.com/eomchny/" class="menuList" target="_blank">
                <li class="navLi">
                    instagram
                </li>
            </a>
            
            <%
            	if(user == null){}
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
            	
            <%		
            	}
            %>
        </ul>
    </div>
</body></html>