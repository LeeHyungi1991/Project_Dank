package dank.mvc.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dank.mvc.dao.MemberDao;
import dank.mvc.method.Mail;
import dank.mvc.method.SecurityCode;


@RestController
public class SecurityService {

	
	@Autowired
	private SecurityCode securityCode;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private Mail mail;

	// �̸��� �����ڵ� : 1
	// �����ڵ� ī�� ���� : 2
	// OTP �ڵ� ���� : 3
	@RequestMapping(value = "/emailsend")
	public String emailSend(String email) {
		
		StringBuilder content = new StringBuilder();
		content.append("HD-Bank ����").append("\n");
		String emailCode = securityCode.securityCodeMaking(4);
		content.append("���� �ڵ� : ").append(emailCode);
		String name = memberDao.nameChk(email);
		mail.emailSend(email, name, "�����ڵ�", content.toString());
		
		return emailCode;
	}
}
