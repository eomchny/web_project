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
	#moreBtn{
		text-align: center;
		background-color: #b2b2b2;
		color: white;
		width: 60%;
		margin: auto;
		margin-bottom: 10px;
		padding-top: 5px;
		padding-bottom: 5px;
	}

</style>


<%
	String cateogry_param = request.getParameter("category");
	String keyword_param = request.getParameter("keyword");
	DAO.product_DAO proDao = new product_DAO();

	//6개씩 끊어서 보여주기 위함.
	int pageLimit;
	if(keyword_param!=null) pageLimit = (proDao.searchList(keyword_param).size()/6)+1;
	else pageLimit = (proDao.productList(cateogry_param).size()/6)+1;

%>

<script>
	var pages=0;

	$(document).ready(function() {
		var category = "<%=cateogry_param%>";
		var keyword = "<%=keyword_param%>";

		//초기 페이지 로딩
		$.ajax({
			url : "maincontent.jsp",
			dataType : "html",
			type : "get",
			data : { 	Pages:pages,
				category:category,
				keyword:keyword
			},   // 호출할 url 에 있는 페이지로 넘길 파라메터
			success : function(result){
				$("#scrolling").append(result);
			}
		});

		//버튼 누를떄마다
		$("#moreBtn").click(function (){
			pages = pages+1;
			if(pages < "<%=pageLimit%>"){
				$.ajax({
					url : "maincontent.jsp",
					dataType : "html",
					type : "get",
					data : { 	Pages:pages,
						category:category,
						keyword:keyword
					},   // 호출할 url 에 있는 페이지로 넘길 파라메터
					success : function(result){
						$("#scrolling").append(result);
					}
				});
			}
		});
	});
</script>

<body>
	<jsp:include page="header.jsp"/>

	<div id="scrolling">

	</div>

	<div id="moreBtn">
		MORE
	</div>

	<jsp:include page="footer.jsp"/>

</body>
</html>