<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" type="text/css" href="viewproduct.css">
<link rel="stylesheet" type="text/css" href="cart.css">
<body>

<div class="mainstyle">
<a href="homepage.jsp">
<img alt="back" src="./img/back.png" class="backimg"></a>
<h2>Cart Items</h2>
</div>
<%
HttpSession hs = request.getSession(false);
if(hs != null) {
String emailId = (String) hs.getAttribute("emid");
String password = (String) hs.getAttribute("passw");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    RowSetFactory rf = RowSetProvider.newFactory();
    JdbcRowSet jrs = rf.createJdbcRowSet();
    jrs.setUrl("jdbc:mysql://localhost:3306/india_mart");
    jrs.setUsername("root");
    jrs.setPassword("jarvis");
    jrs.setCommand("select * from cart c inner join addproduct ad on c.cid=ad.pid where cemail = ?");
    jrs.setString(1, emailId);
    jrs.execute();
    
   
    long totalSum = 0;
    
  
    List<String[]> cartItems = new ArrayList<>();
    
    while(jrs.next()) {
        String pname = jrs.getString("pname");
        String pid = jrs.getString("pid");
        String pprice = jrs.getString("pprice");
        String poprice = jrs.getString("poprice");
        String pdisc = jrs.getString("pdiscount");
        String cemail = jrs.getString("cemail");
      
      
        long itemPrice = jrs.getLong("poprice");
        totalSum += itemPrice;
       
        String[] item = {pid};
        cartItems.add(item);
        
%>
<div class="maincon">
<div class="product-grid" id="productGrid">
<a href="cart_det.jsp?id=<%=pid%>">
<div class="product-card">
<div class="product-image">
<img alt="no" src="getproductimg?id=<%=pid%>" width="200px">
</div>
<div class="product-info">
<div class="product-title"><%=pname %></div>
</div>
<div class="priceinfo">
<div class="price-container">
<span class="price">₹<%=poprice %></span>
<span class="original-price">M.R.P:<%=pprice%></span>
</div>
<div class="discount"><%=pdisc %></div>
<div class="emi-info">Save extra with No Cost EMI</div>
<div class="twobtn">
<div class="remvp"> <a href="removepro.jsp?id=<%=pid %>">Remove</a></div>
<div class="buynow"><a href="paymentoption.jsp?id=<%=pid%>">Buy Now</a></div></div>
</div>
</div>
</a>
</div>
</div>
<%

    }
    
   
    if (!cartItems.isEmpty()) {
%>
<div class="total-container" style="margin-top: 20px; padding: 15px; background-color: #f9f9f9; border-radius: 5px; text-align: right;">
    <h3>Cart Total: ₹<%= totalSum %></h3>
    
</div>
<%
    } else {
%>
<div style="text-align: center; margin-top: 50px;">
    <h3>Your cart is empty</h3>
    <p>Add items to your cart to see them here</p>
</div>
<%
    }
}
catch(Exception e)
{
    e.printStackTrace();
}
}
%>


</body>
</html>