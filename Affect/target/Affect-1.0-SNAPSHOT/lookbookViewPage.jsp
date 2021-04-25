<%@page import="DAO.lookbook_DAO"%>
<%@page import="DTO.lookbook_dto"%>
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


    <title>Document</title>
</head>

<style>
    .uploadContainer{
        padding-top: 10px;
        padding-bottom: 10px;
    }
    
    .lookInformation{
        margin: 0px;
        padding-top: 5px;
        font-weight: bold;
    }
    
    .lookInput{
        width: 100%;
        border: none;
        border-bottom: 1px solid;
    }
    
    .lookImg{
        width: 100%;
    }
</style>

<%
	String number = request.getParameter("number");
	lookbook_DAO dao = new lookbook_DAO();
	lookbook_dto dto = dao.getLook(number);
%>

<body>
<%@ include file="lookbookHeader.jsp" %>

    <div class="container uploadContainer">
            <div class="row">
                <div class="col-sm-7" id="imageContainer">
                	<img src="lookbook\<%=dto.getFileName()%>" class="lookImg">
                </div>
                
                
                <div class="col-sm-5">
                    <p class="lookInformation">HEADWEAR</p>
                    <input type="text" name="headwear" class="lookInput" readonly value="<%=dto.getHeadwear()%>">
                    <p class="lookInformation">EYEWEAR</p>
                    <input type="text" name="eyewear" class="lookInput" readonly value="<%=dto.getEyewear()%>">
                    <p class="lookInformation">PIERCING</p>
                    <input type="text" name="piercing" class="lookInput" readonly value="<%=dto.getPiercing()%>">
                    <p class="lookInformation">NECKLACE</p>
                    <input type="text" name="necklace" class="lookInput" readonly value="<%=dto.getNecklace()%>">
                    <p class="lookInformation">OUTER</p>
                    <input type="text" name="outer" class="lookInput" readonly value="<%=dto.getOuter()%>">
                    <p class="lookInformation">TOP</p>
                    <input type="text" name="top" class="lookInput" readonly value="<%=dto.getTop()%>">
                    <p class="lookInformation">BOTTOM</p>
                    <input type="text" name="bottom" class="lookInput" readonly value="<%=dto.getBottom()%>">
                    <p class="lookInformation">SHOES</p>
                    <input type="text" name="shoes" class="lookInput" readonly value="<%=dto.getShoes()%>">
                    <p class="lookInformation">ACC</p>
                    <input type="text" name="acc" class="lookInput" readonly value="<%=dto.getAcc()%>">
                    <p class="lookInformation">ETC</p>
                    <input type="text" name="etc" class="lookInput" readonly value="<%=dto.getEtc()%>">
                </div>
            </div>
    </div>

<%@ include file="footer.jsp" %>
</body></html>