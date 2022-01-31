package kr.or.iei.common;

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
	
	//회원 가입 암호화 처리 AOP 처리 
			@Pointcut("execution(int kr.or.iei.member.model.service.MemberServiceImpl.insertMember(..))")
			public void insertMemberPointCut() {}
			
			
			@Before("insertMemberPointCut()")
			public void insertMemberPasswordEncryption(JoinPoint jp) throws Exception
			{
				Member m = (Member)jp.getArgs()[0];
				
				String userPwd = m.getUserPwd();
				String userId = m.getUserId();
				
				String encryptPwd = enc.encryptionData(userPwd, userId);
				
				m.setUserPwd(encryptPwd);
				
			}
			
			
			//로그인할때 작성한 비밀번호 암호화 처리 로직
			@Pointcut("execution(kr.or.iei.member.model.vo.Member kr.or.iei.member.model.service.MemberServiceImpl.selectLoginMember(..))")
			public void selectLoginPointCut() {}
			
			@Before("selectLoginPointCut()")
			public void loginPasswordEncrypt(JoinPoint jp) throws Exception
			{
				Member m = (Member)jp.getArgs()[0];
				
				String userId = m.getUserId();
				String userPwd = m.getUserPwd();
				
				String encryptData = enc.encryptionData(userPwd, userId);
				
				m.setUserPwd(encryptData);
			}
}
