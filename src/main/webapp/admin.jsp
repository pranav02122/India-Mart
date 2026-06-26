<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndiaMart-Account</title>

</head>

<link rel="stylesheet" type="text/css" href="admin.css">
<link rel="stylesheet" type="text/css" href="account.css">



<body>


<%
HttpSession hs = request.getSession(false);
%>
<%
PrintWriter ot = response.getWriter();
%>
<%
if(hs != null) {
%>
<%
String emailId = (String) hs.getAttribute("emid");
%>
<%
String password = (String) hs.getAttribute("passw");
%>
<%
try {
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
%>
<%
RowSetFactory rf = RowSetProvider.newFactory();
%>
<%
JdbcRowSet jrs = rf.createJdbcRowSet();
%>
<%
jrs.setUrl("jdbc:mysql://localhost:3306/india_mart");
%>
<%
jrs.setUsername("root");
%>
<%
jrs.setPassword("jarvis");
%>
<%

jrs.setCommand("select * from register r inner join address a on r.email = a.emailid where email = ?;");

jrs.setString(1, emailId);
%>
<%
jrs.execute();
%>
<%


while(jrs.next()) {
%>
<% String firstname =(jrs.getString("firstname"));%>
<% String lastname =(jrs.getString("lastname"));%>
<% String genderdata =(jrs.getString("gender"));%>
<% String email =(jrs.getString("email"));%>
<% String mobileno =(jrs.getString("mobileno"));

String landmark = (jrs.getString("landmark"));
Long alphoneno =(jrs.getLong("alphoneno"));
Long pincode = (jrs.getLong("pincode"));
String state = (jrs.getString("state"));
String locality= (jrs.getString("locality"));
String city= (jrs.getString("city"));
String address = (jrs.getString("address"));


%>





<div class="profile-name">

<div class="detail-info"></div>

<%if(email.equals("pranav.ad2424@gmail.com"))
{%>
<ul class="detail2-list">
<%} 
else{%>
<ul class="detail-list">
<%} %>
<a href="account.jsp"><li>Personal Details</li></a>
<a href="Addressshow.jsp"><li>Manage Address</li></a>
<a href="vieworder.jsp"><li>Orders</li></a>
<a href="cartshow.jsp"><li>Cart</li></a>
<a href=""><li>Payment</li></a>


<%if(email.equals("pranav.ad2424@gmail.com"))
{%>
<a href="admin.jsp" class="admin"><li>Admin</li></a>
<%} %>

</ul>
</div>

<div class ="profile-indicates">
<img alt="profine_img" src="./img/user_6994705.png" class="profile-img">
<div class="welcomename">
<% out.print(firstname);%>
<% out.print(lastname);%>
</div>
</div>



<form >
<div class ="profile-data">






<div class="data-show">


    
<div class="consuper">

<div class ="personal-det" >

 <span id="welcome"><h1>Hello Admin,</h1></span>
<span id="name">
<h1>
<% out.print(firstname);%>
<% out.print(lastname);%>
</h1>
</span>
<div class="adimg">

<div class="my">
<a href="users.jsp">
<img alt="available user" src="./img/team (1).png" width="160px"></a>
<p>Available User</p>
</div>

<div class="my">
<a href="addproductform.jsp"><img alt="addproduct" src="./img/add-product.png" width="160px"></a>
<p> Add Product</p>
</div>

<div class="my">
<a href="showproduct.jsp">
<img alt="viewproduct" src="./img/loading.png" width="100px"></a>
<p>All Products</p>
</div>

<div class="my">
<a href="orderad.jsp">
<img alt="orders" src="./img/shopping-cart_6054136.png" width="100px"></a>
<p>Orders</p>
</div>
</div>



</div>


</div>
</div>



    
    
<%
}
%>
<%
} catch(Exception e) {

System.out.println(e);
%>

<%
}
%>
<%
}
%>

   
</body>
</html>      