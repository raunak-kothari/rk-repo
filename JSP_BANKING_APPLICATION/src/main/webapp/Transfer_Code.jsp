<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Money Transfer</title>
</head>
<body>

	<%
	Long sender_acc_no = Long.parseLong(request.getParameter("sender_acc_no"));
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	Long target_acc_no = Long.parseLong(request.getParameter("target_acc_no"));
	Double trf_amt = Double.parseDouble(request.getParameter("amt"));

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "defdb", "defdb");

		PreparedStatement ps_sender = con.prepareStatement("select * from banking_cust_details where acc_no = ?");
		PreparedStatement ps_target = con.prepareStatement("select * from banking_cust_details where acc_no = ?");

		ps_sender.setLong(1, sender_acc_no);
		ps_target.setLong(1, target_acc_no);

		ResultSet rs_sender = ps_sender.executeQuery();
		ResultSet rs_target = ps_target.executeQuery();

		String status_sender = "";
		String status_targer = "";
		Double sender_old_bal = 0.0;
		Double sender_new_bal = 0.0;
		Double target_old_bal = 0.0;
		Double target_new_bal = 0.0;

		//if credentials is valid , getting the status

		if (rs_sender.next() && rs_target.next()) {
			status_sender = rs_sender.getString("status");
			status_targer = rs_target.getString("status");
			//checking account active or not

			if (status_sender.equals("active") && status_targer.equals("active")) {

		if (sender_acc_no != target_acc_no) {
			//checking sender acc & target acc no are not same, performing further operations	

			if (rs_sender.getDouble("balance") >= trf_amt) {
				//if active , performing further operations	

				sender_old_bal = rs_sender.getDouble("balance");
				target_old_bal = rs_target.getDouble("balance");

				sender_new_bal = sender_old_bal - trf_amt;
				target_new_bal = target_old_bal + trf_amt;

				PreparedStatement ps2_sender = con
						.prepareStatement("Update banking_cust_details set balance = ? where acc_no = ? ");
				PreparedStatement ps2_target = con
						.prepareStatement("Update banking_cust_details set balance = ? where acc_no = ? ");

				ps2_sender.setDouble(1, sender_new_bal);
				ps2_sender.setLong(2, sender_acc_no);

				ps2_target.setDouble(1, target_new_bal);
				ps2_target.setLong(2, target_acc_no);

				int t = ps2_sender.executeUpdate();
				int s = ps2_target.executeUpdate();

				if (s == 1 && t == 1) {

					out.print("<h1>" + "Before Transfer Sender Account Balance : " + sender_old_bal + "</h1>");
					out.print("<h1>" + "Before Transfer Target Account Balance : " + target_old_bal + "</h1>");
					out.print("<h1>" + "Transfer Amount : " + trf_amt + "</h1>");
					out.print("<h1>" + "After Transfer Sender Account Balance : " + sender_new_bal + "</h1>");
					out.print("<h1>" + "After Transfer Target Account Balance : " + target_new_bal + "</h1>");

				}

				else {
					out.print("<h1>" + "Error Occured !!! Balance Not Updated ***" + "</h1>");
				}

			}

			else {
				out.print("<h1>" + " *** Insufficient Balance In Sender Account ***" + "</h1>");

			}
		}

		else {
			out.print("<h1>" + "**** Cannot Transfer To Same Account ****" + "</h1>");
		}
			}

			else if (status_sender.equals("inactive")) {
		out.print("<h1>" + "**** Sorry , Sender Account Number -"+ sender_acc_no +"Is Inactive ****" + "</h1>");
			}

			//if not active , displaying message to user
			else {
		out.print("<h1>" + "**** Sorry , Target Account Number - "+ target_acc_no +" Is Inactive ****" + "</h1>");
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