<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  String query = request.getParameter("query");
  
  if(query != null && !query.trim().isEmpty()) {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
      // Database connection
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart", "root", "jarvis");
      
      // First try to find an exact match by ID (highest priority)
      String exactIdQuery = "SELECT pid FROM addproduct WHERE pid = ?";
      pstmt = conn.prepareStatement(exactIdQuery);
      pstmt.setString(1, query);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        // Found exact match by ID - redirect immediately
        String productId = rs.getString("pid");
        response.sendRedirect("productDetails.jsp?id=" + productId);
        return; // Stop processing
      }
      
      // Close previous statement and result set
      rs.close();
      pstmt.close();
      
      // Try to find an exact match by name
      String exactNameQuery = "SELECT pid FROM addproduct WHERE pname = ?";
      pstmt = conn.prepareStatement(exactNameQuery);
      pstmt.setString(1, query);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        // Found exact match by name - redirect immediately
        String productId = rs.getString("pid");
        response.sendRedirect("productDetails.jsp?id=" + productId);
        return; // Stop processing
      }
      
      // Close previous statement and result set
      rs.close();
      pstmt.close();
      
      // If no exact matches, look for partial matches using LIKE
      String partialMatchQuery = "SELECT pid FROM addproduct WHERE pname LIKE ? OR pid LIKE ? OR pcatagory LIKE ?";
      pstmt = conn.prepareStatement(partialMatchQuery);
      
      String searchPattern = "%" + query + "%";
      pstmt.setString(1, searchPattern);
      pstmt.setString(2, searchPattern);
      pstmt.setString(3, searchPattern);
      
      rs = pstmt.executeQuery();
      
      // Check if we have exactly one result
      if(rs.next()) {
        String productId = rs.getString("pid");
        
        // Check if there's only one result
        if(!rs.next()) {
          // Only one result found - redirect directly
          response.sendRedirect("product-det.jsp?id=" + productId);
          return; // Stop processing
        } else {
          // More than one result - redirect to search results page
          response.sendRedirect("searchResults.jsp?query=" + query);
          return;
        }
      } else {
        // No results - redirect to search results page
        response.sendRedirect("searchResults.jsp?query=" + query);
        return;
      }
      
    } catch(Exception e) {
      out.println("Error: " + e.getMessage());
    } finally {
      // Close connections
      try { if(rs != null) rs.close(); } catch(Exception e) { }
      try { if(pstmt != null) pstmt.close(); } catch(Exception e) { }
      try { if(conn != null) conn.close(); } catch(Exception e) { }
    }
  } else {
    // Empty query - redirect back to home or show error
    response.sendRedirect("index.jsp");
  }
%>