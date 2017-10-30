package los.wizard.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import los.vo.IbatisVO;
import los.vo.QuartzVO;
import los.vo.ViewResolverVO;
import los.vo.WebXMLVO;
import los.wizard.dao.ISpringDao;

@Service
public class ISpringServiceImpl implements ISpringService{
	@Autowired
	private ISpringDao dao;
	
	@Transactional
	@Override
	public WebXMLVO getWebXMLInfo(Map<String, String> params) throws SQLException {
		return this.dao.getWebXMLInfo(params);
	}

	@Transactional
	@Override
	public void insertWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException {
		this.dao.insertWebXMLInfo(webXMLInfo);
	}

	@Transactional
	@Override
	public void updateWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException {
		this.dao.updateWebXMLInfo(webXMLInfo);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public IbatisVO getIbatisInfo(String pr_no) throws SQLException {
		return this.dao.getIbatisInfo(pr_no);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public QuartzVO getQuartzInfo(String pr_no) throws SQLException {
		return this.dao.getQuartzInfo(pr_no);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public ViewResolverVO getViewResolverInfo(String pr_no) throws SQLException {
		return this.dao.getViewResolverInfo(pr_no);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void insertSpringInfo(IbatisVO iBatisInfo,
			QuartzVO quartzInfo, ViewResolverVO viewResolverInfo)
			throws SQLException {
		this.dao.insertSpringInfo(iBatisInfo, quartzInfo, viewResolverInfo);
		
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void updateSpringInfo(IbatisVO iBatisInfo,
			QuartzVO quartzInfo, ViewResolverVO viewResolverInfo)
			throws SQLException {
		this.dao.updateSpringInfo(iBatisInfo, quartzInfo, viewResolverInfo);
	}
	
}
