package los.wizard.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import los.vo.IbatisVO;
import los.vo.QuartzVO;
import los.vo.ViewResolverVO;
import los.vo.WebXMLVO;
import los.wizard.service.ISpringService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/wizard/")
public class SpringController {
	@Autowired
	private ISpringService service;
	@Autowired
	private HttpSession session;

	
	/**
	 * 1. 메소드명 : getWizardS1
	 * 2. 작성일 : 2015. 12. 16. 오전 9:22:27
	 * 3. 작성자 : "Yang Jaeryeon"
	 * 4. 설명 : web.xml 
	 * @param view
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("wizardS1")
	private ModelAndView getWizardS1(ModelAndView view) throws SQLException{
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_no", (String) session.getAttribute("pr_no"));
		
		WebXMLVO webXMLInfo = this.service.getWebXMLInfo(params);
		
		if(webXMLInfo != null) {
			view.addObject("webXMLInfo", webXMLInfo);
		}
		
		view.setViewName("wizard/wizardS1");
		
		return view;
	}
	
	
	/**
	 * 1. 메소드명 : insertWebXMLInfo
	 * 2. 작성일 : 2015. 12. 16. 오전 9:22:52
	 * 3. 작성자 : "Yang Jaeryeon"
	 * 4. 설명 : web.xml 등록
	 * @param webXMLInfo
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("insertWebXMLInfo")
	private String insertWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException {
		
		webXMLInfo.setPr_no((String) session.getAttribute("pr_no"));
		
		this.service.insertWebXMLInfo(webXMLInfo);
		
		System.out.println("==================");
		System.out.println("insertWebXMLInfo");
		System.out.println("==================");
		
		return "redirect:/wizard/wizardS3.do";
	}
	
	
	/**
	 * 1. 메소드명 : updateWebXMLInfo
	 * 2. 작성일 : 2015. 12. 16. 오전 9:23:01
	 * 3. 작성자 : "Yang Jaeryeon"
	 * 4. 설명 : web.xml 수정
	 * @param webXMLInfo
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("updateWebXMLInfo")
	private String updateWebXMLInfo(WebXMLVO webXMLInfo) throws SQLException {
		
		webXMLInfo.setPr_no((String) session.getAttribute("pr_no"));
		
		this.service.updateWebXMLInfo(webXMLInfo);
		
		System.out.println("==================");
		System.out.println("updateWebXMLInfo");
		System.out.println("==================");
		
		return "redirect:/wizard/wizardS3.do";
	}
	
	
	/**
	 * 1. 메소드명 : wizardS2
	 * 2. 작성일 : 2015. 12. 12. 오후 11:11:11
	 * 3. 작성자 : 유홍상
	 * 4. 설명 :  wizardS2 페이지로 이동
	 */
	@RequestMapping("wizardS2")
	private ModelAndView getWizardS2(ModelAndView mav) throws SQLException{
		String pr_no = "4";
//		String pr_no = (String) session.getAttribute("pr_no");
		ViewResolverVO vwResolverInfo = this.service.getViewResolverInfo(pr_no);
		QuartzVO quartzInfo =  this.service.getQuartzInfo(pr_no);
		IbatisVO ibatisInfo =  this.service.getIbatisInfo(pr_no);
		
		mav.addObject("vwResolverInfo", vwResolverInfo);
		mav.addObject("quartzInfo", quartzInfo);
		mav.addObject("ibatisInfo", ibatisInfo);
		mav.setViewName("wizard/wizardS2");
		
		return mav;
	}
	
	
	/**
	 * 1. 메소드명 : insertSpringInfo
	 * 2. 작성일 : 2015. 12. 12. 오후 11:11:30
	 * 3. 작성자 : 유홍상
	 * 4. 설명 :  S3화면에서 다음 화면으로 넘어갈 때 ibatis, quartz, viewResolver 테이블에 정보가 없을 시 인서트
	 */
	@RequestMapping("insertSpringInfo") //모두 인서트 탈때
	private String insertSpringInfo(IbatisVO iBatisInfo, 
								QuartzVO quartzInfo, 
								ViewResolverVO vwResolverInfo) throws SQLException{
		String pr_no = "4";
//		String pr_no = (String) session.getAttribute("pr_no");
		iBatisInfo.setPr_no(pr_no);
		quartzInfo.setPr_no(pr_no);
		vwResolverInfo.setPr_no(pr_no);
		this.service.insertSpringInfo(iBatisInfo, quartzInfo, vwResolverInfo);
				
		return "redirect:/wizard/wizardG.do";
	}
	
	
	/**
	 * 1. 메소드명 : insertSpringInfo
	 * 2. 작성일 : 2015. 12. 12. 오후 11:14:30
	 * 3. 작성자 : 유홍상
	 * 4. 설명 :  S3화면에서 다음 화면으로 넘어갈 때 ibatis, quartz 정보가 있을 시 업데이트하고
	 * 			쿼츠의 인서트, 업데이트, 삭제 여부는 dao에서 처리
	 */
	@RequestMapping("updateSpringInfo") 
	private String updateSpringInfo(IbatisVO iBatisInfo, 
								QuartzVO quartzInfo, 
								ViewResolverVO vwResolverInfo) throws SQLException{
		String pr_no = "4";
//		String pr_no = (String) session.getAttribute("pr_no");
		iBatisInfo.setPr_no(pr_no);
		quartzInfo.setPr_no(pr_no);
		vwResolverInfo.setPr_no(pr_no);
		this.service.updateSpringInfo(iBatisInfo, quartzInfo, vwResolverInfo);

		return "redirect:/wizard/wizardG.do";
	}	
	

	
}
	

