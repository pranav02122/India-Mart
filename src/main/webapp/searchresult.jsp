<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product</title>
</head>

<link rel="stylesheet" type="text/css" href="viewproduct.css">
<body>
<nav class="navbar">
    <div class="logo">
      	<a href="homepage.jsp"><h3>India Mart</h3></a>
    </div>
        <div class="search-container">
    <form action="searchresult.jsp" method="get" class="search-form">
      <input type="text" class="search-bar" placeholder="Search any product" name="query">
      <button  class="btns" type="submit" >
    <img src="./img/Search.png" class="si" alt="">
</button>

    </form>
    </div>
    
    
        <div class="cart">
            <a href="cartshow.jsp"> <img alt="" src=".\img\Shopping cart (1).png" class="imgcart">
                <h3 class="carth">Cart</h3>
            </a>
        </div>
    
  </nav>






<div class="heading">
			<h2>Available Product</h2>
			</div>

<%
String query = request.getParameter("query");

if (query != null && !query.trim().isEmpty()) {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Replace with your database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/india_mart";
        String dbUser = "root";
        String dbPassword = "jarvis";

        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Correct SQL query with proper REGEXP syntax
        String sql = "SELECT * FROM addproduct WHERE pid REGEXP ? OR pname REGEXP ?";
        pstmt = conn.prepareStatement(sql);

        // For REGEXP, don't use % wildcards
        pstmt.setString(1, "^" + query); // Pattern for "starts with query"
        pstmt.setString(2, "^" + query);

        // Execute the query
        rs = pstmt.executeQuery();

        // Check if any results were found
        boolean resultsFound = false;

        // Display results
        while (rs.next()) {
            resultsFound = true;
            
%>

<div class="maincon">		
			<div class="product-grid" id="productGrid">
                 
                  <a href="cart_det.jsp?id=<%=rs.getString("pid")%>">  
                       <div class="product-card">
                 
                        <div class="product-image">
                            
		<img alt="no" src="getproductimg?id=<%=rs.getString("pid")%>" width="200px">
                        </div>
                        
                        <div class="product-info">
                            <div class="product-title"><%=rs.getString("pname") %></div>
                           
                            </div>
                            
                           
                            <div class="priceinfo">
                            <div class="price-container">
                                <span class="price">₹<%=rs.getLong("poprice") %></span>
                                <span class="original-price">M.R.P:<%=rs.getLong("pprice")%></span>
                            </div>
                            
                            
                            <div class="discount"><%=rs.getString("pdiscount") %></div>
                            <div class="emi-info">Save extra with No Cost EMI</div>
                        </div>
                        </div>
                        </a>
                    </div>
                    </div>
	
	
<%
        }

        if (!resultsFound) {
%>
<div class="no-results">
    <p>No products found matching '<%= query %>'</p>
</div>
<%
        }

    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} else {
    out.println("<p>Please enter a search query.</p>");
}
%>

<a href="homepage.jsp" class="back-link">← Back to home</a>

</body>
</html>