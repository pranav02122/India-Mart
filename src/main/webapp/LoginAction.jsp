
<%@page import="java.util.Vector"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
<%@page import="javax.sql.RowSet"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="java.io.PrintWriter"%>
<%  
String emailid = request.getParameter("email");
String pass = request.getParameter("password");

PrintWriter ot =response.getWriter();

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	 RowSetFactory  rf =   RowSetProvider.newFactory(); 
	 JdbcRowSet jrs = rf.createJdbcRowSet();
	 jrs.setUrl("jdbc:mysql://localhost:3306/india_mart");
	 jrs.setUsername("root");
	 jrs.setPassword("jarvis");	
	 
	 jrs.setCommand("select email, password from register");
	 jrs.execute();
	 
	 Vector v = new Vector();
	 
	 while(jrs.next())
	 {
		 v.add(jrs.getString("email"));
		 v.add(jrs.getString("password"));
	 }
	 
	 HttpSession hs = request.getSession(); 
	 if(v.contains(emailid) && v.contains(pass))
	 {
		 hs.setAttribute("emid", emailid);
		 hs.setAttribute("passw",pass);
		 
		RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
		rd.forward(request, response);
	 response.sendRedirect("Loginpage.jsp?msg=valid"); 
	 }
	 else
	 {
		RequestDispatcher rd = request.getRequestDispatcher("Loginpage.jsp");
		rd.include(request, response);
	 response.sendRedirect("Loginpage.jsp?msg=invalid");
		
	 }
}
catch(Exception e)
{
	System.out.println(e);
}

%>