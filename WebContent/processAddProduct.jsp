<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "D:\\dev\\workspace\\JSPWebMarket\\WebContent\\resources\\images"; // 웹 어플리케이션 상의 절대 경로.
	int maxSize = 5 * 1024 * 1024; // 업로드될 최대. 파일의 크기 5MB.
	String encType = "utf-8"; // 인코딩 유형.
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	// 쿼리스트링의 파라미터 값을 로그로 찍어보기.
	/* Enumeration params = request.getParameterNames();
	
	System.out.println("----------------------------");
	
	while (params.hasMoreElements()) {
	  	
		String name = (String)params.nextElement();
		System.out.println(name + " : " +request.getParameter(name));
		
	}
	
	System.out.println("----------------------------"); */
			
	// 쿼리스트링에서 파라미터 값을 가져옴.
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty()) { // unitPrice가 null 값이면. isEmpty().
		
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
	
	Enumeration files = multi.getFileNames();
	// request에서 전달받은 파일 이름들을 불러와서 Enumeration 객체에 넣는다.
	// Enumeration은 자바 초기 버전용. Enumeration의 기능을 확장한게 Iterator이다.
	// Iterator는 모든 컬렉션 객체에서 사용가능하다. (Vector, list, set, map 등..)
	
	String fname = (String) files.nextElement();
	// fname 이랑 FilesystemName 적용한거랑 로그 찍어볼 것.
	// FileSystemName이 뭔지 모르겠다.
	
	String fileName = multi.getFilesystemName(fname);
	// getFilesystemName() : 
	// Returns the filesystem name of the specified file, or null if the file was not included in the upload.
	// filesystem name 이란 무엇인가? : 
	
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
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
	
%>