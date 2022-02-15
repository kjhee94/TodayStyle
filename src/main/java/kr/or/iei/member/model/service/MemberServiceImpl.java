package kr.or.iei.member.model.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import kr.or.iei.member.model.dao.MemberDAO;
import kr.or.iei.member.model.vo.Member;



@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(m);
	}

	@Override
	public Member selectLoginMember(Member member) {
		
		Member m =  mDAO.selectLoginMember(member);
	
		return m;
	}

	@Override
	public Member findId(Member member) {
		return mDAO.findId(member);
	}

	@Override
	public int IdCheck(String userid) {
		return mDAO.IdCheck(userid);
	}

	@Override
	public int nicknameCheck(String nickname) {
		return mDAO.nicknameCheck(nickname);
	}

	@Override
	public int mailCheck(String userEmail) {
		return mDAO.mailCheck(userEmail);
	}

	@Override
	public int findNewPwd(HashMap<String, Object> map) {
		return mDAO.findNewPwd(map);
	}
	
	//메인페이지 팔로우 랭킹띄우는 로직
	@Override
	public ArrayList<Member> selectTopFollowList() {
		ArrayList<Member> list = mDAO.selectTopFollowList();
		return list;
	}
	
	@Override
	public int kakaoinsert(HashMap<String, Object> map) {
		return mDAO.kakaoinsert(map);
	}

	@Override
	public int findkakao(String email) {
		return mDAO.findkakao(email);
	}

	@Override
	public Member kakaoselect(Member member) {
		Member m =  mDAO.kakaoselect(member);
		return m;
	}

	@Override
	public Member kakaoMember(Member member,String email) {
		Member m =  mDAO.kakaoMember(member,email);
		return m;
	}

	@Override
	public int kakaoemail(String email) {
		return mDAO.kakaoemail(email);
	}

	

	

	


	

	
	

	
	
}
