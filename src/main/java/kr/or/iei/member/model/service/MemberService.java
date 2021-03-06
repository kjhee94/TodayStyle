package kr.or.iei.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.member.model.vo.Member;

public interface MemberService {


	int insertMember(Member m);

	Member selectLoginMember(Member member);

	Member findId(Member member);

	int IdCheck(String userid);

	int nicknameCheck(String nickname);

	int mailCheck(String userEmail);

	int findNewPwd(HashMap<String, Object> map);

	ArrayList<Member> selectTopFollowList();

	int kakaoinsert(HashMap<String, Object> map);

	int findkakao(String email);

	Member kakaoselect(Member member);

	Member kakaoMember(Member member, String email);

	int kakaoemail(String email);

}
