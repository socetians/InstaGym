package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.util.Dbconnection;

/**
 * Servlet implementation class client_registration
 */
public class client_registration extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email_id = request.getParameter("email_id");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		Connection c=Dbconnection.getConnection();
		try
		{
			Statement stml= c.createStatement();
			String sql = "SELECT email_id FROM client_registration";
			ResultSet rs = stml.executeQuery(sql);
			JSONArray json = new JSONArray();
			JSONObject jo = new JSONObject();
			while(rs.next())
			{
				if(!email_id.equals(rs.getString("email_id")))
				{
					jo.put("message","Email_id is alredy in use..");
					json.put(jo);
					break;
				}
			}
			out.println(json);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
