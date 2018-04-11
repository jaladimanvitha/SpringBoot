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
h1{
color: white;
}
body {
	background: red url("images/212.jpg");
	background-size: cover;
}

a:link, a:visited {
    background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
}

th,td {
	padding: 10px;
}

input[type=submit] {
    padding:14px 25px; 
    background: #f44336; 
    border:0 none;
    text-align: center;
    color: white;
 	display: inline-block;    
}

input[type=reset] {
    padding:14px 25px; 
    background: #f44336; 
    border:0 none;
    text-align: center;
    color: white;
 	display: inline-block;    
}

#row{
	padding: 0 5px;
}
</style>
</head>

<body>

	<div align="center">
		<h1>Add Product Specification</h1>

		<form:form action="addspecification" method="post"
			modelAttribute="sbean" enctype="multipart/form-data">
			<table >
				<tr>
					<td>Specification ID</td>
					<td><form:input path="specId"  /></td>
					<td><form:errors path="specId" /></td>
				</tr>
				<tr>
					<td>Specification Name</td>
					<td><form:input path="specName"  /></td>
					<td><form:errors path="specName" /></td>
				</tr>
				<tr>
					<td>Specification Value</td>
					<td><form:input path="specValue" /></td>
					<td><form:errors path="specValue" /></td>
				</tr>
				<tr>
					<td>Product ID</td>
					<td><form:input path="prod.productId"/></td>
					<td><form:errors path="prod.productId" /></td>
				</tr>
				<tr>
					<td align="center"><input type="submit"
						value="Add"  /></td>
					<td align="center"><input type="reset"
						value="Reset"  /></td>
				</tr>
			</table>
		</form:form>
		<h3 align="center">${specmsg }</h3>
	</div>
</body>
</html>