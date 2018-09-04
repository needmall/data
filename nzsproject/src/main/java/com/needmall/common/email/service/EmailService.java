package com.needmall.common.email.service;

import com.needmall.common.email.vo.EmailVO;

public interface EmailService {
	public String sendSimpleMail(EmailVO evo); 
	public String sendMimeMail(EmailVO evo);
}
