package com.needmall.client.member.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.needmall.client.member.dao.MemberDao;
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
		int result;
		if (memberDao.customerSelect(c_id) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public int sellerIdConfirm(String s_id) {
		int result;
		if (memberDao.sellerSelect(s_id) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Transactional
	@Override
	public int customerInsert(MemberVO mvo) {
		//int sCode = 2;
		if (memberDao.customerSelect(mvo.getC_id()) != null) {
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
			
			if(mvo.getC_gendernum()==1 || mvo.getC_gendernum()==3) {
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
	public int sellerInsert(MemberVO mvo) {
		int sCode = 2;
		if (memberDao.sellerSelect(mvo.getS_id()) != null) {
			return 1;
		} else {
			try {	// 비밀번호 암호화(단방향)
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
			}
		}
	}

	@Override
	public int stBnumConfirm(String st_bnum) {
		int result;
		if (memberDao.storeSelect(st_bnum) != null) {
			result=1;
		} else {
			result=2;
		}
		return result;
	}
		
}
