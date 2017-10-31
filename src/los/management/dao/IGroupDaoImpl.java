package los.management.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.GroupVO;
import los.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IGroupDaoImpl implements IGroupDao {
	
//Commented temporarily on 1/11/17 due to lack of database instance	on Heroku	
//Override the unimplemented method to avoid error
	
	@Override
	public GroupVO getGroupInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GroupVO> getGroupList(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalGroupCount(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertGroupInfo(GroupVO groupInfo) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllGroupInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProjectVO> getProjectList(String grp_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
//	@Autowired
//	private SqlMapClient client;
	
	/*@Override
	public GroupVO getGroupInfo(Map<String, String> params) throws SQLException {
		return (GroupVO) this.client.queryForObject("GROUP_INFO.groupInfo", params);
	}
	
	@Override
	public List<GroupVO> getGroupList(Map<String, String> params)
			throws SQLException {
		return this.client.queryForList("GROUP_INFO.groupList", params);
	}
	
	@Override
	public int getTotalGroupCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("GROUP_INFO.totalGroupCount", params);
	}

	@Override
	public void insertGroupInfo(GroupVO groupInfo) throws SQLException {
		this.client.insert("GROUP_INFO.insertGroupInfo", groupInfo);
		this.client.insert("GROUP_INFO.insertRelGrpInfo", groupInfo);
	}

	@Override
	public void deleteAllGroupInfo(Map<String, String> params)
			throws SQLException {
		this.client.delete("GROUP_INFO.deleteAllGroupInfo", params);
	}
	
	@Override
	public List<ProjectVO> getProjectList(String grp_no) throws SQLException {
		return this.client.queryForList("GROUP_INFO.projectList", grp_no);
	}	*/
	
	
}
