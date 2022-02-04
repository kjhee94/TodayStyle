package kr.or.iei.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.myPage.model.dao.MemberSettingDAO;

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

}
