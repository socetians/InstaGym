<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="admin.css">
 
</head>
<body>

		<% 
		String error = (String)request.getAttribute("Iswrong");
		String password =(String)request.getAttribute("Passworderror");
		if(password !=null)
		{%>
			<script type='text/javascript'>
			function myfun()
			{
				alert('reach you sortly');
			}
			</script>
		<%}
		if(error != null)
		{
			out.print(error);
		}
		
		if(session.getAttribute("user_type")!=null)
		{
			RequestDispatcher rd = null;
			if(session.getAttribute("user_type").equals("admin"))
				rd = request.getRequestDispatcher("Home_page_admin.jsp");
			else
				rd= request.getRequestDispatcher("Home_page_gym_owner.jsp");
			
			rd.forward(request, response);
		}
		else
		 {	%>
			<!-- 
			<form action='LoginVerification.jsp' method='post'>
	   		User_Email-id:<input type='text' name='User_Email-id'/>
	   		User_Password:<input type='password' name='User_Password'/>
	   		<input type='submit' value='login' onClick='myfun()'/>	 -->	
		<%  }
		%>
		
		<nav class="navbar navbar-inverse">
  <!--<div class="container-fluid">-->
    <div class="navbar-header">
      <a class="navbar-brand" ><img src="img/svkpie.png.jpeg" style="width:40px;height:40px;"></a>
	  <span class="navbar-text" style="font-size:20px;">INSTA GYM </span>
    </div>
	<div class="login-container">
	<form action="http://localhost:8080/E_gym/sign_up_page.jsp" method="post">
	<button class="button1" style="vertical-align:middle" ><b>SIGN UP</b></button>
  </form>
  </div>
  
    <div class="login-container">
    <form action="LoginVerification.jsp" method="post">
      <input type="text" placeholder="email@gmail.co" name="User_Email-id">
      <input type="password" placeholder="Password" name="User_Password">&nbsp&nbsp
      
	  <button type="submit" >LOGIN</button>
	 
	  
    </form>
	</div>
	 
</nav>
<div class="container-fluid">
  <div class="row">
    
         <div class="container">
  <div class="row">
    <div class= "main col-md-9">
         
		 <div class="mySlides fade">
  
  <img class="img-responsive" src="img/Gym-in-pimpri-chinchwad-1.jpg" width:"500" height:"300">
  </div>
   
 <!-- <div class="text">Gym</div>-->


<div class="mySlides fade">
  
  <img class="img-responsive" src="img/Stay-Motivated-In-The-Gym.jpg" width:"500" height:"300">
 <!-- <div class="text">Gym </div>-->
</div>

<div class="mySlides fade">
  
  <img class="img-responsive" src="img/32.jpg" width:"500" height:"300">
 <!-- <div class="text">Gym</div>-->
</div>
   
   <div>
   <div style="text-align:center"></div>
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  </div>
</div>



		  
    
   <div class="sidebar col-md-3">
         <div class="well"><ul>
  <li><b>Why Insta Gym?</b></li>
  <ul><li>Single membership throughout<br> all the gyms</li>
  
  </ul>
  <li><b>Services offered</b></li>
  <ul><li>CRM</li>
  <li>Brand building</li>
  <li>Mobile application for customers</li>
  <li>Diet provider</li>
  <li>Body size tracker</li>
  <li>Anonymous complain</li>
  <li>Gym e-commerce platform</li>
  </ul></div>
   
   
  </div>
</div>


 <div class="row">
  <div class="sidebar col-md-12">

<h2>50 + gyms connected with us</h2>
<h2>Use your single membership throughout all the gyms of the country</h2> </div></div>
<!-- <div class="footer">
  <p>Insta Gym by <b><i>Socetians</i></b></p>
</div> -->



<div >
<div style="height:150px;width:1240px;background:#2d3246;float:left"><h2><span style="color:white;margin:15px">Address:</h2><span style="color:white;margin:15px">Level 4,Shantam complex</span><br><span style="color:white;margin:15px">Bodakdev</span><br><span style="color:white;margin:15px">Ahmedabad,Gujarat</span></div>
</div>



<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
<script>
$(document).ready(function () { 
 $( ".change_to_left" ).click(function() {   
  $('.wrap').removeClass('sidebar-right');
   $('.wrap').addClass('sidebar-left');  
}); 
  
   $( ".change_to_right" ).click(function() {   
  $('.wrap').removeClass('sidebar-left');
   $('.wrap').addClass('sidebar-right');  
}); 
  
  }); </script>
		
</body>
</html>