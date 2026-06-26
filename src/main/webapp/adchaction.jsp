<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.Connection_Provider"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>


<% 
String name = request.getParameter("name");
String emailed = request.getParameter("email");
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
	
	
	

	PreparedStatement pst = con.prepareStatement("UPDATE address SET aname =? ,landmark = ?, alphoneno = ? , pincode = ? , state =?,  locality =?, city =?, address =? WHERE emailid=?");
	
	pst.setString(9,emailed);
	pst.setString(1, name);
	pst.setString(2,landmark);
	pst.setLong(3,alphoneno);
	pst.setLong(4,pincode);
	pst.setString(5,state);
	pst.setString(6,locality);
	pst.setString(7,city);
	pst.setString(8,address);

	int s =pst.executeUpdate();
	  	
	
	if(s==1)
	{
		RequestDispatcher rd = request.getRequestDispatcher("Addressshow.jsp");
		rd.forward(request, response);
	 response.sendRedirect("Addressshow.jsp?msg=valid");
	
	}
	
	else
	{
		

		RequestDispatcher rd = request.getRequestDispatcher("Address.jsp");
		rd.forward(request, response);
	 response.sendRedirect("Address.jsp?msg=invalid");
	
	}
	
	
	
}
catch(Exception e)
{
	ot.print("hello");
	System.out.print(e);
}


%>