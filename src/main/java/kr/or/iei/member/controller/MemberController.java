package kr.or.iei.member.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	 @Autowired
	 private JavaMailSender mailSender;
	
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
	public ModelAndView memberJoinus(Member m, ModelAndView mav,HttpServletRequest request)
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
	
	@RequestMapping(value="/member/idCheck.do",method=RequestMethod.GET)
	public void idCheck(@RequestParam String userid, HttpServletResponse response)throws IOException
	{
		
		
		int result = mService.IdCheck(userid);
		
		
		if(result>0)
		{
			response.getWriter().print(true);//true면 사용 중이다는 라는 의미
		}else
		{
			response.getWriter().print(false);//false면 미사용중이다라는 의미 
		}
	}
	
	@RequestMapping(value="/member/nicknameCheck.do", method=RequestMethod.GET)
	public void nicknameCheck(@RequestParam String nickname, HttpServletResponse response) throws IOException
	{
		
		int result = mService.nicknameCheck(nickname);
		
		
		if(result>0)
		{
			response.getWriter().print(true);//true면 사용 중이다는 라는 의미
		}else
		{
			response.getWriter().print(false);//false면 미사용중이다라는 의미 
		}
	}
	
	
	 /* 이메일 인증 */
    @RequestMapping(value="/member/emailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(@RequestParam String email) throws Exception{
        
     System.out.println(email);
     /* 인증번호(난수) 생성 */
     Random random = new Random();
     int checkNum = random.nextInt(888888) + 111111;
     System.out.println(checkNum);
     
     /* 이메일 보내기 */
     String setFrom = "hyeonji149@gmail.com";
     String toMail = email;
     String title = "회원가입 인증 이메일 입니다.";
     String content = 
             "인증 번호는 " + checkNum + "입니다." + 
             "<br>" + 
             "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
     try {
         
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
         helper.setFrom(setFrom);
         helper.setTo(toMail);
         helper.setSubject(title);
         helper.setText(content,true);
         mailSender.send(message);
         
     }catch(Exception e) {
         e.printStackTrace();
     }
     String num = Integer.toString(checkNum);
     return num;
    }
}
