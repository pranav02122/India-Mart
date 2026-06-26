<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="signup.css">
<link rel="stylesheet" type="text/css" href="addproduct.css">


<body>


<form action="addproduct" method="post" enctype="multipart/form-data">
<div class="adpform">
<h1 class="head">ADD YOUR PRODUCT</h1>
<div class="cent">
<input type="text" name="id" class="sstyle" placeholder="Product Id">
<input type="text" name="product-nm" class="sstyle" placeholder="Product name">
</div>
<label for ="catagory" >Select Product Catagory</label>
<select name="catagory" class="myselect">
<option value="Electronics">Electronics</option>
<option value="Cloths">Cloths</option>
<option value="Beauty&toys">Beauty&toys</option>
<option value="Kitchen">Kitchen</option>
<option value="Glossary">Grocery</option>
<option value="other">Other</option>
</select>
<input type="number" name="product-price" class="sstyle" placeholder="Product Price" >
<input type="number" name="final-price" class="sstyle" placeholder="final Price" >
<input type="text" name="product-discount" class="sstyle" placeholder="Product Discount in Percentage" >


<textarea rows="6" cols="60" name="product-info" class="pinfo" placeholder="Product Information">
</textarea>
<div class="centerpr">
<label for="img">Add Product Image</label>
<input type="file" class="pstyle" id="img" name="product-img" >
<input type="submit" value="Add Product" class="loginbtn">

</div>

</form>
</div>
</body>
</html>