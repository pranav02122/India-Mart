<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="product_det.css">

<link rel="stylesheet" type="text/css" href="viewproduct.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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


<%
String productId = request.getParameter("id");

System.out.println(productId);

%>

<%

try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
	PreparedStatement pst = con.prepareStatement("select * from addproduct where pid =? ");
	pst.setString(1, productId);
ResultSet rs =	pst.executeQuery();

while(rs.next())
{

%>


    <div class="product-container">
        <div class="product-left">
            <div class="product-img">
                
<img alt="no" src="getproductimg?id=<%=rs.getString("pid")%>" width="200px">
               
            </div>
            <div class="action-buttons">
            <a href="cart.jsp?id=<%=rs.getString("pid")%>"> 
                <button class="add-to-cart" >ADD TO CART</button></a>
               <a href="paymentoption.jsp?id=<%=rs.getString("pid")%>"><button class="buy-now">BUY NOW</button></a> 
            </div>
            <%
            String msg = request.getParameter("msg");
            if("valid".equals(msg))
            {
            %>
            <span class="msgcart">Product added successfully</span>
            
           <%} %>
          	
          	
          	<%if("available".equals(msg)){%>
          	<span class="msgcart">Product is already available in a cart</span>
          	
          	<%} %>
          	
        </div>
        

            
            
        <div class="product-right">
            <h1 class="product-title2"><%=rs.getString("pname") %></h1>
            
            <div class="price-section">
                <span class="current-price2">₹<%=rs.getLong("poprice") %></span>
                <span class="original-price2">₹<%=rs.getLong("pprice") %></span>
                <span class="discount1">(<%=rs.getString("pdiscount") %>)</span>
                <span class="discount2">Save extra with No Cost EMI</span>
            </div>
            
            <div class="offers-section">
                <div class="offers-title">Available offers</div>
                
                <div class="offer-item">
                    <div class="offer-icon">•</div>
                    <div class="offer-text">
                        <strong>Special Price</strong> Get extra 6% off (price inclusive of cashback/coupon)
                        <a href="#" class="tnc-link">T&C</a>
                    </div>
                </div>
                
                <div class="offer-item">
                    <div class="offer-icon">•</div>
                    <div class="offer-text">
                        <strong>Combo Offer</strong> Combo OfferBuy 2 items save ₹20; Buy 3 or more save ₹40
                        <a href="#" class="tnc-link">T&C</a>
                    </div>
                </div>
                </div>
                <div class="offer-item">
                    <div class="offer-icon">•</div>
                    <div class="offer-text">
                        <strong>Bank Offer:</strong> 5% Unlimited Cashback on Flipkart Axis Bank Credit Card
                        <a href="#" class="tnc-link">T&C</a>
                    </div>
                </div>
                
                
            
            
            <div class="pdet">
                <div class="pdet"><h2>Product Details</h2></div>
                <p> <%=rs.getString("pinfo") %></p>
                
                </div>
                </div>
                </div>
                
                
                
                
	<%		
	}
%>
<% 
	}
catch(Exception e)
{
	e.printStackTrace();
}
%>




<% 

	try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/india_mart","root","jarvis");
				PreparedStatement pst = con.prepareStatement("SELECT * FROM addproduct WHERE pid REGEXP '^stationery' ORDER BY RAND() LIMIT 12;");
			ResultSet rs =	pst.executeQuery();
			
			while(rs.next())
			{%>
			
		<div class="maincon2">		
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


</body>
</html>
