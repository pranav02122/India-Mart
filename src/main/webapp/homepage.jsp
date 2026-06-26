<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.sql.rowset.JdbcRowSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
HttpSession hs = request.getSession(false);
%>
<%
PrintWriter ot = response.getWriter();
%>
<%
if(hs != null) {
%>
<%
String emailId = (String) hs.getAttribute("emid");
%>
<%
String password = (String) hs.getAttribute("passw");
%>
<%
try {
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
%>
<%
RowSetFactory rf = RowSetProvider.newFactory();
%>
<%
JdbcRowSet jrs = rf.createJdbcRowSet();
%>
<%
jrs.setUrl("jdbc:mysql://localhost:3306/india_mart");
%>
<%
jrs.setUsername("root");
%>
<%
jrs.setPassword("jarvis");
%>
<%
jrs.setCommand("select * from register where email = ?");
%>
<%
jrs.setString(1, emailId);
%>
<%
jrs.execute();
%>
<%
while(jrs.next()) {
%>
<% String username =(jrs.getString("firstname"));
	
%>
   <%if (username == "null")
   {
	   username = "User";
   }
	   %> 
	   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>India Mart</title>
  
  <link rel="stylesheet" type="text/css" href="homepage.css">
</head>


 <div class="main">

    <div class="head">
    <form action="searchresult.jsp" method="get" class="search-form">
    <div class="search-bar"> 
<input type="text" class="bar"  name="query" placeholder="Search any product"  >

<button  class="btns" type="submit"  >
    <img src="./img/Search.png" class="si" alt="" type="submit">
</button>
</form>
    </div>


<div class ="logo">
    <img class="logo img" src=".\img\Screenshot 2024-08-20 211327 (3).png" alt="" width="3px">
</div>
    <div class="nav-items">
    


        <div class="cart">
            <a href="cartshow.jsp"> <img alt="" src=".\img\Shopping cart (1).png" class="imgcart">
                <h3 class="cart">Cart</h3>
            </a>
        </div>

    <div class="user">
    
    <a href="account.jsp">
    <img alt="" src=".\img\user-circle (1).png" class="imguser">
    <h3 class="user"><% out.print(username);%></h3>
</a>
</div>
              
    
    <div class="menu">
    
    
        <div class="menu-btn"><img alt="" src=".\img\menu-line.png" class="imgmenu"></div>
        <ul class="menu-list">
            
             <li> <a href="account.jsp">Account</a></li>
        <li> <a href="Address.jsp">Add Address</a></li>
        <li> <a href="vieworder.jsp">Orders</a></li>
        <li> <a href="support.html">Support</a></li>
        <li><a href='logout.jsp'>Logout</a></li>
        </ul>
<script type="text/javascript" src="menu.js"></script>
</div>
            
            
    </div>
</nav>

</div>


    </div>

<body>
  <div class="bmain">

<div class="finder">

    <div class="items">

        
        <a href="toys.jsp">
        <div class="toys">
            <img src="./images/toys.webp" alt="">
            <h2 class="h2s">Beauty, Toys & more</h2>
            </div></a>

		<a href="homeproduct.jsp">
        <div class="home">
            <img src="./images/8582.webp" alt="">
            <h2 class="h2s">Home & Lifestyle</h2>
            </div></a>
			
		<a href="grocery.jsp">	
        <div class="gro">
        <img src="./images/biscuits-drinks-packaged-foods-20240620.webp" alt="">
        <h2 class="h2s">Grocery</h2>
        </div></a>
    	
    	<a href="electronics.jsp">
        <div class="electronics">
            <img src="./images/4.webp" alt="">
            <h2 class="h2s">Electronics</h2>
        </div></a>
        
        <a href="stationery.jsp">
        <div class="stationery">
            <img src="./images/stationery.webp" alt="">
            <h2 class="h2s">Stationery</h2>
        </div>
    </a>
        <a href="mobiles.jsp">
        <div class="mobiles">
            <img src="./images/mobiles.webp" alt="">
            <h2 class="h2s">Mobiles</h2>
            </div></a>
    
    <a href="fashion.jsp">
        <div class="fashion">
            <img src="./images/3.webp" alt="">
            <h2 class="h2s">Fashion</h2>
        </div>
    </a>
    </div>
    </div>
    
    </div>
    


<div class="fimg">
<div class="slideshow-container">
    <div class="mySlides">
        <img src="./images/b76bba648130afc4.webp" alt="Image 1">
    </div>
    <div class="mySlides">
        <img src="./images/ab9ccf8a8ad6a05f.webp" alt="Image 2">
    </div>
    <div class="mySlides">
        <img src="./images/e7554fcdb3042316.webp" alt="Image 3">
    </div>
    <div class="mySlides">
        <img src="./martimg/front4.jpg" alt="Image 4">
    </div>
    <div class="mySlides">
        <img src="./martimg/front5.webp" alt="Image 5">
    </div>
    
    <div class="mySlides">
        <img src="./martimg/front6.webp" alt="Image 5">
    </div>

    <div class="mySlides">
        <img src="./martimg/front3.webp" alt="Image 5">
    </div>
    <div class="mySlides">
        <img src="./martimg/front2.webp" alt="Image 5">
    </div>
</div>
</div>

    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

    <div class="dot-container">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
        <span class="dot" onclick="currentSlide(5)"></span>
        <span class="dot" onclick="currentSlide(6)"></span>
        <span class="dot" onclick="currentSlide(7)"></span>
        <span class="dot" onclick="currentSlide(8)"></span>
    </div>

<script src="imgslide.js"></script>


<div class="bestelc">
    <h2>Best of Electronics</h2>
</div>
<div class="h1con">
    <a href="electronics.jsp">
    <div class="h1-1">
<img src="./images/boultz40.webp" alt="">
<br>
<p>Best Truewireless..</p> 
<h3>Grab now</h3> 
    </div>
    </a>
    <a href="electronics.jsp" class="nodeco">
    <div class="h1-1">
        <img src="./images/monitorzeb.webp" alt="">
        <br>
        <p>Gaming Monitor</p> 
        <h3>From ₹7999</h3> 
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/boAt Lunar Orb.jpg" alt="">
        <br>
        <p>Smartwatches</p> 
        <h3>From ₹1099</h3>    
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/bolt powerbank.jpg" alt="">
        <br>
        <p>powerbank..</p> 
        <h3>80% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/camera2.webp" alt="" >
        <br>
        <p>Top Camera</p> 
        <h3>Shop now</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/wifi cctv.webp" alt="">
        <br>
        <p>Wifi CCTV</p> 
        <h3>30% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    
    <div class="h1-1">
        <img src="./images/wires.jpg" alt="">
        <br>
        <p>Best Deal</p> 
        <h3>80% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/projector1.webp" alt="">
        <br>
        <p>Projectors..</p> 
        <h3>40% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/drone.webp" alt="">
        <br>
        <p>Drones</p> 
        <h3>Special Offer</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./allproducts/headpone.jpg" alt="">
        <br>
        <p>jbl</p> 
        <h3>50% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./allproducts/bud01.jpg" alt="">
        <br>
        <p>boAt Airdopes </p> 
        <h3>80% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/onepluse band1.webp" alt="">
        <br>
        <p>Neackbands</p> 
        <h3>40% off</h3>   
    </div>
    </a>

    <div class="s-phones">
        
        <div class="titles">
                <h2>Top Deals of the Week</h2>
            </div>
            <a href="mobiles.jsp">
        <div class="posters">
    <div class="redmi">
        <img src="./images/redmi poster.jpg" alt="" width="600px">
    </div></a>
    
    <a href="mobiles.jsp">
    <div class="redmi">
        <img src="./images/moto poster.jpg" alt="" width="600px">
    </div></a>

<a href="mobiles.jsp">
    <div class="redmi">
        <img src="./images/samsung poster.jpg" alt="" width="600px">
    </div></a>

	<a href="mobiles.jsp">
    <div class="redmi">
        <img src="./images/onepluse poster.jpg" alt="" width="600px">
        </div></a>
        
        <div class="sugest">
        <a href="mobiles.jsp">
        <div class="h1-1">
            <img src="./images/iqoo z9.webp" alt="">
            <br>
            <p>iQOO</p> 
            <h3>From ₹24,999</h3> 
        </div>
        </a>
        <a href="mobiles.jsp">
        <div class="h1-1">
            <img src="./images/xiaomi 14.webp" alt="">
            <br>
            <p>MI brands</p> 
            <h3>From ₹1099</h3>    
        </div>
        </a>
        <a href="mobiles.jsp">
        <div class="h1-1">
            <img src="./images/redmi13c.webp" alt="">
            <br>
            <p>Redmi</p> 
            <h3>80% off</h3>   
        </div>
        </a>
        <a href="mobiles.jsp">
        <div class="h1-1">
            <img src="./images/iphone13.webp" alt="" >
            <br>
            <p>iphones</p> 
            <h3>Shop now</h3>   
        </div>
        </a>
        <a href="mobiles.jsp">
        <div class="h1-1">
            <img src="./images/realme12x.webp" alt="">
            <br>
            <p>Realme</p> 
            <h3>30% off</h3>   
        </div>
        </a>
</div>
</div>
    </div>
<div class="sugest">
    <div class="buds">
        
    <div class="budstitle">
        <h2>Recommended items</h2>
    </div>
    <a href="electronics.jsp">
        <div class="b1">
            <img src="./images/boult audio z40.webp" alt="">
        </div>
        </a>
        <a href="electronics.jsp">
        <div class="b1">
<img src="./images/boult audio ufo.webp" alt="">
        </div>
        </a>
        <!-- <div class="b1">
<img src="/images/noise buds.jpg" alt="">
        </div> -->
        <a href="electronics.jsp">
        <div class="b1">
<img src="./images/boult mustang.webp" alt="">
        </div>
        </a>
    </div>

    <div class="fash">
        
    <div class="fashiontitle">
        <h2>Men's Fashion on 50% off</h2>
    </div>
    <a href="fashion.jsp">
        <div class="f1">
            <img src="./images/free-size-ln1992rozti053-rozti-original-imah3hephqkgmycy.webp" alt="">
        </div>
        </a>
        <a href="fashion.jsp">
        <div class="f1">
<img src="./images/men cargo.webp" alt="">
        </div>
        </a>
        <a href="fashion.jsp">
        <div class="f1">
<img src="./images/casual shirts 2.jpg" alt="">
        </div>
        </a>
        <a href="fashion.jsp">
        <div class="f1">
<img src="./images/casual shirts 3.jpg "alt="">
        </div>
        </a>
    </div>
</div>

<div class="bags">
<a href="homeproduct.jsp">
<div class="bag1" class="carts">
    <img src="./images/Travel_luggage._CB568250814_.jpg" alt="" width="400px">
</div>
</a>

<a href="homeproduct.jsp">
<div class="bag1" class="carts">
    <img src="./images/Wallets._CB568250814_.jpg" alt="" width="400px">
</div>
</a>
<a href="homeproduct.jsp">
<div class="bag1"class="carts">
    <img src="./images/Bags__Backpacks.jpg" alt="" width="400px">
</div>
</a>

</div>

<div class="poster2" class="carts">
    <div class="img">
        <img src="./images/pc img.jpg" alt="">
    </div>
    <div class="img" class="carts">
        <img src="./images/pcbagimg.jpg" alt="">
    </div>
    <div class="img" class="carts">
        <img src="./images/warrenty car.jpg" alt="">
    </div>
    <div class="img" class="carts">
        <img src="./images/keybord.jpg" alt="">

    </div>
</div>

<div class="sugest">
<a href="homeproduct.jsp">
    <div class="h1-1">
        <img src="./images/laptop bag.jpg" alt="">
        <br>
        <p>Laptop Bag</p> 
        <h3>From ₹2000</h3> 
    </div>
    </a>
    <a href="toys.jsp">
    <div class="h1-1">
        <img src="./images/rccar.webp" alt="">
        <br>
        <p>RC cars</p> 
        <h3>From ₹999</h3>    
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/razer naga mouse.jpg" alt="">
        <br>
        <p>Mouse</p> 
        <h3>80% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/boat bass headpone.jpg" alt="" >
        <br>
        <p>Best Earphones</p> 
        <h3>Shop now</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./images/pendirve hp.jpg" alt="">
        <br>
        <p>Pendrive</p> 
        <h3>30% off</h3>   
    </div>
    </a>
    <a href="electronics.jsp">
    <div class="h1-1">
        <img src="./martimg/tv/kodak-80-cm-32-inch-hd-ready-led-smart-tv-7xpro-series-32hdx7xpro-quad-core-processor-built-in-chromecast-digital-o492166141-p590442119-0-202209200444.jpeg" alt="">
        <br>
        <p>Smart Tv</p> 
        <h3>30% off</h3>   
    </div>
    </a>
    </div>
<br><%
}
%>
<%
} catch(Exception e) {
%>
<%
System.out.println(e);
%>
<%
}
%>
<%
}
%>

</body>

<div style="font-family: Arial, sans-serif; max-width: 1200px; margin: 0 auto; padding: 20px; color: #212121;">
  <!-- Home & Furniture Section -->
  <div style="margin-bottom: 30px;">
    <h3 style="font-size: 20px; margin-bottom: 15px;">Home & Furniture</h3>
    <p style="color: #666; line-height: 1.6; font-size: 14px;">
      Find everything you need to make your house a home with our extensive collection of furniture and home décor. Choose from a wide range of furniture, home décor, and furnishing products from top brands like @home, Nilkamal, Urban Living, HomeStyle, and Perfect Homes.
    </p>
    <p style="color: #666; line-height: 1.6; font-size: 14px;">
      You may have your furniture all set up, but they could end up looking flat and incomplete without complementary decor. Curtains, cushion covers, bed sheets, wall shelves, paintings, floor lamps - find everything that turns a house to an inviting home under one roof at India Mart.
    </p>
  </div>

  <!-- Baby and Kids Section -->
  <div style="margin-bottom: 30px;">
    <h3 style="font-size: 20px; margin-bottom: 15px;">Baby and Kids</h3>
    <p style="color: #666; line-height: 1.6; font-size: 14px;">
      Your kids deserve only the best. From bodysuits, booties, diapers to strollers, if you're an expecting mother or a new mother, you will find everything you need to set sail on a smooth parenting journey with the help of our baby care collection. When it comes to safety, hygiene and comfort, you can rely on us without a second thought. Huggies, Pampers, BabyLove, and Johnson & Johnson: we host only the most-trusted names in the business for your baby.
    </p>
  </div>

  <!-- Books, Sports and Games Section -->
  <div style="margin-bottom: 30px;">
    <h3 style="font-size: 20px; margin-bottom: 15px;">Books, Sports and Games</h3>
    <p style="color: #666; line-height: 1.6; font-size: 14px;">
      Work hard and no play? We don't believe in that. Get access to best-selling fiction and non-fiction books by your favourite authors, thrilling English and Indian blockbusters, most-wanted gaming consoles, and a tempting range of fitness and sports gadgets and equipment bound to inspire you to get moving.
    </p>
  </div>

  <!-- Grocery/Supermart Section -->
  <div style="margin-bottom: 30px;">
    <h3 style="font-size: 20px; margin-bottom: 15px;">Grocery/Supermart</h3>
    <p style="color: #666; line-height: 1.6; font-size: 14px;">
      Launching into the grocery vertical, India Mart introduces Supermart that is out to bring everyday essentials close to you. From pulses, spices, dairy, personal and sanitary care, breakfast essentials, health drinks, spreads, ready to cook, grooming to cleaning agents, we are happy to present everything you need to run a house. Now buy Grocery products for as low as 1 Rupee only - our 1 Rupee Store presents new products every day for a nominal price of 1 Rupee only. Terms and conditions apply.
    </p>
  </div>

  <!-- Electronics Section -->
  <div style="margin-bottom: 30px;">
    <h3 style="font-size: 20px; margin-bottom: 15px;">Electronics & Appliances</h3>
    <p style="color: #666; line-height: 1.6; font-size: 14px;">
      Discover the latest in technology with India Mart's extensive range of electronics and appliances. From smartphones, laptops, and tablets to televisions, air conditioners, and refrigerators, we offer products from leading brands like Samsung, Apple, LG, Sony, and Bosch. Our selection includes the newest models with cutting-edge features to enhance your digital lifestyle. Take advantage of our exclusive deals, exchange offers, and warranty extensions to make your tech purchases even more valuable.
    </p>
  </div>

  <!-- Fashion Section -->
  <div style="margin-bottom: 30px;">
    <h3 style="font-size: 20px; margin-bottom: 15px;">Fashion</h3>
    <p style="color: #666; line-height: 1.6; font-size: 14px;">
      Stay on trend with India Mart's fashion collection featuring the latest styles for men, women, and children. Browse through our curated selection of clothing, footwear, accessories, and beauty products from top brands like Levi's, Nike, Adidas, H&M, and many more. Whether you're looking for everyday essentials, workwear, or statement pieces for special occasions, we've got you covered. Our seasonal sales and fashion events bring you the best designs at unbeatable prices, letting you refresh your wardrobe without breaking the bank.
    </p>
  </div>


<footer style="background-color: #172337; color: #fff; font-family: Arial, sans-serif; padding: 20px 0;     width: 133%;
  margin: 0px -164px;
  height: 76vh;">
    <div style="max-width: 1200px; margin: 0 auto; display: flex; flex-wrap: wrap; justify-content: space-between; padding: 0 20px;">
      <!-- Column 1 -->
      <div style="width: 200px; margin-bottom: 20px;">
        <h4 style="color: #878787; font-size: 14px; margin-bottom: 15px;">ABOUT</h4>
        <ul style="list-style: none; padding: 0; margin: 0;">
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Contact Us</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">About Us</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Careers</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">India Mart Stories</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Press</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Corporate Information</a></li>
        </ul>
      </div>
      
      <!-- Column 2 -->
      <div style="width: 200px; margin-bottom: 20px;">
        <h4 style="color: #878787; font-size: 14px; margin-bottom: 15px;">GROUP COMPANIES</h4>
        <ul style="list-style: none; padding: 0; margin: 0;">
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">TradeMart</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">SupplyTrip</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">IndiaBuy</a></li>
        </ul>
      </div>
      
      <!-- Column 3 -->
      <div style="width: 200px; margin-bottom: 20px;">
        <h4 style="color: #878787; font-size: 14px; margin-bottom: 15px;">HELP</h4>
        <ul style="list-style: none; padding: 0; margin: 0;">
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Payments</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Shipping</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Cancellation & Returns</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">FAQ</a></li>
        </ul>
      </div>
      
      <!-- Column 4 -->
      <div style="width: 200px; margin-bottom: 20px;">
        <h4 style="color: #878787; font-size: 14px; margin-bottom: 15px;">CONSUMER POLICY</h4>
        <ul style="list-style: none; padding: 0; margin: 0;">
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Cancellation & Returns</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Terms Of Use</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Security</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Privacy</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Sitemap</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">Grievance Redressal</a></li>
          <li style="margin-bottom: 10px;"><a href="#" style="color: #fff; text-decoration: none; font-size: 12px;">EPR Compliance</a></li>
        </ul>
      </div>
      
      <!-- Column 5 -->
      <div style="width: 250px; margin-bottom: 20px;">
        <h4 style="color: #878787; font-size: 14px; margin-bottom: 15px;">Mail Us:</h4>
        <p style="font-size: 12px; line-height: 1.5; margin: 0;">
          India Mart Internet Private Limited,<br>
          Buildings Tech Village,<br>
          Outer Ring Road,<br>
          Islampur, 415409,<br>
          Maharastra, India
        </p>
        
        <h4 style="color: #878787; font-size: 14px; margin: 20px 0 15px;">Social:</h4>
        <div style="display: flex; gap: 15px;">
          <a href="#" style="color: #fff;"><i class="fab fa-facebook-f"></i></a>
          <a href="#" style="color: #fff;"><i class="fab fa-twitter"></i></a>
          <a href="#" style="color: #fff;"><i class="fab fa-youtube"></i></a>
          <a href="#" style="color: #fff;"><i class="fab fa-instagram"></i></a>
        </div>
      </div>
      
      <!-- Column 6 -->
      <div style="width: 250px; margin-bottom: 20px;">
        <h4 style="color: #878787; font-size: 14px; margin-bottom: 15px;">Registered Office Address:</h4>
        <p style="font-size: 12px; line-height: 1.5; margin: 0;">
            India Mart Internet Private Limited,<br>
            Buildings Tech Village,<br>
            Outer Ring Road,<br>
            Islampur, 415409,<br>
            Maharastra, India        
            
            Telephone: <a href="tel:094-45614700" style="color: #2874f0; text-decoration: none;">044-45614700</a> / <a href="tel:044-67415800" style="color: #2874f0; text-decoration: none;">044-67415800</a>
        </p>


      </div>
    </div>
    
    <!-- Bottom Bar -->
    <div style="max-width: 1200px; margin: 20px auto 0; padding: 20px; border-top: 1px solid #454d5e; display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center;">
      <div style="display: flex; flex-wrap: wrap; gap: 20px; margin-bottom: 10px;">
        <a href="#" style="color: #fff; text-decoration: none; font-size: 14px; display: flex; align-items: center; gap: 5px;">
          <span style="color: #ffc200;">⭐</span> Become a Seller
        </a>
        <a href="#" style="color: #fff; text-decoration: none; font-size: 14px; display: flex; align-items: center; gap: 5px;">
          <span style="color: #ffc200;">🎯</span> Advertise
        </a>
        <a href="#" style="color: #fff; text-decoration: none; font-size: 14px; display: flex; align-items: center; gap: 5px;">
          <span style="color: #ffc200;">🎁</span> Gift Cards
        </a>
        <a href="#" style="color: #fff; text-decoration: none; font-size: 14px; display: flex; align-items: center; gap: 5px;">
          <span style="color: #ffc200;">❓</span> Help Center
        </a>
      </div>
      
      <div style="margin-bottom: 10px;">
        <span style="font-size: 14px;">© 2007-2025 IndiaMart.com</span>
      </div>
      
    </div>
  </footer>
  

</html>






    