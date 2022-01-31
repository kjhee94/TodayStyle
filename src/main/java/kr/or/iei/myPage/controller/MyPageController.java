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
	
	

}
