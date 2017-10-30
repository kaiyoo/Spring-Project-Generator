package los.sendmail;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 1. 패키지명 : los.sendmail
 * 2. 타입명 : SendMail.java
 * 3. 작성일 : 2015. 11. 30. 오후 4:55:20
 * 4. 작성자 : "안정원"
 * 5. 설명 : 이메일 발송 기능 구현
 */
public class SendMail {
	
	private final String HOST = "smtp.gmail.com";
	private final String CHARSET = "UTF-8";
	private Properties sendProps = null;
	
	
	/**
	 * 1. 메소드명 : mailSendingEnvironment
	 * 2. 작성일 : 2015. 11. 30. 오후 4:55:39
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 프로퍼티 값 인스턴스 생성과 메일인증환경 설정.
	 */
	public void mailSendingEnvironment(){
		sendProps = new Properties();
		// 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
		sendProps.put("mail.smtp.starttls.enable", "true");
		sendProps.put("mail.smtp.auth", "true");
		sendProps.put("mail.smtp.socketFactory.port", "465");  
		sendProps.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		sendProps.put("mail.smtp.socketFactory.fallback", "false");
		sendProps.put("mail.smtp.host", HOST);
		sendProps.put("mail.transport.protocol", "smtp");
	}
	
	
	/**
	 * 1. 메소드명 : mailSending
	 * 2. 작성일 : 2015. 11. 30. 오후 4:56:34
	 * 3. 작성자 : "안정원"
	 * 4. 설명 : 메일 발송
	 */
	public void mailSending(MailMessageBean msgBean){
		MyAuthenticator auth = new MyAuthenticator(msgBean.getSenderID(), msgBean.getSenderPwd());

		Session mailSession = Session.getDefaultInstance(sendProps, auth);

		// 메일 송신자 설정
		Message msg = new MimeMessage(mailSession);
		
		try {
			// 메일 수신자 설정
			InternetAddress address = new InternetAddress(msgBean.getReceiverEmail());
			
			msg.setFrom(new InternetAddress(msgBean.getSenderEmail(), msgBean.getSenderName(), CHARSET));
			//받는 사람설정
			msg.setRecipient(Message.RecipientType.TO, address); 
			// 제목 설정
			msg.setSubject(msgBean.getSubject());                 
			// 보내는 날짜 설정
			msg.setSentDate(new java.util.Date());                
			// 내용 설정 (HTML 형식)
			msg.setContent(msgBean.getContent(), "text/html;charset=UTF-8");   
			
			Transport.send(msg); // 메일 보내기
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} 
	}
}
