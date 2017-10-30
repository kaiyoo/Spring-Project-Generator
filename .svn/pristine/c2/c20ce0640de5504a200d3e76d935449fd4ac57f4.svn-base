package los.wizard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.GenVO;
import los.vo.UserTableVO;
import los.vo.DBVO;

public interface IGenDao {
	
	public DBVO getUserInfo(Map<String, String> params) throws SQLException;
	
	public List<UserTableVO> getTableList(DBVO userDBInfo) throws SQLException;

	public UserTableVO getTableView(Map<String, String> params) throws SQLException;
	
	public List<UserTableVO> getCreateTableList(String tblType, DBVO userDBInfo) throws SQLException;

	public List<UserTableVO> getCreateTableColList(Map<String, String> params, DBVO dbInfo) throws SQLException;
	
	public void createTable(String tableList, DBVO userDBInfo) throws SQLException; 
	
	public void insertGenInfo(GenVO tbInfo) throws SQLException;
	
	public List<UserTableVO> loadColList(String loadColumnList, DBVO userDBInfo) throws SQLException;

	public List<GenVO> getCreateTblList(Map<String, String> params) throws SQLException;

	public List<UserTableVO> getPkTableList(Map<String, String> params, DBVO dbInfo) throws SQLException;

	public List<UserTableVO> getColumnList(Map<String, String> params, DBVO dbInfo) throws SQLException;
	
}
