<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    if (id == null || "".equals(id.trim())) {
        response.sendRedirect("products.jsp");
        return;
    }

    ProductRepository dao = ProductRepository.getInstance(); // 싱글턴 패턴으로 인스턴스 생성.

    Product product = dao.getProductById(id);
    if (product == null) {
        response.sendRedirect("exceptionNoProductId.jsp");
    }

    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
    Product goodsQnt = new Product();
    for (int i = 0, loop = cartList.size(); i < loop; i++) {
        goodsQnt = cartList.get(i);
        if (id.equals(goodsQnt.getProductId())) {
            cartList.remove(goodsQnt);
            break;
        }
    }

    response.sendRedirect("cart.jsp");
%>