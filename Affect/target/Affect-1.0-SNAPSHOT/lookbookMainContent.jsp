<%@page import="DTO.lookbook_dto"%>
<%@page import="DAO.lookbook_DAO"%>
<%@page import="DAO.product_DAO"%>
<%@page import="DTO.product_dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<style>
    .img {
        width: 100%;
    }

    .lookbookRow {
        margin-top: 3%;
    }

    .infoDiv {
        margin-bottom: 15px;
    }

    .productInfo {
        margin: 0px;
        padding-top: 6px;
        text-align: center;
        font-size: 90%;
        padding-bottom: 2px;
    }
</style>

<%
	lookbook_DAO lookDAO = new lookbook_DAO();
	ArrayList<lookbook_dto> lookbookList = lookDAO.lookbookList();
%>


<body>
    <div class="container">
        <div class="row lookbookRow">
        	
        	<%
        	for(int i=0; i<lookbookList.size(); i++){
        		lookbook_dto dto = lookbookList.get(i);
        	%>
        	
        	<a href="lookbookViewPage.jsp?number=<%=dto.getNumber()%>">
                <div class="col-sm-4 col-xs-6">
                    <img src="lookbook/<%=dto.getFileName()%>" class="img">
                    <div class="infoDiv">
                        <p class="productInfo"><%=dto.getUserName()%></p>
                        <p class="productInfo"><%=dto.getDate()%></p>
                    </div>
                </div>
            </a>
        	
        	<%	
        		}
        	%>
        
        </div>
    </div>
</body></html>