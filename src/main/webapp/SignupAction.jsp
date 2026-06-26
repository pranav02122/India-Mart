<%@page import="project.Connection_Provider"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>


<% 
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String gender = request.getParameter("gen");
String email = request.getParameter("email");
String password = request.getParameter("password");
Long mobileno = Long.parseLong(request.getParameter("mobileno"));



PrintWriter ot =response.getWriter();
try{
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
System.out.println(con);
	
	
	

	PreparedStatement pst = con.prepareStatement("insert into register values(?,?,?,?,?,?)");
	pst.setString(1,firstname);
	pst.setString(2,lastname);
	pst.setString(3,gender);
	pst.setString(4,email);
	pst.setString(5,password);
	pst.setLong(6,mobileno);
	int i = pst.executeUpdate();
	if(i==1)
	{
	RequestDispatcher rd = request.getRequestDispatcher("Loginpage.jsp");
	rd.include(request, response);
 response.sendRedirect("Loginpage.jsp?msg=invalid");
	}
	
}
catch(Exception e)
{
	System.out.print(e);
}


%>