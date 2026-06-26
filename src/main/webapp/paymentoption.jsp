<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="paymenoption.css">
<script type="text/javascript" src="paymentoption.js"></script>
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

<div class="maincon">
<div class="container">
        <div class="header">
            <h1>Payment Details</h1>
            <p>Choose your preferred payment method</p>
        </div>
        
        <div class="order-summary">
            <h2>Order Summary</h2>
            
            <div class="order-item">
                <span class="imgnm"><img alt="no" src="getproductimg?id=<%=rs.getString("pid")%>" width="90px">
   <%=rs.getString("pname") %></span>
                <span class="price">₹<%=rs.getLong("poprice") %></span>
            </div>
            
            <div class="order-item">
                <span><h4>Delivery Charges</h4></span>
                <span class="dc">₹49</span>
                <span class="ship">Free Delivery</span>
            </div>
            <div class="order-total">
                <span>Total Amount</span>
                <span>₹<%=rs.getLong("poprice") %></span>
            </div>
            
        </div>
        
        <div class="payment-options">
            <h2>Payment Options</h2>
            <form action="orderAction.jsp">
            
            <div class="payment-method" id="cod-method">
                <div class="payment-method-header">
                    <input type="radio" name="payment" id="cod" value="cod" name="pay">
                    <div class="payment-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="2" y="6" width="20" height="12" rx="2"></rect>
                            <circle cx="12" cy="12" r="2"></circle>
                            <path d="M6 12h.01M18 12h.01"></path>
                        </svg>
                    </div>
                    <div>
                        <h3>Cash on Delivery</h3>
                        <p>Pay when your order is delivered</p>
                    </div>
                </div>
                <div class="payment-detail" id="cod-details">
                    <div class="cod-info">
                        <p>By selecting Cash on Delivery:</p>
                        <ul>
                            <li>You'll pay the delivery person when your order arrives</li>
                            <li>Please keep the exact amount ready to avoid delays</li>
                            <li>Cash, UPI, and card payments are accepted on delivery</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            
            <div class="payment-method" id="upi-method">
                <div class="payment-method-header">
                    <input type="radio" name="payment" id="upi" value="upi" name="pay">
                    <div class="payment-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="5" width="18" height="14" rx="2"></rect>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                    </div>
                    <div>
                        <h3>UPI Payment</h3>
                        <p>Pay instantly via UPI</p>
                    </div>
                </div>
                
                <div class="payment-detail" id="upi-details">
                    <div class="upi-form">
                        <div class="form-group">
                            <label for="upi-id">Enter UPI ID</label>
                            <input type="text" id="upi-id" placeholder="username@bank" required>
                        </div>
                        </form>
                        
                        <p>Or pay using UPI apps:</p>
                        <div class="upi-icons">
                            <div class="upi-app" data-app="gpay">
                                <img src="./img/icons8-google-pay-48.png" alt="Google Pay">
                                <span>Google Pay</span>
                            </div>
                            <div class="upi-app" data-app="phonepe">
                                <img src="./img/icons8-phone-pe-48.png" alt="PhonePe">
                                <span>PhonePe</span>
                            </div>
                            <div class="upi-app" data-app="paytm">
                                <img src="./img/icons8-paytm-48.png" alt="Paytm">
                                <span>Paytm</span>
                            </div>
                            <div class="upi-app" data-app="bhim">
                                <img src="./img/icons8-bhim-48.png" alt="BHIM">
                                <span>BHIM</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="button-container">
          
                <a href="order.jsp?id=<%=rs.getString("pid")%>">
                <button class="btn btn-primary" id="place-order" type="submit">Place Order</button>
                </a>
                     
            </div>
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