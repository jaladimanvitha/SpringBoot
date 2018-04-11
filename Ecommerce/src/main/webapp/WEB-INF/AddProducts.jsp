<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<div align="right"><a id="anchor" href="main">Home</a>&nbsp;&nbsp;&nbsp;<a id="anchor" href="viewcategory">Categories</a></div>
<h1 align="center">HEXAKART</h1>
<head>
<style type="text/css">
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
body {
	background: red url("images/212.jpg");
	background-size: cover;
	align-content: center;
}

a:link, a:visited {
    background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
input[type=submit] {
    padding:14px 25px; 
    background: #f44336; 
    border:0 none;
    text-align: center;
    color: white;
 	display: inline-block;    
}

table {
	margin: 0 auto;
	border-collapse: collapse;
}

th,td {
	padding: 10px;
}

h2{
	color: white;
}

</style>
</head>
<body>
<section>
	<div align="center">
		<h2>Add Products</h2>
		<form:form action="addProduct" method="post" modelAttribute="ebean"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>Product ID</td>
					<td><form:input path="productId" /></td>
					<td><form:errors path="productId" cssStyle="color:red"
							element="div" /></td>
				</tr>
				<tr>
					<td>Product Name</td>
					<td><form:input path="productName" /></td>
					<td><form:errors path="productName" cssStyle="color:red"
							element="div" /></td>
				</tr>
				<tr>
					<td>Product Price</td>
					<td><form:input path="productPrice" /></td>
					<td><form:errors path="productPrice" cssStyle="color:red"
							element="div" /></td>

				</tr>
				<tr>
					<td>Product Stock</td>
					<td><form:input path="productStock" /></td>
					<td><form:errors path="productStock" cssStyle="color:red"
							element="div" /></td>
				</tr>


				<tr>
					<td>Choose category</td>
					<td><form:select items="${catmap}" cssStyle="color:red"
							path="cat.categoryId" /></td>
				</tr>

				<tr>
					<td>Choose image to upload</td>
					<td><input type="file" name="fname" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="Add Product" /></td>
				</tr>

			</table>
		</form:form>
		<h3 align="center">${promsg }</h3>
	</div>
	<div align="center">
	<a href="addspec">Add Specification</a>
	</div>
	</section>
</body>
</html>