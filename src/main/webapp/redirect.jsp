<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String address = request.getParameter("address1");
    String paymentMode = request.getParameter("paymentMode");
    
    if(paymentMode.equals("gpay")) {
        response.sendRedirect("https://pay.google.com");
    } else if(paymentMode.equals("phonepay")) {
        response.sendRedirect("https://www.phonepe.com");
    } else if(paymentMode.equals("paypal")) {
        response.sendRedirect("https://www.paypal.com");
    } else if(paymentMode.equals("internetBanking")) {
        response.sendRedirect("https://www.sbi.com/internet-banking");
    } else if(paymentMode.equals("cashOnDelivery")) {
        out.println("<p>Your order will be delivered to: </p>" + address + "<br>");
        out.println("<p>You will pay cash on delivery.</p>");
    }
%>
