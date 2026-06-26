
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String cartid = request.getParameter("cpid");
String cartemail = request.getParameter("cpemail");

try{
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");

	PreparedStatement pst = con.prepareStatement("insert into cart values(?,?)");
	pst.setString(1,cartemail);
	pst.setString(2,cartid);
	
	int r =pst.executeUpdate();
	  if(r > 0) {
          response.sendRedirect("product-det.jsp?id=" + cartid + "&msg=valid");
          
      }

	
	
}
catch(Exception e)
{
	
	System.out.print(e);
	response.sendRedirect("product-det.jsp?id=" + cartid + "&msg=available");
}








%>