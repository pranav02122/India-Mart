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
<% String mobileno =(jrs.getString("mobileno"));%>
<% String passwords =(jrs.getString("password"));%>




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

<form action="UpdateAcAction.jsp" method="post">
<div class ="profile-data">

<h2 class="heading-pd">
Update Profile</h2>

<%
String msg = request.getParameter("msg");
if("invalid".equals(msg))
{
%>
<p2>something went wrong</p2>
<%
}
%>

<div class="data-show">


    
<div class="consuper">

<div class ="personal-det" >

<span class="infotext"><h2></h2></span>
<input type="text" name ="firstname" class="sstyle" placeholder="First name" value=<% out.print(firstname);%> >
<input type="text" name ="lastname" class="sstyle" placeholder="Last name" value=<% out.print(lastname);%>>

<br>

	<div class="gender">
	<input type="radio" name="gen" value="Male" >
<lable for="male">Male</lable>
<input type="radio" name="gen"  value="female" >
<lable for="female">Female</lable>
     
</div>

<br>

<span><h2>Email Address</h2></span>
<input type ="email" name ="email" class="sstyle" placeholder="Email Address" value=<% out.print(email);%> readonly>
<span><h2>Mobile Number</h2></span>
<input type ="number" name ="mobileno" class="sstyle" placeholder="Mobile Number" value=<% out.print(mobileno); %>>
<span><h2>Change Password</h2></span>
<input type ="text" name ="password" class="sstyle" placeholder="Mobile Number" value=<% out.print(passwords); %>>

<input type="submit" value="Save" class="savebtn">

<p class = "note">
Note: Email Address Cannot Be Edited or Updated</p>
 </form>   
</div>
</div>
</div>
</body>
</html>
<%

}
%>
<%
} catch(Exception e) {
%>
<%
System.out.println(e);
%>
<%
}
%>
<%
}
%>