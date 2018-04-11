<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html >

<html>

<div align="right"><a id="anchor" href="main">Home</a>&nbsp;&nbsp;&nbsp;<a id="anchor" href="viewcategory">Categories</a></div>
<h1 align="center">HEXAKART</h1>
<head>
<style>
body {
	background: red url("images/212.jpg");
	background-size: cover;
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

.gallery {
	width: 80%;
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	/* background-color: orange; */
	padding: 10px;
}

.gallery .prod {
	height: 80%;
	width: 200px;
	padding: 10px;
	background-color: #a5d9ef;
	box-shadow: 5px 5px 5px black;
	margin: 10px;
	text-decoration: none;
	color: white;
	background-webkit: 
}

.gallery .prod a {
	text-decoration: none;
	color: white;
}

h1 {
	font-size: 40px;
	color: white;
}
.gallery img{
   -webkit-transition: -webkit-transform 2s;
}
.gallery img:hover{
    -webkit-transform: scale(1.5,1.5);
}
</style>

</head>
<body>
	<section>
	<h2 align="center">${msg}</h2>
		<div class="gallery">
			<c:forEach items="${plist}" var="p">
				<div class="prod" align="center">
					<a href="productspec?proid=${p.productId}"> <img
						src="viewimg?imgname=${p.productImage}" height="75" width="75">
						<br /> <br /> Product Name ${fn:toUpperCase(p.productName)} <br />
						Product Price ${p.productPrice } <br /></a>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
