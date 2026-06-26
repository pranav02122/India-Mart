<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%
    String proId = request.getParameter("id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
        PreparedStatement pst = con.prepareStatement("delete from cart where cid=?");
        pst.setString(1, proId);
        int rowsAffected = pst.executeUpdate();
        
      
        if(rowsAffected > 0) {
            response.sendRedirect("cartshow.jsp?msg=deleted");
        } else {
            response.sendRedirect("cartshow.jsp?msg=notfound");
        }
        
        con.close(); 
    }
    catch(Exception e) {
        e.printStackTrace();
    }
%>