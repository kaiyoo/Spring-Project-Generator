package los.management.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import los.management.service.IGroupService;
import los.utils.PagingUtil;
import los.vo.GroupVO;
import los.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/management/")
public class GroupController {
	
	@Autowired
	private IGroupService groupService;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("groupForm")
	private ModelAndView groupForm(ModelAndView view) {
		
		view.setViewName("management/group/groupForm");
		return view;
	}

	@RequestMapping("groupList")
	private ModelAndView groupList(ModelAndView view) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("group_status", "Y");
		
		int totalCount = this.groupService.getTotalGroupCount(params);
		
		int currentPage;
		if(request.getParameter("currentPage") == null){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//한페이지 당 게시물의 수
		int blockCount = 10;
		//표시할 페이지
		int blockPage = 5;
		String pagingHtml;
		
		PagingUtil pageUtil = new PagingUtil(currentPage, totalCount, blockCount, blockPage, request);
		params.put("start_count", String.valueOf(pageUtil.getStartCount()));
		params.put("end_count", String.valueOf(pageUtil.getEndCount()));
		
		List<GroupVO> groupList = this.groupService.getGroupList(params);
		pagingHtml = pageUtil.getPageHtml().toString();
		
		view.addObject("groupList", groupList);
		view.addObject("pagingHtml", pagingHtml);
		view.setViewName("management/group/groupList");
		
		return view;
	}
	
	@RequestMapping("insertGroupInfo")
	private ModelAndView insertGroupInfo(ModelAndView view, GroupVO groupInfo) throws SQLException {
		this.groupService.insertGroupInfo(groupInfo);
		view.setViewName("redirect:/management/groupList.do");
		return view;
	}
	
	
	@RequestMapping("deleteAllGroupInfo")
	private ModelAndView deleteAllGroupInfo(ModelAndView view, String grp_no) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		
		String[] deleteGroupInfo = grp_no.split(",");
		
		for(String deleteGrp_no : deleteGroupInfo){
			params.put("grp_no", deleteGrp_no);
			groupService.deleteAllGroupInfo(params);
		}
		
		view.setViewName("redirect:/management/groupList.do");
		return view;
		
	}
	
	
	@RequestMapping("projectList")
	private ModelAndView getProjectList(ModelAndView mav, String grp_no, String grp_writer) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		params.put("grp_no", grp_no);
		GroupVO groupInfo = this.groupService.getGroupInfo(params);
		List<ProjectVO> projectList= this.groupService.getProjectList(grp_writer);
		mav.addObject("groupInfo", groupInfo);
		mav.addObject("projectList", projectList);
		mav.setViewName("management/group/projectList");		
		
		return mav;
	}

	

}























