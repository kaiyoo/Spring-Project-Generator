package los.wizard.controller;

import groovy.json.JsonException;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import los.vo.LibsVO;
import los.vo.MavVO;
//import los.vo.MavenInfoVO;
import los.wizard.service.IMavenService;
//import los.wizard.service.IMavenRepoService;





import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.codehaus.jackson.map.ObjectMapper;
import org.jfrog.artifactory.client.Artifactory;
import org.jfrog.artifactory.client.ArtifactoryClient;
import org.jfrog.artifactory.client.model.RepoPath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonMappingException;


@Controller
@RequestMapping("/wizard/")
public class MavenController {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private IMavenService service;
	@Autowired
	private HttpSession session;
	
	/**
	 * 1. 메소드명 : wizardM2
	 * 2. 작성일 : 2015. 12. 16. 오후 3:07:24
	 * 3. 작성자 : "안정원"
	 * 4. 설명 :
	 * @param view
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("wizardM2")
	private ModelAndView wizardM2(ModelAndView view) throws SQLException {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_no", (String) session.getAttribute("pr_no"));
		
		List<LibsVO> dependencyList = this.service.getJarList(params);
		
		if(dependencyList != null){
			view.addObject("dependencyList", dependencyList);
		}
		view.setViewName("wizard/wizardM2");
		return view;
	}
	
	/**
	 * 1. 메소드명 : searchJAR
	 * 2. 작성일 : 2015. 12. 16. 오후 3:07:36
	 * 3. 작성자 : "안정원"
	 * 4. 설명 :
	 * @param search
	 * @param jarBtnName
	 * @return
	 * @throws IOException
	 * @throws JsonException
	 * @throws JsonMappingException
	 */
	@RequestMapping("searchJAR")
	@ResponseBody
	private String searchJAR(String search, String jarBtnName) throws IOException, JsonException, JsonMappingException {
		String jsonData = "";
		String jarPath = null;
		
		Artifactory artifactory= ArtifactoryClient.create("http://192.168.202.135:8081/artifactory", "admin", "password");

		List<String> jarList = new ArrayList<String>();
		
		if(search != null) {
			List<RepoPath> jarPathes =  artifactory.searches().artifactsByName(search+"%jar").doSearch();
			for (RepoPath path : jarPathes) {
				System.out.println("Mine Path : "+path.getItemPath());
				jarPath = path.getItemPath();
				jarList.add(jarPath);
			}
		} else if(jarBtnName != null) {
			List<RepoPath> jarPathes =  artifactory.searches().artifactsByName(jarBtnName+"%jar").doSearch();
			for (RepoPath path : jarPathes) {
				System.out.println("Mine Path : "+path.getItemPath());
				jarPath = path.getItemPath();
				jarList.add(jarPath);
			}
		}
	    
		ObjectMapper mapper = new ObjectMapper();
		
		if (jarList != null) {
			jsonData = mapper.writeValueAsString(jarList);
		}
		
		return jsonData;
	}
	
	/**
	 * 1. 메소드명 : insertJarInfo
	 * 2. 작성일 : 2015. 12. 16. 오후 3:07:48
	 * 3. 작성자 : "안정원"
	 * 4. 설명 :
	 * @param view
	 * @param jarInfo
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	@RequestMapping("insertJarInfo")
	private ModelAndView insertJarInfo(ModelAndView view, LibsVO jarInfo) throws SQLException, IOException {
		List<LibsVO> jarsList  = new ArrayList<LibsVO>(); 	
		if(jarInfo.getJarList() != null){
		for (LibsVO getJarInfo : jarInfo.getJarList()) {
			if(getJarInfo.getPr_grp_id() != null){
				LibsVO insertJar = new LibsVO();
				
				String jarPathV = getJarInfo.getPr_grp_id().substring(0,getJarInfo.getPr_grp_id().lastIndexOf("/"));
				String jarPathA = jarPathV.substring(0,jarPathV.lastIndexOf("/"));
				
				insertJar.setPr_no((String) session.getAttribute("pr_no"));
				insertJar.setPr_grp_id(jarPathA.substring(0,jarPathA.lastIndexOf("/")).replaceAll("/", "."));
				insertJar.setPr_arft_id(jarPathA.substring(jarPathA.lastIndexOf("/")+1));
				insertJar.setPr_version(jarPathV.substring(jarPathV.lastIndexOf("/")+1));
				
				if(getJarInfo.getPr_prop_yn() == null) {
					insertJar.setPr_prop_yn("N");
				} else {
					insertJar.setPr_prop_yn("Y");
				}
				this.service.insertJarInfo(insertJar);
				jarsList.add(insertJar);
				} 
		}
//		velocity(jarsList);
		view.setViewName("redirect:/wizard/wizardS1.do");
	} else {
//		velocity();
		view.setViewName("redirect:/wizard/wizardS1.do");
	}
		return view;
	}
	
	/**
	 * 1. 메소드명 : updateJarInfo
	 * 2. 작성일 : 2015. 12. 16. 오후 3:07:58
	 * 3. 작성자 : "안정원"
	 * 4. 설명 :
	 * @param view
	 * @param jarInfo
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	@RequestMapping("updateJarInfo")
	private ModelAndView updateJarInfo(ModelAndView view, LibsVO jarInfo) throws SQLException, IOException {
		List<LibsVO> jarsList  = new ArrayList<LibsVO>(); 

		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_no", (String) session.getAttribute("pr_no"));
		this.service.deleteJarInfo(params);
		
		if(jarInfo.getJarList() != null){
		for (LibsVO getJarInfo : jarInfo.getJarList()) {
			if (getJarInfo.getPr_grp_id() != null){
				LibsVO insertJar = new LibsVO();
			
				String jarPathV = getJarInfo.getPr_grp_id().substring(0,getJarInfo.getPr_grp_id().lastIndexOf("/"));
				String jarPathA = jarPathV.substring(0,jarPathV.lastIndexOf("/"));
			
				insertJar.setPr_no((String) session.getAttribute("pr_no"));
				insertJar.setPr_grp_id(jarPathA.substring(0,jarPathA.lastIndexOf("/")).replaceAll("/", "."));
				insertJar.setPr_arft_id(jarPathA.substring(jarPathA.lastIndexOf("/")+1));
				insertJar.setPr_version(jarPathV.substring(jarPathV.lastIndexOf("/")+1));
			
				if (getJarInfo.getPr_prop_yn() == null) {
					insertJar.setPr_prop_yn("N");
				} else {
					insertJar.setPr_prop_yn("Y");
				}
				this.service.insertJarInfo(insertJar);
				jarsList.add(insertJar);
			} 
		}
//			velocity(jarsList);
			view.setViewName("redirect:/wizard/wizardS1.do");
		} else {
//			velocity();
			view.setViewName("redirect:/wizard/wizardS1.do");
		}
		return view;
	}
	
	/**
	 * 1. 메소드명 : wizardM1
	 * 2. 작성일 : 2015. 12. 9. 오후 5:06:59
	 * 3. 작성자 : "Jeong seokjune"
	 * 4. 설명 :  wizard-M1 페이지로 이동
	 * @param view
	 * @param projectInfo
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("wizardM1")
	private ModelAndView wizardM1(ModelAndView view) throws SQLException {
		Map<String, String> params = new HashMap<String, String>();
		String pr_no = (String) session.getAttribute("pr_no");
		params.put("pr_no", pr_no);
		List<MavVO> mavenInfoList = this.service.getMavenList(params);
		if(mavenInfoList.size() != 0){
			view.addObject("mavenInfoList", mavenInfoList);
		}
		view.addObject("pr_no",pr_no);
		view.setViewName("wizard/wizardM1");
		return view;
	}
	
	@RequestMapping("insertMavenInfo")
	private ModelAndView insertMavenInfo(ModelAndView view,MavVO mavenInfoList,String pr_no) throws SQLException {
		if(mavenInfoList.getMavenList() != null){
			for(MavVO mavenInfo : mavenInfoList.getMavenList()) {
				if(mavenInfo.getPr_mav_rep_id() != null) {
					this.service.insertMavenInfo(mavenInfo);
				}
			}
		}
		view.addObject("pr_no", pr_no);
		view.setViewName("redirect:/wizard/wizardM2.do");		
		return view;
	} 
	@RequestMapping("updateMavenInfo")
	private ModelAndView updateMavenInfo(ModelAndView view , MavVO mavenInfoList , String pr_no) throws SQLException {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_no", pr_no);
		List<MavVO> mavenList = this.service.getMavenList(params);
		if(mavenList.size() != 0){
			this.service.deleteMavenInfo(params);
			for(MavVO mavenInfo : mavenInfoList.getMavenList()){
				if(mavenInfo.getPr_mav_rep_id() != null){
					this.service.insertMavenInfo(mavenInfo);
				}
			}
		}	
		view.addObject("pr_no", pr_no);
		view.setViewName("redirect:/wizard/wizardM2.do");
		return view;
	}
	
	
}
