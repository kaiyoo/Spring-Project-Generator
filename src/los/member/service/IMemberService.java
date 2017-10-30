package los.member.service;

import java.sql.SQLException;
import java.util.Map;

import los.vo.MemberVO;

public interface IMemberService {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public int insertMemberInfo(MemberVO memberInfo) throws SQLException;
}
