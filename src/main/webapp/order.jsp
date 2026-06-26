<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
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
<body>
<script type="text/javascript" src="cform.js"></script>


<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
  // Get current date
  LocalDate currentDate = LocalDate.now();
  
  // Get date 4 days from now
  LocalDate fourDaysLater = currentDate.plusDays(4);
  
  // Format dates as dd/MM/yyyy
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
  String formattedCurrentDate = currentDate.format(formatter);
  String formattedFuturDate = fourDaysLater.format(formatter);
%>



<%
String productId = request.getParameter("id");
System.out.println(productId);





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



 String email =(jrs.getString("email"));


%>
			
			
			<form id="myForm" action="orderAction.jsp" method="post">
			<input type="text" id="myInput" value="<%=productId%>" name="orderid">
			<input type="text" id="myInput" value="<%=email%>" name="orderemail">
			<input type="text" id="myInput" value="<%=formattedCurrentDate%>" name="odd">
			<input type="text" id="myInput" value="<%=formattedFuturDate%>" name="del">
			
		
			 <button type="submit">Submit</button>
			</form>
			
		
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

<style>
body {
    overflow: hidden;
}
form#myForm {
    background-color: aqua;
    width: 155px;
    height: 42px;
    margin: 1000px 16px;
</style>


</body>
</html>