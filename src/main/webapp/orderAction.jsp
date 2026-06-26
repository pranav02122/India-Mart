
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String orderid = request.getParameter("orderid");
String orderemail = request.getParameter("orderemail");
String order_det = request.getParameter("odd");
String delivery_det = request.getParameter("del");


try{
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");

	PreparedStatement pst = con.prepareStatement("insert into orders values(?,?,?,?)");
	pst.setString(1,orderemail);
	pst.setString(2,orderid);
	pst.setString(3,order_det);
	pst.setString(4,delivery_det);
	
	
	
	
	int r =pst.executeUpdate();
	  if(r > 0) {
          response.sendRedirect("orderconfirm.jsp?id=" + orderid + "&msg=valid");
          
      }

	
	
}
catch(Exception e)
{
	
	System.out.print(e);
	response.sendRedirect("paymentoption.jsp?id=" + orderid + "&msg=available");
}








%>