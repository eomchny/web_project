<%@page import="DTO.user_dto"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
</head>

<style>
    body {
        margin: 0px;
    }
    
    #loobookUploadBtn{
        background-color: #e0e0e0;
        text-align: center;
        padding: 6px;
        font-weight: bold;
        color: black;
		width: 50%;
		border-radius: 15px;
		margin: auto;
    }
    
    #lookbookUploadLink{
		display: block;
        text-decoration: none;
        color: black;
    }
</style>

<%
user_dto Btncheck = (user_dto)session.getAttribute("user");
//세션에 유저정보가 있는지 없는지 확인
%>

<body>
	<%if(Btncheck==null){%>
		<a id="lookbookUploadLink">
        	<div id="loobookUploadBtn">
            	Login to register photos
        	</div>
    	</a>
	<%} else {%>
		<a href="lookbookUploadPage.jsp" id="lookbookUploadLink">
        	<div id="loobookUploadBtn">
            	Register
        	</div>
    	</a>
	<%}%>
</body>
</html>