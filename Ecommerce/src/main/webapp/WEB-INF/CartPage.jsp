<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<div align="right"><a id="anchor" href="main">Home</a>&nbsp;&nbsp;&nbsp;<a id="anchor" href="viewcategory">Categories</a></div>
<h1 align="center">HEXAKART</h1>
<style>
h1{
color: white;
}
body {
	background: url("images/212.jpg");
	background-size: cover;
	color: black;
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

a:link, a:visited {
	background-color: #f44336;
	color: white;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

h2{

	color: white;
}

#footer{
	margin-top: 150px;
}

#table2 {
    border-collapse: collapse;
}
</style>


<body>
	<section>
		<h2 align="center">Products in Cart</h2>
		<div align="center">

			<table id="table2" border="1">
				<tr>
					<td>Product Name</td>
					<td>Product Price</td>
					<td>Category Name</td>
				</tr>
				<c:forEach items="${sessionScope.cartlist}" var="d">

					<tr>
						<td>${d.productName}</td>

						<td>${d.productPrice }</td>

						<td>${d.cat.categoryName}</td>
					</tr>

				</c:forEach>
			</table>
			<br /> <br /> <a href="viewcategory">Continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<a href="cartBuy">Buy</a>
		</div>
	</section>
</body>
</html>