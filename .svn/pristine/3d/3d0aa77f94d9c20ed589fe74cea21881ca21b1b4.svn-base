package los.wizard.service;

import java.sql.SQLException;
import java.util.Map;

import los.vo.ProjectVO;
import los.wizard.dao.IProjectDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class IProjectServiceImpl implements IProjectService {
	
	@Autowired
	private IProjectDao dao;
	
	
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public String insertProjectInfo(ProjectVO projectInfo) throws SQLException {
		return this.dao.insertProjectInfo(projectInfo);
	}
	
	
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public ProjectVO getProjectInfo(Map<String, String> params) throws SQLException {
		return this.dao.getProjectInfo(params);
	}


	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void updateProjectInfo(ProjectVO projectInfo) throws SQLException {
		this.dao.updateProjectInfo(projectInfo);
	}
	
	
	
	
}
