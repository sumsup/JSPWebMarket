<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	// 코드로 JSP를 만들었다.

	request.setCharacterEncoding("UTF-8");
	
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty()) {
		
		price = 0;
		
	} else {
		
		price = Integer.valueOf(unitPrice);
		
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()) {
		
		stock = 0;
		
	} else {
		
		stock = Long.valueOf(unitsInStock);
		
	}
	
	ProductRepository dao = ProductRepository.getInstance(); 
	// 싱글턴 인스턴스 생성 방식.
	// ProductRepository 클래스로 가보면. 필드에 instance 라는 이름의 static 변수가 있을 꺼다.
	// 이 static 의 의미는 인스턴스를 새로 생성하지 않고 하나만 만들어서 돌려 쓰겠다는 의도.
	// 그래서 static으로 instance 라는 이름의 변수를 필드에 선언했다.
	// 이 instance 변수를 getInstance 메서드를 통해서 가져오는 것.
	
	Product newProduct = new Product();
	
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
	
	
%>