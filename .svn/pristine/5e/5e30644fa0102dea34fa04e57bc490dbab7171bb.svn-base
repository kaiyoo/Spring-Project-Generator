package los.wizard.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.buf.UEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import los.ibatis.config.DBConnection;
import los.vo.GenVO;
import los.vo.UserTableVO;
import los.vo.DBVO;

@Repository
public class IGenDaoImpl implements IGenDao {
	
	@Autowired
	private SqlMapClient client;

	@Autowired
	private DBConnection connection;
	
	@Override
	public void insertGenInfo(GenVO tbInfo) throws SQLException {
		this.client.insert("MVC.genInfo", tbInfo);
	}

	@Override
	public DBVO getUserInfo(Map<String, String> params)
			throws SQLException {
		DBVO userInfo = null;
		
		userInfo = (DBVO) client.queryForObject("MVC.userInfo", params);
		
		return userInfo;
	}

	@Override
	public List<UserTableVO> getTableList(DBVO userDBInfo) throws SQLException {
		// 현재의 컨넥션을 유저가 전달한 컨넥션으로 변경
		this.connection.changeUserConnection(userDBInfo);
		List<UserTableVO> mainTblList = new ArrayList<UserTableVO>();
		mainTblList = this.client.queryForList("MVC.tableList", userDBInfo);
		this.connection.changeAdminConnection();
		
		return mainTblList;
	}

	@Override
	public UserTableVO getTableView(Map<String, String> params)
			throws SQLException {
		UserTableVO tableInfo = null; 
		
		try{
			client.startTransaction();
			tableInfo = (UserTableVO) client.queryForObject("MVC.tableInfo", params);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return tableInfo;
	}
	
	@Override
	public List<UserTableVO> getCreateTableList(String tblType, DBVO userDBInfo)
			throws SQLException {
		System.out.println("유저계정연결");
		this.connection.changeUserConnection(userDBInfo);
		
		List<UserTableVO> tableList = new ArrayList<UserTableVO>();
		tableList =  this.client.queryForList("MVC.pkTableList", tblType);
		
		System.out.println("Admin계정연결");
		this.connection.changeAdminConnection();
		
		return tableList;
	}


	@Override
	public List<UserTableVO> getCreateTableColList(Map<String, String> params, DBVO dbInfo)
			throws SQLException {
		this.connection.changeUserConnection(dbInfo);
		List<UserTableVO> colList = new ArrayList<UserTableVO>();
		colList =  this.client.queryForList("MVC.tableColumnsInfo",params);
		this.connection.changeAdminConnection();
		return colList;
	}

	@Override
	public List<UserTableVO> loadColList(String loadColumnList, DBVO userDBInfo) throws SQLException {
		
		System.out.println("유저계정연결");
		this.connection.changeUserConnection(userDBInfo);
		
		List<UserTableVO> colList = new ArrayList<UserTableVO>();
		colList = this.client.queryForList("MVC.loadColumnList", loadColumnList);
		
		System.out.println("Admin계정연결");
		this.connection.changeAdminConnection();
		
		return colList;
	}
	

	@Override
	public void createTable(String tableList, DBVO userDBInfo) throws SQLException {
		System.out.println("유저계정연결");
		this.connection.changeUserConnection(userDBInfo);
		
		this.client.insert("MVC.createTable", tableList);
		
		System.out.println("Admin계정연결");
		this.connection.changeAdminConnection();
	}
	
	@Override
	public List<GenVO> getCreateTblList(Map<String, String> params)
			throws SQLException {
		return this.client.queryForList("MVC.genFileCreate",params);
	}

	@Override
	public List<UserTableVO> getPkTableList(Map<String, String> params, DBVO dbInfo)
			throws SQLException {
		List<UserTableVO> userTableList = new ArrayList<UserTableVO>();
		this.connection.changeUserConnection(dbInfo);
		userTableList = this.client.queryForList("MVC.pkTableList",params);
		this.connection.changeAdminConnection();
		return userTableList;
		
	}
	
	@Override
	   public List<UserTableVO> getColumnList(Map<String, String> params, DBVO dbInfo)
	         throws SQLException {
	      this.connection.changeUserConnection(dbInfo);
	      
	      List<UserTableVO> userColumnList = new ArrayList<UserTableVO>();
	      userColumnList =  this.client.queryForList("MVC.tableColumnsInfo",params);

	      this.connection.changeAdminConnection();
	      
	      return userColumnList;
	   }
	
}
