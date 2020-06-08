package dank.mvc.method;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Repository;

@Repository
public class Mail {
	
	// �Է��� ���ڸ�ŭ �ڸ����� ������ ���ڷ� �����ȴ�.
	// �� ) 4 => 2459
	public String securityCodeMaking(int len) {
		StringBuffer emailSecuCode = new StringBuffer();
		for (int i = 0; i < len; i++) {
			int random = (int) (Math.random()*9+1);
			emailSecuCode.append(random);
		}
		return emailSecuCode.toString();
	}
	
	// ���� ���� : 0
	// ���� ���� : ���� �ڵ尡 ����
	
	public String emailSend(String RecipientMail, String RecipientName, String title) {
			// SMTP ���� ������ ����
				Properties props = new Properties();
				// �߼� STMP ����
				props.put("mail.smtp.host", "smtp.naver.com");
				// SMTP������ ��Ʈ
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				// SSL Ȱ��ȭ
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", "smtp.naver.com");
				// SMTP ���� ������ ����� ������ �������
				// Session Ŭ������ �ν��Ͻ��� ����

				Session session = Session.getDefaultInstance(props, new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("jinproject94@naver.com", "wlsgbvmfhwprxm12");
					}
				});
				// ���� �߽��ڿ� ������, ���� �׸��� ���� �ۼ��� ���� MimeMessage��ü ����
				MimeMessage message = new MimeMessage(session);
				try {
					// �߽��� ����
					message.setFrom(new InternetAddress("jinproject94@naver.com", "������"));
					// ������ ����
					message.setRecipient(Message.RecipientType.TO, new InternetAddress(RecipientMail, RecipientName));
					// ���� ����
					message.setSubject(title);
					// ���� ���� ����
					StringBuilder content = new StringBuilder();
					content.append("HD-Bank ����").append("\n");
					String code = securityCodeMaking(4);
					content.append("���� �ڵ� : ").append(code);
					// �Ϲ� �׽�Ʈ ����
					message.setText(content.toString());
					// �̸��� ������
					Transport.send(message);
					System.out.println("������ ���� �Ǿ����ϴ�.");
					return code;
				} catch (MessagingException | UnsupportedEncodingException e) {
					System.out.println("������ ���� �����Դϴ�.");
					e.printStackTrace();
					return "0";
				}

	}
}
