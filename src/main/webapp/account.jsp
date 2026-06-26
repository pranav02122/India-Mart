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

	<script src=
"https://code.jquery.com/jquery-1.12.4.min.js">
	</script>
</head>
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

<form >
<div class ="profile-data">

<a href="UpdateAC.jsp" class="editbtn">
<img alt="" src="./img/edit.png" class ="eimg">
</a>
<h2 class="heading-pd">
Personal Details</h2>
<%


String msg = request.getParameter("msg");
if("valid".equals(msg))
{
%>

<p2>Profile Updated Successfully</p2>
<%} %>


<div class="data-show">


    
<div class="consuper">

<div class ="personal-det" >


<span class="infotext"><h2></h2></span>
<input type="text" name ="firstname" class="sstyle" placeholder="First name" value=<% out.print(firstname);%> disabled>
<input type="text" name ="lastname" class="sstyle" placeholder="Last name" value=<% out.print(lastname);%> disabled>

<br>

	<div class="gender">
     <h4>Gender:</h4><p><%out.print(genderdata); %></p>
</div>

<br>

<span><h2>Email Address</h2></span>
<input type ="email" name ="email" class="sstyle" placeholder="Email Address" value=<% out.print(email);%> disabled >
<span><h2>Mobile Number</h2></span>
<input type ="number" name ="mobileno" class="sstyle" placeholder="Mobile Number" value=<% out.print(mobileno); %> disabled>
<span><h2>Address</h2></span>

<div class="address">

    
    <input type="text" class="address" name="address" placeholder="Address (Area and Street)"
    value="<% out.println("State: " + state + ", " + "City: " + city + ", "+ "Address: " + address + ", " + "Pincode: " + pincode);%>" disabled>
    <a href="adch.jsp" class="addAdbtn">Edit Address</a>
    
    
</div>
<div>
<a href="homepage.jsp">Home</a>
</div>

 </form>   


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