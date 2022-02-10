package kr.or.iei.memberSetting.model.service;

import java.util.HashMap;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.memberSetting.model.vo.ProfileImg;

public interface MemberSettingService {

	// 회원 설정 - 비밀번호 확인
	Member settingPwdCheck(Member member);

	// 회원설정 - 회원정보 수정 - 닉네임 중복체크
	int nicknameCheck(String nickname);
	// 회원설정 - 회원정보 수정 - 사용자 닉네임 체크
	int userNicknameCheck(String userId, String nickname);

	// 회원설정 - 비밀번호 수정
	int pwdUpdate(HashMap<String, Object> map);

	
	// 회원설정 - 회원정보 수정 - 프로필 이미지 기본이미지로 수정(업데이트)
	int updateProfiledDefaultImg(HashMap<String, Object> map);
	// 회원설정 - 회원정보 수정 - 프로필 이미지 존재 여부 확인  (서버에 프로필 사진이 있을 경우 삭제하기 위함)
	ProfileImg profileImgCheck(String userId);
	// 회원설정 - 회원정보 수정 - 프로필 이미지 수정(업데이트)
	int updateProfileImg(ProfileImg pI);

	
	// 회원설정 - 회원정보 수정
	int memberUpdate(Member m);

	// 회원 설정 - 회원정보 수정 - 이메일 중복 확인
	int emailCheck(String email);

	// 회원 설정  - 회원 정보 수정 (메일변경x)
	int memberUpdateNoMail(Member m);

	// 회원 탈퇴
	int memberWithdraw(Member m);

	

	
	
	

}
