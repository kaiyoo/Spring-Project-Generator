package los.ibatis.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import los.vo.DBVO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

@Component
public class DBConnection {
	@Autowired
	private SqlMapClient client;
	
	public void changeUserConnection(DBVO userDBInfo) throws SQLException{
		// 클래스. forName()
		// 컨넥션 취득
		//
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@" + userDBInfo.getPr_db_host() + ":" 
																	+ userDBInfo.getPr_db_port() + ":" + userDBInfo.getPr_db_sn() 
																, userDBInfo.getPr_db_userId() 
																, userDBInfo.getPr_db_pass());
		client.setUserConnection(connection);
	}
	public void changeAdminConnection() throws SQLException{
		// 클래스. forName()
		// 컨넥션 취득
		// 
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@58.227.103.17:1521:XE" 
																, "los", "los123");
		client.setUserConnection(connection);
	}
	
}
