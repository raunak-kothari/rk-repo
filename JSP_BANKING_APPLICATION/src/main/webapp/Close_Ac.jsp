<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Close Account</title>
<link rel="stylesheet" href="Banking_Project.css">
<style>
body {
	background-image: url("close.jpg");
	height: 50%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	text-align: center;
	align-content: center;
	align-items: center;
}

h1, h2 {
	background-color: black;
	color: white;
	width: 15%;
	padding: 5px;
	margin: 10px;
	border-radius: 20px;
}

h2 {
	width: 25%;
}
</style>
</head>
<body>
	<div  align="center">
		<img alt="error 404" src="sdfc_logo.png">
		<h1 align="center">SDFC BANK</h1>
		<h2 align="center">EXTRAORDINARY SERVICES</h2>
	</div>

	<div align="center" class="head">
		<table cellspacing="20px" cellpadding="10px" class="t1" align="center">

			<tr>
				<th><a href="Home_Page.jsp"> Home Page </a></th>
				<th><a href="Balance.jsp"> Balance </a></th>
				<th><a href="Deposit.jsp"> Deposit </a></th>
				<th><a href="Withdraw.jsp"> Withdraw </a></th>
				<th><a href="Transfer.jsp"> Transfer </a></th>
				<th><a href="Close_Ac.jsp"> Close A/C </a></th>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<div class="body">
		<form action="Close_Code.jsp">
			<table cellspacing="15px" align="center">
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<th class="sub_head">ACCOUNT CLOSURE FORM</th>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td><input type="text" name="acc_no"
						placeholder="Enter Account Number" class="input-box"></td>
				</tr>

				<tr>
					<td><input type="text" name="name"
						placeholder="Enter Your Full Name" class="input-box"></td>
				</tr>

				<tr>
					<td><input type="password" name="pwd"
						placeholder="Enter Password" class="input-box"></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td><input type="submit" class="del" value="Delete">
						&nbsp;&nbsp; &nbsp; <input type="reset" class="reset"></td>

				</tr>
				<tr>
					<td><br></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>