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
		int height =0;
		int weight = 0;
		String name=null;
		Connection c = Dbconnection.getConnection();
		Statement stml = c.createStatement();
		String sql ="select * from client_registration";
		ResultSet rse = stml.executeQuery(sql);
		while(rse.next())
		{
			name=rse.getString("first_name");
			height=Integer.parseInt(rse.getString("height"));
			weight=Integer.parseInt(rse.getString("weight"));
		}
	%>
</body>
</html>