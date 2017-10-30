package los.wizard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import los.vo.LibsVO;
import los.vo.MavVO;
import los.wizard.dao.IMavenDao;

@Service
public class IMavenServiceImpl implements IMavenService {
	
	@Autowired
	private IMavenDao dao;
	
	@Override
	public List<LibsVO> getJarList(Map<String, String> params) throws SQLException {
		return this.dao.getJarList(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void insertJarInfo(LibsVO jarInfo) throws SQLException {
		this.dao.insertJarInfo(jarInfo);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void deleteJarInfo(Map<String, String> params) throws SQLException {
		this.dao.deleteJarInfo(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void insertMavenInfo(MavVO mavenInfo) throws SQLException {
		this.dao.insertMavenInfo(mavenInfo);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public List<MavVO> getMavenList(Map<String, String> params)
			throws SQLException {
		return this.dao.getMavenList(params);
	}

	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void deleteMavenInfo(Map<String, String> params) throws SQLException {
		this.dao.deleteMavenInfo(params);
	}

}
