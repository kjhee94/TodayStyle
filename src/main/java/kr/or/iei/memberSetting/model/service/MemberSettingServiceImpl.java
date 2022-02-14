package kr.or.iei.memberSetting.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.memberSetting.model.dao.MemberSettingDAO;
import kr.or.iei.memberSetting.model.vo.ProfileImg;

@Service
public class MemberSettingServiceImpl implements MemberSettingService{
	
	@Autowired
	private MemberSettingDAO msDAO;

	@Override
	public Member settingPwdCheck(Member member) {
		
		Member m = msDAO.settingPwdCheck(member);
		//System.out.println("service: "+m);
		
		return m;
	}

	@Override
	public int nicknameCheck(String nickname) {
		
		return msDAO.nicknameCheck(nickname);
	}

	@Override
	public int userNicknameCheck(String userId, String nickname) {
		
		return msDAO.userNicknameCheck(userId, nickname);
	}
	
	
	@Override
	public int pwdUpdate(HashMap<String, Object> map) {
		
		return msDAO.pwdUpdate(map);
	}
	
	
	@Override
	public int updateProfiledDefaultImg(HashMap<String, Object> map) {

		return msDAO.updateProfiledDefaultImg(map);
	}
	
	@Override
	public ProfileImg profileImgCheck(String userId) {
		
		return msDAO.profileImgCheck(userId);
	}

	@Override
	public int updateProfileImg(ProfileImg pI) {
		
		return msDAO.updateProfileImg(pI);
	}

	@Override
	public int memberUpdate(Member m) {
		
		return msDAO.memberUpdate(m);
	}

	@Override
	public int emailCheck(String email) {
		
		return msDAO.emailCheck(email);
	}

	@Override
	public int memberUpdateNoMail(Member m) {

		return msDAO.memberUpdateNoMail(m);
	}

	@Override
	public int memberWithdraw(Member m) {

		return msDAO.memberWithdraw(m);
	}

	@Override
	public int memberWithdrawDeleteFollower(Member m) {

		return msDAO.memberWithdrawDeleteFollower(m);
	}

	@Override
	public int memberWithdrawDeleteFollowing(Member m) {

		return msDAO.memberWithdrawDeleteFollowing(m);
	}

	



}
