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


	PreparedStatement pst = con.prepareStatement("UPDATE register SET firstname = ?, lastname = ? , gender = ? , mobileno =?,  password =? WHERE email = ?");
	pst.setString(6,email);
	pst.setString(1,firstname);
	pst.setString(2,lastname);
	pst.setString(3,gender);
	pst.setLong(4,mobileno);
	pst.setString(5,password);	
	int g = pst.executeUpdate();
	if(g==1)
	{
		RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
		rd.forward(request, response);
	 response.sendRedirect("account.jsp?msg=valid");
	
	}
	

}
catch(Exception e)
{

		RequestDispatcher rd = request.getRequestDispatcher("UpdateAC.jsp");
		rd.forward(request, response);
	 response.sendRedirect("UpdateAC.jsp?msg=invalid");

	System.out.print(e);
}


%>