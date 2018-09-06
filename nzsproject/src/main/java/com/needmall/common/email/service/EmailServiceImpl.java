package com.needmall.common.email.service;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.needmall.common.email.vo.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public String sendSimpleMail(EmailVO evo) {
		String result = "";
		try{
			SimpleMailMessage message = new SimpleMailMessage();

			/*message.setFrom(evo.getFrom());
			message.setTo(evo.getTo());
			message.setSubject(evo.getSubject());
			message.setText(evo.getText());*/
			
			/* 확인 작업 */
			message.setFrom("alfosmdfur@gmail.com");
			message.setTo("jg9870@naver.com");
			message.setSubject("스프링으로 메일 발송 확인");
			message.setText("스프링으로 메일 발송 테스트입니다.");
			
			mailSender.send(message);
			result = "성공적으로 이메일 발송이 완료되었습니다.";
		}catch(Exception e){
			e.printStackTrace();
			result = "이메일 발송에 필요한 데이터가 충족하지 못해서 정상적으로 발송하지 못하였습니다.";
		}   
		return result;
	}

	@Override
	public String sendMimeMail(EmailVO evo) {
		String result = "";
		try{
			MimeMessage message = mailSender.createMimeMessage();
 
			/*message.setFrom(new InternetAddress(evo.getFrom()));  
			message.addRecipient(RecipientType.TO, new InternetAddress(evo.getC_mail()));
			message.setSubject(evo.getSubject());
			message.setText(evo.getText(), "utf-8", "html");*/
			
			message.setFrom(new InternetAddress("alfosmdfur@gmail.com"));  
			message.addRecipient(RecipientType.TO, new InternetAddress(evo.getTo()));
			message.setSubject(evo.getSubject());
			//message.setText("<h1>회원가입이 완료되었습니다!!</h1><h4>NeedMall에 오신것을 격하게 환영합니다~!!</h4>", "utf-8", "html");
			message.setText(evo.getText(), "utf-8", "html");
			
			mailSender.send(message);
			result = "성공적으로 이메일 발송이 완료되었습니다.";
		}catch(Exception e){
			e.printStackTrace();
			result = "이메일 발송에 필요한 데이터가 충족하지 못해서 정상적으로 발송하지 못하였습니다.";
		} 
		return result;
	}
}
