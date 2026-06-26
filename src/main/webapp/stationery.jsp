<%@page import="java.lang.classfile.CodeTransform"%>
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
<link rel="stylesheet" type="text/css" href="viewproduct.css">



  
</head>
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
			<h2>Stationery</h2>
			</div>
<% 

	try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
				PreparedStatement pst = con.prepareStatement("select * from addproduct where pid regexp  '^stationery' ORDER BY RAND() ;");
			ResultSet rs =	pst.executeQuery();
			
			while(rs.next())
			{%>
			
		<div class="maincon">		
			<div class="product-grid" id="productGrid">
                 
                  <a href="stationery_det.jsp?id=<%=rs.getString("pid")%>">  
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
	}
catch(Exception e)
{
	e.printStackTrace();
}
				%>
				

  