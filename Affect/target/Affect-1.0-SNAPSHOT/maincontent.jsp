<%@page import="DAO.product_DAO"%>
<%@page import="DTO.product_dto"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">


<style>
    .img {
        width: 100%;
    }

    .contentRow {
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
	String pages = request.getParameter("Pages");
	if(pages==null) pages="0";
	//현재 상품의 페이지

	product_DAO productDAO = new product_DAO();			//상품을 불러오기 위한 DAO
	String category = request.getParameter("category");	//현재 페이지의 카테고리
	String keyword = request.getParameter("keyword");   //제품 검색을 위한 키워드
	ArrayList<product_dto> productList;
	
	//키워드가 있으면 키워드로 출력, 아니면 카테고리로 출력한다.
	if(!keyword.equals("null")){
		productList = productDAO.searchList(keyword);
	}else{
		productList = productDAO.productList(category);
	}

	int limit = Integer.parseInt(pages)*6;//개씩 동적으로 추가함.
%>

<body>
<div id="mainContainer">
    <div class="container">
        <div class="row contentRow">
        	<%for(int i=limit; i<limit+6; i++){
        		if(i>=productList.size()) break;
        	    product_dto dto = productList.get(i);
            %>

        	<a href="productViewPage.jsp?category=<%=dto.getCategory()%>&productNumber=<%=dto.getProductNumber()%>">
                <div class="col-sm-4 col-xs-6">
                    <img src="thumbnails/<%=dto.getProductThumbnail()%>" class="img">
                    <div class="infoDiv">
                        <p class="productInfo"><%=dto.getProductName() %></p>
                        <p class="productInfo"><%=dto.getProductPrice() %></p>
                    </div>
                </div>
            </a>
        	
        	<%	
        		}
        	%>
        </div>
    </div>
</div>
</body></html>