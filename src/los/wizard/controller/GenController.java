package los.wizard.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import los.ibatis.config.DBConnection;
import los.vo.DBVO;
import los.vo.GenVO;
import los.vo.UserTableVO;
import los.wizard.service.IGenService;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/wizard/")
public class GenController {
	
	@Autowired
	private DBConnection connection;
	@Autowired
	private IGenService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	 
	
	@RequestMapping("wizardG")
	private ModelAndView wizardM2(ModelAndView view) throws SQLException {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("pr_no", (String) session.getAttribute("pr_no"));
		
		List<GenVO> GenList = this.service.getCreateTblList(params);
		
		if(GenList != null){
			view.addObject("GenList", GenList);
		}
		view.setViewName("wizard/wizardG");
		return view;
	}
	
	
	// Table List 肉뚮젮二쇰뒗 遺�遺�
		@RequestMapping(value="tableList")
		@ResponseBody
		private String getTableList(DBVO userDBInfo) throws SQLException, JsonGenerationException, JsonMappingException, IOException{
			
			List<UserTableVO> list = service.getTableList(userDBInfo);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonData = mapper.writeValueAsString(list);
			
			return jsonData;
		}
	
//commented on 31/10/17 due to lack of database instance
/*	@RequestMapping("insertGenInfo")
	private ModelAndView insertGenInfo(ModelAndView view ,GenVO createTbInfo, String pr_no) throws SQLException{
		this.connection.changeAdminConnection();
		String prNo = "";
		for (GenVO tbInfo : createTbInfo.getCreateTblList()) {
			if(tbInfo.getYn_chk_tbl() != ""){
				prNo = request.getParameter("pr_no");
				tbInfo.setPr_no(request.getParameter("pr_no"));
				this.service.insertGenInfo(tbInfo);
			}
		}
		createTbInfo.getCreateTblList();
		
//		view.addObject("pr_no", prNo);
//		view.addObject("createTbInfo", createTbInfo);

		view.setViewName("redirect:/wizard/createFile.do");
		
		return view;
		
	}*/
	
	
	// Table �깮�꽦�떆 fk Select Box Table遺�遺�
	@RequestMapping("createTableList")
	@ResponseBody
	private String tableInfoList(DBVO userDBInfo, String tblType) throws SQLException, JsonGenerationException, JsonMappingException, IOException{

		List<UserTableVO> tableList = new ArrayList<UserTableVO>();
		
		tableList = this.service.getCreateTableList(tblType, userDBInfo);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(tableList);
		return jsonData;
	}
	
	
	// Table �깮�꽦�떆 fk Select Box Column遺�遺�
	@RequestMapping("createColumnList")
	@ResponseBody
	private String columnInfoList(String loadColumnList,
			DBVO userDBInfo) throws SQLException, JsonGenerationException, JsonMappingException, IOException{
		
		List<UserTableVO> colList = new ArrayList<UserTableVO>();
		
		colList = this.service.loadColList(loadColumnList, userDBInfo);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(colList); 
		return jsonData;
	}
	
	
	//Modal李� �뀒�씠釉� �깮�꽦 (Create Button)
	@RequestMapping("createTableInfo")
	@ResponseBody
	private void createTable(DBVO userDBInfo,
			String addQue, String columnList) throws SQLException{
		
		System.out.println(addQue+columnList);
		this.service.createTable(addQue+columnList, userDBInfo);
	}
	
	
	
//	//velocity
//	
//	@RequestMapping("GeneratorTblInfo")
//	private ModelAndView GeneratorTblInfo(ModelAndView view,GenVO createTbInfo,String pr_no) throws SQLException {
//		System.out.println(pr_no);
//		System.out.println(createTbInfo);
//		
//		
//		
////		Map<String, String> params = new HashMap<String, String>();
////		params.put("pr_no", pr_no);
//		
////		for (GenVO tbInfo : createTbInfo.getCreateTblList()){
////			if(genInfo.getPr_tbl_nm() != null){
////				this.service.getCreateTblList(params);
////			}
////		}
//		
////		view.addObject("pr_no", pr_no);
//		view.addObject("createTbInfo", createTbInfo);
//		view.setViewName("redirect:/wizard/createFile.do");		
//		return view;
//	} 
	
}