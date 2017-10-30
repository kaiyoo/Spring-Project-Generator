package los.wizard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import los.vo.DBVO;
import los.vo.UserTableVO;
import los.wizard.dao.IGen2Dao;

@Service
public class IGen2ServiceImpl implements IGen2Service {
	@Autowired
	private IGen2Dao dao;

	@Override
	public List<UserTableVO> getPkList(DBVO dbInfo, Map<String, String> params)
			throws SQLException {
		return this.dao.getPkList(dbInfo, params);
	}
	
	
}
