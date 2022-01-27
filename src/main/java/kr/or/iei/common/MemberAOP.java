package kr.or.iei.common;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MemberAOP {

	@Autowired
	private SHA256Util enc;
	
	
}
