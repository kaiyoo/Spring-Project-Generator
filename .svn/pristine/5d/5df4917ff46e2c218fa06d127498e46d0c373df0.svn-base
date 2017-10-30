package los.wizard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.LibsVO;
import los.vo.MavVO;

public interface IMavenDao {
	public List<LibsVO> getJarList(Map<String, String> params) throws SQLException;
	public void insertJarInfo(LibsVO jarInfo) throws SQLException;
	public void deleteJarInfo(Map<String, String> params) throws SQLException;
	
	//MAVENREPOINFO
	public void insertMavenInfo(MavVO mavenInfo) throws SQLException;
	public List<MavVO> getMavenList(Map<String, String> params) throws SQLException;
	public void deleteMavenInfo(Map<String, String> params) throws SQLException;
}
