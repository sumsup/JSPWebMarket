<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page errorPage="exceptionNoProductId.jsp" %>

<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->

	<%@ include file="menu.jsp" %>
	<%

		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);

	%>
<title><%= product.getPname() %></title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="../resources/images/<%=product.getFilename() %>" style="width: 100%" />
<%--				<img src="c:/upload/<%= product.getFilename() %>" style="width: 100%" />--%>

			</div>
			<div class="col-md-6">
				<h3><%= product.getPname() %></h3>
				<p><%= product.getDescription() %></p>
				<p><b>상품 코드 </b>:<span class="badge badge-danger">
					<%= product.getProductId() %></span>
					
				<p><b>제조사</b>:<%= product.getManufacturer() %>
				<p><b>분류</b>:<%= product.getCategory() %>
				<p><b>재고 수</b>:<%= product.getUnitsInStock() %>
				<h4><%= product.getUnitPrice() %> 원</h4>
				<p>
					<form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">장바구니 담기 &raquo;</a>
				   		<a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>
				</p>

			</div>
		
		</div>
		<hr>
	
	</div>
	<jsp:include page="footer.jsp"></jsp:include>



</body>
<script>
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</html>