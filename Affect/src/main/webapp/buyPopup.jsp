<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.product_DAO" %>
<%@ page import="DAO.coupon_DAO" %>
<%@ page import="DTO.coupon_dto" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: eomchny
  Date: 2021/04/14
  Time: 3:12 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
    #title{
        background-color: black;
        letter-spacing: 3px;
        text-align: center;
        font-weight: bold;
        font-size: 120%;
        padding: 7px;
        color: white;
    }

    .productImg{
        width: 100%;
    }

    .list{
        padding-bottom: 7px;
        border-bottom: 1px dotted black;
        margin-bottom: 7px;
    }

    .productName,.productPrice{
        padding: 0px;
        margin: 0px;
    }

    .productName{
        border-bottom: 1px solid black;
        padding-bottom: 5px;
    }
    .productPrice{
        font-weight: bold;
        padding-top: 5px;
    }
    .couponList{
        width: 100%;
        border-radius: 5px;
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

<%
    DTO.user_dto user = (DTO.user_dto)session.getAttribute("user");
    int userNumber = user.getNumber();
    int totalMoney =0;

    DAO.product_DAO productDao = new product_DAO();
    ArrayList<DTO.product_dto> arr = new ArrayList<>(); //여기에 물건 담아서 출력

    String type = request.getParameter("buyType");
    String productNumber, productCategory;

    if(type.equals("single")){
        productNumber = request.getParameter("productNumber");
        productCategory = request.getParameter("productCategory");
        arr.add(productDao.getProduct(productCategory,productNumber));
    }
    else if(type.equals("multi")){
        arr = productDao.getCartList(userNumber);
    }
    //단독구입이냐 바이리스트 구입이냐에 따른 Arr 구분

    DAO.coupon_DAO cpDao = new coupon_DAO();
    ArrayList<DTO.coupon_dto> cpArr = new ArrayList<>();
    cpArr = cpDao.getCouponList(userNumber);
    DecimalFormat df = new DecimalFormat("0.#");
    //사용자의 쿠폰리스트를 불러온다.

    String buyList="";
    //구입한 물건 목록을 스트링 형태로 넘겨줌
%>

<body onresize="parent.resizeTo(500,620)" onload="parent.resizeTo(500,620)">
<div class="container">
    <div class="row title">
        <p id="title">Buy</p>
    </div>

    <%for(int i=0; i<arr.size(); i++){
        DTO.product_dto obj = arr.get(i);
        totalMoney = totalMoney + obj.getProductPrice();
        buyList = buyList + obj.getProductNumber()+" ";
    %>
    <div class="row list">
        <div class="col-xs-2">
            <img src="thumbnails/<%=obj.getProductThumbnail()%>" class="productImg">
        </div>

        <div class="col-xs-6">
            <p class="productName"><%=obj.getProductName()%></p>
            <p class="productPrice"><%=obj.getProductPrice()%></p>
        </div>
    </div>
    <%}%>

    <div class="row couponRow">
        <div class="col-xs-6 col-xs-offset-3">
            <select name="coupon" class="couponList" id="couponList" onchange="totalMoney()">
                <option value="0" label="0" class="couponOption" id="couponOption">available copon</option>
                <%for(int i=0; i<cpArr.size(); i++){
                    DTO.coupon_dto cpObj = cpArr.get(i);
                %>
                    <option value="<%=cpObj.getCpNumber()%>" label="<%=cpObj.getCpPercent()%>"><%=cpObj.getCpName()%>( <%=df.format(cpObj.getCpPercent()*100)%>% )</option>
                <%}%>
            </select>
        </div>
    </div>

    <script>
        function totalMoney(){
            var Select = document.getElementById("couponList");
            var usedCpNumber = Select.options[Select.selectedIndex].value;
            var percent = Select.options[Select.selectedIndex].label;

            var total = "<%=totalMoney%>"
            total = total - (total * percent);
            document.getElementById("totalSpan").innerText = total;
            //표시될 금액
            document.getElementById("totalMoneyParam").value = total;
            //실제로 전송될 금액
            document.getElementById("usedCpParam").value = usedCpNumber;
            //사용한 쿠폰

        }
    </script>

    <%
        buyList = buyList.substring(0, buyList.length()-1);
    %>

    <div class="row totalRow">
        <span>TOTAL </span><span style="color: red" id="totalSpan"><%=totalMoney%></span><br>
        <form action="buyProduct.product" method="post">
            <input type="hidden" name="totalMoney" value="<%=totalMoney%>" id="totalMoneyParam">
            <input type="hidden" name="usedCp" value="none" id="usedCpParam">
            <input type="hidden" name="userNumber" value="<%=userNumber%>">
            <input type="hidden" name="totalBuyList" value="<%=buyList%>">
            <input type="submit" value="BUY" id="totalBuy">
        </form>
    </div>
</div>
</body>
</html>