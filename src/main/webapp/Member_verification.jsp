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
		String email_id = request.getParameter("User_Email-id");
		String password = request.getParameter("User_password");
		String database_email = null;
		String database_password = null;
		String client_id = null;
		Connection c = Dbconnection.getConnection();
		RequestDispatcher rd = null;
		try
		{
			Statement stml = c.createStatement();
			String sql = "select * from client_registration";
			ResultSet res=stml.executeQuery(sql);
			while(res.next())
			{
				 database_email =res.getString("email_id"); 
				 database_password =res.getString("password");
				 client_id =res.getString("client_id");
				 request.setAttribute("client_id",client_id);
				 if(database_email.equals(email_id) && database_password.equals(password))
				 {	
					System.out.print("In if");
					request.setAttribute("client_id",client_id);
					out.print("<form action='Member_.jsp' method='post'>");
			   		out.print("User_Height:<input type='text' name='User_Height'/>");
			   		out.print("User_Weight:<input type='password' name='User_Weight'/>");
					out.print("User_Neck:<input type='text' name='User_ Neck'/>");	   		
			   		out.print("User_Arm :<input type='text' name='User_Arm'/>");
			   		out.print("User_Chest:<input type='text' name='User_Chest'/>");
			   		out.print("User_Waist:<input type='text' name='User_Waist'/>");
			   		out.print("User_Hips:<input type='text' name='User_Hips'/>");
			   		out.print("User_Inner_thigh:<input type='text' name='User_Inner_thigh'/>");
			   		out.print("User_Calf:<input type='text' name='User_Calf'/>");
			   		out.print("<input type='submit' value='login'/>");
					rd = request.getRequestDispatcher("Home_page_client.jsp");
				 }
				 else
				 {
					 request.setAttribute("Iswrong", "plzzzz enter the valid email and password ....");
					 rd = request.getRequestDispatcher("new_member.jsp");
				 }
			 }
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>