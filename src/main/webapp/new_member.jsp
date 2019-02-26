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
			String error = (String)request.getAttribute("Iswrong");
			if(error!=null)
			{
				out.print(error);
			}
			String task = (String)request.getAttribute("Task");
			if(task!=null)
			{
				out.print("Your data is recived , have a fun ....");
			}
		%>
		<form action='Member_verification.jsp' method='post'>
   		User_Email-id:<input type='text' name='User_Email-id'/>
   		User_password:<input type='password' name='User_password'/>
   		<input type='submit' value='login' onClick='myfun()'/>
	
		
</body>
</html>