<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="showproduct.css">


<div class="heading">
			<h2>India Mart Products</h2>
			</div>

<%
String productId = request.getParameter("id");
System.out.println(productId);

%>

<% 

	try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
				PreparedStatement pst = con.prepareStatement("select * from addproduct");
			ResultSet rs =	pst.executeQuery();
			
			
			while(rs.next())
			{%>
			
		
			<div class="product-list">
		<div class="items">
		<div  class="pimgs">		
		<img alt="no" src="getproductimg?id=<%=rs.getString("pid")%>" width="120px"></div>
		<div class="info">
		<h3>Product Name: <%=rs.getString("pname") %></h3>
		<p>Product Id: <%=rs.getString("pid") %></p>
		<p>Product Catagory: <%=rs.getString("pcatagory") %></p>
		<p>Product Price: <%=rs.getLong("pprice") %></p>
		<p>Product Final Price: <%=rs.getLong("poprice") %></p>
		<p>Product Discount: <%=rs.getString("pdiscount") %></p>
		<p>Product Details: <%=rs.getString("pinfo") %></p>
		
		<a href="admdelproduct.jsp?id=<%=rs.getString("pid")%>">
		<button class="btndel">Remove Product</button>
		</a>
		</div>
			</div>
			</div>
	<%		
	}
	}
catch(Exception e)
{
	e.printStackTrace();
}
				%>
				
</body>
</html>