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
<p id="tag">WISHLIST</p>
<%
    DAO.product_DAO productDao = new product_DAO();
    DTO.user_dto user = (user_dto) session.getAttribute("user");
    int userNumber = user.getNumber();
    ArrayList<product_dto> wishlist = productDao.getWishList(userNumber);
    DTO.product_dto wishItem;
    for(int j=0; j<wishlist.size(); j++){
        wishItem = wishlist.get(j);
%>
<div class="row listRow">
    <div class="col-xs-2">
        <%=wishItem.getCategory()%>
    </div>

    <div class="col-xs-2">
        <a href="productViewPage.jsp?category=<%=wishItem.getCategory()%>&productNumber=<%=wishItem.getProductNumber()%>">
            <img src="thumbnails/<%=wishItem.getProductThumbnail()%>" class="listImage">
        </a>
    </div>
    <div class="col-xs-5">
        <a href="productViewPage.jsp?category=<%=wishItem.getCategory()%>&productNumber=<%=wishItem.getProductNumber()%>" class="productlink">
            <%=wishItem.getProductName()%>
        </a>
    </div>

    <div class="col-xs-2">
        <%=wishItem.getProductPrice()%>
    </div>

    <div class="col-xs-1">
        <form action="deleteWishlist.product" method="post">
            <input type="hidden" name="userNumber" value="<%=userNumber%>">
            <input type="hidden" name="productNumber" value="<%=wishItem.getProductNumber()%>">
            <input type="submit" value="X" class="deleteBtn">
        </form>
    </div>
</div>
<%}%>
</body>
</html>
