<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw</title>
</head>
<body>

	<%
	Long acc_no = Long.parseLong(request.getParameter("acc_no"));
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	Double wid_amt = Double.parseDouble(request.getParameter("amt"));

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "defdb", "defdb");
		PreparedStatement ps = con.prepareStatement("select * from banking_cust_details where acc_no = ?");

		ps.setLong(1, acc_no);

		ResultSet rs = ps.executeQuery();

		String status = "";
		Double old_bal = 0.0;
		Double newbal = 0.0;

		//if credentials is valid , getting the status

		if (rs.next()) {
			status = rs.getString("status");

			//checking account active or not

			if (status.equals("active")) {

		//if active , performing further operations	

		old_bal = rs.getDouble("balance");

		newbal = old_bal - wid_amt;

		PreparedStatement ps2 = con
				.prepareStatement("Update banking_cust_details set balance = ? where acc_no = ? ");

		ps2.setDouble(1, newbal);
		ps2.setLong(2, acc_no);

		int i = ps2.executeUpdate();

		if (i == 1) {

			out.print("<h1>" + "Before Withdrawal Account Balance : " + old_bal + "</h1>");
			out.print("<h1>" + " Withdraw Account : " + wid_amt + "</h1>");
			out.print("<h1>" + "After Withdrawal Account Balance : " + newbal + "</h1>");

		}

		else {
			out.print("<h1>" + "Error Occured !!! Balance Not Updated ***" + "</h1>");
		}

			}
			//if not active , displaying message to user
			else {
		out.print("<h1>" + "**** Sorry , Your Account Is Inactive ****" + "</h1>");
			}
		}
		//if credentials invalid , displaying message to user
		else {
			out.print("<h1>" + "**** Please Enter Valid Details ****" + "</h1>");
		}

		con.close();

	} catch (Exception e) {
		out.print(e);
	}
	%>


</body>
</html>