package com.zy.gdcs.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.zy.vo.CrawlRecord;

public class DomainDAO {
	public void saveCrawlRecord(CrawlRecord crawlRecord){
		String sql="insert into CRAWL_RECORD(username,url1, url2) values ('"+crawlRecord.getUsername()+"', '"+crawlRecord.getUrl1()+"', '"+crawlRecord.getUrl2()+"');";
		Connection connection=null;
		Statement statement=null;
		try {
			connection=DBHelper.getInstance().getConnection();
			statement=connection.createStatement();
			statement.executeUpdate(sql);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DBHelper.getInstance().closeAll(statement, connection);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		CrawlRecord crawlRecord=new CrawlRecord();
		crawlRecord.setUsername("username1");
		crawlRecord.setUrl1("username1");
		crawlRecord.setUrl2("username1");
		new DomainDAO().saveCrawlRecord(crawlRecord);
	}
}
