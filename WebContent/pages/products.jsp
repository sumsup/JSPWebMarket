<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="java.io.File" %>

<!-- 자바 빈 객체 생성 -->
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
</head>
<body>
	
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			
			<h1 class="display-3">상품 목록</h1>		
		
		</div>
	</div>
	
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%

				for(int i = 0; i < listOfProducts.size(); i++) { // Array에는 size() 도 있구나.
					
					Product product = listOfProducts.get(i);
			%>
			
			<div class="col-md-4">
				<img src='../resources/images/<%=product.getFilename()%>' style='width: 100%'>
<%--				<img src='c:/upload/<%=product.getFilename() %>' style='width: 100%'>--%>
				<!-- 크롬에서는 로컬 파일에 접근 불가함. -->
				
				<h3><%= product.getPname() %></h3>
				<p><%= product.getDescription() %>
				<p><%= product.getUnitPrice() %> 원
				<p><a href="./product_detail.jsp?id=<%=product.getProductId() %>" class="btn btn-secondary"
					role="button"> 상세정보 &raquo;></a>
			</div>
			
			<%
			
				}
			
			%>
		
		
		</div>
		<hr>
	
	</div>
	
	<jsp:include page="footer.jsp" />

</body>
</html>