package dank.method;

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

public class Mail {
	
	public int securityCodeMaking(int len) {
		StringBuffer emailSecuCode = new StringBuffer();
		for (int i = 0; i < len; i++) {
			int random = (int) (Math.random()*9+1);
			emailSecuCode.append(random);
		}
		return Integer.parseInt(emailSecuCode.toString());
	}
	
	// 1 : ���� ����
	// 0 : ���� ����
	public int emailSend(String RecipientMail, String RecipientName, String title) {
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
					content.append("���� �ڵ� : ").append(securityCodeMaking(4));
					// �Ϲ� �׽�Ʈ ����
					message.setText(content.toString());
					// �̸��� ������
					Transport.send(message);
					System.out.println("������ ���� �Ǿ����ϴ�.");
					return 1;
				} catch (MessagingException | UnsupportedEncodingException e) {
					System.out.println("������ ���� �����Դϴ�.");
					e.printStackTrace();
					return 0;
				}

	}
}
