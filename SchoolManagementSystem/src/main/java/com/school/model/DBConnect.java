package com.school.model;

import java.sql.Connection;
import java.sql.DriverManager;


//this is the only class thats needed for the DB connectivity
public class DBConnect {

	private static String url = "jdbc:mysql://localhost:3306/sims";
	private static String user = "root";
	private static String password = "vikum821";
	private static Connection con;
	
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
		
	}
}