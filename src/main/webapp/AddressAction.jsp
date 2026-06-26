<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.Connection_Provider"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>


<% 
String name = request.getParameter("name");
String email = request.getParameter("email");
String landmark = request.getParameter("landmark");
Long alphoneno =Long.parseLong(request.getParameter("alphoneno"));
Long pincode = Long.parseLong(request.getParameter("pincode"));
String state = request.getParameter("state");
String locality= request.getParameter("locality");
String city= request.getParameter("city");
String address = request.getParameter("address");




PrintWriter ot =response.getWriter();
try{
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
	
	
	

	PreparedStatement pst = con.prepareStatement("insert into address values(?,?,?,?,?,?,?,?,?)");
	pst.setString(1,name);
	pst.setString(2,email);
	pst.setString(3,landmark);
	pst.setLong(4,alphoneno);
	pst.setLong(5,pincode);
	pst.setString(6,state);
	pst.setString(7,locality);
	pst.setString(8,city);
	pst.setString(9,address);
	int r =pst.executeUpdate();
	 
	
	if(r==1)
	{
		RequestDispatcher rd = request.getRequestDispatcher("Addressshow.jsp");
		rd.forward(request, response);
	 response.sendRedirect("Addressshow.jsp?msg=valid");
	
	}
	
	else
	{
		

		RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
		rd.forward(request, response);
	 response.sendRedirect("account.jsp?msg=invalid");
	
	}
	
	
	
}
catch(Exception e)
{
	
	System.out.print(e);
}


%>