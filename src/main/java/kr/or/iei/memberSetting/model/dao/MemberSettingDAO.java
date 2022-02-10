package kr.or.iei.memberSetting.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.memberSetting.model.vo.ProfileImg;

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
	public int userNicknameCheck(String userId, String nickname) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("nickname", nickname);
		
		//Member m = sqlSession.selectOne("memberSetting.userNicknameCheck", map);
		//System.out.println(m);

		return sqlSession.selectOne("memberSetting.userNicknameCheck", map)!=null?1:0;
	}


	public int pwdUpdate(HashMap<String, Object> map) {
		
		//System.out.println(map);
		
		return sqlSession.update("memberSetting.pwdUpdate", map);
	}

	public int updateProfiledDefaultImg(HashMap<String, Object> map) {

		return sqlSession.update("memberSetting.updateProfiledDefaultImg", map);
	}
	
	public ProfileImg profileImgCheck(String userId) {
		
		return sqlSession.selectOne("memberSetting.profileImgCheck", userId);
	}

	public int updateProfileImg(ProfileImg pI) {
		
		return sqlSession.update("memberSetting.updateProfileImg", pI);
	}

	public int memberUpdate(Member m) {
		
		return sqlSession.update("memberSetting.memberUpdate", m);
	}

	public int emailCheck(String email) {
		
		return sqlSession.selectOne("memberSetting.emailCheck", email)!=null?1:0;
	}

	public int memberUpdateNoMail(Member m) {

		return sqlSession.update("memberSetting.memberUpdateNoMail", m);
	}

	public int memberWithdraw(Member m) {

		return sqlSession.update("memberSetting.memberWithdraw", m);
	}


	
}
