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
	String Gym_name			=(String)request.getAttribute("Gym_name");
	String Owner_first_name =(String)request.getAttribute("Owner_first_name");
	String Owner_last_name  =(String)request.getAttribute("Owner_last_name");
	String Owner_emailid    =(String)request.getAttribute("Owner_emailid");
	String Owner_phone      =(String)request.getAttribute("Owner_phone");
	String Gym_state        =(String)request.getAttribute("Gym_state");
	String Gym_city         =(String)request.getAttribute("Gym_city");
	String Gym_area         =(String)request.getAttribute("Gym_area");
	String Gym_street_add   =(String)request.getAttribute("Gym_Street_add");
	String Gym_6_price		=(String)request.getAttribute("Gym_6_price");
	String Gym_12_price		=(String)request.getAttribute("Gym_12_price");
	String Passworderror = (String)request.getAttribute("Passworderror");
	String Emailerror =(String)request.getAttribute("Emailerror");
	if(Passworderror != null)
	{
		out.print(Passworderror+"\n");
	}
	 else if(Emailerror !=null)
	{
		out.print(Emailerror+"\n");
	}
	%>
	<%
		out.print("<form action='Sign_up_verification.jsp' method='post' <br>");
		if(Gym_name != null)
			out.print("Gym_name:<input type='text' name='Gym_name' value='"+Gym_name+"'/><br>");
		else
			out.print("Gym_name:<input type='text' name='Gym_name' /><br>");
		if(Owner_first_name !=null)
			out.print("Owner_first_name:<input type='text' name='Owner_first_name' value='"+Owner_first_name+"'/><br>");
		else
			out.print("Owner_first_name:<input type='text' name='Owner_first_name'/><br>");
		if(Owner_last_name !=null)
			out.print("Owner_last_name:<input type='text' name='Owner_last_name' value='"+Owner_last_name+"'/><br>");
		else
			out.print("Owner_last_name:<input type='text' name='Owner_last_name'/><br>");
		if(Owner_emailid != null)
			out.print("Owner_emailid:<input type='email' name='Owner_emailid' value='"+Owner_emailid+"'/><br>");
		else
			out.print("Owner_emailid:<input type='email' name='Owner_emailid' /><br>");
		if(Owner_phone !=null)
			out.print("Owner_phone:<input type='number' name='Owner_phone' value='"+Owner_phone+"'/> <br>");
		else
			out.print("Owner_phone:<input type='number' name='Owner_phone'/> <br>");
		if(Gym_state !=null)
			out.print("Gym_state:<input type='text' name='Gym_state' value='"+Gym_state+"'/><br>");
		else
			out.print("Gym_state:<input type='text' name='Gym_state'/><br>");
		if(Gym_city !=null)
			out.print("Gym_city:<input type='text' name='Gym_city' value='"+Gym_city+"'/><br>");
		else
			out.print("Gym_city:<input type='text' name='Gym_city'/><br>");
		if(Gym_area !=null)	
			out.print("Gym_area:<input type='text' name='Gym_area' value='"+Gym_area+"'/><br>");
		else
			out.print("Gym_area:<input type='text' name='Gym_area'/><br>");
		if(Gym_street_add !=null)	
			out.print("Gym_street_add:<input type='text' name='Gym_street_add' value='"+Gym_street_add+"'/><br>");
		else
			out.print("Gym_street_add:<input type='text' name='Gym_street_add'/><br>");
		if(Gym_6_price !=null)	
			out.print("Gym_6_price:<input type='number' name='Gym_6_price' value='"+Gym_6_price+"'/><br>");
		else
			out.print("Gym_6_price:<input type='number' name='Gym_6_price'/><br>");
		if(Gym_12_price !=null)	
			out.print("Gym_12_price:<input type='number' name='Gym_12_price' value='"+Gym_12_price+"'/><br>");
		else
			out.print("Gym_12_price:<input type='number' name='Gym_12_price'/><br>");
		out.print("Owner_password:<input type='password' name='Owner_password' /><br>");
		out.print("Confirm_password:<input type='password' name='Confirm_password'/><br>");
		out.print("<input type='submit' value='login' /><br>");	
	%>
	
</body>
</html>