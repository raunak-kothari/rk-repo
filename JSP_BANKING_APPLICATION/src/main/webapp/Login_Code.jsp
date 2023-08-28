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

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "defdb", "defdb");
		PreparedStatement ps = con
		.prepareStatement("select status from banking_cust_details where acc_no = ? and password = ? ");

		ps.setLong(1, acc_no);
		ps.setString(2, pwd);
		String status = "";
		ResultSet rs = ps.executeQuery();

		//if credentials is valid , getting the status

		if (rs.next()) {
			status = rs.getString("status");

			//checking account active or not

			if (status.equals("active")) {

		response.sendRedirect("Home_Page.jsp");
			} else {
		out.print("<h1>" + "**** Sorry , Your Account Is Inactive ****" + "</h1>");
			}
		} else {
			out.print("<h1>" + "**** Enter Valid Account Details ****" + "</h1>");
		}

		con.close();
	} catch (Exception e) {
		out.print(e);
	}
	%>


</body>
</html>