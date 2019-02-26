<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.Dbconnection"%>
<%@page import="java.sql.Connection"%>
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
		String user_type = (String) request.getAttribute("user_value");
	String decision = "decision";
	%>
	<%=user_type%>
	<p>welcome in my gym</p>
	<%
		session.setAttribute("user_type","admin");
		int Gym_id = 0;
		Connection c = Dbconnection.getConnection();
		Statement stml = c.createStatement();
		try {
			String sql = "select * from go_temp";
			ResultSet rs1 = stml.executeQuery(sql);
			while (rs1.next()) {
	%>
	<%=rs1.getString("gto_gym_name")%>
	<%=rs1.getString("gto_gym_owner_first_name")%>
	<%=rs1.getString("gto_gym_owner_last_name")%>
	<%=rs1.getString("gto_gym_owner_email_id")%>
	<%=rs1.getString("gto_gym_owner_phone_number")%>
	<%=rs1.getString("gto_gym_state")%>
	<%=rs1.getString("gto_gym_city")%>
	<%=rs1.getString("gto_gym_area")%>
	<%=rs1.getString("gto_gym_6_price")%>
	<%=rs1.getString("gto_gym_12_price")%>
	<form action='Home_page_admin_verification.jsp' method='post'>
	<% decision = "decision" + rs1.getString("gto_id"); %>
	<%=decision%>
		<% out.print("<input name='"+decision+"' type='radio' value='yes'>Yes</button>");
		out.print("<input name='"+decision+"' type='radio' value='no'>No</button>");
		out.print("<input type='submit' name='"+decision+"'>");
			out.print("</form>");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<a href="http://localhost:8080/E_gym/admin_logout.jsp">Log out</a>

</body>
</html>