<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<title>BankDetails</title>
<style type="text/css">

body {
	background: red url("images/bank.jpg");
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
h1{
	align-content: center;
}
</style>

</head>
<body>
	<h1 align="center">Enter Bank Details</h1>
	<table>
		<tr>
		<td>Select a BANK:</td>
		<td>
			<select>
			<option value="SBI">SBI</option>
			<option value="IDBI">IDBI</option>
			<option value="ICICI">ICICI</option>
			<option value="HDFC">HDFC</option>
			</select> 
		</td>
		</tr>
		<tr>
			<td>Enter the Card Number:</td>
			<td><input type="text"> </td>
		</tr>
		<tr>
			<td>Expiry Date</td>
			<td><input type="date"> </td>
		</tr>
		<tr>
			<td>Enter CVV</td>
			<td><input type="text"> </td>
		</tr>
		<tr>
			<td><a href="otp"> Make Payment</a></td>
		</tr>
	</table>
</body>
</html>