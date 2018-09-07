package com.needmall.common.email.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.needmall.common.email.service.EmailService;
import com.needmall.common.email.vo.EmailVO;

@Controller
@RequestMapping(value="/email")
public class EmailController {
	Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
	private EmailService emailService;
	
	@RequestMapping(value="/mailForm.do", method=RequestMethod.GET)
	public void mailForm(){
		
	}
	
	/*****************************************************************
	 * 참고: SimpleMailMessage 단순 메시지로 메일 발송.
	 * ****************************************************************/
	@ResponseBody
	@RequestMapping(value="/sendSimpleMail.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
	public String sendSimpleMail(@ModelAttribute EmailVO evo) throws FileNotFoundException, URISyntaxException {
		String result = "";
		result = emailService.sendSimpleMail(evo);
		return result;
	}
	
	/*****************************************************************
	 * 참고: 파일 첨부 또는 HTML로 구성되어 있는 경우 MimeMessage를 이용.
	 * ****************************************************************/
	@ResponseBody
	@RequestMapping(value="/sendMimeMail.do", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
	public String sendMimeMail(@ModelAttribute EmailVO evo,@RequestParam("c_mail") String c_mail) throws FileNotFoundException, URISyntaxException {
		evo.setTo(c_mail);//★체크!!!!!!!!!!!!
		logger.info("emailController c_mail : " + c_mail);
		String result = "";
		result = emailService.sendMimeMail(evo);
		return result;
	}
}