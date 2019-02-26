<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	hey................
	<%
		String go_id = (String)request.getAttribute("owner_id");
		System.out.println(go_id);
		out.print(go_id);
		 session.setAttribute("user_type","gym_owner");
		Connection c = Dbconnection.getConnection();
		Statement stml = c.createStatement();
		String owner_name = null;
		try
		{
			String sql="select * from a_go WHERE go_id='"+go_id+"'";
			ResultSet rs = stml.executeQuery(sql);
			while(rs.next())
			{
				owner_name=rs.getString("go_gym_owner_first_name");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	 %>
	 <%
	 	try
	 	{
	 		String sql1="select client_id from client_info WHERE gym_id="+go_id+"";
	 		Statement stml2 = c.createStatement();
	 		String sql2="select * from client_registration WHERE client_id in("+sql1+"";
	 		ResultSet rs2=stml2.executeQuery(sql1);	
 		    while(rs2.next())
	 		{
	 			rs2.getString("first_name");
	 			rs2.getString("email_id");
	 			rs2.getString("phone_number");
	 		}
	 	}catch(Exception e)
	 	{
	 		e.printStackTrace();
	 	}
	 %>
	 <a href="http://localhost:8080/E_gym/new_member.jsp">Edit member</a>
	 <a href="http://localhost:8080/E_gym/admin_logout.jsp">Log out</a>
</body>
</html>