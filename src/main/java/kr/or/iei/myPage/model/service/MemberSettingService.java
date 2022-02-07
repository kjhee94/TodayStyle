package kr.or.iei.myPage.model.service;

import java.util.HashMap;

import kr.or.iei.member.model.vo.Member;

public interface MemberSettingService {

	// 회원 설정 - 비밀번호 확인
	Member settingPwdCheck(Member member);

	// 회원설정 - 회원정보 수정 - 닉네임 중복체크
	int nicknameCheck(String nickname);

	// 회원설정 - 비밀번호 수정
	int pwdUpdate(HashMap<String, Object> map);
	
	

}
