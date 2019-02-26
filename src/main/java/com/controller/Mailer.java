package com.controller;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer 
{
	public static void send(String to, String subject, String msg) 
	{

		final String user = "6765.st.kabir.din@gmail.com";
		final String pass = "jplove4ever";

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.user", user);
		props.put("mail.smtp.password", pass);
		
		props.put("mail.smtp.port", 587);
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");

	
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pass);
			}
		});
		 		
		
		System.out.println("----------------------");
		try 
		{
			System.out.println(to);     
			System.out.println(subject);
			System.out.println(msg);    
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setText(msg);
			

	         

			
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) 
		{
			throw new RuntimeException(e);
		}

	}
}