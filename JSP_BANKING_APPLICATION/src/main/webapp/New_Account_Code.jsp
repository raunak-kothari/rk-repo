<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

	<%
	Long acc_no = Long.parseLong(request.getParameter("acc_no"));
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String c_pwd = request.getParameter("confirm_pwd");
	String address = request.getParameter("address");
	Double balance = Double.parseDouble(request.getParameter("bal"));
	Long mob_no = Long.parseLong(request.getParameter("mob_no"));


	try {
		if(pwd.equals(c_pwd)) {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "defdb", "defdb");
			PreparedStatement ps = con.prepareStatement("insert into banking_cust_details values (?,?,?,?,?,?,'active')");
			ps.setLong(1, acc_no);
			ps.setString(2, name);
			ps.setString(3, pwd);
			ps.setString(4,address );
			ps.setDouble(5, balance);
			ps.setLong(6, mob_no);

			int i = ps.executeUpdate();

			if (i == 1) {
		out.println("<h1>" + " ***** Account Created Sucessfully ***** " + "</h1>");
			}

			else {
		out.println("Please enter valid data!!!");
			}

			con.close();

		} else {
			out.print("<h1>" + "Password and Confirm Password Must Be Same" + "</h1>");

		}

	} catch (Exception e) {
		out.print(e);
	}
	%>
	
		
<h3><a href="Login.jsp"> Login Page </a></h3>
	
	

</body>
</html>