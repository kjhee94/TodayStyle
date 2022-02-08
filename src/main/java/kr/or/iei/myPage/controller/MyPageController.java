package kr.or.iei.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.myPage.model.service.MemberSettingService;
import kr.or.iei.myPage.model.vo.ProfileImg;

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
				
				ProfileImg pI = msService.profileImgCheck(userId);
				//System.out.println(pI);
				model.addAttribute("ProfileImg",pI);
				
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
	
	
	
	@Autowired
	private ServletContext context;
	
	// 회원 정보 수정
	@RequestMapping(value = "/myPage/memberUpdate.do")
	public String memberUpdatePage(@SessionAttribute Member member, 
									HttpServletRequest request,
									Model model) throws IOException
	{
		// 1. 이미지 업로드(업로드 했을 경우만) 		2. 정보 수정

		
		// 이미지 업로드는 기존 이미지를 삭제하고 새로운 이미지 저장
		
		// 업로드 유저
		String userId = member.getUserId();
		
		// 1. 업로드 경로 (실제 절대경로 위치가 필요함)
		String uploadPath = "/resources/upload/profileImg/";
		String uploadFilePath = context.getRealPath(uploadPath);
		
		// 2. 파일 사이즈 (최대 10MB)
		int uploadFileSizeLimit = 10*1024*1024;
		
		// 3. 파일 이름에 대한 인코딩 처리
		String encType="UTF-8";
		
		// 4. 위에 정보들을 바탕으로 MultipartRequest 객체 생성
		// 필요한 정보는 5가지
		// - request 객체
		// - 업로드 경로 (uploadFilePath)
		// - 파일 업로드 제한 사이즈 (uploadFileSizeLimit)
		// - 파일명 인코딩 타임 (encType)
		// - 동일한 이름에 대한 정책 (DefaultFilerenamePolicy 객체)
		
		MultipartRequest multi = new MultipartRequest(request,
													uploadFilePath,
													uploadFileSizeLimit,
													encType,
													new DefaultFileRenamePolicy());
		// MultipartRequest 객체가 생성되면 설정해놓은 경로에 파일이 업로드된다.
		System.out.println("name: "+multi.getFilesystemName("profileImg"));
		
		// 이미지 파일의 길이로 사진 업로드 유무 판단
		// 업로드 했을 경우 서버의 기존 파일 삭제와 디비에 업데이트 진행
		File tmp = new File(uploadFilePath+ "\\" +multi.getFilesystemName("profileImg"));
		if(tmp.length()>0)
		{
			// 이미지 사이즈 검증(파일 크기 확인 후 10MB 이상이면 삭제)
			if(tmp.length()>(1024*1024*10))
			{
				tmp.delete(); // 해당 파일 삭제
				model.addAttribute("msg","이미지 파일의 최대 크기는 10MB입니다.");
				model.addAttribute("location","/myPage/memberUpdatePage.do");
				return "common/msg";
			}
			
			// 서버에 프로필 사진이 있을 경우 삭제
			ProfileImg pIresult = msService.profileImgCheck(userId);
			//System.out.println(pIresult);
			if(pIresult!=null)
			{
				// 서버 사진 삭제
				File file = new File(uploadFilePath+ "/" +pIresult.getImgName());
				if(file.exists())
				{
					// 파일이 서버에 존재하면 삭제
					file.delete();
					//System.out.println("deleteName : " +file.getName());
					//System.out.println("서버 파일 삭제");
					
				}
			}
			// 삭제 후 업로드 진행
			// --- db에 저장하기 위한 처리 --- 
			String imgName = multi.getFilesystemName("profileImg");
			//System.out.println(fileName);
			String filePath = "/resources/upload/profileImg/" +imgName;
			
			ProfileImg pI = new ProfileImg();
			pI.setUserId(userId);
			pI.setImgName(imgName);
			pI.setFilePath(filePath);
			
			int pIResult = msService.updateProfileImg(pI);
			
			if(pIResult>0)
			{
				//System.out.println("프로필 이미지 정상 업로드");
			}
			else 
			{
				model.addAttribute("msg","사진 수정에 실패하였습니다.\n- 지속적인 문제 발생시 관리자에게 문의해주세요. -");
				model.addAttribute("location","/myPage/setting.do");
				return "common/msg";
			}
		}
		
		// 사진 수정 완료 후 회원 정보 수정
		String userName = multi.getParameter("userName");
		String nickname = multi.getParameter("nickname");
		String userEmail = multi.getParameter("userEmail");
		String gender = multi.getParameter("gender");
		
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserName(userName);
		m.setNickname(nickname);
		m.setUserEmail(userEmail);
		m.setGender(gender);
		
		int memberUpdateResult = msService.memberUpdate(m);
		
		if(memberUpdateResult>0) 
		{
			model.addAttribute("msg","회원정보가 수정되었습니다.");
			model.addAttribute("location","/myPage/setting.do");
			return "common/msg";
		}
		else
		{
			model.addAttribute("msg","회원 정보 수정에 실패하였습니다.\n- 지속적인 문제 발생시 관리자에게 문의해주세요. -");
			model.addAttribute("location","/myPage/setting.do");
			return "common/msg";
		}
		
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
