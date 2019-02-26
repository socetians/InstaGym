package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;
import com.util.Dbconnection;

/**
 * Servlet implementation class gym_controller
 */
public class gym_controller extends HttpServlet {
 
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection c = Dbconnection.getConnection();
		PrintWriter out = response.getWriter();
		try { 
				Statement stml = c.createStatement();
				String sql = "select * from a_go";
				ResultSet rs = stml.executeQuery(sql);
				JSONArray json = new JSONArray();
				JSONObject jo1 = new JSONObject();
				jo1.put("status ", "0");
				jo1.put("message", "all set brooo!!!");
				json.put(jo1);
				while (rs.next()) {	
					JSONObject jo = new JSONObject();
					jo.put("owner_first_name", rs.getString("go_gym_owner_first_name"));
					jo.put("owenr_email_id",rs.getString("go_gym_owner_email_id"));
					jo.put("owner_gym_area",rs.getString("go_gym_area"));
					json.put(jo);
				}
				out.print(json);
			}catch (Exception e) {
			e.printStackTrace();
		}
	}
}