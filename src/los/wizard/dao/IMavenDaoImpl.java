package los.wizard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import los.vo.LibsVO;
import los.vo.MavVO;

@Repository
public class IMavenDaoImpl implements IMavenDao {
	
//Commented temporarily on 1/11/17 due to lack of database instance	on Heroku	
//Override the unimplemented method to avoid error	

	@Override
	public List<LibsVO> getJarList(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertJarInfo(LibsVO jarInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteJarInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertMavenInfo(MavVO mavenInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MavVO> getMavenList(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteMavenInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

/*	@Autowired
	SqlMapClient client;
	
	@Override
	public List<LibsVO> getJarList(Map<String, String> params) throws SQLException {
		return this.client.queryForList("PR_LIBS_INFO.jarList", params);
	}

	@Override
	public void insertJarInfo(LibsVO jarInfo) throws SQLException {
		this.client.insert("PR_LIBS_INFO.insertJarInfo", jarInfo);
	}

	@Override
	public void deleteJarInfo(Map<String, String> params) throws SQLException {
		this.client.delete("PR_LIBS_INFO.deleteJarInfo",params);
	}
	
	@Override
	public void insertMavenInfo(MavVO mavenInfo) throws SQLException {
		this.client.insert("maven.insertMavenInfo",mavenInfo);
	}

	@Override
	public List<MavVO> getMavenList(Map<String, String> params)
			throws SQLException {
		return this.client.queryForList("maven.mavenInfoList",params);
	}

	@Override
	public void deleteMavenInfo(Map<String, String> params) throws SQLException {
			this.client.delete("maven.deleteMavenInfo", params);
	}
	*/
	
	

}
