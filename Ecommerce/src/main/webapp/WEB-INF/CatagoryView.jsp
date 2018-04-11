<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>


<html>
<div align="right"><a href="main">Home</a></div>
		
<style>

body {


	background: url("images/212.jpg");
	background-size: cover;
}

#home{
	color: white;
	text-decoration: none;
}

a:link, a:visited {
	text-decoration: none;
	background-color: #f44336;
    color: white;
    padding: 14px 25px;
    text-align: center; 
    text-decoration: none;
    display: inline-block;
    margin-top: 75px;
    
}

h1 {
	font-size: 40px;
}

td {
	padding: 10px;
}

</style>
<title>Order Success</title>

<body>
	<section>
		<div align="center">
			<form action="viewproductbycategory">
				<h1 id="home">Choose the Category</h1>			 
				<c:forEach items="${clist}" var="d">
						<a href="viewproductbycategory?cartid=${d.categoryId}">
								${fn:toUpperCase(d.categoryName)}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
			</form>
		</div>
	</section>
	<br />
</body>
</html>