<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
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
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="vieworders.css">
<body>

    	 <div class="header">
    <a href="#" class="logo">Orders</a>
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

jrs.setCommand("select * from orders o inner join addproduct ad on o.oid = ad.pid where oemail = ?");

jrs.setString(1, emailId);

jrs.execute();

while(jrs.next()) {
%>
	


    	
    	
  
    <!-- Order 1 -->
    <div class="order-card">
    <a href="cart_det.jsp?id=<%=jrs.getString("pid")%>">
    
      <div class="order-details">
        
          <img alt="no" src="getproductimg?id=<%=jrs.getString("oid")%>" class="product-image">
        <div class="product-info">
          <h3 class="product-title"><%=jrs.getString("pname") %></h3>
       <span class="tracking-status">Expected delivery</span>
          
        </div>
        <div class="price"><%=jrs.getString("poprice") %></div>
        <div class="status">
          <div class="status-text">
            <span class="status-icon status-cancelled"></span>
            <span class="delivery-date">Delivered Date <%=jrs.getString("delivery_det") %></span>
             
          </div>
        </div>
      </div>
    </div></a>
   
    <div class="timeline-dates">
    
      <div class="date-box ordered-date"><%=jrs.getString("order_det") %></div>
      <div class="timeline-line"></div>
      <div class="date-box delivery-date"><%=jrs.getString("delivery_det") %></div>
    </div>
  
    	
          <a href="cancelorder.jsp?id=<%=jrs.getString("oid")%>">
           <button class="cancel-button">Cancel Order</button></a>
   
    	
<%

}
%>
<%

} 
catch(Exception e) {
System.out.println(e); 

}
}
%>

</body>
</html>