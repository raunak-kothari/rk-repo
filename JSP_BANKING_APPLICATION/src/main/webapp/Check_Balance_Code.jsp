<%@page import="org.apache.catalina.startup.Catalina"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance</title>
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

		//if active , performing further operations

		PreparedStatement ps2 = con.prepareStatement(
				"select acc_no , name, balance , address , mob_no from banking_cust_details where acc_no = ?");
		ps2.setLong(1, acc_no);

		ResultSet rs2 = ps2.executeQuery();

		ResultSetMetaData rsmd = rs2.getMetaData();
		int n = rsmd.getColumnCount();

		out.print("<table border='1' cellpadding= '10px' cellspacing= '10px' align = center>");
		out.print("<tr>");

		for (int i = 1; i <= n; i++) {
			out.print("<th>" + rsmd.getColumnName(i) + "</th>");
		}

		out.print("</tr>" + "<tr>");
		while (rs2.next()) {
			for (int j = 1; j <= n; j++) {
				out.print("<td>" + rs2.getString(j) + "</th>");
			}
		}

			}
			//if not active , displaying message to user
			else {
		out.print("<h1>" + "**** Sorry " + name + ", Your Account Is Inactive ****" + "</h1>");
		out.print("<h2>" + "**** Please Visit Your Home Branch For More Details ****" + "</h2>");
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
	</tr>
	</table>
	<p>
	<h3>
		<a href="Home_Page.jsp"> Home Page </a>
	</h3>
	</p>

</body>
</html>