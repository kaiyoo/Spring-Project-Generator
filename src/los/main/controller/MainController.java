package los.main.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import los.member.service.IMemberService;
import los.sendmail.MailMessageBean;
import los.sendmail.SendMail;
import los.vo.MemberVO;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 1. 패키지명 : los.controller.main
 * 2. 타입명 : MainController.java
 * 3. 작성일 : 2015. 11. 30. 오후 4:38:59
 * 4. 작성자 : "안정원"
 * 5. 설명 : 메인 기능 구현(로그인/아웃, ID/PW찾기)
 */
@Controller
@RequestMapping("/main/")
public class MainController {
	
	@Autowired
	private IMemberService service;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	
	/**
	 * 1. 메소드명 : mainPage
	 * 2. 작성일 : 2015. 11. 30. 오후 4:41:05
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 메인페이지
	 */
	@RequestMapping("index")
    private ModelAndView mainPage(ModelAndView view) {
        view.setViewName("index");
        return view;
    }
	
	
	/**
	 * 1. 메소드명 : logout
	 * 2. 작성일 : 2015. 11. 30. 오후 4:42:10
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 로그아웃 기능 구현
	 */
	@RequestMapping("logout")
	public String logout() {
		
		//저장된 세션 삭제
		request.getSession().removeAttribute("LOGIN_MEMBERINFO");
		return "redirect:/main/index.do";
	}
	
	
	/**
	 * 1. 메소드명 : loginCheck
	 * 2. 작성일 : 2015. 11. 30. 오후 4:43:17
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 로그인 체크 기능 구현
	 */
	@RequestMapping(value="loginCheck")
	@ResponseBody
	private String loginCheck(@RequestParam String mem_id , @RequestParam String mem_pass) throws SQLException, IOException {
		
		//요청받은 mem_id값과 mem_pass값 Map에 저장.
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);

		//DB에 저장된 회원정보와 비교.
		MemberVO memberInfo = this.service.getMemberInfo(params);
		
		String jsonData = "";
		
		//중복된 회원정보가 없으면(memberInfo == null) 회원X.
		ObjectMapper mapper = new ObjectMapper();
		if (memberInfo != null) {
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			jsonData = mapper.writeValueAsString(memberInfo);
		} else {
			Map<String, String> target = new HashMap<String, String>();
			target.put("flag", "true");
			jsonData = mapper.writeValueAsString(target);
		}
		return jsonData;
	}
	
	
	/**
	 * 1. 메소드명 : findId
	 * 2. 작성일 : 2015. 11. 30. 오후 4:43:45
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : ID찾기 기능 구현
	 */
	@RequestMapping("findID")
	@ResponseBody
	private String findId(String mem_mail) throws JsonGenerationException, JsonMappingException, IOException, SQLException {
		
		//요청받은 mem_mail값 Map에 저장.
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_mail", mem_mail);
		
		//DB에 저장된 회원정보와 비교.
		MemberVO memeberInfo = this.service.getMemberInfo(params);

		Map<String, String> target = new HashMap<String, String>();
		
		//중복된 정보가 없으면 rtn값 true로 저장.
		if (memeberInfo == null) {
			target.put("rtn", "true");
			
		} else {
			target.put("mem_id",memeberInfo.getMem_id());
			target.put("rtn", "false");
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(target);

		return jsonData;
	}
	
	
	/**
	 * 1. 메소드명 : findPW
	 * 2. 작성일 : 2015. 11. 30. 오후 4:44:06
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : PW찾기 기능 구현(이메일 발송)
	 */
	@RequestMapping("findPW")
	@ResponseBody
	private String findPW(String mem_mail) throws SQLException, JsonGenerationException, JsonMappingException, IOException {
		
		//SendMail객체 생성.
		SendMail sendMail = new SendMail();
		
		//메일 인증정보 호출.
		sendMail.mailSendingEnvironment();
		
		//mem_mail값 저장.
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_mail", mem_mail);
		
		//DB에 저장된 회원정보와 비교
		MemberVO memberInfo = this.service.getMemberInfo(params);
		
		Map<String, String> target = new HashMap<String, String>();
		
		//중복된 정보가 있으면 rtn값 true로 저장.
		if (memberInfo != null) {
			target.put("rtn", "true");
			MailMessageBean msgBean = new MailMessageBean();
			msgBean.setSenderID("anjungwon93@gmail.com");                                           //보낼이메일 주소.                         
			msgBean.setSenderPwd("ads931958");                                                      //보낼이메일 주소 패스워드.                    
			msgBean.setSenderName("관리자");                                                        //보낼이메일 이름.                             
			msgBean.setSubject("[LOS]비밀번호 확인 메일 입니다.");                                  //이메일 제목.                                
			msgBean.setContent("회원님의 비밀번호는 \"" + memberInfo.getMem_pass() +"\" 입니다. "); //이메일 내용.                              
			msgBean.setReceiverEmail(mem_mail);                                                     //받을메일 주소.(ajax로 받은 mem_mail값 넣어줌.) 
			sendMail.mailSending(msgBean);                                                          //msgBean정보를 담아서 SendMail로 보냄.      
		} else {
			target.put("rtn", "false");
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(target);
		
		return jsonData;
	}
	
}
