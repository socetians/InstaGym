<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
	String user_id=request.getParameter("User_Email-id");
	String user_pass=request.getParameter("User_Password");
	ServletContext context =getServletContext(); 
	String user_userName = context.getInitParameter("user_userName");
	String user_password = context.getInitParameter("user_password");
	String owner_id =null;
	String database_email = null;
	String database_password = null;
	RequestDispatcher rd=null; 
	if(user_id.equals(user_userName) && user_pass.equals(user_password))
	{
		rd = request.getRequestDispatcher("Home_page_admin.jsp");
	}	
	else 
	{ 	
		try{
				Connection c = Dbconnection.getConnection();
				Statement stml= c.createStatement();
				String sql = "select * from a_go";
				ResultSet res=stml.executeQuery(sql);
				while(res.next())
				{
					 database_email =res.getString("go_gym_owner_email_id"); 
					 database_password =res.getString("go_gym_owner_password");
					 owner_id = res.getString("go_id");
					 System.out.println(" in while");
					 System.out.println(owner_id);
					 System.out.println(database_password.equals(user_pass));
					 System.out.println(database_email.equals(user_id));
					 if(database_email.equals(user_id) && database_password.equals(user_pass))
					 {	
						System.out.print("In if");
						request.setAttribute("owner_id",owner_id);
						System.out.println(owner_id);
						rd = request.getRequestDispatcher("Home_page_gym_owner.jsp");
					 }
					 else
					 {
						 request.setAttribute("Iswrong", "plzzzz enter the valid email and password ....");
						 rd = request.getRequestDispatcher("Home.jsp");
					 }
				 }
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	}	
	rd.forward(request, response);
	%>
</body>
</html>