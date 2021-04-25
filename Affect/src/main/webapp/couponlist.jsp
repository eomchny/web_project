<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.user_dto" %>
<%@ page import="DAO.coupon_DAO" %>
<%@ page import="java.text.DecimalFormat" %>
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
<p id="tag">COUPON</p>

<%
    DAO.coupon_DAO couponDao = new coupon_DAO();
    DTO.user_dto user = (user_dto) session.getAttribute("user");
    int userNumber = user.getNumber();

    ArrayList<DTO.coupon_dto> cplist = couponDao.getCouponList(userNumber);
    DTO.coupon_dto cpItem;
    DecimalFormat df = new DecimalFormat("0.#");

    for(int j=0; j<cplist.size(); j++){
        cpItem = cplist.get(j);
%>
<div class="row listRow">
    <div class="col-xs-3">
        <%=cpItem.getCpNumber()%>
    </div>

    <div class="col-xs-3">
        <%=df.format(cpItem.getCpPercent()*100)%>%
    </div>

    <div class="col-xs-6">
        <%=cpItem.getCpName()%>
    </div>
</div>
<%}%>
</body>
</html>

