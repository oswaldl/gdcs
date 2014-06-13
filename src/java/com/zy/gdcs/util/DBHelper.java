package com.zy.gdcs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.h2.jdbcx.JdbcConnectionPool;



public class DBHelper {
	private DBHelper() {
	}

	private final static DBHelper DB_HELPER = new DBHelper();

	public static DBHelper getInstance() {
		return DB_HELPER;
	}
	public Connection getConnection() throws ClassNotFoundException,
			SQLException {
		Class.forName("org.h2.Driver");
		return DriverManager.getConnection(
				"jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000", "sa", "");
//		return JdbcConnectionPool.create(  
//	            "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000", "sa", "").getConnection();
	}
	public void closeAll(Statement st , Connection connection) throws SQLException {
		if (null != st) {
			st.close();
		}
		if (null != connection) {
			connection.close();
		}
	}
	
}
