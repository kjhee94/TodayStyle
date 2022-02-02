package kr.or.iei.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	
	@RequestMapping(value="/member/loginPage.do", method=RequestMethod.GET)
	public String loginPage()
	{
		return "member/loginPage";
	}

	@RequestMapping(value="/member/findIdPage.do", method=RequestMethod.GET)
	public String findIdPage()
	{
		return "member/findIdPage";
	}
	
	@RequestMapping(value="/member/findPwdPage.do", method=RequestMethod.GET)
	public String findPwdPage()
	{
		return "member/findPwdPage";
	}
	
	
	@RequestMapping(value="/member/joinPage.do", method=RequestMethod.GET)
	public String joinPage()
	{
		return "member/joinPage";
	}
	
	@RequestMapping(value="/member/joinMember.do", method=RequestMethod.POST)
	public ModelAndView memberJoinus(Member m, ModelAndView mav)
	{
		int result = mService.insertMember(m);
		
		if(result>0)
		{
			//System.out.println("회원가입 성공");
			mav.addObject("msg","회원가입 성공!!");
			mav.addObject("location","/");
		}else
		{
			//System.out.println("회원가입 실패");
			mav.addObject("msg","회원 가입 실패!");
			mav.addObject("location","/member/joinPage.do");
		}
		
		mav.setViewName("member/msg"); 
		
		return mav;
	}
	
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest request,
					Member member
				)
	{	
		Member m = mService.selectLoginMember(member);
		System.out.println(m);
		if(m!=null)
		{
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			
			return "redirect:/";
		}else {
			return "member/loginFail";
		}
		
		
	}
	

	@RequestMapping(value="/member/findId.do",method=RequestMethod.POST)
	public ModelAndView findId(HttpServletRequest request,
			HttpServletResponse response,
			 Member member,
			ModelAndView mav)
	{
		
		Member m = mService.findId(member);
		
		
		if(m!=null)
		{
			mav.addObject("m",m);
			mav.setViewName("member/findIdPage"); 
		}else
		{
			mav.addObject("msg","회원 정보가 없습니다.");
			mav.addObject("location","/member/findIdPage.do");
			mav.setViewName("member/msg"); 
		}
		return mav;
	}
	
	@RequestMapping(value="/member/logout.do",method=RequestMethod.GET)
	public String logout(HttpSession session, @SessionAttribute Member member)
	{
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	
	
}
