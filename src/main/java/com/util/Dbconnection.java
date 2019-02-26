package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {
	public static Connection getConnection(){
		 String url= "jdbc:mysql://localhost:3306/e_gym";
		 String driver = "com.mysql.cj.jdbc.Driver";
		 String userName ="root";
		 String password = "root";
		 
		 Connection con=null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userName,password);
		} catch (Exception e) {
					e.printStackTrace();
		}
		 if(con != null)
		 {
			 System.out.println("connected.....");
		 }
		 else
		 {
			 System.out.println("Not connected .....");
		 }
		 return con;
	}
	public static void main(String[] args) {
		Dbconnection.getConnection(); 	
	}

}
