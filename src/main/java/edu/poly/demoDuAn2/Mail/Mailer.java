package edu.poly.demoDuAn2.Mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailer")
public class Mailer {
	@Autowired
	JavaMailSender emailSender;

	public void sendMessageWithAttachment(String to, String subject, String text) {
		// ...
		try {
			MimeMessage message = emailSender.createMimeMessage();

			MimeMessageHelper helper = new MimeMessageHelper(message, true,"utf-8");

			helper.setFrom("hn7566410@gmail.com");
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(text);

			emailSender.send(message);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		// ...
	}
}
