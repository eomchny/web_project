<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.product_DAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Affect</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- ViewPort -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--AJAX-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<style>
    .basicRow{
        text-align: center;
        padding-top: 3%;
        padding-bottom: 3%;
        background-color: #f0f0f0;
    }

    .menuRow{
        text-align: center;
    }

    .menuBtn{
        padding-top: 5px;
        padding-bottom: 5px;
        font-size: 80%;
        color: black;
    }

    .menuBtn:hover{
        background-color: black;
        color: white;
    }
</style>

<%
    DTO.user_dto user = (DTO.user_dto)session.getAttribute("user");
    String menuQuery = request.getParameter("menuQuery");
    if(menuQuery==null) menuQuery = "none";
%>

<body>
<jsp:include page="header.jsp"/>

<div class="container">
    <%if(user == null){%>
    <div class="row basicRow">
        <div class="col-xs-12 basicInformation">
            <h4>ログインしてください</h4>
            <p>下のリンクを通して会員登録できます。</p>
            <a href="index.jsp" onClick="window.open(this.href, '', 'width=700, height=700'); return false;">SIGN UP</a>
        </div>
    </div>
    <%}else{%>
    <div class="row basicRow">
        <div class="col-xs-12 basicInformation">
            <h4><%=user.getName()%></h4>
            <p><%=user.getMail()%></p>
            <p>75 points</p>
            <a href="userModify.jsp" onClick="window.open(this.href, '', 'width=700, height=500'); return false;">Moidfy</a>
        </div>
    </div>

    <div class="row menuRow">
        <a href="mypage.jsp?menuQuery=wishlist">
            <div class="col-sm-6 menuBtn" id="wishlist">WISHLIST</div>
        </a>


        <a href="mypage.jsp?menuQuery=cartlist">
            <div class="col-sm-6 menuBtn" id="cartlist">CARTLIST</div>
        </a>

        <a href="mypage.jsp?menuQuery=buylist">
            <div class="col-sm-6 menuBtn" id="buylist">BUYLIST</div>
        </a>

        <a href="mypage.jsp?menuQuery=cplist">
            <div class="col-sm-6 menuBtn" id="cplist">COUPON</div>
        </a>
    </div>
    <%}%>

    <div>
        <%if(menuQuery.equals("wishlist")){%>
            <jsp:include page="wishlist.jsp"/>
        <%}%>

        <%if(menuQuery.equals("cartlist")){%>
        <jsp:include page="cartlist.jsp"/>
        <%}%>

        <%if(menuQuery.equals("cplist")){%>
        <jsp:include page="couponlist.jsp"/>
        <%}%>

        <%if(menuQuery.equals("buylist")){%>
        <jsp:include page="buylist.jsp"/>
        <%}%>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>