package oj;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.jdbc.pool.OracleDataSource;

public class HelloRaw {

	public static void main(String[] args) {

		try {
			OracleDataSource ods = new OracleDataSource();
			ods.setURL("jdbc:Oracle:thin:@localhost:1521/ORCLPDB");
			ods.setUser("hr");
			ods.setPassword("hr");
			
			Connection conn= ods.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select first_name from employees where employee_id=100");
			while(rs.next()) {
			System.out.println(rs.getString(1));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
