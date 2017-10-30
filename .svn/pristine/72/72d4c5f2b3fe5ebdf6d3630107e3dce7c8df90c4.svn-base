package los.sendmail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 1. 패키지명 : los.sendmail
 * 2. 타입명 : MyAuthenticator.java
 * 3. 작성일 : 2015. 11. 30. 오후 4:59:17
 * 4. 작성자 : "안정원"
 * 5. 설명 : 보내는 메일주소와 패스워드 데이터 저장.
 */
public class MyAuthenticator extends Authenticator {
	private String id;
    private String pw;

    public MyAuthenticator(String id, String pw) {
        this.id = id;
        this.pw = pw;
    }
    
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(id, pw);
	}
	
}
