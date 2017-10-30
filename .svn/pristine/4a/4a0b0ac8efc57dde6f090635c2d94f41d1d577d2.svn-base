package los.wizard.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import los.vo.ProjectVO;
import los.wizard.service.IProjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/wizard/")
public class ProjectController {
	
	@Autowired
	private IProjectService projectService;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("wizardP1")
	private ModelAndView wizardP1(ModelAndView view,String pr_no) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_no", pr_no);
		ProjectVO projectInfo = null;
		if(pr_no != null){
			projectInfo = this.projectService.getProjectInfo(params);
		}
		if(projectInfo != null){
			view.addObject("projectInfo", projectInfo);
		}
		view.addObject("pr_no", pr_no);
		view.setViewName("wizard/wizardP1");
		return view;
	}
	
	@RequestMapping("insertWizardP1")
	private ModelAndView insertWizardP1(ModelAndView view , ProjectVO projectInfo) throws SQLException {
		projectInfo.setPr_grp_no("1");
		String pr_no = this.projectService.insertProjectInfo(projectInfo);
		session.setAttribute("pr_no", pr_no);
		view.addObject("pr_no",pr_no);
		view.setViewName("redirect:/wizard/wizardM1.do");
		return view;
	}
	@RequestMapping("updateWizardP1")
	private ModelAndView updateWizardP1(ModelAndView view , ProjectVO projectInfo) throws SQLException{
		this.projectService.updateProjectInfo(projectInfo);
		view.addObject("pr_no", session.getAttribute("pr_no"));
		view.setViewName("redirect:/wizard/wizardM1.do");
		return view;
	}
	
//	/**
//	 * 1. 메소드명 : wizardM1
//	 * 2. 작성일 : 2015. 12. 9. 오후 5:06:59
//	 * 3. 작성자 : "Jeong seokjune"
//	 * 4. 설명 :  wizard-M1 페이지로 이동
//	 * @param view
//	 * @param projectInfo
//	 * @return
//	 * @throws SQLException
//	 */
//	@RequestMapping("wizardM1")
//	private ModelAndView wizardM1(ModelAndView view,String pr_no) throws SQLException{
//		Map<String, String> params = new HashMap<String, String>();
//		params.put("pr_no", pr_no);
//		List<MavenInfoVO> mavenInfoList = new ArrayList<MavenInfoVO>();
//		if(mavenInfoList.size() != 0){
//			mavenInfoList = this.mavenService.getMavenList(params);
//			view.addObject("mavenInfoList", mavenInfoList);
//		}
//		view.addObject("pr_no",pr_no);
//		view.setViewName("wizard/wizardM1");
//		return view;
//	}
//	
//	@RequestMapping("insertMavenInfo")
//	private ModelAndView insertMavenInfo(ModelAndView view,MavenInfoVO mavenInfoList,String pr_no) throws SQLException{
//		for(MavenInfoVO mavenInfo : mavenInfoList.getMavenList()){
//			if(mavenInfo.getPr_mav_rep_id() != null){
//				this.mavenService.insertMavenInfo(mavenInfo);
//			}
//		}
//		view.addObject("pr_no", pr_no);
//		view.setViewName("redirect:/wizard/wizardM2.do");		
//		return view;
//	}
//	/**
//	 * 1. 메소드명 : wizardM2
//	 * 2. 작성일 : 2015. 12. 9. 오후 5:05:44
//	 * 3. 작성자 : "Jeong seokjune"
//	 * 4. 설명 :    MavenRepository Data 를 읽어와 insert 후 
//	 * 				wizard-M2 페이지로 이동
//	 * @param view
//	 * @param mavenInfoList
//	 * @return
//	 * @throws SQLException
//	 */
//	@RequestMapping("wizardM2")
//	private ModelAndView wizardM2(ModelAndView view,String pr_no) throws SQLException{
//		view.addObject("pr_no", pr_no);
//		view.setViewName("wizard/wizardM2");
//		return view;
//	}
	
	
	
//	@RequestMapping("wizardS1")
//	private String getWizardS1(){
//		return "wizard/wizard-S1";
//	}

}