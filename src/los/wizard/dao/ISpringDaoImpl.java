package los.wizard.dao;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import los.vo.IbatisVO;
import los.vo.QuartzVO;
import los.vo.ViewResolverVO;
import los.vo.MemberVO;
import los.vo.WebXMLVO;

@Repository
public class ISpringDaoImpl implements ISpringDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public WebXMLVO getWebXMLInfo(Map<String, String> params) throws SQLException {
		return (WebXMLVO) this.client.queryForObject("webXML.getWebXMLInfo", params);
	}

	@Override
	public void insertWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException {
		this.client.insert("webXML.insertWebXMLInfo", webXMLInfo);
	}

	@Override
	public void updateWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException {
		this.client.insert("webXML.updateWebXMLInfo", webXMLInfo);
	}

	@Override
	public IbatisVO getIbatisInfo(String pr_no) throws SQLException {
		return (IbatisVO) this.client.queryForObject("ibatis.ibatisInfo", pr_no);
	}
	@Override
	public QuartzVO getQuartzInfo(String pr_no) throws SQLException {
		return (QuartzVO) this.client.queryForObject("quartz.quartzInfo", pr_no);
	}
	@Override
	public ViewResolverVO getViewResolverInfo(String pr_no) throws SQLException {
		return (ViewResolverVO) this.client.queryForObject("viewResolver.viewResolverInfo", pr_no);
	}

	@Override
	public void insertSpringInfo(IbatisVO iBatisInfo,
			QuartzVO quartzInfo, ViewResolverVO viewResolverInfo)
			throws SQLException {
		this.client.insert("ibatis.insertIbatisInfo", iBatisInfo);
		this.client.insert("viewResolver.insertViewResolverInfo", viewResolverInfo);
		
		if(quartzInfo.getQuartzCkb()!=null){
			this.client.insert("quartz.insertQuartzInfo", quartzInfo);
		}
		
	}
	
	@Override
	public void updateSpringInfo(IbatisVO iBatisInfo,
			QuartzVO quartzInfo, ViewResolverVO viewResolverInfo)
			throws SQLException {
		String pr_no = quartzInfo.getPr_no();
		this.client.update("viewResolver.updateViewResolverInfo", viewResolverInfo);
		this.client.update("ibatis.updateIbatisInfo", iBatisInfo);
		
		if(quartzInfo.getQuartzCkb()!=null){
			if(this.client.queryForObject("quartz.quartzInfo", pr_no)==null){
				this.client.insert("quartz.insertQuartzInfo", quartzInfo);
			}else{
				this.client.update("quartz.updateQuartzInfo", quartzInfo);
			}
		}else{
			 if(this.client.queryForObject("quartz.quartzInfo", pr_no)!=null){
				 this.client.delete("quartz.deleteQuartzInfo", pr_no);
			 }
		}
	}
}
