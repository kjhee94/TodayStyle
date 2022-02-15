package kr.or.iei.myPage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.iei.board.model.vo.Notice;
import kr.or.iei.coordi.model.service.CoordiService;
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

	@Autowired
	private CoordiService coService;
	
	
	// 프로필 
	public void profile(@SessionAttribute Member member, Model model) {
		
		// profile 내용 (nickname, 프로필 이미지 경로, 팔로잉&팔로워 수, follow user 정보)

		// 닉네임
		String nickname = member.getNickname();

		// 프로필 이미지 경로
		String userId = member.getUserId();
		String filepath = mpService.profileFilePath(userId);

		// 팔로잉&팔로워 수
		String followingNum = mpService.followingNum(userId);
		String followerNum = mpService.followerNum(userId);

		// 팔로우 사용자 정보 ( 프로필 이미지 경로, 닉네임, 회원번호)
		ArrayList<Follow> followerList = mpService.followerList(userId);
		//System.out.println(followerList);
		ArrayList<Follow> followingList = mpService.followingList(userId);
		System.out.println(followingList);
		
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingList", followingList);
		model.addAttribute("nickname", nickname);
		model.addAttribute("filepath", filepath);
		model.addAttribute("followingNum", followingNum);
		model.addAttribute("followerNum", followerNum);
	}

	// 나의 코디 페이지
	@RequestMapping(value = "/myPage/myStyle.do")
	public String myPage(@SessionAttribute Member member, Model model) {
		
		//1. profile 내용
		profile(member, model);
		
		// 2. content 내용
		String userId = member.getUserId();
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

		// profile 내용
		profile(member, model);
		
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

		// profile 내용
		profile(member, model);
		
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

		// profile 내용
		profile(member, model);
		
		String userId = member.getUserId();

		ArrayList<ScrapCoordiList> scList = mpService.scrapCoordiList(userId);
		// System.out.println(scList);

		model.addAttribute("ScrapCoordiList", scList);

		return "myPage/scrap_coordi";
	}

	// 스크랩(잇템) 페이지
	@RequestMapping(value = "/myPage/scrapItTem.do")
	public String scrapItTem(@SessionAttribute Member member, Model model) {

		// profile 내용
		profile(member, model);
		
		String userId = member.getUserId();

		ArrayList<ScrapItTemList> siList = mpService.scrapItTemList(userId);
		// System.out.println("siList"+siList);

		model.addAttribute("ScrapItTemList", siList);

		return "myPage/scrap_itTem";
	}

	// 댓글(코디) 페이지
	@RequestMapping(value = "/myPage/commentsCoordi.do")
	public String commentsCoordi(HttpServletRequest request, @SessionAttribute Member member, Model model) 
	{

		// profile 내용
		profile(member, model);
		
		int currentPage;
		if (request.getParameter("currentPage")==null)
		{
			currentPage = 1;
		}else {

			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		String userId = member.getUserId();
		
		HashMap<String, Object> pageDataMap = mpService.commentsPageDataMap(currentPage, userId);
		
		ArrayList<Notice> cmtList = (ArrayList<Notice>)pageDataMap.get("list");
		String pageNavi = (String)pageDataMap.get("pageNavi");
		
		//System.out.println(cmtList);
		//System.out.println(pageNavi);
		
		
		
		model.addAttribute("cmtList", cmtList);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("currentPage", currentPage);
		
		return "myPage/comments_coordi";
	}

	// 댓글(잇템) 페이지
	@RequestMapping(value = "/myPage/commentsItTem.do")
	public String commentsItTem(HttpServletRequest request,@SessionAttribute Member member, Model model) {

		// profile 내용
		profile(member, model);

		int currentPage;
		if (request.getParameter("currentPage")==null)
		{
			currentPage = 1;
		}else {

			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		String userId = member.getUserId();
		
		HashMap<String, Object> pageDataMap = mpService.itTemPageDataMap(currentPage, userId);
		
		ArrayList<Notice> itTemCmtList = (ArrayList<Notice>)pageDataMap.get("list");
		String pageNavi = (String)pageDataMap.get("pageNavi");
		
		//System.out.println(itTemList);
		//System.out.println(pageNavi);
		
		
		
		model.addAttribute("itTemCmtList", itTemCmtList);
		model.addAttribute("itTempageNavi", pageNavi);
		model.addAttribute("currentPage", currentPage);
		
		return "myPage/comments_ItTem";
	}
	
	// 팔로우 취소
	@RequestMapping(value = "/myPage/unFollow.do")
	public void unFollow(@RequestParam String unfollowUserId, @SessionAttribute Member member)
	{

		System.out.println(unfollowUserId);
		String userId = member.getUserId();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("unfollowUserId", unfollowUserId);
		map.put("userId", userId);
		
		int result=mpService.unFollow(map);
		
		if(result>0) {
			System.out.println("팔로우 취소 완료");
		}
		else {
			System.out.println("팔로우 취소 실패");
		}
		
		return ;
	}
	
	// 팔로우
	@RequestMapping(value = "/myPage/follow.do")
	public String follow(@RequestParam String followUserId,@SessionAttribute Member member)
	{
		
		if(member != null)
		{
			String userId = member.getUserId();
			
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("followUserId", followUserId);
			map.put("userId", userId);
			
			int result=mpService.follow(map);
			
			if(result>0) {
				System.out.println("팔로우 완료");
			}
			else {
				System.out.println("팔로우 실패");
			}
			
			return "myPage/myStyle";
		}
		else
		{
			return "redirect:/member/loginPage.do";
		}
		
	}
	
	
	// 댓글 삭제(잇템)
	@RequestMapping(value = "/myPage/deleteItTemComment.do")
	public String deleteItTemComment(@RequestParam int cmtNo)
	{
		int result = mpService.deleteItTemComment(cmtNo);
		
		return "myPage/scrap_itTem";
	}
	
	// 댓글 삭제(코디)
	@RequestMapping(value = "/myPage/deleteCoordiComment.do")
	public String deleteCoordiComment(@RequestParam int cmtNo)
	{
		int result = mpService.deleteCoordiComment(cmtNo);
		
		return "myPage/scrap_coordi";
	}
	
	
	// 개인페이지 프로필 정보 (로그인 O)
	public void memberProfile(Model model, String memberUserId, String userId)
	{

		// 프로필 내용 (userId, 프로필 이미지, 닉네임, 팔로우 수, 팔로우 버튼(팔로우/팔로잉/탈퇴))
		String memberProfileFilepath = mpService.profileFilePath(memberUserId);
		String memberNickname = mpService.memberNickname(memberUserId);
		String memberFollowingNum = mpService.followingNum(memberUserId);
		String memberFollowerNum = mpService.followerNum(memberUserId);
		String memberEndYN = mpService.memberEndYN(memberUserId); // N : 회원 / Y : 탈퇴
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("memberUserId", memberUserId);
		int memberFollowYN = mpService.memberFollowYN(map); // 1 : 팔로우 / 2 : 팔로우x
		String followBtn;
		
		if(memberEndYN.equals("N"))
		{
			if(memberFollowYN == 1)
			{
				followBtn = "팔로잉";
			}else
			{
				followBtn = "팔로우";
			}
		}else
		{
			followBtn = "탈퇴";
		}
		
		// 팔로우 사용자 정보 ( 프로필 이미지 경로, 닉네임, 회원번)
		ArrayList<Follow> followerList = mpService.followerList(memberUserId);
		//System.out.println(followerList);
		ArrayList<Follow> followingList = mpService.followingList(memberUserId);
		System.out.println(followingList);
		
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingList", followingList);
		
		model.addAttribute("memberUserId", memberUserId);
		model.addAttribute("memberProfileFilepath", memberProfileFilepath);
		model.addAttribute("memberNickname", memberNickname);
		model.addAttribute("memberFollowingNum", memberFollowingNum);
		model.addAttribute("memberFollowerNum", memberFollowerNum);
		model.addAttribute("followBtn", followBtn);
		
	}
	// 개인페이지 프로필 정보 (로그인 X)
	public void nLoginMemberProfile(Model model, String memberUserId)
	{

		// 프로필 내용 (userId, 프로필 이미지, 닉네임, 팔로우 수, 팔로우 버튼(팔로우/팔로잉/탈퇴))
		String memberProfileFilepath = mpService.profileFilePath(memberUserId);
		String memberNickname = mpService.memberNickname(memberUserId);
		String memberFollowingNum = mpService.followingNum(memberUserId);
		String memberFollowerNum = mpService.followerNum(memberUserId);
		String memberEndYN = mpService.memberEndYN(memberUserId); // N : 회원 / Y : 탈퇴
		
		String followBtn;
		
		if(memberEndYN.equals("N"))
		{
			
			followBtn = "팔로우";
			
		}else
		{
			followBtn = "탈퇴";
		}

		// 팔로우 사용자 정보 ( 프로필 이미지 경로, 닉네임, 회원번)
		ArrayList<Follow> followerList = mpService.followerList(memberUserId);
		//System.out.println(followerList);
		ArrayList<Follow> followingList = mpService.followingList(memberUserId);
		System.out.println(followingList);
		
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingList", followingList);
		
		model.addAttribute("memberUserId", memberUserId);
		model.addAttribute("memberProfileFilepath", memberProfileFilepath);
		model.addAttribute("memberNickname", memberNickname);
		model.addAttribute("memberFollowingNum", memberFollowingNum);
		model.addAttribute("memberFollowerNum", memberFollowerNum);
		model.addAttribute("followBtn", followBtn);
		
	}
	

	// 개인페이지 - 메인
	@RequestMapping(value = "/myPage/userPage.do", method = RequestMethod.GET)
	public String userPage(HttpServletRequest request, Model model, HttpSession session) {
		
		Member member = (Member)session.getAttribute("member");

		String memberUserId = request.getParameter("userId");
		
		if(member != null) 
		{

			//System.out.println(userId);
			String userId = member.getUserId();
			
			if(memberUserId.equals(userId))
			{
				return "redirect:/myPage/myStyle.do";
			}
			else
			{
				// memberFrofile data
				memberProfile(model, memberUserId, userId);
				
				ArrayList<MyCoordiList> memberCoordiList = mpService.myCoordiList(memberUserId);
				//System.out.println(memberCoordiList);
				model.addAttribute("memberCoordiList", memberCoordiList);
				
				model.addAttribute("memberUserId", memberUserId);

				ArrayList<MyItTemList> memberItTemList = mpService.myItTemList(memberUserId);
				// System.out.println(myItTemList);
				model.addAttribute("memberItTemList", memberItTemList);
				
				return "myPage/userPage";
			}
		}
		else
		{
			nLoginMemberProfile(model, memberUserId);

			ArrayList<MyCoordiList> memberCoordiList = mpService.myCoordiList(memberUserId);
			//System.out.println(memberCoordiList);
			model.addAttribute("memberCoordiList", memberCoordiList);
			
			model.addAttribute("memberUserId", memberUserId);

			ArrayList<MyItTemList> memberItTemList = mpService.myItTemList(memberUserId);
			// System.out.println(myItTemList);
			model.addAttribute("memberItTemList", memberItTemList);
			
			
			return "myPage/userPage";
		}
		
		
	}
	
	// 개인페이지 - 코디 전체보기 페이지
	@RequestMapping(value = "/mypage/memberCoordi.do", method = RequestMethod.GET)
	public String memberCoordiPage(HttpServletRequest request, @SessionAttribute Member member, Model model) {
		
		String memberUserId = request.getParameter("userId");
		//System.out.println(memberUserId);
		String userId = member.getUserId();
		//System.out.println(userId);
		
		if(memberUserId.equals(userId))
		{
			return "redirect:/myPage/myStyle.do";
		}
		else
		{
			// memberFrofile data
			memberProfile(model, memberUserId, userId);
			
			ArrayList<MyCoordiList> memberCoordiList = mpService.myCoordiList(memberUserId);
			//System.out.println(memberCoordiList);
			model.addAttribute("memberCoordiList", memberCoordiList);
			model.addAttribute("memberUserId", memberUserId);
			
			ArrayList<Integer> memberLikeList=coService.selectLikeList(userId);
			ArrayList<Integer> memberScrapList=coService.selectScrapList(userId);
			model.addAttribute("memberLikeList", memberLikeList);
			model.addAttribute("memberScrapList", memberScrapList);

			return "myPage/userPage_AllCoordi";
		}
		
		
	}
	

	// 개인페이지 - 잇템 전체보기 페이지
	@RequestMapping(value = "/mypage/memberItTem.do", method = RequestMethod.GET)
	public String memberItTemPage(HttpServletRequest request, @SessionAttribute Member member, Model model) {
		
		String memberUserId = request.getParameter("userId");
		//System.out.println(memberUserId);
		String userId = member.getUserId();
		//System.out.println(userId);
		
		if(memberUserId.equals(userId))
		{
			return "redirect:/myPage/myStyle.do";
		}
		else
		{
			// memberFrofile data
			memberProfile(model, memberUserId, userId);
			
			ArrayList<MyItTemList> memberItTemList = mpService.myItTemList(memberUserId);
			//System.out.println(memberCoordiList);
			model.addAttribute("memberItTemList", memberItTemList);
			model.addAttribute("memberUserId", memberUserId);

			ArrayList<Integer> memberLikeList=coService.selectLikeList(userId);
			ArrayList<Integer> memberScrapList=coService.selectScrapList(userId);
			model.addAttribute("memberLikeList", memberLikeList);
			model.addAttribute("memberScrapList", memberScrapList);

			return "myPage/userPage_AllItTem";
		}

	

	}
}
