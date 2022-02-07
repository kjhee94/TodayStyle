package kr.or.iei.myPage.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

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
	
	// 회원정보 수정 페이지 이동 
	@RequestMapping(value = "/myPage/memberUpdatePage.do")
	public String memberUpdatePage() {
		return "myPage/setting_memberUpdate";
	}
	
	// 회원정보 수정 - 닉네임 중복 확인 ajax
	@RequestMapping(value = "/myPage/nickNameCheck.do")
	public void nickNameCheck(@RequestParam String nickname, HttpServletResponse response) throws IOException
	{
		//System.out.println(nickname);
		int result = msService.nicknameCheck(nickname);
		
		if(result>0) {
			response.getWriter().print(true); // 사용중
		}else
		{
			response.getWriter().print(false); // 미사용중
		}
	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/myPage/memberUpdate.do")
	public String memberUpdatePage(@RequestParam String userName, @RequestParam String nickname, @RequestParam String gender, HttpServletRequest request)
	{
		System.out.println(userName);
		System.out.println(nickname);
		System.out.println(gender);
		String radio = request.getParameter("gender");
		System.out.println("radio: " +radio);
		
		
		return null;
	}

	// 비밀번호 수정 페이지로 이동
	@RequestMapping(value = "/myPage/pwdUpdatePage.do")
	public String pwdPage()
	{
		return "myPage/setting_pwdUpdate";
	}
	
	// 비밀번호 수정 - 현재 비밀번호 확인 ajax
	@RequestMapping(value = "/myPage/userPwdCheck.do")
	public void userPwdCheck(@RequestParam String userPwd, 
							@SessionAttribute Member member, 
							HttpServletResponse response) throws IOException 
	{
		//System.out.println(userPwd);
		String userId = member.getUserId();
		member.setUserPwd(userPwd);
		Member m = msService.settingPwdCheck(member);
		
		if(m!=null) {
			response.getWriter().print(true); // 회원 있음 == 비밀번호 일치
		}else
		{
			response.getWriter().print(false); // 회원 없음 == 비밀번호 불일치
		}
		
	}
	
	// 비밀번호 수정
	@RequestMapping(value = "/myPage/pwdUpdate.do", method=RequestMethod.POST)
	public ModelAndView pwdUpdate(@RequestParam String userPwd, @RequestParam String newUserPwd, 
							@SessionAttribute Member member,
							ModelAndView mav) 
	{
		String userId = member.getUserId();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("userPwd", userPwd);
		map.put("newUserPwd", newUserPwd);
		
		int result = msService.pwdUpdate(map);
		
		if(result>0)
		{
			mav.addObject("msg","비밀번호가 변경되었습니다.");
			mav.addObject("location","/myPage/setting.do");
		}else
		{
			mav.addObject("msg","비밀번호 변경에 실패하였습니다. -지속적인 문제 발생시 관리자에게 문의해주세요.");
			mav.addObject("location","/myPage/setting.do");
		}
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/myPage/withdraw.do")
	public String pwithdrawPage()
	{
		return "myPage/setting_withdraw";
	}
}
