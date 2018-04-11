<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Message</title>
<style type="text/css">
a:link, a:visited {
	background-color: #f44336;
	color: white;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

body {
	background: url("images/212.jpg");
	background-size: 100%;
	color: white;
	margin-top: 100px;
}
</style>
</head>
<body>
<div align="right">
		<a href="main">Home</a>&nbsp;&nbsp;&nbsp;<br/><br/>
		<a href="viewcategory">Categories</a>&nbsp;&nbsp;&nbsp;
</div>
<h2 align="center">${msg}</h2>
</body>
</html>