<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<div align="right"><a id="anchor" href="main">Home</a>&nbsp;&nbsp;&nbsp;<a id="anchor" href="viewcategory">Categories</a></div>
<h1 align="center">HEXAKART</h1>
<style>
h1{
	color: white;
}
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
input[type=text], select {

    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 50%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    padding: 20px;
}

h3{
	color: white;
}

label{
	color: white;
}
</style>
<body>

<div align="center">
  <form action="buy">
    <label for="fname">Name</label>	<br/>
    <input type="text" id="fname" name="firstname" placeholder="Your name.." required>
	<br/>
    <label for="lname">Mobile Number</label>	<br/>
    <input type="text" id="lname" name="lastname" placeholder="Your Mobile NUmber.." required>
	<br/>
    <label for="lname">Address</label>	<br/>
    <input type="text" id="lname" name="lastname" placeholder="Your Address.." required>
  	<br/>
    <input type="submit" value="Submit">
  </form>
</div>

</body>

</html>