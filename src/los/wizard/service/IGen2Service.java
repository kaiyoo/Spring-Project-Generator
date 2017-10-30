package los.wizard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.DBVO;
import los.vo.UserTableVO;

public interface IGen2Service {
	public List<UserTableVO> getPkList(DBVO dbInfo, Map<String, String> params) throws SQLException;
}
