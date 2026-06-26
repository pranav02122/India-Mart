<%@page import="java.io.PrintWriter"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
<%@ page language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" type="text/css" href="AddressShow.css">
<link rel="stylesheet" type="text/css" href="account.css">

<body>


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

jrs.setCommand("select * from register r inner join address a on r.email = a.emailid where email = ?");

jrs.setString(1, emailId);

jrs.execute();

while(jrs.next()) {
%>

<% 
 String firstname =(jrs.getString("firstname"));
 String lastname =(jrs.getString("lastname"));
 String genderdata =(jrs.getString("gender"));
 String email =(jrs.getString("email"));

String name = (jrs.getString("aname"));

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
<a href="support.html"><li>Customer Care</li></a>


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
<a href="adch.jsp" class="editbtn">
<img alt="" src="./img/edit.png" class ="eimg">
</a>
    <h2 class="heading">Your Address</h2>
    <div class="name$num">
    	
        <input type="text" class="instyle"  id="myInput" name="name" placeholder="Name" value="<% out.print(firstname + " " + lastname);%>" disabled>
        <input type="email" class="instyle" name="email" placeholder="Email" value="<% out.print(email);%>"disabled>
    </div>
    <div class="landmark">
        <input type="text" class="instyle" name="landmark" placeholder="Landmark" value="<% out.print(landmark);%>"disabled>
        <input type="number" class="instyle" name="alphoneno" placeholder="Alternate Phone no(Optional)" value="<% out.print(alphoneno);%>"disabled>
    </div>
    <div class="add-details">
        <input type="number" class="instyle" name="pincode" placeholder="Pincode" value="<% out.print(pincode);%>"disabled>
        <input type="text" class="instyle" name="state" placeholder="State"value="<% out.print(state);%>"disabled>
    </div>
    <div class="add-localde">
        <input type="text" class="instyle" name="locality" placeholder="Locality" value="<% out.print(locality);%>"disabled>
        <input type="text" class="instyle" name="city" placeholder="City" value="<% out.print(city);%>"disabled>
    </div>
    <div class="address">
        <input type="text" class="address" name="address" placeholder="Address (Area and Street)" value="<% out.print(address);%>"disabled>
    </div>
    <div class="nothing">
    
    </div>
</form>
</div>
</div>

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