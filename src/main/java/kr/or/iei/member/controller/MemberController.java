package kr.or.iei.member.controller;

import java.io.IOException;
import java.util.HashMap;
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
import kr.or.iei.member.model.service.kakaoService;
import kr.or.iei.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	 @Autowired
	 private JavaMailSender mailSender;
	 
	 @Autowired
	 private kakaoService kakaoService;
	
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
	
	
	@RequestMapping(value="/member/joinPage.do", method=RequestMethod.GET)
	public String joinPage()
	{
		return "member/joinPage";
	}
	
	@RequestMapping(value="/member/findPwdPage.do",method=RequestMethod.GET)
	public String findPwdPage()
	{
		return "member/findPwdPage";
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
		System.out.println(m);
		if(m!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			
			if(m.getRoll().substring(0,2).equals("AD")) {
				return "admin/adminLogin";
			}
			
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
			String userId = m.getUserId();
			//아이디 첫글자
			String firstId = userId.substring(0,1);
			
			
			//아이디 중간글자
			String midId = userId.substring(1,userId.length()-1);
			
			
			//중간글자 마스킹
			String id = "";
			for(int i = 0; i<midId.length(); i++)
			{
				id +="*";//중간 글자 수 만큼 * 표시
			}
			//마지막 아이디 글자
			String lastId = userId.substring(userId.length()-1,userId.length());
			
			//마스킹 완성된 사용자 아이디
			String maskingId=firstId+id+lastId;
			mav.addObject("m",m);
			mav.addObject("maskingId",maskingId);
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
        
     /* 인증번호(난수) 생성 */
     Random random = new Random();
     int checkNum = random.nextInt(888888) + 111111;
     System.out.println(checkNum);
     
     /* 이메일 보내기 */
     String setFrom = "hyeonji149@gmail.com";
     String toMail = email;
     String title = "[오늘 뭐 입지?] 인증 이메일 입니다.";
     String content = "인증코드를 확인해주세요.(회원가입)" + 
    		 	"<br><br>" + 
				checkNum + 
				"<br><br>" + 
				"이메일 인증 절차에 따라 이메일 인증코드를 발급해드립니다. <br>" + 
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
   
    
    @RequestMapping(value="/member/mailCheck.do", method=RequestMethod.GET)
    public void mailCheck(@RequestParam String userEmail,HttpServletResponse response)throws IOException
    {
    	
    	int result = mService.mailCheck(userEmail);
    	if(result>0)
		{
			response.getWriter().print(true);//true면 사용 중이다는 라는 의미
		}else
		{
			response.getWriter().print(false);//false면 미사용중이다라는 의미 
		}
    }
    
    
    @RequestMapping(value="/member/findPwdRe.do",method=RequestMethod.GET)
    @ResponseBody
    public String findPwdRe(@RequestParam String email)
    {
    	System.out.println(email);
    	  /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println(checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "hyeonji149@gmail.com";
        String toMail = email;
        String title = "[오늘 뭐 입지?] 인증 이메일 입니다.";
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
    
    @RequestMapping(value="/member/findPwd.do",method=RequestMethod.POST)
    @ResponseBody
    public ModelAndView findPwd(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam String userId,
			@RequestParam String userEmail,
			Member m,
			ModelAndView mav
			) throws IOException
    {
    	
    	  Random random = new Random();
          int checkNum = random.nextInt(888888) + 111111;
          System.out.println(checkNum);
          
          /* 이메일 보내기 */
          String setFrom = "hyeonji149@gmail.com";
          String toMail = userEmail;
          String title = "[오늘 뭐 입지?] 임시 비밀번호 발급 이메일 입니다.";
          String content = "인증코드를 확인해주세요.(비밀번호 발급)" + 
        		  	"<br><br>" + 
        		  	checkNum + 
        		  	"<br><br>" + 
        		  	"해당 비밀번호를 마이페이지 내 비밀번호 변경에서 변경해주세요.";
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
  
          
          HashMap<String, Object> map = new HashMap<String,Object>();
          map.put("num", num);
          map.put("userId",userId);
          map.put("userEmail",userEmail);
    	
          int newPwd = mService.findNewPwd(map);
        
          if(newPwd>0)
          {
        	  mav.addObject("msg","입력하신 이메일로 임시비밀번호를 발급했습니다");
  			  mav.addObject("location","/member/loginPage.do");//아이디 이메일 같을때
          }else
          {
        	  mav.addObject("msg","회원 정보가 없습니다.");
  			mav.addObject("location","/member/findPwdPage.do");//아이디 이메일 다를때
          }
  		
        
          mav.setViewName("member/msg"); 
  		
  		return mav;
       
    	
    }
    @RequestMapping(value="/main/kakao_login.ajax")
    public String kakaoLogin() {
        StringBuffer loginUrl = new StringBuffer();
        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
        loginUrl.append("efe990df155904844a586a916429d5d9"); 
        loginUrl.append("&redirect_uri=");
        loginUrl.append("http://127.0.0.1/kakao"); 
        loginUrl.append("&response_type=code");
        
        return "redirect:"+loginUrl.toString();
    }
    @RequestMapping("/kakao")
    public ModelAndView home(@RequestParam(value = "code", required = false) String code, HttpSession session
    		,HttpServletRequest request,ModelAndView mav,Member member) throws Exception{
       //System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        HashMap<String, String> userInfo = kakaoService.getUserInfo(access_Token);
        //System.out.println("###access_Token#### : " + access_Token);
        String userId = userInfo.get("email");
        
        String email =   userInfo.get("email");
     
        String name =  userInfo.get("nickname");
        String nickname =   userInfo.get("nickname");
        String password = userInfo.get("email");
        
	HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("email", email);
		map.put("nickname", nickname);
		map.put("password", password);
		map.put("userId", userId);
		map.put("name", name);
        
        
      
        int check = mService.kakaoemail(email);
      //System.out.println(check);
      
    
      
    	  int find =  mService.findkakao(email);
      if(find>0)//1있다면
      {
    	  Member m = mService.kakaoMember(member,email);
			session.setAttribute("member", m);
			mav.addObject("location","/");
			mav.setViewName("member/msg2"); 
    	 
      }else
      {
    	  
    	  if(check>0)//이메일이 겹친다면
          {
        	  mav.addObject("msg","이미 사용중인 이메일입니다.");
    			mav.addObject("location","/");
    			mav.setViewName("member/msg"); 
          }else {
    	  
    	int result = mService.kakaoinsert(map);
    	if(result>0)
    	{
    	 mav.addObject("msg","회원가입 완료(비밀번호는 이메일로 설정되었습니다.)");
			mav.addObject("location","/");
			mav.setViewName("member/msg"); 
    	}
          }
      }//0 없다면
      
       
      return mav;

}
}
