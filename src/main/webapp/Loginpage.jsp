<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>India Mart Login</title>
</head>
<link rel="stylesheet" type="text/css" href="login.css">
<body>
<div class="superlog">
<div class="slog">
<div class="logimg">
<img alt="" src="./img/1738222909254.jpg" class="im2">
</div>

<form action="LoginAction.jsp" method="post">
<div class="loginpage">
<div class="emc">
<label for="email"><img alt="" class="i1" src="./img/icons8-male-user-94.png" ></label>
<input type="email" name="email" class="em" placeholder="Email">
</div>

<div class="pasc">
<label for="password"><img alt="" class="i1"  src="./img/icons8-password-64.png"></label>
<input type="password" name="password" class="pass" placeholder="Password">
</div>


<%
String msg = request.getParameter("msg");
if("valid".equals(msg))
{
%>
<p2 >successfully logged in</p2>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<p2 class ="invmsg">Incorrect username and password</p2>
<%
}
%>


<input type="submit" value ="Login" class="sbtn">

</form>


<a href="signup.html" ><p class="create-account">Sign-Up</p></a>

</div>
</div>
</body>
</html>