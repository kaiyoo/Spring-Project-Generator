package los.wizard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import los.vo.GenVO;
import los.vo.UserTableVO;
import los.vo.DBVO;
import los.wizard.dao.IGenDao;

@Service
public class IGenServiceImpl implements IGenService {
	
	@Autowired
	private IGenDao dao;
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void insertGenInfo(GenVO tbInfo) throws SQLException {
		this.dao.insertGenInfo(tbInfo);
	}

	@Transactional(rollbackFor={SQLException.class})
	@Override
	public DBVO getUserInfo(Map<String, String> params)
			throws SQLException {
		return this.dao.getUserInfo(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public List<UserTableVO> getTableList(DBVO userDBInfo)
			throws SQLException {
		return this.dao.getTableList(userDBInfo);
	}

	@Transactional(rollbackFor={SQLException.class})
	@Override
	public UserTableVO getTableView(Map<String, String> params)
			throws SQLException {
		return this.dao.getTableView(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public List<UserTableVO> getCreateTableList(String tblType, DBVO userDBInfo)
			throws SQLException {
		return this.dao.getCreateTableList(tblType, userDBInfo);
	}


	@Override
	public List<UserTableVO> getCreateTableColList(Map<String, String> params, DBVO dbInfo)
			throws SQLException {
		return this.dao.getCreateTableColList(params, dbInfo);
	}

	@Override
	public void createTable(String tableList, DBVO userDBInfo) throws SQLException {
		this.dao.createTable(tableList, userDBInfo);
	}

	@Override
	public List<UserTableVO> loadColList(String loadColumnList, DBVO userDBInfo) throws SQLException {
		return this.dao.loadColList(loadColumnList, userDBInfo);
	}

	@Override
	public List<GenVO> getCreateTblList(Map<String, String> params)
			throws SQLException {
		return this.dao.getCreateTblList(params);
	}

	@Override
	public List<UserTableVO> getPkTableList(Map<String, String> params, DBVO dbInfo)
			throws SQLException {
		return this.dao.getPkTableList(params, dbInfo);
	}

	@Override
	   public List<UserTableVO> getColumnList(Map<String, String> params,
	         DBVO dbInfo) throws SQLException {
	      return this.dao.getColumnList(params, dbInfo);
	   }
	

}
