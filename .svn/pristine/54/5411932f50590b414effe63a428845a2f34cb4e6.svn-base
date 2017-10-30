package los.management.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import los.management.dao.IGroupDao;
import los.vo.GroupVO;
import los.vo.ProjectVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IGroupServiceImpl implements IGroupService {
	
	@Autowired
	private IGroupDao dao;
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public GroupVO getGroupInfo(Map<String, String> params) throws SQLException {
		return this.dao.getGroupInfo(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public List<GroupVO> getGroupList(Map<String, String> params) throws SQLException {
		return this.dao.getGroupList(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public int getTotalGroupCount(Map<String, String> params) throws SQLException {
		return this.dao.getTotalGroupCount(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void insertGroupInfo(GroupVO groupInfo) throws SQLException {
		this.dao.insertGroupInfo(groupInfo);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void deleteAllGroupInfo(Map<String, String> params)
			throws SQLException {
		this.dao.deleteAllGroupInfo(params);
	}

	@Override
	public List<ProjectVO> getProjectList(String grp_writer) throws SQLException {
		return this.dao.getProjectList(grp_writer);
	}
	
}
