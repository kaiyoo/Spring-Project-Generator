package los.member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 1. 패키지명 : los.controller.member
 * 2. 타입명 : MemberController.java
 * 3. 작성일 : 2015. 11. 30. 오후 4:38:30
 * 4. 작성자 : "안정원"
 * 5. 설명 : 회원가입 기능 구현
 */
@RequestMapping("join")
@Controller
public class MemberController {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private IMemberService service;
	
	
	/**
	 * 1. 메소드명 : insertMemberInfo
	 * 2. 작성일 : 2015. 11. 30. 오후 4:35:20
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 회원가입
	 */
	@RequestMapping("insertMemberInfo")
	private String insertMemberInfo(MemberVO memberInfo) throws SQLException {
		
		//...?
		if (request.getMethod().equalsIgnoreCase("POST")) {
			this.service.insertMemberInfo(memberInfo);
			
			return "redirect:/main/index.do";
		} else {
			return "redirect:/main/index.do";
		}
	}
	
	
	/**
	 * 1. 메소드명 : idCheck
	 * 2. 작성일 : 2015. 11. 30. 오후 4:36:14
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 아이디 중복체크
	 */
	@RequestMapping("idCheck")
	@ResponseBody	//페이지 내에서 처리.
	private String idCheck(String mem_id) throws JsonGenerationException, JsonMappingException, IOException, SQLException {
		
		//mem_id값 가져와서 map에 저장.
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);

		//가져온 mem_id값과 DB에 저장된 회원정보 비교.
		MemberVO memeberInfo = this.service.getMemberInfo(params);
		
		Map<String, String> target = new HashMap<String, String>();
		
		//일치한 정보가 있는지 비교.
		if (memeberInfo == null) {
			
			//rtn값 저장.
			target.put("rtn", "true");
		} else {
			target.put("rtn", "false");
		}

		ObjectMapper mapper = new ObjectMapper();
		
		//jsonData에 데이터 저장해서 리턴.
		String jsonData = mapper.writeValueAsString(target);
		
		return jsonData;
	}
	
	
	/**
	 * 1. 메소드명 : emailCheck
	 * 2. 작성일 : 2015. 11. 30. 오후 4:36:54
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 이메일 인증
	 */
	@RequestMapping("emailCheck")
	@ResponseBody
	private String emailCheck(String mem_mail) throws SQLException, JsonGenerationException, JsonMappingException, IOException{
		
		
		//SendMail객체 생성.
		SendMail sendMail = new SendMail();
		
		//메일 인증정보 호출.
		sendMail.mailSendingEnvironment();
		
		//mem_mail값 저장.
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_mail", mem_mail);
				
		//DB에 저장된 회원정보와 비교
		MemberVO memberInfo = this.service.getMemberInfo(params);
		
		//4자리 랜던 인증코드담을 변수.
		int randomNumber = new Random().nextInt(9000) + 1000;
		
		//랜덤 인증코드 형변환.
		String randomNumber1 = Integer.toString(randomNumber);
		Map<String, String> target = new HashMap<String, String>();
		
		//인증코드값 조건처리해서 rtn값 넘겨줌.
		if (memberInfo == null) {
			target.put("rtn", "true");

			MailMessageBean msgBean = new MailMessageBean();
			msgBean.setSenderID("anjungwon93@gmail.com");						//보낼이메일 주소.
			msgBean.setSenderPwd("ads931958");									//보낼이메일 주소 패스워드.
			msgBean.setSenderName("관리자");									//보낼이메일 이름.
			msgBean.setSubject("[LOS]이메일인증 메일 입니다.");					//이메일 제목.
			msgBean.setContent("인증번호는 \"" + randomNumber +"\" 입니다. ");	//이메일 내용.
			msgBean.setReceiverEmail(mem_mail);									//받을메일 주소.(ajax로 받은 mem_mail값 넣어줌.)
			sendMail.mailSending(msgBean);										//msgBean정보를 담아서 SendMail로 보냄.
			
			//스크립트에서 데이터 받을수 있게 보내줌.
			target.put("randomNumber1", randomNumber1);
			
		} else {
			target.put("rtn", "false");
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(target);
		
		return jsonData;
	}
}
