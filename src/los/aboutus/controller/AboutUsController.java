package los.aboutus.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import los.board.service.IBoardService;
import los.member.service.IMemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/aboutus/")
public class AboutUsController {
	
	@Autowired
	private IMemberService service;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ServletContext application;
	
	
//	@RequestMapping("aboutUs")
//	private ModelAndView aboutUs(ModelAndView view){
//		view.setViewName("about-us");
//		return view;
//	}
	
	@RequestMapping("about-us")
	private String getAboutUs(){
		return "aboutus/about-us";
	}
	
}