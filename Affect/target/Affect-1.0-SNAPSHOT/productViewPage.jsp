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

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title></title>
</head>

<%
    DTO.user_dto user = (DTO.user_dto)session.getAttribute("user");
    String category = request.getParameter("category");
    String productNumber = request.getParameter("productNumber");

    DAO.product_DAO productDAO = new DAO.product_DAO();
    DTO.product_dto productObject = productDAO.getProduct(category,productNumber);
%>

<body>
<jsp:include page="header.jsp"/>
<style>

    .productContainer {
        margin-top: 3%;
        margin-bottom: 3%;
    }

    .productImage{
        width: 100%;
    }

    p {
        padding-top: 5px;
        padding-bottom: 5px;
    }

    #categoryLink{
        color: black;
        text-decoration: none;
        font-size: 80%;
    }

    #productName{
        font-size: 150%;
        border-bottom: 2px solid;
    }

    #productPrice{
        font-weight: bold;
    }

    .submitBtn{
        display: block;
        width: 100%;
        padding-top: 8px;
        padding-bottom: 8px;
        margin-top: 15px;
    }

    #buyBtn{
        background-color: black;
        border: none;
        color: white;
    }

    .detailBtn {
        text-align: center;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .detailBtn:hover {
        background-color: black;
        color: white;
    }

    .moveBtn{
        margin-top: 7px;
        margin-bottom: 7px;
    }

    .information{
        margin-top: 10px;
    }
</style>

<script>
    function move(seq){
        var offset = $("#" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>

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

<body>
    <div class="container productContainer">
        <div class="row">
            <div class="col-sm-6">
                <img src="thumbnails/<%=productObject.getProductThumbnail()%>" class="productImage">
            </div>
            <div class="col-sm-6">
                <p>
                    <a href="main.jsp?category=<%=productObject.getCategory()%>" id="categoryLink">
                        <%=productObject.getCategory()%>
                    </a>
                </p>

                <p id="productName">
                    <%=productObject.getProductName()%>
                </p>

                <p id="productInformation">
                    <%=productObject.getProductIntro()%>
                </p>

                <p id="productPrice">
                    <%=productObject.getProductPrice()%>
                </p>

                <%
                    if (user==null){
                %>
                    <input type="submit" value="Please Login to Buy" class="submitBtn" id="buyBtn">

                    <input type="submit" value="Please Login to Wishlist" class="submitBtn" id="addWishListBtn" disabled>

                    <input type="submit" value="Please Login to Cart" class="submitBtn" id="addCartListBtn" disabled>
                <%
                    }
                    else{
                %>
                    <form name="buyForm" action="" method="post">
                        <input type="hidden" name="productNumber" value="<%=productNumber%>">
                        <input type="hidden" name="productCategory" value="<%=productObject.getCategory()%>">
                        <input type="hidden" name="buyType" value="single">
                        <input type="submit" value="BUY IT NOW" class="submitBtn" id="buyBtn" onclick="buyCheck()">
                    </form>

                    <form action="addWish.product" method="get">
                        <input type="hidden" name="productNumber" value="<%=productNumber%>">
                        <input type="hidden" name="userNumber" value="<%=user.getNumber()%>">
                        <input type="hidden" name="category" value="<%=category%>">
                        <input type="submit" value="ADD TO WISHLIST" class="submitBtn" id="addWishListBtn">
                    </form>

                <form action="addCart.product" method="get">
                    <input type="hidden" name="productNumber" value="<%=productNumber%>">
                    <input type="hidden" name="userNumber" value="<%=user.getNumber()%>">
                    <input type="hidden" name="category" value="<%=category%>">
                    <input type="submit" value="ADD TO CART" class="submitBtn" id="addCartListBtn">
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <div class="container information">
        <div class="row moveBtn">
            <div class="col-xs-6 detailBtn" id="detailHeader" style="background-color: black; color: white">
                DEATAIL
            </div>

            <div class="col-xs-6 detailBtn" onclick="move('reviewHeader')">
                REVIEW
            </div>
        </div>


        <div id="detailContainer">
            <img src="productDetail/merge_from_ofoct.jpg" class="productImage">
        </div>


        <div class="row moveBtn">
            <div class="col-xs-6 detailBtn" onclick="move('detailHeader')">
                DEATAIL
            </div>

            <div class="col-xs-6 detailBtn" id="reviewHeader" style="background-color: black; color: white">
                REVIEW
            </div>
        </div>

        <div>
            <%@ include file="review.jsp" %>
        </div>

    </div>
</body>

<jsp:include page="footer.jsp"/>


</body>
</html>