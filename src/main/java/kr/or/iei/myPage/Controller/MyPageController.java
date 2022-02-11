package kr.or.iei.myPage.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.memberSetting.model.service.MemberSettingService;
import kr.or.iei.myPage.model.service.MyPageService;
import kr.or.iei.myPage.model.vo.Follow;
import kr.or.iei.myPage.model.vo.MyCoordiList;
import kr.or.iei.myPage.model.vo.MyItTemList;
import kr.or.iei.myPage.model.vo.ScrapCoordiList;
import kr.or.iei.myPage.model.vo.ScrapItTemList;

@Controller
public class MyPageController {

	@Autowired
	private MemberSettingService msService;

	@Autowired
	private MyPageService mpService;

	/*
	 * // 프로필 데이터를 세션에 담는 메소드 public void profileData(@SessionAttribute Member
	 * member, HttpSession session) { // 1. profile 내용 // - 이름 // - 사진(경로) // -
	 * 팔로워/팔로잉 수 String userId = member.getUserId();
	 * 
	 * ProfileImg pI = msService.profileImgCheck(userId); // System.out.println(pI);
	 * String filePath = pI.getFilePath(); System.out.println(filePath);
	 * session.setAttribute("ProfileImgPath", filePath);
	 * 
	 * // 사용자가 팔로우한 사람 수 String result = mpService.followingNum(userId);
	 * 
	 * }
	 */

	// 나의 코디 페이지
	@RequestMapping(value = "/myPage/myStyle.do")
	public String myPage(@SessionAttribute Member member, Model model) {

		// 1. profile 내용 (nickname, 프로필 이미지 경로, 팔로잉&팔로워 수, follow user 정보)

		// 닉네임
		String nickname = member.getNickname();

		// 프로필 이미지 경로
		String userId = member.getUserId();
		String filepath = mpService.profileFilePath(userId);

		// 팔로잉&팔로워 수
		String followingNum = mpService.followingNum(userId);
		String followerNum = mpService.followerNum(userId);

		// 팔로우 사용자 정보 ( 프로필 이미지 경로, 닉네임, 회원번)
		ArrayList<Follow> followerList = mpService.followerList(userId);
		//System.out.println(followerList);
		ArrayList<Follow> followingList = mpService.followingList(userId);
		//System.out.println(followingList);
		
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingList", followingList);
		model.addAttribute("nickname", nickname);
		model.addAttribute("filepath", filepath);
		model.addAttribute("followingNum", followingNum);
		model.addAttribute("followerNum", followerNum);

		// 2. content 내용

		// user coordi list (코디글 번호, 이미지 경로)
		ArrayList<MyCoordiList> myCoordiList = mpService.myCoordiList(userId);
		// System.out.println(myCoordiList);
		model.addAttribute("myCoordiList", myCoordiList);

		// user itTem list (잇템글 번호, 이미지 경로)
		ArrayList<MyItTemList> myItTemList = mpService.myItTemList(userId);
		// System.out.println(myItTemList);
		model.addAttribute("myItTemList", myItTemList);

		return "myPage/myStyle";
	}

	// 나의 코디 전체보기 페이지
	@RequestMapping(value = "/mypage/myCoordi.do")
	public String myCoordiAll(@SessionAttribute Member member, Model model) {

		String userId = member.getUserId();

		// user coordi list (코디글 번호, 이미지 경로)
		ArrayList<MyCoordiList> myCoordiList = mpService.myCoordiList(userId);
		// System.out.println(myCoordiList);
		model.addAttribute("myCoordiList", myCoordiList);

		return "myPage/myStyle_myCoordi";
	}

	// 나의 잇템 전체보기 페이지
	@RequestMapping(value = "/mypage/myItTem.do")
	public String myItTemAll(@SessionAttribute Member member, Model model) {

		String userId = member.getUserId();

		// user itTem list (잇템글 번호, 이미지 경로)
		ArrayList<MyItTemList> myItTemList = mpService.myItTemList(userId);
		// System.out.println(myItTemList);
		model.addAttribute("myItTemList", myItTemList);

		return "myPage/myStyle_myItTem";
	}

	// 스크랩(코디) 페이지
	@RequestMapping(value = "/myPage/scrapCoordi.do")
	public String scrapCoordi(@SessionAttribute Member member, Model model) {

		String userId = member.getUserId();

		ArrayList<ScrapCoordiList> scList = mpService.scrapCoordiList(userId);
		// System.out.println(scList);

		model.addAttribute("ScrapCoordiList", scList);

		return "myPage/scrap_coordi";
	}

	// 스크랩(잇템) 페이지
	@RequestMapping(value = "/myPage/scrapItTem.do")
	public String scrapItTem(@SessionAttribute Member member, Model model) {

		String userId = member.getUserId();

		ArrayList<ScrapItTemList> siList = mpService.scrapItTemList(userId);
		// System.out.println("siList"+siList);

		model.addAttribute("ScrapItTemList", siList);

		return "myPage/scrap_itTem";
	}

	// 댓글(코디) 페이지
	@RequestMapping(value = "/myPage/commentsCoordi.do")
	public String commentsCoordi(@SessionAttribute Member member, Model model) {
		
		String userId = member.getUserId();
		
		//ArrayList<ScrapItTemList> siList = mpService.scrapItTemList(userId);
		// System.out.println("siList"+siList);

		//model.addAttribute("ScrapItTemList", siList);

		
		return "myPage/comments_coordi";
	}

	// 댓글(잇템) 페이지
	@RequestMapping(value = "/myPage/commentsItTem.do")
	public String commentsItTem() {
		return "myPage/comments_ItTem";
	}
	
	// 팔로우 취소
	@RequestMapping(value = "/myPage/unFollow.do")
	public String unFollow(@RequestParam String unfollowUserId, @SessionAttribute Member member)
	{
		String userId = member.getUserId();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("unfollowUserId", unfollowUserId);
		map.put("userId", userId);
		
		int result=mpService.unFollow(map);
		/*
		if(result>0) {
			System.out.println("팔로우 취소 완료");
		}
		else {
			System.out.println("팔로우 취소 실패");
		}*/
		
		return "myPage/myStyle";
	}
	
	// 팔로우
	@RequestMapping(value = "/myPage/follow.do")
	public String follow(@RequestParam String followUserId, @SessionAttribute Member member)
	{
		String userId = member.getUserId();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("followUserId", followUserId);
		map.put("userId", userId);
		
		int result=mpService.follow(map);
		/*
		if(result>0) {
			System.out.println("팔로우 완료");
		}
		else {
			System.out.println("팔로우 실패");
		}*/
		
		return "myPage/myStyle";
	}

}
