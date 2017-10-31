package los.wizard.dao;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import los.vo.ProjectVO;

@Repository
public class IProjectDaoImpl implements IProjectDao {

//Commented temporarily on 1/11/17 due to lack of database instance	on Heroku	
//Override the unimplemented method to avoid error	

	@Override
	public String insertProjectInfo(ProjectVO projectInfo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectVO getProjectInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateProjectInfo(ProjectVO projectInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	/*@Autowired
	private SqlMapClient client;
	
	@Override
	public String insertProjectInfo(ProjectVO projectInfo) throws SQLException {
		return (String) this.client.insert("project.insertProjectInfo",projectInfo);
	}

	@Override
	public ProjectVO getProjectInfo(Map<String, String> params) throws SQLException {
		return (ProjectVO) this.client.queryForObject("project.projectInfo",params);
	}
	
	
	public void updateProjectInfo(ProjectVO projectInfo) throws SQLException{
		this.client.update("project.updateProjectInfo",projectInfo);
	}*/
	
}
