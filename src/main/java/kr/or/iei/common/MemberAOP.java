package kr.or.iei.common;

import java.util.HashMap;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.iei.member.model.vo.Member;

@Aspect
@Component
public class MemberAOP {

	@Autowired
	private SHA256Util enc;

	// 회원 가입 암호화 처리 AOP 처리
	@Pointcut("execution(int kr.or.iei.member.model.service.MemberServiceImpl.insertMember(..))")
	public void insertMemberPointCut() {
	}

	@Before("insertMemberPointCut()")
	public void insertMemberPasswordEncryption(JoinPoint jp) throws Exception {
		Member m = (Member) jp.getArgs()[0];

		String userPwd = m.getUserPwd();
		String userId = m.getUserId();

		String encryptPwd = enc.encryptionData(userPwd, userId);

		m.setUserPwd(encryptPwd);

	}

	// 로그인할때 작성한 비밀번호 암호화 처리 로직
	@Pointcut("execution(kr.or.iei.member.model.vo.Member kr.or.iei.member.model.service.MemberServiceImpl.selectLoginMember(..))")
	public void selectLoginPointCut() {
	}

	@Before("selectLoginPointCut()")
	public void loginPasswordEncrypt(JoinPoint jp) throws Exception {
		Member m = (Member) jp.getArgs()[0];

		String userId = m.getUserId();
		String userPwd = m.getUserPwd();

		String encryptData = enc.encryptionData(userPwd, userId);

		m.setUserPwd(encryptData);
	}

	// 회원 설정 - 비밀번호 확인 시 암호화 처리
	@Pointcut("execution(kr.or.iei.member.model.vo.Member kr.or.iei.memberSetting.model.service.MemberSettingServiceImpl.settingPwdCheck(..))")
	public void settingPwdCheckPointCut() {
	}

	@Before("settingPwdCheckPointCut()")
	public void settingPwdCheckEncryption(JoinPoint jp) throws Exception {
		Member m = (Member) jp.getArgs()[0];

		String userId = m.getUserId();
		String userPwd = m.getUserPwd();

		String encryptData = enc.encryptionData(userPwd, userId);

		m.setUserPwd(encryptData);
	}

	// 회원 설정 - 비밀번호 변경 암호화
	@Pointcut("execution(int kr.or.iei.memberSetting.model.service.MemberSettingServiceImpl.pwdUpdate(..))")
	public void pwdUpdatePointCut() {
	}

	@Before("pwdUpdatePointCut()")
	public void pwdUpdateEncryption(JoinPoint jp) throws Exception {
		
		HashMap<String,Object> map = (HashMap<String,Object>)jp.getArgs()[0];
		
		String userId = map.get("userId").toString();
		String userPwd = map.get("userPwd").toString();
		String newUserPwd = map.get("newUserPwd").toString();
		
		// 기존 비밀번호 암호화 처리
		String data = enc.encryptionData(userPwd, userId);
		map.put("userPwd", data);
		
		// 새 비밀번호 암호화 처리
		data = enc.encryptionData(newUserPwd, userId);
		map.put("newUserPwd", data);
		
	}
	
	// 회원 설정현지 - 비밀번호 변경 암호화
		@Pointcut("execution(int kr.or.iei.member.model.service.MemberServiceImpl.findNewPwd(..))")
		public void findNewPwdPointCut() {
		}

		@Before("findNewPwdPointCut()")
		public void findNewPwdEncryption(JoinPoint jp) throws Exception {
			
			HashMap<String,Object> map = (HashMap<String,Object>)jp.getArgs()[0];
			
			String userId = map.get("userId").toString();
			String num = map.get("num").toString();
			
			
			
			// 새 비밀번호 암호화 처리
			String data = enc.encryptionData(num, userId);
			map.put("num", data);
			
		}
		
		// 카카오 로그인 회원 가입 암호화 처리 AOP 처리
		
				@Pointcut("execution(int kr.or.iei.member.model.service.MemberServiceImpl.kakaoinsert(..))")
				public void kakaoinsertPointCut() {
				}

				@Before("kakaoinsertPointCut()")
				public void kakaoinsertPasswordEncryption(JoinPoint jp) throws Exception {
					HashMap<String,Object> map = (HashMap<String,Object>)jp.getArgs()[0];

					String password = map.get("password").toString();
					String userId = map.get("userId").toString();

					String encryptPwd = enc.encryptionData(password, userId);

					map.put("password", encryptPwd);

				}

}
