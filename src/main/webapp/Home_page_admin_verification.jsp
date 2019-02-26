
<%
	//@page import="com.controller.SendMail"
%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.controller.Mailer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int temp_gid = 0;
		int temp_gid1 = 0;
		boolean flag = false;
		String temp_decision = null;
		String temp_decision1 = null;
		Connection c = Dbconnection.getConnection();
		Statement stml = c.createStatement();
		Statement stml0 = c.createStatement();
		Statement stml1 = c.createStatement();
		Statement stml2 = c.createStatement();
		Statement stml3 = c.createStatement();
		RequestDispatcher rd = null;
		try {
			String sql0 = "Select * from go_temp";
			ResultSet rs0 = stml0.executeQuery(sql0);
			while (rs0.next()) {
				temp_decision = "decision" + rs0.getString("gto_id");
				out.print(request.getParameter(temp_decision));
				if (request.getParameter(temp_decision) != null
						&& request.getParameter(temp_decision).equals("yes")) {
					flag = true;
					out.print("In if...");
					temp_gid = Integer.parseInt(rs0.getString("gto_id"));
					out.print(temp_gid);
					break;
				}
			}
			if (flag == true) {
				String sql1 = "select go_id from A_go order by go_id desc limit 1";

				ResultSet rs1 = stml1.executeQuery(sql1);
				while (rs1.next()) {
					temp_gid1 = Integer.parseInt(rs1.getString("go_id"));
				}
				temp_gid1++;
				System.out.println(temp_gid1);
				String sql2 = "select * from go_temp WHERE gto_id=" + temp_gid + "";
				ResultSet rs2 = stml2.executeQuery(sql2);
				while (rs2.next()) {

					String message = "We approve your request of joing a gym,we will reach you shortly...";
					Mailer.send(rs2.getString("gto_gym_owner_email_id"), "Congoooo...", message);
					String sql3 = "INSERT INTO a_go values(" + temp_gid1 + ",'" + rs2.getString("gto_gym_name")
							+ "','" + rs2.getString("gto_gym_owner_first_name") + "','"
							+ rs2.getString("gto_gym_owner_last_name") + "','"
							+ rs2.getString("gto_gym_owner_email_id") + "','"
							+ rs2.getString("gto_gym_owner_phone_number") + "','" + rs2.getString("gto_gym_state")
							+ "','" + rs2.getString("gto_gym_city") + "','" + rs2.getString("gto_gym_area") + "',"
							+ rs2.getString("gto_gym_6_price") + "," + rs2.getString("gto_gym_12_price") + ",'"
							+ rs2.getString("gto_gym_owner_password") + "','"
							+ rs2.getString("gto_gym_street_address") + "')";
					int rs3 = stml3.executeUpdate(sql3);
				}
			} else {
				Statement stml5 = c.createStatement();
				String sql5 = "select id from deleted_entries order by id desc limit 1";
				ResultSet rs5 = stml1.executeQuery(sql5);
				while (rs5.next()) {
					temp_gid1 = Integer.parseInt(rs5.getString("go_id"));
				}
				temp_gid1++;
				System.out.println(temp_gid1);
				String sql6 = "select * from go_temp WHERE gto_id=" + temp_gid + "";
				ResultSet rs6 = stml2.executeQuery(sql6);
				while (rs6.next()) {

					String message = "We update your profile and request again , for more contact our service center....";
					Mailer.send(rs6.getString("gto_gym_owner_email_id"), "sorry ....", message);

					String sql7 = "INSERT INTO a_go values(" + temp_gid1 + ",'" + rs6.getString("gto_gym_name")
							+ "','" + rs6.getString("gto_gym_owner_first_name") + "','"
							+ rs6.getString("gto_gym_owner_last_name") + "','"
							+ rs6.getString("gto_gym_owner_email_id") + "','"
							+ rs6.getString("gto_gym_owner_phone_number") + "','" + rs6.getString("gto_gym_state")
							+ "','" + rs6.getString("gto_gym_city") + "','" + rs6.getString("gto_gym_area") + "',"
							+ rs6.getString("gto_gym_6_price") + "," + rs6.getString("gto_gym_12_price") + ",'"
							+ rs6.getString("gto_gym_street_address") + ",'" + rs6.getString("gto_gym_password")
							+ "')";
					int rs7 = stml3.executeUpdate(sql7);
				}
			}
			String sql4 = "DELETE from go_temp WHERE gto_id =" + temp_gid + "";
			System.out.print(sql4);
			int rs4 = stml.executeUpdate(sql4);
			System.out.print("rs4  => " + rs4);

		} catch (Exception e) {
			e.printStackTrace();
		}
		rd = request.getRequestDispatcher("Home_page_admin.jsp");
		rd.forward(request, response);
	%>
</body>
</html>