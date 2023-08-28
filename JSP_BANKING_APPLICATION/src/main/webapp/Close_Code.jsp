<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Closure</title>
</head>
<body>
<% 
	Long acc_no = Long.parseLong(request.getParameter("acc_no"));
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "defdb", "defdb");
		PreparedStatement ps = con.prepareStatement("select * from banking_cust_details where acc_no = ? and password = ?");
	
		ps.setLong(1, acc_no);
		ps.setString(2, pwd);
		
		ResultSet rs = ps.executeQuery();
		
		String status = "";
		String new_status="inactive";



		//if credentials is valid , getting the status

		if (rs.next()) {
			status = rs.getString("status");
			
			//checking account active or not

			if (status.equals("active")) {
				
		//if active , performing further operations	
		
		PreparedStatement ps2 = con.prepareStatement("Update banking_cust_details set status = ? where acc_no = ? ");
		
		

		ps2.setString(1, new_status);
		ps2.setLong(2, acc_no);
		

		int i = ps2.executeUpdate();

		if (i == 1) {

			out.print("<h1>" + "Welcome "+name +"Your Account "+acc_no+" Has Been Closed!!!"+"</h1>");
			out.print("<h2>" + " ************************"+"</h2>");
	

		}

		else {
			out.print("<h1>" + "Error Occured !!! Balance Not Updated ***" + "</h1>");
		}

			}
			//if not active , displaying message to user
			else {
		out.print("<h1>" + "****  Your Account Is Already Inactive ****" + "</h1>");
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