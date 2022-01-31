package kr.or.iei.member.model.service;

import java.util.HashMap;

import kr.or.iei.member.model.vo.Member;

public interface MemberService {


	int insertMember(Member m);

	Member selectLoginMember(Member member);

	

	

	

}
