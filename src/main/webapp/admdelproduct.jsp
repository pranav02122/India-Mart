<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%
    String proId = request.getParameter("id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
        PreparedStatement pst = con.prepareStatement("delete from addproduct where pid = ?");
        pst.setString(1, proId);
        int rowsAffected = pst.executeUpdate();
        
      
        if(rowsAffected > 0) {
            response.sendRedirect("showproduct.jsp?msg=deleted");
        } else {
            response.sendRedirect("showproduct.jsp?msg=notfound");
        }
        
        con.close(); 
    }
    catch(Exception e) {
        e.printStackTrace();
    }
%>