package los.management.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.GroupVO;
import los.vo.ProjectVO;

public interface IGroupService {
	public GroupVO getGroupInfo(Map<String, String> params) throws SQLException;
	public List<GroupVO> getGroupList(Map<String, String> params) throws SQLException;
	public int getTotalGroupCount(Map<String, String> params) throws SQLException;
	public void insertGroupInfo(GroupVO groupInfo) throws SQLException;
	public void deleteAllGroupInfo(Map<String, String> params) throws SQLException;

	public List<ProjectVO> getProjectList(String grp_writer) throws SQLException;

}
