<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background: url("images/121.jpg");
	background-size: cover;
}

#home {
	color: white;
}

h1 {
	font-size: 40px;
}

a:link, a:visited {
	text-decoration: none;
	background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center; 
    text-decoration: none;
    display: inline-block;
    margin-top: 150px;
    
}

a:hover, a:active {
    background-color: gray;
    margin: 0 auto;
}

</style>
<title>Welcome</title>
</head>
<body>
<div align="center">
	<a></a>
</div>
<div>
	<section id="home">
		<h1 align="center">HEXAKART</h1>
		<br />
		
		<h2 align="center">${promsg}</h2>
		<h2>${specmsg}</h2>
	<div align="center">
		<a href="viewcategory">CONTINUE SHOPPING</a> 
		<a href="addProductPage">SELL YOUR PRODUCTS</a>
	</div>
	</section>
</div>
</body>

</html>
