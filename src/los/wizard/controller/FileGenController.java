package los.wizard.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import los.vo.DBVO;
import los.vo.GenVO;
import los.vo.ProjectVO;
import los.vo.UserTableVO;
import los.wizard.service.IGenService;
import los.wizard.service.IMavenService;
import los.wizard.service.IProjectService;
import los.wizard.service.ISpringService;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/wizard/")
public class FileGenController {

	 @Autowired
	 private  HttpSession session;
	 @Autowired
	 private HttpServletRequest request;
	 @Autowired 
	 private IProjectService projectService;
	 @Autowired
	 private IMavenService mavenService;
	 @Autowired
	 private ISpringService  springService;
	 @Autowired
	 private IGenService genSerive;
	 
	 
	public static final String TEMPLATE_PATH = "/los/template/";   //vm 파일들 저장된 곳
	
	@RequestMapping("createFile")
	private ModelAndView ssibal(ModelAndView view) throws SQLException,
			IOException {
		String srcPath = "D:/veloTest/";

		// String pr_no = (String) session.getAttribute("pr_no");
		String pr_no = "4";
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_no", pr_no);
		

		ProjectVO projectInfo = this.projectService.getProjectInfo(params);
		String pr_name = projectInfo.getPr_name();
		String pr_pkg_nm =projectInfo.getPr_pkg_nm();
//		if (projectInfo != null) {
//			Map<String, Object> prMap = new HashMap<String, Object>();
//			prMap.put("pr_name", pr_name);
//			srcPath += pr_name;
//			this.diretoryFile(srcPath);
//			List<String> prNames = new ArrayList<String>();
//			prNames.add(".project.vm");
//			prNames.add(".classpath.vm");
//			List<String> settingNames = new ArrayList<String>();
//			settingNames.add("org.eclipse.wst.common.component.vm");
//			settingNames
//					.add("org.eclipse.wst.common.project.facet.core.xml.vm");
//			settingNames.add("org.eclipse.wst.jsdt.ui.superType.container.vm");
//			settingNames.add("org.eclipse.wst.jsdt.ui.superType.name.vm");
//			settingNames.add("org.eclipse.jdt.core.prefs.vm");
//			for (String prName : prNames) {
//				this.setTemplate(prName, srcPath, prMap);
//			}
//			this.diretoryFile(srcPath + "/.setting");
//			for (String settingName : settingNames) {
//				this.setTemplate(settingName, srcPath + "/.setting", prMap);
//			}
//			this.diretoryFile(srcPath + "/res");
//			this.diretoryFile(srcPath + "/conf");
//			this.diretoryFile(srcPath + "/doc");
//			this.diretoryFile(srcPath + "/WebContent");
//			this.diretoryFile(srcPath + "/WebContent/META-INF");
//			this.diretoryFile(srcPath + "/WebContent/WEB-INF");

//			List<MavVO> mavenRepoList = this.mavenService.getMavenList(params);
//			List<LibsVO> mavenJarList = this.mavenService.getJarList(params);
//				Map<String, Object> mavMap = new HashMap<String, Object>();
//				mavMap.put("repoList", mavenRepoList);
//				mavMap.put("jarList", mavenJarList);
//				String vmName = "pom.xml.vm";
//				setTemplate(vmName, srcPath, mavMap);
//
//			WebXMLVO webxmlInfo = this.springService.getWebXMLInfo(params);
//				vmName = "web.xml.vm";
//				Map<String, Object> webMap = new HashMap<String, Object>();
//				webMap.put("pr_ctx_conf_fld", webxmlInfo.getPr_ctx_conf_fld());
//				webMap.put("pr_ctx_conf_file", webxmlInfo.getPr_ctx_conf_file());
//				webMap.put("pr_svlt_fld", webxmlInfo.getPr_svlt_fld());
//				webMap.put("pr_svlt_file", webxmlInfo.getPr_svlt_file() );
//				webMap.put("pr_url_ptrn", webxmlInfo.getPr_url_ptrn());
//				webMap.put("pr_session_time", webxmlInfo.getPr_session_time() );
//				setTemplate(vmName, srcPath+"/WebContent/WEB-INF/", webMap);
//				
//				
//				
//			
//			IbatisVO ibatisInfo = this.springService.getIbatisInfo(pr_no);
//			// rootContext/
//			String rootPath = srcPath+"/WebContent/WEB-INF/" + webxmlInfo.getPr_ctx_conf_fld() + "/";
//			String servletPath = srcPath+"/WebContent/WEB-INF/"  + webxmlInfo.getPr_svlt_fld() + "/"; 
//			this.diretoryFile(rootPath);
//			this.diretoryFile(servletPath);
//			 // rootContext/application
//			rootPath += webxmlInfo.getPr_ctx_conf_file();   
//			if (ibatisInfo != null) {
//			
//				Map<String, Object> ibatisMap = new HashMap<String, Object>();
//				ibatisMap.put("xml_ibatis", "");
//				vmName = "xml.vm";
//				if (ibatisInfo.getPr_ibatis_type().equals("jndi")) {
//					ibatisMap.put("jndi", "");
//				}
//
//				if (ibatisInfo.getPr_ibatis_type().equals("dbcp")) {
//					Map<String, Object> propertiesMap = new HashMap<String, Object>();
//					ibatisMap.put("dbcp", "");
//					propertiesMap.put("xml_properties", "");
//					this.setTemplate(vmName, rootPath + "-properties", propertiesMap);
//				}
//				
//				this.setTemplate(vmName, rootPath+"-ibatis", ibatisMap);
//			}
//
//			QuartzVO quartzInfo = this.springService.getQuartzInfo(pr_no);
//			if (quartzInfo != null) {
//				Map<String, Object> quartzMap = new HashMap<String, Object>();
//				quartzMap.put("xml_quartz", "");
//				quartzMap.put("cron_ex", quartzInfo.getPr_quar_expsn().split("_")[2]);
//				quartzMap.put("clz_nm", quartzInfo.getPr_quar_cls_nm());
//				quartzMap.put("clz_path", quartzInfo.getPr_quar_cls_path());
//				this.setTemplate(vmName, rootPath + "-quartz", quartzMap);
//			}
//
//			ViewResolverVO viewResolverInfo = this.springService.getViewResolverInfo(pr_no);
//			if (viewResolverInfo != null) {
//				List<String> viewPaths = new ArrayList<String>();
//				List<Map<String, Object>> viewResolverMaps = new ArrayList<Map<String, Object>>();
//				Map<String, Object> viewMap = new HashMap<String, Object>();
//				viewPaths.add(rootPath + "-viewresolver");
//				viewMap.put("xml_viewResolver", "");
//				if (viewResolverInfo.getPr_reslv_inter_yn().equals("Y")) {
//					viewMap.put("prefix", viewResolverInfo.getPr_reslv_pre());
//					viewMap.put("suffix", viewResolverInfo.getPr_reslv_suf());
//				}
//				if (viewResolverInfo.getPr_reslv_file_yn().equals("Y")) {
//					viewMap.put("beanNameView", "");
//					this.diretoryFile(srcPath + "/res/los");
//					this.diretoryFile(srcPath + "/res/los/utils");
//					this.setTemplate("downloadView.java.vm", srcPath + "/res/los/utils/", viewMap);
//				}
//				if (viewResolverInfo.getPr_reslv_tiles_yn().equals("Y")) {
//					this.diretoryFile(srcPath + "/WebContent/WEB-INF/tiles/");
//					Map<String, Object> defMap = new HashMap<String, Object>();
//					Map<String, Object> configMap = new HashMap<String, Object>();
//					viewMap.put("tilesView", "");
//					configMap.put("xml_tiles_config", "");
//					defMap.put("xml_tiles_def", "");
//					viewPaths.add(rootPath + "-tiles");
//					viewPaths.add(srcPath + "/WebContent/WEB-INF/tiles/tiles-def");
//					viewResolverMaps.add(configMap);
//					viewResolverMaps.add(defMap);
//					
//				}
//				
//				viewResolverMaps.add(viewMap);
//				
//				for (int i = 0; i < viewPaths.size(); i++) {
//					this.setTemplate(vmName, viewPaths.get(i), viewResolverMaps.get(i));
//				}
//
//			}
//			for (GenVO genVO : generatorList) {
//		         if(genVO.getPr_dao_yn().equals("Y")){
//		            파일을 만든다
//		         }
//		         if(genVO.getCreateTblList().)
//		      }      
//		      
//		}
			
			List<GenVO> genList = this.genSerive.getCreateTblList(params);
			
			for (GenVO genInfo : genList) {
				String methodName = genInfo.getPr_tbl_nm().toLowerCase();
				String bizName = methodName.substring(0, 1).toUpperCase()+methodName.substring(1);
				//dao
				if(genInfo.getPr_dao_yn().equals("Y")){
					List<String> vmNameList = new ArrayList<String>();
					vmNameList.add("dao.vm");
					vmNameList.add("daoImpl.vm");
					Map<String, Object> daoMap = new HashMap<String, Object>();
//					String pr_tbl_nm = genInfo.getPr_tbl_nm().substring(0, 1).toUpperCase()+genInfo.getPr_tbl_nm().substring(1);
					daoMap.put("bizName", bizName);
					daoMap.put("methodName",methodName);   
					daoMap.put("packageName", pr_pkg_nm);
			        for(String vmName : vmNameList){
			        	this.setTemplate(vmName, srcPath, daoMap);
			        }
				}
				//service
				if(genInfo.getPr_svc_yn().equals("Y")){
					List<String> vmNameList = new ArrayList<String>();
					vmNameList.add("service.vm");
					vmNameList.add("serviceImpl.vm");
					Map<String, Object> serviceMap = new HashMap<String, Object>();
					serviceMap.put("bizName", bizName);
					serviceMap.put("methodName",methodName);   
					serviceMap.put("packageName", pr_pkg_nm);
					for(String vmName : vmNameList){
				       	this.setTemplate(vmName, srcPath, serviceMap);
				      }
				}
				//controller
				if(genInfo.getPr_ctr_yn().equals("Y")){
						String table_name = genInfo.getPr_tbl_nm();
						List<String> pk_column_List = new ArrayList<String>();
						
						Map<String, String> tableParam = new HashMap<String, String>();
						tableParam.put("table_name", table_name);
						
						DBVO dbInfo = this.genSerive.getUserInfo(params);
						
						
						List<UserTableVO> userTableList = genSerive.getPkTableList(tableParam, dbInfo);
						for(UserTableVO userTableInfo : userTableList){
							pk_column_List.add(userTableInfo.getColumn_name().toLowerCase());
						}
						
						String vmName = "controller.vm";
						
						Map<String, Object> ctrMap = new HashMap<String, Object>();
						ctrMap.put("bizName", bizName);
						ctrMap.put("methodName",methodName);
						ctrMap.put("pk_column_List", pk_column_List);
						ctrMap.put("packageName", pr_pkg_nm);
					    this.setTemplate(vmName, srcPath, ctrMap);
				}
				//xml
				if(genInfo.getPr_xml_yn().equals("Y")){
					Map<String, String> tableParam = new HashMap<String, String>();
					tableParam.put("table_name", genInfo.getPr_tbl_nm());
					
					
					DBVO dbInfo = this.genSerive.getUserInfo(params);
					List<UserTableVO> userTableList = genSerive.getCreateTableColList(tableParam, dbInfo);
					List<String> varList = new ArrayList<String>();
					List<String> colList =  new ArrayList<String>();
					int count = 0;
					for (UserTableVO userTableInfo : userTableList) {
						varList.add(userTableInfo.getColumn_name().toLowerCase());
						colList.add(userTableInfo.getColumn_name().toUpperCase());
						count++;
					}
					
					String vmName = "xml.vm";
					Map<String, Object> xmlMap = new HashMap<String, Object>();
					xmlMap.put("bizName", bizName);
					xmlMap.put("methodName",methodName);   
					xmlMap.put("packageName", pr_pkg_nm);
					xmlMap.put("tableName", methodName.toUpperCase());
					xmlMap.put("count", count-1);
					xmlMap.put("colList", colList);
					xmlMap.put("varList", varList);
					//xmlMap.put(key, value)
				    this.setTemplate(vmName, srcPath, xmlMap);
				}
				
				// VO
	            if(genInfo.getPr_vo_yn().equals("Y")){
	               String table_name = genInfo.getPr_tbl_nm();
	               
	               List<String> user_col = new ArrayList<String>();
	               List<String> user_col_up = new ArrayList<String>();
	               
	               Map<String, String> columnParam = new HashMap<String, String>();
	               columnParam.put("table_name", table_name);
	               
	               DBVO dbInfo = this.genSerive.getUserInfo(params);
	               
	               List<UserTableVO> userColumnList = genSerive.getColumnList(columnParam, dbInfo);
//	               List<UserTableVO> userColumnListLow = genSerive.getColumnList(params, dbInfo);
	               int count = 0;
	               for (UserTableVO userColumnInfo : userColumnList) {
	                  user_col.add(userColumnInfo.getColumn_name().toLowerCase());
	                  user_col_up.add(userColumnInfo.getColumn_name().substring(0,1).toUpperCase()+userColumnInfo.getColumn_name().substring(1).toLowerCase());
	                  count++;
	               }

	               String vmName = "vo.vm";
	               
	               Map<String, Object> voMap = new HashMap<String, Object>();
	               voMap.put("packageName", pr_pkg_nm);
	               voMap.put("bizName", bizName);
	               voMap.put("user_col", user_col);
	               voMap.put("user_col_up", user_col_up);
	               voMap.put("count", count-1);
	               this.setTemplate(vmName, srcPath, voMap);
	            }
				
				
			}
			
			
			
			
		view.setViewName("redirect:/wizard/wizardG.do");
		return view;
	}
	
	
	private void setTemplate(String vmName, String srcpath, Map<String, Object> params) throws IOException{
		 VelocityEngine ve = new VelocityEngine();
	     ve.setProperty("resource.loader", "classpath");
	     ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
	     ve.setProperty("input.encoding", "UTF-8");
	     VelocityContext context = new VelocityContext(params);
	     ve.init();
		
	     Template t = ve.getTemplate(TEMPLATE_PATH + vmName);
	     vmName = vmName.split(".vm")[0];
	     if(vmName.intern()== "spring"){
	    	 vmName = ".xml";
	     }else if(vmName.intern()=="dao"){
	    	vmName =params.get("bizName")+"dao.java";
	     }else if(vmName.intern()=="daoImpl"){
	    	 vmName =params.get("bizName")+"daoImpl.java";
	     }else if(vmName.intern()=="service"){
		    vmName =params.get("bizName")+"service.java";
		 }else if(vmName.intern()=="serviceImpl"){
		     vmName =params.get("bizName")+"serviceImpl.java";
		 }else if(vmName.intern()=="controller"){
			 vmName = params.get("bizName")+"controller.java";
		 }else if(vmName.intern()=="xml"){
			 vmName = params.get("bizName")+".xml";
		 }else if(vmName.intern()=="vo"){
			 vmName = params.get("bizName")+"vo.java";
		 }
    	 String fileName = srcpath + vmName; 
    	     	 
    	 BufferedWriter bw = new BufferedWriter(new FileWriter(fileName));
    	 t.merge(context, bw);
    	 bw.flush();
    	 bw.close();
		
	}
	
	private void diretoryFile(String path){
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
	}
	
	
}
