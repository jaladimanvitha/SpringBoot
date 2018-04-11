<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html >
<html>
<div align="right"><a id="anchor" href="main">Home</a>&nbsp;&nbsp;&nbsp;<a id="anchor" href="viewcategory">Categories</a></div>
<h1 align="center">HEXAKART</h1>
<head>
<title>Product Specifications</title>
<style type="text/css">
body {
	background: red url("images/212.jpg");
	background-size: cover;
	color: black;	
}
h1{
color: white;
}
#anchor{
	text-decoration: none;
	background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center; 
    text-decoration: none;
    display: inline-block;
    margin-top: 75px;
}

h2 {
	font-size: 40px;
	color: white;
}

a:link, a:visited {
    background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
#pspec img{
  -webkit-transition: -webkit-transform 2s;
}

#pspec img:hover{
   -webkit-transform: rotateY(360deg);
}

table {
	margin: 0 auto;
	border-collapse: collapse;
}

td {
	padding: 10px;
}
</style>
</head>
<body>
	<div>
	<table id="pspec">
	<tr>
	<td>
		<img src="viewimg?imgname=${prod.productImage}" height="175px" width="175px">
	</td>
	<td>
		<table>
		<tr>
			<td>Product Name: </td>
			<td>${fn:toUpperCase(prod.productName)}</td>
		</tr>
		<tr>
			<td>Price: </td>
			<td>${prod.productPrice }</td>
		</tr>
		<%-- <tr>
			<td>Stock Available: </td>
			<td>${prod.productStock}</td>
		</tr> --%>
		
		<c:forEach items="${speclist}" var="s">
		<tr><td>${fn:toUpperCase(s.specName)}</td>
			<td>${s.specValue} </td>
        </tr>
		</c:forEach>
		</table>
		</td>
		</tr>
	</table>
	</div>

	<br />
	<br />
	<div align="center">
	<a href="delivery?proid=${prod.productId}"> BUY</a>
	<a href="addtocart?proid=${prod.productId}"> ADD TO CART </a></div>		
</body>
</html>