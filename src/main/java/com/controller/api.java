package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.util.Dbconnection;

public class api {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection c = Dbconnection.getConnection();
		PrintWriter out = response.getWriter();

		try {
			Statement stml = c.createStatement();
			String sql = "select * from a_go";
			ResultSet rs = stml.executeQuery(sql);
			JSONArray json = new JSONArray();
			JSONArray json1 = new JSONArray();
			
		while (rs.next()) {	
				JSONObject jo = new JSONObject();
				jo.put("owner_first_name", rs.getString("go_gym_owner_first_name"));
				jo.put("owenr_email_id",rs.getString("go_gym_owner_email_id"));
				jo.put("owner_first_name",rs.getString("go_gym_owner_street_address"));
				jo.put("status ", "0");
				jo.put("message", "all set brooo!!!");
				json.put(jo);
			}
			out.println(json);
			System.out.println(json);
			out.println(json1);
			}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
