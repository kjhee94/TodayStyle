package kr.or.iei.myPage.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository
public class MemberSettingDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public Member settingPwdCheck(Member member) {
//		System.out.println("daoMember : "+member);
//		Member m = sqlSession.selectOne("member.selectLoginMember", member);
//		System.out.println("dao: " +m);
		
		return sqlSession.selectOne("memberSetting.settingPwdCheck", member);
	}

	public int nicknameCheck(String nickname) {
		
		return sqlSession.selectOne("memberSetting.nicknameCheck", nickname)!=null?1:0;
	}


	public int pwdUpdate(HashMap<String, Object> map) {
		
		System.out.println(map);
		
		return sqlSession.update("memberSetting.pwdUpdate", map);
	}
}
