package los.wizard.service;

import java.sql.SQLException;
import java.util.Map;

import los.vo.ProjectVO;

public interface IProjectService {
	
	public String insertProjectInfo(ProjectVO projectInfo) throws SQLException ;
	public ProjectVO getProjectInfo(Map<String, String> params) throws SQLException ;
	public void updateProjectInfo(ProjectVO projectInfo) throws SQLException;
}
