package kr.or.iei.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;


	public int insertMember(Member m) {
		System.out.println(m);
		return sqlSession.insert("member.insertMember",m);
	}

	public Member selectLoginMember(Member member) {
		return sqlSession.selectOne("member.selectLoginMember",member);
	}

	public Member findId(Member member) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		return sqlSession.selectOne("member.findId",member);
	}

	public int IdCheck(String userid) {
		return sqlSession.selectOne("member.IdCheck",userid)!=null?1:0;
	}

	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne("member.nicknameCheck",nickname)!=null?1:0;
	}

	public int mailCheck(String userEmail) {
		return sqlSession.selectOne("member.mailCheck",userEmail)!=null?1:0;
	}

	public int findNewPwd(HashMap<String, Object> map) {
		return sqlSession.update("member.findNewPwd",map);
	}

	public ArrayList<Member> selectTopFollowList() {
		ArrayList<Member> list=new ArrayList(sqlSession.selectList("member.selectTopFollowList"));
		
		return list;
	}
	
public int kakaoinsert(HashMap<String, Object> map) {
		
		return sqlSession.insert("member.kakaoinsert",map);
	}

	public int findkakao(String email) {
		return sqlSession.selectOne("member.findkakao",email)!=null?1:0;
	}

	public Member kakaoselect(Member member) {
		return sqlSession.selectOne("member.kakaoselect",member);
	}

	public Member kakaoMember(Member member,String email) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("member", member);
		map.put("email", email);
		return sqlSession.selectOne("member.kakaoMember",map);
	}

	public int kakaoemail(String email) {
		return sqlSession.selectOne("member.kakaoemail",email)!=null?1:0;
	}

	

	

	

	
}
