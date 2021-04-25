<%@ page import="DAO.product_DAO" %>
<%@ page import="DTO.product_dto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.user_dto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    .listRow{
        padding-top: 5px;
        padding-bottom: 5px;
        text-align: center;
        border-bottom: 1px dotted black;
    }

    .listImage{
        width: 70px;
        height: 70px;
    }

    .productlink{
        color: black;
    }

    .totalRow{
        text-align: center;
        padding-top: 3%;
        padding-bottom: 3%
    }
    .totalRow span{
        font-weight: bold;
        font-size: 120%;
    }
    #totalBuy{
        width: 30%;
        border: none;
        margin-top: 10px;
        font-weight: bold;
        border-radius: 5px;
        padding: 5px;
        border: 1px solid black;
        background-color: white;
        transition: 0.5s;
    }

    #totalBuy:hover{
        width: 40%;
        color: white;
        background-color: black;
    }
</style>

<body>
<style>
    #tag{
        text-align: center;
        padding: 5px;
        font-weight: bold;
        letter-spacing: 2px;
    }
</style>
<p id="tag">CARTLIST</p>

<%
    DAO.product_DAO productDao = new product_DAO();
    DTO.user_dto user = (user_dto) session.getAttribute("user");

    int totalMoney =0;
    int userNumber = user.getNumber();

    ArrayList<product_dto> cartlist = productDao.getCartList(userNumber);
    DTO.product_dto cartItem;

    for(int j=0; j<cartlist.size(); j++){
        cartItem = cartlist.get(j);
        totalMoney = totalMoney + cartItem.getProductPrice();
%>
<div class="row listRow">
    <div class="col-xs-2">
        <%=cartItem.getCategory()%>
    </div>

    <div class="col-xs-2">
        <a href="productViewPage.jsp?category=<%=cartItem.getCategory()%>&productNumber=<%=cartItem.getProductNumber()%>">
            <img src="thumbnails/<%=cartItem.getProductThumbnail()%>" class="listImage">
        </a>
    </div>
    <div class="col-xs-5">
        <a href="productViewPage.jsp?category=<%=cartItem.getCategory()%>&productNumber=<%=cartItem.getProductNumber()%>" class="productlink">
            <%=cartItem.getProductName()%>
        </a>
    </div>

    <div class="col-xs-2">
        <%=cartItem.getProductPrice()%>
    </div>

    <div class="col-xs-1">
        <form action="deleteCartlist.product" method="post">
            <input type="hidden" name="userNumber" value="<%=userNumber%>">
            <input type="hidden" name="productNumber" value="<%=cartItem.getProductNumber()%>">
            <input type="submit" value="X" class="deleteBtn">
        </form>
    </div>
</div>
<%}%>

<script>
    function buyCheck(){
        var gsWin = window.open("","buyScreen");
        var frm =document.buyForm;
        frm.action = "buyPopup.jsp";
        frm.target ="buyScreen";
        frm.method ="post";
        frm.submit();
    }
</script>

<div class="row totalRow">
    <span>TOTAL </span><span style="color: red"><%=totalMoney%></span><br>
    <form name="buyForm" action="" method="post">
        <input type="hidden" name="buyType" value="multi">
        <input type="submit" value="Buy" id="totalBuy" onclick="buyCheck()">
    </form>
</div>

</body>
</html>
