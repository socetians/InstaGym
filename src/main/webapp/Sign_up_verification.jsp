<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
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
			String Gym_name=request.getParameter("Gym_name");
	       	String Owner_first_name=request.getParameter("Owner_first_name");
	       	String Owner_last_name=request.getParameter("Owner_last_name");
	       	String Owner_emailid=request.getParameter("Owner_emailid");
	       	String Owner_phone=request.getParameter("Owner_phone");
           	String Gym_state=request.getParameter("Gym_state");
           	String Gym_city=request.getParameter("Gym_city");
           	String Gym_area=request.getParameter("Gym_area");
           	String Owner_password=request.getParameter("Owner_password");
           	String Confirm_password=request.getParameter("Confirm_password");
           	int Gym_6_price=Integer.parseInt(request.getParameter("Gym_6_price"));
           	int Gym_12_price=Integer.parseInt(request.getParameter("Gym_12_price"));
           	String Gym_street_add = request.getParameter("Gym_street_add");
           	String temp_password = null;
            RequestDispatcher rd=null;
           	Connection c = Dbconnection.getConnection();
   		 	Statement stml = c.createStatement();
   		 	int Gym_id =0; 
   		 	String Email_comfirm = null; 
   		 	%>
   		 	  
          	<%
          		boolean error=false;
          		 if(!(Owner_password.equals(Confirm_password)))
          		{
          			error = true;
          			request.setAttribute("Passworderror","Plz... enter valid password");
          		} 
          		try
       		 	{
       		 		String sql1 = "select * from a_go";
       		 		ResultSet rs1 = stml.executeQuery(sql1);
       				while (rs1.next()) {
    					 	temp_password =rs1.getString("go_owner_email_id");
    					 	if(temp_password.equals(Owner_emailid))
    					 	{
    					 		error=true;
    					 		request.setAttribute("Emailerror","Plz... enter not register email");
    					 	}
    			 		}
       				}catch(Exception e)
    			 	{
    				 	e.printStackTrace();
    			 	}
          	%>
          <% 	
          	  
        	  if(error==false)
        	  {
        	  	try
        	  	{
        				String sql = "select gto_id from go_temp order by GtO_id desc limit 1";
        				ResultSet rs = stml.executeQuery(sql);
        				while (rs.next()) {
        					Gym_id = Integer.parseInt(rs.getString("gto_id"));
        				}
        			 
        			Gym_id = Gym_id + 1;
        			 String sql2= "INSERT INTO go_temp values('"+Gym_id+"','"+Gym_name+"','"+Owner_first_name+"','"+Owner_last_name+"','"+Owner_emailid+"','"+Owner_phone+"','"+Gym_state+"','"+Gym_city+"','"+Gym_area+"',"+Gym_6_price+","+Gym_12_price+",'"+Owner_password+"','"+Gym_street_add+"')";
					 int rs2= stml.executeUpdate(sql2);
        			  }catch(Exception e)
        			  {
        				  e.printStackTrace();
          				}
        	  		rd = request.getRequestDispatcher("Home.jsp");
        	  		request.setAttribute("Passworderror","Your responce is recived we will contact you shortly... ,thank you");
          	  }
        	  else
        	  {		
        		  request.setAttribute("Gym_name",Gym_name);
        		  request.setAttribute("Owner_first_name",Owner_first_name);
        		  request.setAttribute("Owner_last_name",Owner_last_name);
        		  request.setAttribute("Owner_emailid",Owner_emailid);
        		  request.setAttribute("Owner_phone",Owner_phone);
        		  request.setAttribute("Gym_state",Gym_state);
        		  request.setAttribute("Gym_city",Gym_city);
        		  request.setAttribute("Gym_area",Gym_area);
        		  request.setAttribute("Gym_6_price",Gym_6_price);
        		  request.setAttribute("Gym_12_price",Gym_12_price);
        		  request.setAttribute("Gym_street_add",Gym_street_add);
        		  rd = request.getRequestDispatcher("sign_up_page.jsp");
        		  
        	  }
          rd.forward(request,response);
          %>
	</body>
</html>