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
	int owner_id =Integer.parseInt((String)request.getAttribute("owner_id"));
	Connection c = Dbconnection.getConnection();
	try
	{
		Statement stml = c.createStatement();
		String sql = "select * from client_registration WHERE client_id="+owner_id+"";
		ResultSet rs = stml.executeQuery(sql);
		while(rs.next())
		{
			rs.getString("");
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</body>
</html>