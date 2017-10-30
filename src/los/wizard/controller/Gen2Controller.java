package los.wizard.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import los.vo.DBVO;
import los.vo.UserTableVO;
import los.wizard.service.IGen2Service;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/wizard/")
public class Gen2Controller {
	
	@Autowired
	private IGen2Service service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("wizardG2")
	private String getWizardG(){
		return "wizard/wizardG2";
	}

	// Table 생성시 fk Select Box Column부분
	@RequestMapping("getPkList")
	@ResponseBody
	private String getPkList(DBVO dbInfo, String table_name) throws JsonGenerationException, JsonMappingException, IOException, SQLException {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("table_name", table_name);
		
		List<UserTableVO> pkList = this.service.getPkList(dbInfo, params);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(pkList); 
		return jsonData;
	}
	
}