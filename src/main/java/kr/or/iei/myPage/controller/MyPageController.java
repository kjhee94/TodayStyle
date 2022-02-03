package kr.or.iei.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
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
	@RequestMapping(value = "/myPage/setting.do")
	public String setttingPage()
	{
		return "myPage/setting_pwdCheck";
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
