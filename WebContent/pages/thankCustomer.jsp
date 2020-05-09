<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>주문 완료</title>
</head>
<body>
<%@include file="menu.jsp"%>
    <%
        String shipping_cartId = "";
        String shipping_name = "";
        String shipping_shippingDate = "";
        String shipping_country = "";
        String shipping_zipCode = "";
        String shipping_addressName = "";

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String cookieName = cookie.getName();
                if ("Shipping_cartId".equals(cookieName)) {
                    shipping_cartId = URLDecoder.decode(cookie.getValue(),"utf-8");
                }
                if ("Shipping_shippingDate".equals(cookieName)) {
                    shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
                }
            }
        }
    %>
    <div class="jumbotron">
        <div class="display-3">
            <h1 class="display-3">주문 완료</h1>
        </div>
    </div>
    <div class="container">
        <h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
        <p> 주문은 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다!</p>
        <p> 주문번호 : <% out.println(shipping_cartId); %></p>
    </div>
    <div class="container">
        <p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a></p>
    </div>

</body>
<script>

</script>

</html>
<%
    session.removeAttribute("cartList");

    for (Cookie cookie : cookies) {
        String cookieName = cookie.getName();
        if ("Customer_Id".equals(cookieName)) cookie.setMaxAge(0);
        if ("Customer_name".equals(cookieName)) cookie.setMaxAge(0);
        if ("Customer_phoneNumber".equals(cookieName)) cookie.setMaxAge(0);
        if ("Customer_country".equals(cookieName)) cookie.setMaxAge(0);
        if ("Customer_zipCode".equals(cookieName)) cookie.setMaxAge(0);
        if ("Customer_addressName".equals(cookieName)) cookie.setMaxAge(0);

        if ("Shipping_cartId".equals(cookieName)) cookie.setMaxAge(0);
        if ("Shipping_name".equals(cookieName)) cookie.setMaxAge(0);
        if ("Shipping_shippingDate".equals(cookieName)) cookie.setMaxAge(0);
        if ("Shipping_country".equals(cookieName)) cookie.setMaxAge(0);
        if ("Shipping_zipCode".equals(cookieName)) cookie.setMaxAge(0);
        if ("Shipping_addressName".equals(cookieName)) cookie.setMaxAge(0);

        response.addCookie(cookie);
    }
%>