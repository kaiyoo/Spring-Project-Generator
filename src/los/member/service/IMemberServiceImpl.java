 package los.member.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import los.member.dao.IMemberDao;
import los.vo.MemberVO;

@Service
public class IMemberServiceImpl implements IMemberService{

	@Autowired
	private IMemberDao dao;
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException {
		
		return this.dao.getMemberInfo(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public int insertMemberInfo(MemberVO memberInfo) throws SQLException {
		
		return this.dao.insertMemberInfo(memberInfo);
	}
	
}
