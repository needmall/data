package com.needmall.client.member.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.dao.MemberDao;
import com.needmall.client.member.vo.CinfoVO;
import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;
import com.needmall.client.member.vo.SinfoVO;
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
		result1 = memberDao.customerIdSelect(c_id);
		result2 = memberDao.sellerIdSelect(c_id);
		result = result1 + result2;
		return result;
	}

	@Override
	public int sellerIdConfirm(String s_id) {
		int result=0;
		int result1=0;
		int result2=0;
		
		result1 = memberDao.customerIdSelect(s_id);
		result2 = memberDao.sellerIdSelect(s_id);
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
		
		result1 = memberDao.customerIdSelect(lvo.getC_id());
		result2 = memberDao.sellerIdSelect(lvo.getS_id());
		
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
		if (memberDao.customerIdSelect(mvo.getC_id()) != 0) {
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
			
			CinfoVO civo = new CinfoVO();	// 될가 안되네
			civo.setC_id(mvo.getC_id());	// sec.으로 했더니 security에 id 여러개 들어가서 로그인이 안됨
			
			
			if(mvo.getC_genderNum()==1 || mvo.getC_genderNum()==3) {
				mvo.setC_gender("남자");
			}else{
				mvo.setC_gender("여자");
			}
			
			mvo.setC_pwd(new String(OpenCrypt.getSHA256(mvo.getC_pwd(), sec.getSalt())));
			
			int result = memberDao.customerInsert(mvo);
			memberDao.customerAgreeInsert(mvo);	//?????? ORA-02291: 무결성 제약조건(NZS.R_34)이 위배되었습니다- 부모 키가 없습니다
			// agree 부모가 customer 니까 customer insert 된 후에 agreeInsert
			
			return result;
				
		}
	}
	
	
	@Transactional
	@Override
	public int sellerInsert(JoinVO jvo) {
		//int sCode = 2;
		if (memberDao.sellerIdSelect(jvo.getS_id()) != 0) {
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
			
			SinfoVO sivo = new SinfoVO();
			sivo.setS_id(jvo.getS_id());
			
			if(jvo.getS_genderNum()==1 || jvo.getS_genderNum()==3) {
				jvo.setS_gender("남자");
			}else{
				jvo.setS_gender("여자");
			}
			
			jvo.setS_pwd(new String(OpenCrypt.getSHA256(jvo.getS_pwd(), sec.getSalt())));
			
			
			//jvo.setS_num(jvo.getS_num());
				
			int result = memberDao.sellerInsert(jvo);
			memberDao.reqstoreInsert(jvo);
			memberDao.sellerAgreeInsert(jvo);
			
			return result;
				
		}
	}

	@Transactional
	@Override
	public int customerDelete(String c_id) {
		int result = memberDao.customerDelete(c_id);
		//result = memberDao.customerSecurityDelete(c_id);
		return result;
	}

	@Transactional
	@Override
	public int sellerDelete(String s_id) {
		//logger.info("sellerDelete에 들어갈 mvo : "+mvo);
		int result = memberDao.sellerDelete(s_id);
		//logger.info("reqStoreDelte에 들어갈 mvo.getS_num : "+mvo.getS_num());
		//memberDao.reqStoreDelete(mvo.getS_num());
		
		//result = memberDao.sellerSecurityDelete(s_id);
		return result;
	}

	@Transactional
	@Override
	public int reqStoreDelete(int s_num) {
		int result = memberDao.reqStoreDelete(s_num);
		return result;
	}
	
	@Transactional
	@Override
	public int customerUpdate(MemberVO mvo){
		if(!mvo.getC_pwd().isEmpty()){
			MemberSecurity sec = memberDao.customerSecuritySelect(mvo.getC_id());
			mvo.setC_pwd(new String(OpenCrypt.getSHA256(mvo.getC_pwd(),sec.getSalt())));
		}
		int result = memberDao.customerUpdate(mvo);

		return result;     
	}

	@Override
	public MemberVO customerSelect(String c_id) {
		MemberVO vo = memberDao.customerSelect(c_id);
		return vo;
	}

	@Override
	public int sellerUpdate(MemberVO mvo) {
		if(!mvo.getS_pwd().isEmpty()){
			MemberSecurity sec = memberDao.sellerSecuritySelect(mvo.getS_id());
			mvo.setS_pwd(new String(OpenCrypt.getSHA256(mvo.getS_pwd(),sec.getSalt())));
		}
		int result = memberDao.sellerUpdate(mvo);

		return result;
	}

	@Override
	public MemberVO sellerSelect(String s_id) {
		MemberVO vo = memberDao.sellerSelect(s_id);
		return vo;
	}

	@Override
	public String customerIdIden(String c_name, String c_mail) {
		
		MemberVO mvo = new MemberVO();
		mvo.setC_name(c_name);
		mvo.setC_mail(c_mail);
		
		
		logger.info("c_name : " + c_name);
		
		String c_id = memberDao.customerIdIdenSelect(mvo);
		logger.info("mvo : " + mvo);
		logger.info("c_id : " + c_id);
		
		LoginVO lvo = new LoginVO();
		lvo.setC_id(c_id);
		logger.info("lvo : " + lvo);
		
		if (c_id==null) {
			logger.info("가입된 아이디가 없습니다.");			
			return null;
		} else {
			logger.info("성공");
			return c_id;
		}
		
	}

	@Override
	public String sellerIdIden(String s_name, String s_mail) {
		MemberVO mvo = new MemberVO();
		mvo.setS_name(s_name);
		mvo.setS_mail(s_mail);


		logger.info("s_name : " + s_name);

		String s_id = memberDao.sellerIdIdenSelect(mvo);
		logger.info("mvo : " + mvo);
		logger.info("s_id : " + s_id);

		LoginVO lvo = new LoginVO();
		lvo.setS_id(s_id);
		logger.info("lvo : " + lvo);

		if (s_id==null) {
			logger.info("가입된 아이디가 없습니다.");
			return null;
		} else {
			logger.info("성공");
			return s_id;
		}
	}

}
