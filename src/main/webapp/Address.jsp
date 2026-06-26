<%@page import="java.lang.foreign.AddressLayout"%>
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
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="AddressShow.css">
<link rel="stylesheet" type="text/css" href="account.css">
</head>


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
jrs.setCommand("select * from register where email=?");
%>
<%
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


<body>



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

<div class="profile-data">



<div class="addcon">
<form action="AddressAction.jsp">
    <h2 class="heading"> Add Address</h2>
    <%
String msg = request.getParameter("msg");
if("invalid".equals(msg))
{
%>
<p2>Address is aleardy exist</p2>
<%} %>
	
	<img alt="" src="./img/icons8-add-32.png" class="adadimg">

    <div class="name$num">
        <input type="text" class="instyle" name="name" placeholder="Name"  value="<% out.print(firstname + " " + lastname);%>" readonly>
        <input type="email" class="instyle" name="email" placeholder="Email" value="<%out.print(email);%>" readonly>
    </div>
    <div class="landmark">
        <input type="text" class="instyle" name="landmark" placeholder="Landmark">
        <input type="number" class="instyle" name="alphoneno" placeholder="Alternate Phone no(Optional)">
    </div>
    <div class="add-details">
        <input type="number" class="instyle" name="pincode" placeholder="Pincode">
        <input type="text" class="instyle" name="state" placeholder="State">
    </div>
    <div class="add-localde">
        <input type="text" class="instyle" name="locality" placeholder="Locality">
        <input type="text" class="instyle" name="city" placeholder="City">
    </div>
    <div class="address">
        <input type="text" class="address" name="address" placeholder="Address (Area and Street)">
    </div>
    <input type="submit" class="save" value="Save">
</form>

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
