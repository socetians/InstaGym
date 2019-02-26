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
	String User_Height     =(String)request.getParameter("User_Height");
	String User_Weight     =(String)request.getParameter("User_Weight");
	String User_Neck       =(String)request.getParameter("User_Neck ");
	String User_Arm        =(String)request.getParameter("User_Arm");
	String User_Chest      =(String)request.getParameter("User_Chest");
	String User_Waist      =(String)request.getParameter("User_Waist");
	String User_Hips       =(String)request.getParameter("User_Hips");
	String User_Inner_thigh=(String)request.getParameter("User_Inner_thigh");
	String User_Calf	   =(String)request.getParameter("User_Calf");
	String client_id =(String)request.getAttribute("client_id");
	RequestDispatcher rd = null;
	Connection c =Dbconnection.getConnection();
	try
	{
		Statement stml = c.createStatement();
		String sql=	"UPDATE client_registration SET  height= '"+User_Height+"' weight= '"+User_Weight+"' neck='"+User_Neck+"' arm='"+User_Arm+"' chest='"+User_Chest+"' waist='"+User_Waist+"' hips='"+User_Hips+"' inner_thigh='"+User_Inner_thigh+"' calf='"+User_Calf+"' FROM client_registration WHERE client_id= '"+client_id+"'";
		int rs=stml.executeUpdate(sql);
		request.setAttribute("Task","Done");
		rd= request.getRequestDispatcher("Home_page_admin_verification");
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	rd.forward(request,response);
	%>
</body>
</html>