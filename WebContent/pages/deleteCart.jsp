<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("cartId");
    if (id == null || "".equals(id.trim())) {
        response.sendRedirect("cart.jsp");
        return;
    }

    session.invalidate();

    response.sendRedirect("cart.jsp");
%>