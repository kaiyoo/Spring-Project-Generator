package los.member.dao;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import los.vo.MemberVO;

@Repository
public class IMemberDaoImpl implements IMemberDao {
	
//Commented temporarily on 1/11/17 due to lack of database instance	on Heroku	
//Override the unimplemented method to avoid error
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMemberInfo(MemberVO memberInfo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	/*@Autowired
	private SqlMapClient client;
	
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException {
		
		return (MemberVO) this.client.queryForObject("member.memberInfo",params);
	}

	@Override
	public int insertMemberInfo(MemberVO memberInfo) throws SQLException {
		
		this.client.insert("member.insertMemberInfo",memberInfo);
		
		return 1;
	}*/

}
