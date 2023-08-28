<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance Deposit</title>
<link rel="stylesheet" href="Banking_Project.css">
<style>
body {
	background-image: url("deposit.jpg");
	height: 50%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
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
	<div align="center">
		<img alt="error 404" src="sdfc_logo.png">
		<h1>SDFC BANK</h1>
		<h2>EXTRAORDINARY SERVICES</h2>
	</div>

	<div align="center" class="head">
		<table cellspacing="20px" cellpadding="10px" class="t1">
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
		<form action="Deposit_Balance_Code.jsp">
			<table cellspacing="15px" align="center">
				<tr>
					<th><br></th>
				</tr>
				<tr>
					<th class="sub_head">BALANCE DEPOSIT FORM</th>
				</tr>
				<tr>
					<th><br></th>
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
					<td><input type="text" name="bal"
						placeholder="Enter Amount To Deposit" class="input-box"></td>
				</tr>

				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td><input type="submit" class="submit"> &nbsp; &nbsp;
						<input type="reset" class="reset"></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>