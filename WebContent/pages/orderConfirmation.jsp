<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.sun.org.apache.bcel.internal.generic.LDIV" %>
<%@ page import="dto.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");

    String cartId = session.getId();

    String shipping_cartId = "";
    String shipping_name = "";
    String shipping_shippingDate = "";
    String shipping_country = "";
    String shipping_zipCode = "";
    String shipping_addressName = "";

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (int i=0, v=cookies.length; i < v; i++) {
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();
            if ("Shipping_cartId".equals(n)) {
                shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
            if ("Shipping_name".equals(n)) {
                shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
            if ("Shipping_shippingDate".equals(n)) {
                shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
            if ("Shipping_country".equals(n)) {
                shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
            if ("Shipping_zipCode".equals(n)) {
                shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
            if ("Shipping_addressName".equals(n)) {
                shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
        }
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>주문정보</title>
</head>
<body>
<%@include file="menu.jsp"%>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">주문 정보<h1>
        </div>
    </div>

    <div class="container col-8 alert alert-info">
        <div class="text-center">
            <h1>영수증</h1>
        </div>
        <div class="row justify-content-between">
            <div class="col-4" align="left">
                <strong>배송 주소</strong><br>
                성명 : <% out.println(shipping_name); %> <br>
                우편번호 : <% out.println(shipping_zipCode); %> <br>
                주소 : <% out.println(shipping_addressName); %> <br>
            </div>
            <div class="col-4" align="right">
                <p><em> 배송일 : <% out.println(shipping_shippingDate); %></em></p>
            </div>
        </div>
        <div>
            <table class="table table-hover">
                <tr>
                    <th class="text-center">도서</th>
                    <th class="text-center">#</th>
                    <th class="text-center">가격</th>
                    <th class="text-center">소계</th>
                </tr>
                <%
                    int sum = 0; // 주문 총액.
                    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
                    if (cartList == null) cartList = new ArrayList<>();

                    for (int i=0, v=cartList.size(); i < v ; i++) { // 상품 리스트 하나씩 출력하기.
                        Product product = cartList.get(i);
                        int total = product.getUnitPrice() * product.getQuantity();
                        sum = sum + total;
                %>
                <tr>
                    <td class="text-center"><em><%=product.getPname()%></em></td>
                    <td class="text-center"><em><%=product.getQuantity()%></em></td>
                    <td class="text-center"><em><%=product.getUnitPrice()%></em></td>
                    <td class="text-center"><em><%=total%></em></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td></td>
                    <td></td>
                    <td class="text-right"><strong>총액 : </strong></td>
                    <td class="text-center text-danger"><strong><%=sum%></strong></td>
                </tr>
            </table>

            <a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button"> 이전 </a>
            <a href="./thankCustomer.jsp" class="btn btn-success" role="button"> 주문 완료 </a>
            <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
        </div>
    </div>

</body>
<script>

</script>

</html>