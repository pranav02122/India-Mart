<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful</title>
</head>
<link rel="stylesheet" type="text/css" href="orderconfirm.css">
<script type="text/javascript" src="orderconfirm.js"></script>
<body>


<%
String productId = request.getParameter("id");
System.out.println(productId);
%>

<%
try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
	PreparedStatement pst = con.prepareStatement("select * from orders o inner join addproduct ad on o.oid=ad.pid where oid = ? ");
	pst.setString(1, productId);
	
	ResultSet rs =	pst.executeQuery();

	while(rs.next())
{
		
%>
				

<div class="container">
        <div class="success-icon">
            <div class="success-circle"></div>
            <svg class="checkmark" width="50" height="50" viewBox="0 0 52 52">
                <circle class="checkmark-circle" cx="26" cy="26" r="25" fill="none" stroke="white" stroke-width="2"/>
                <path class="checkmark-path" d="M14.1 27.2l7.1 7.2 16.7-16.8" fill="none" stroke="white" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </div>
        
        <h1>Order Successful!</h1>
        <p>Your order has been placed and is being processed. You'll receive an email confirmation shortly.</p>
        
        <div class="order-details">
            <div class="product-row">
                <div class="product-image">
                    
                    <img alt="no" src="getproductimg?id=<%=rs.getString("oid")%>" width=100px>
                </div>
                <div class="product-info">
                    <div class="product-title"><%=rs.getString("pname") %></div>
                    <div class="product-price">₹<%=rs.getString("poprice")%></div>
                </div>
            </div>
            
            <div class="delivery-info">
                <div class="info-block">
                    <div class="info-label">Discount</div>
                    <div class="info-value"><%=rs.getString("pdiscount") %></div>
                </div>
                <div class="info-block">
                    <div class="info-label">Estimated Delivery</div>
                    <div class="info-value"><%=rs.getString("delivery_det") %></div>
                </div>
                <div class="info-block">
                    <div class="info-label">Shipping Method</div>
                    <div class="info-value">Express</div>
                </div>
            </div>
        </div>
        
        <div class="actions">
           <a href="vieworder.jsp?id=<%=rs.getString("oid")%>"> <button class="btn btn-primary">Track Order</button></a>
            <a href="cart_det.jsp?id=<%=rs.getString("oid")%>"><button class="btn btn-secondary">View Details</button></a>
        </div>
        
        <svg class="delivery-truck" viewBox="0 0 100 50">
            <rect x="10" y="20" width="50" height="20" rx="5" fill="#4f46e5"/>
            <rect x="60" y="20" width="30" height="15" rx="3" fill="#6366f1"/>
            <circle cx="25" cy="40" r="7" fill="#1f2937"/>
            <circle cx="65" cy="40" r="7" fill="#1f2937"/>
            <rect x="20" y="13" width="5" height="7" fill="#6366f1"/>
        </svg>
    </div>

    	<%	
    	
    	
	}
	
	
	}
catch(Exception e)
{
	e.printStackTrace();
}
				%>
</body>
</html>

