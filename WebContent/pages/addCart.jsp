<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%
    String id = request.getParameter("id");
    if (id == null || "".equals(id.trim())) { // id 입력 안했으면.
        response.sendRedirect("products.jsp");
        return;
    }

    ProductRepository dao = ProductRepository.getInstance();

    Product product = dao.getProductById(id);
    if (product == null) { // 없는 제품의 id 면.
        response.sendRedirect("exceptionNoProductId.jsp"); // 예외처리.
    }

    ArrayList<Product> goodsList = dao.getAllProducts(); // 제품들 가져오고.
    Product goods = new Product();

    for (int i = 0, loop= goodsList.size(); i < loop; i++) {
        goods = goodsList.get(i); // 하나씩 꺼냄
        if (id.equals(goods.getProductId())) { // id와 일치하면 break.
            break;
        }
    }

    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList"); // 카트 리스트 가져옴.

    if (cartList == null) { // 카트에 상품이 없으면
        cartList = new ArrayList<Product>();
        session.setAttribute("cartList", cartList); // 빈 장바구니 목록을 세션에 추가.
    }

    int cnt = 0;
    Product goodsQnt = new Product(); // 제품수량설정용.

    for (int i = 0, loop = cartList.size(); i < loop; i++) {
        goodsQnt = cartList.get(i); // 카트에서 제품을 가져와서
        System.out.println("제품 수량 : " + goodsQnt.getQuantity());
        if (id.equals(goodsQnt.getProductId())) { // 제품 id가 일치하면.
            cnt++;
            goodsQnt.setQuantity(goodsQnt.getQuantity() + 1); // 수량으로 등록.
        }
    }

    if (cnt == 0) { // 장바구니의 제품 수량이 0개면.
        goods.setQuantity(1); // 수량을 1로 설정하고
        cartList.add(goods); // 카트 리스트에 추가.
    }

    response.sendRedirect("cart.jsp");
%>