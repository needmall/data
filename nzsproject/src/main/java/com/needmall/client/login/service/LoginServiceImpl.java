package com.needmall.client.login.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.needmall.client.login.dao.LoginDao;
import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.dao.MemberDao;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.common.util.OpenCrypt;

@Service
public class LoginServiceImpl implements LoginService {
	Logger logger = Logger.getLogger(LoginServiceImpl.class);

	@Autowired
	private LoginDao loginDao;

	@Autowired
	private MemberDao memberDao;

	@Override
	public LoginVO customerIdSelect(String c_id) {
		return loginDao.customerIdSelect(c_id);  
	}
	
	@Override
	public LoginVO sellerIdSelect(String s_id) {
		return loginDao.sellerIdSelect(s_id);  
	} 

	/* customer 로그인 처리 메서드 */
	@Override
	public LoginVO customerLoginSelect(String c_id, String c_pwd) {
		LoginVO  vo = null;
		MemberSecurity sec = memberDao.customerSecuritySelect(c_id);
		logger.info("customerSecuritySelect : " + sec);
		if(sec!=null){
			logger.info("customerLoginSelect 성공");
			logger.info("c_id : "+c_id);
			logger.info("c_pwd : "+c_pwd);
			c_pwd = new String(OpenCrypt.getSHA256(c_pwd,sec.getSalt()));
			logger.info("암호화 후 c_pwd : " + c_pwd);
			
			LoginVO lvo = new LoginVO();
			lvo.setC_id(c_id);
			lvo.setC_pwd(c_pwd);
			logger.info("customer c_id, c_pwd : " + lvo);

			vo = loginDao.customerLoginSelect(lvo);
			logger.info("customerLoginSelect : " + vo);
		} 
		return vo;
	} 
	
	/* seller 로그인 처리 메서드 */
	@Override
	public LoginVO sellerLoginSelect(String s_id, String s_pwd) {
		LoginVO  vo = null;
		MemberSecurity sec = memberDao.sellerSecuritySelect(s_id);
		logger.info("sellerSecuritySelect : " + sec);
		if(sec!=null){
			logger.info("sellerLoginSelect 성공");
			logger.info("s_id : "+s_id);
			logger.info("s_pwd : "+s_pwd);
			s_pwd = new String(OpenCrypt.getSHA256(s_pwd,sec.getSalt()));
			logger.info("암호화 후 s_pwd : " + s_pwd);
			LoginVO lvo = new LoginVO();
			lvo.setS_id(s_id);
			lvo.setS_pwd(s_pwd);
			logger.info("set s_id, s_pwd : " + lvo);

			vo = loginDao.sellerLoginSelect(lvo);
			logger.info("sellerLoginSelect : " + vo);
		} 
		return vo;
	} 

	@Transactional
	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		int result;
		if(customerIdSelect(lvo.getC_id())==null){
			result = 1;
		} else{
			LoginVO vo = loginHistorySelect(lvo.getC_id());
			if(vo == null){
				loginDao.loginHistoryInsert(lvo);
			}
			result = 2;
		}
		return result;
	} 

	@Transactional
	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return loginDao.loginHistoryUpdate(lvo);  
	} 

	@Override
	public LoginVO loginHistorySelect(String c_id) {
		return loginDao.loginHistorySelect(c_id);  
	}
}