package kr.or.iei.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.myPage.model.service.MemberSettingService;

@Controller
public class MyPageController {
	
	@Autowired
	private MemberSettingService msService;
	
	@RequestMapping(value="/myPage/myStyle.do")
	public String myPage()
	{
		return "myPage/myStyle";
	}
	
	@RequestMapping(value = "/mypage/myCoordi.do")
	public String myCoordiPage()
	{
		return "myPage/myStyle_myCoordi";
	}
	
	
	@RequestMapping(value = "/myPage/userPage.do")
	public String userPage()
	{
		return "myPage/userPage";
	}
	
	@RequestMapping(value = "/myPage/scrap.do")
	public String scrapPage()
	{
		return "myPage/scrap";
	}
	
	@RequestMapping(value = "/myPage/comments.do")
	public String commentsPage()
	{
		return "myPage/comments";
	}
	
	// 설정 들어가면 비밀번호 확인  -> 확인 되었다면 회원 정보 수정 페이지로 이동
	@RequestMapping(value = "/myPage/setting.do")
	public String setttingPage(HttpServletRequest request, 
								@SessionAttribute Member member, 
								HttpSession session,
								Model model)
	{
		String userPwd = request.getParameter("userPwd");
		//System.out.println(userPwd);
		
		if(userPwd == null) {
			// userPwd가 null이라면 설정 초기 요청 -> 비밀번호 확인 페이지
			return "myPage/setting_pwdCheck";
		}
		else
		{
			// userPwd가 null이 아니라면 비밀번호를 확인한 상태 -> 비밀번호가 일치한다면 회원정보 수정 페이지
			String userId = member.getUserId();
			member.setUserPwd(userPwd);
			
			Member m = msService.settingPwdCheck(member);
			//System.out.println(m);
			
			if(m!=null) {
				session.setAttribute("member",m); // 회원정보(세션) 갱신
				
				return "myPage/setting_memberUpdate";
			}else
			{
				model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
				model.addAttribute("location","/myPage/setting.do");
				return "common/msg";
			}
			
		}
		
		
	}
	
	@RequestMapping(value = "/myPage/memberUpdate.do")
	public String memberUpdatePage()
	{
		return "myPage/setting_memberUpdate";
	}
	
	@RequestMapping(value = "/myPage/pwdUpdate.do")
	public String pwdPage()
	{
		return "myPage/setting_pwdUpdate";
	}
	
	@RequestMapping(value = "/myPage/withdraw.do")
	public String pwithdrawPage()
	{
		return "myPage/setting_withdraw";
	}
}
