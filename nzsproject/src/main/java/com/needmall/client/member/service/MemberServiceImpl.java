package com.needmall.client.member.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.dao.MemberDao;
import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;
import com.needmall.common.util.OpenCrypt;
import com.needmall.common.util.Util;

@Service
public class MemberServiceImpl implements MemberService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int customerIdConfirm(String c_id) {
		int result=0;
		int result1=0;
		int result2=0;
		//★★★ Cheeeeeeeeeeck!
		result1 = memberDao.customerSelect(c_id);
		result2 = memberDao.sellerSelect(c_id);
		result = result1 + result2;
		return result;
	}

	@Override
	public int sellerIdConfirm(String s_id) {
		int result=0;
		int result1=0;
		int result2=0;
		
		result1 = memberDao.customerSelect(s_id);
		result2 = memberDao.sellerSelect(s_id);
		result = result1 + result2;
		return result;
	}

	@Override
	public int stBnumConfirm(String st_bnum) {
		int result;
		if (memberDao.reqstoreSelect(st_bnum) != null) {
			result=1;
		} else {
			result=2;
		}
		return result;
	}
		
	@Override
	public int csCount(LoginVO lvo) {
		int result=0;
		int result1=0;
		int result2=0;
		
		result1 = memberDao.customerSelect(lvo.getC_id());
		result2 = memberDao.sellerSelect(lvo.getS_id());
		
		if(result1==1) {
			result = 0;
		} else if(result2 ==1) {
			result = 1;
		} else {	// id 존재하지 않음
			result = 2;
		}
		return result;
	}

	@Transactional
	@Override
	public int customerInsert(MemberVO mvo) {
		//int sCode = 2;
		if (memberDao.customerSelect(mvo.getC_id()) != 0) {
			//return 1;
			throw new RuntimeException();
		} else {
			/*try {	// 비밀번호 암호화(단방향)
				MemberSecurity sec = new MemberSecurity();
				sec.setC_id(mvo.getC_id());
				sec.setSalt(Util.getRandomString());	// 암호 randomString으로 바꿔주기
				
				logger.info(sec.getC_id() +" / "+ sec.getSalt());
				
				
				sCode = memberDao.customerSecurityInsert(sec);
				
				if(mvo.getC_gendernum()==1 || mvo.getC_gendernum()==3) {
					mvo.setC_gender("남자");
				}else if(mvo.getC_gendernum()==2 || mvo.getC_gendernum()==4){
					mvo.setC_gender("여자");
				}else {
					// 올바른 주민번호 뒷자리를 입력해주세요 해야하나
					return 2;
				}
				
				if(sCode==1) {
					mvo.setC_pwd(new String(OpenCrypt.getSHA256(mvo.getC_pwd(), sec.getSalt())));
					memberDao.customerInsert(mvo);
					return 3;
				} else {
					return 2;
				}
			} catch(RuntimeException e) {
				e.printStackTrace();
				return 2;	// 2 : default 값으로
			} */
			
			MemberSecurity sec = new MemberSecurity();
			sec.setC_id(mvo.getC_id());
			sec.setSalt(Util.getRandomString());
			memberDao.customerSecurityInsert(sec);
			
			if(mvo.getC_genderNum()==1 || mvo.getC_genderNum()==3) {
				mvo.setC_gender("남자");
			}else{
				mvo.setC_gender("여자");
			}
			
			mvo.setC_pwd(new String(OpenCrypt.getSHA256(mvo.getC_pwd(), sec.getSalt())));
			
			int result = memberDao.customerInsert(mvo);
			return result;
				
		}
	}

	@Override
	public int sellerInsert(JoinVO jvo) {
		//int sCode = 2;
		if (memberDao.sellerSelect(jvo.getS_id()) != 0) {
			//return 1;
			throw new RuntimeException();
		} else {
			/*try {	// 비밀번호 암호화(단방향)
				MemberSecurity sec = new MemberSecurity();
				sec.setS_id(mvo.getS_id());
				sec.setSalt(Util.getRandomString());	// 암호 randomString으로 바꿔주기
				sCode = memberDao.sellerSecurityInsert(sec);
				
				if(mvo.getC_gendernum()==1 || mvo.getC_gendernum()==3) {
					mvo.setC_gender("남자");
				}else if(mvo.getC_gendernum()==2 || mvo.getC_gendernum()==4){
					mvo.setC_gender("여자");
				}else {
					// 옳바른 주민번호 뒷자리를 입력해주세요 해야하나
					return 2;
				}
				
				if(sCode==1) {
					mvo.setS_pwd(new String(OpenCrypt.getSHA256(mvo.getS_pwd(), sec.getSalt())));
					memberDao.sellerInsert(mvo);
					return 3;
				} else {
					return 2;
				}
			} catch(RuntimeException e) {
				e.printStackTrace();
				return 2;	// 2 : default 값으로
			}*/
			
			MemberSecurity sec = new MemberSecurity();
			sec.setS_id(jvo.getS_id());
			sec.setSalt(Util.getRandomString());
			memberDao.sellerSecurityInsert(sec);
			
			if(jvo.getS_genderNum()==1 || jvo.getS_genderNum()==3) {
				jvo.setS_gender("남자");
			}else{
				jvo.setS_gender("여자");
			}
			
			jvo.setS_pwd(new String(OpenCrypt.getSHA256(jvo.getS_pwd(), sec.getSalt())));
			
			
			//jvo.setS_num(jvo.getS_num());
				
			int result = memberDao.sellerInsert(jvo);
			
			memberDao.reqstoreInsert(jvo);
			return result;
				
		}
	}

	
}
