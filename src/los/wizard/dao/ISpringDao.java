package los.wizard.dao;

import java.sql.SQLException;
import java.util.Map;

import los.vo.IbatisVO;
import los.vo.QuartzVO;
import los.vo.ViewResolverVO;
import los.vo.WebXMLVO;

public interface ISpringDao {
	public WebXMLVO getWebXMLInfo(Map<String, String> params) throws SQLException;
	public void insertWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException;
	public void updateWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException;
	
	public IbatisVO getIbatisInfo(String pr_no) throws SQLException;
	public QuartzVO getQuartzInfo(String pr_no) throws SQLException;
	public ViewResolverVO getViewResolverInfo(String pr_no) throws SQLException;

	public void insertSpringInfo(IbatisVO iBatisInfo, QuartzVO quartzInfo, ViewResolverVO viewResolverInfo) throws SQLException;
	public void updateSpringInfo(IbatisVO iBatisInfo, QuartzVO quartzInfo, ViewResolverVO viewResolverInfo) throws SQLException;
	
}
