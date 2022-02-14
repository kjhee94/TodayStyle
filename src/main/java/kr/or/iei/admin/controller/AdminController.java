package kr.or.iei.admin.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.admin.model.service.AdminService;
import kr.or.iei.coordi.model.vo.Coordi;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@RequestMapping(value = "/admin/adminMain.do")
	public ModelAndView adminMain(ModelAndView mav) {
		
		HashMap<String, Integer> map = aService.selectCountTodayNew();
		
		//현재 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy.MM.dd");
		// 포맷 적용
		String formatedNow = now.format(formatter);
		
		mav.addObject("map", map);
		mav.addObject("date", formatedNow);
		mav.setViewName("admin/adminMain");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/adminMember.do")
	public ModelAndView adminMember(HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectAllMember(currentPage);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminMember");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/memberOneEndYNChange.do", method = RequestMethod.POST)
	public void memberOneEndYNChange(@RequestParam String userId, @RequestParam char endYN, HttpServletResponse response) throws IOException {
		
		//삼항연상자
		endYN = (endYN == 'Y')?'N':'Y';
		
		int result = aService.updateMemberOneEndYNChange(userId, endYN);
		
		if(result>0) {
			response.getWriter().print(endYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/memberCheckedEndYNChange.do", method = RequestMethod.POST)
	public void memberCheckedEndYNChange(@RequestParam String userId, HttpServletResponse response) throws IOException {
		
		int result = aService.updateMemberCheckedEndYNChange(userId);
		
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/memberSearch.do", method = RequestMethod.GET)
	public ModelAndView memberSearch(@RequestParam String type, @RequestParam String keyword, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectSearchMember(currentPage,type,keyword);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminMember");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/adminNotice.do")
	public ModelAndView adminNotice(ModelAndView mav, HttpServletRequest request) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectAllNotice(currentPage);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminNotice");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/noticeOneEndYNChange.do", method = RequestMethod.POST)
	public void noticeOneEndYNChange(@RequestParam int noticeNo, @RequestParam char endYN, HttpServletResponse response) throws IOException {
		
		//삼항연상자
		endYN = (endYN == 'Y')?'N':'Y';
		
		int result = aService.updateNoticeOneEndYNChange(noticeNo, endYN);
		
		if(result>0) {
			response.getWriter().print(endYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/noticeCheckedEndYNChange.do", method = RequestMethod.POST)
	public void noticeCheckedEndYNChange(@RequestParam String noticeNo, HttpServletResponse response) throws IOException {
		
		int result = aService.updateNoticeCheckedEndYNChange(noticeNo);
		
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/noticeSearch.do", method = RequestMethod.GET)
	public ModelAndView noticeSearch(@RequestParam String type, @RequestParam String keyword, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectSearchNotice(currentPage,type,keyword);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminNotice");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/noticeInsert.do", method = RequestMethod.POST)
	public ModelAndView noticeInsert(@RequestParam String title, @RequestParam String content, ModelAndView mav) {
		
		//textarea 줄개행 치환
		content = content.replace("\r\n","<br>");
		
		int result = aService.insertNotice(title, content);
		
		if(result>0) {
			mav.addObject("msg","등록이 완료되었습니다");
		}else {
			mav.addObject("msg","등록에 실패했습니다");
			
		}
		mav.addObject("location", "/admin/adminNotice.do");
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/noticeUpdate.do", method = RequestMethod.POST)
	public ModelAndView noticeUpdate(@RequestParam String title, @RequestParam String content, @RequestParam int noticeNo,
									ModelAndView mav) {
		
		//textarea 줄개행 치환
		content = content.replace("\r\n","<br>");
		
		int result = aService.updateNotice(title, content, noticeNo);
		
		if(result>0) {
			mav.addObject("msg","수정이 완료되었습니다");
		}else {
			mav.addObject("msg","수정에 실패했습니다");
			
		}
		mav.addObject("location", "/admin/adminNotice.do");
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/adminFAQ.do")
	public ModelAndView adminFAQ(ModelAndView mav, HttpServletRequest request) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectAllFAQ(currentPage);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminFAQ");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/faqOneEndYNChange.do")
	public void faqOneEndYNChange(@RequestParam int faqNo, @RequestParam char endYN, HttpServletResponse response) throws IOException {
		
		//삼항연상자
		endYN = (endYN == 'Y')?'N':'Y';
		
		int result = aService.updateFAQOneEndYNChange(faqNo, endYN);
		
		if(result>0) {
			response.getWriter().print(endYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/faqCheckedEndYNChange.do", method = RequestMethod.POST)
	public void faqCheckedEndYNChange(@RequestParam String faqNo, HttpServletResponse response) throws IOException {
		
		int result = aService.updateFAQCheckedEndYNChange(faqNo);
		
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/faqSearch.do", method = RequestMethod.GET)
	public ModelAndView faqSearch(@RequestParam String category, @RequestParam String keyword, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectSearchFAQ(currentPage,category,keyword);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminFAQ");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/faqInsert.do", method = RequestMethod.POST)
	public ModelAndView faqInsert(@RequestParam String category, @RequestParam String title, @RequestParam String content, ModelAndView mav) {

		//textarea 줄개행 치환
		content = content.replace("\r\n","<br>");
		
		int result = aService.insertFAQ(category, title, content);
		
		if(result>0) {
			mav.addObject("msg","등록이 완료되었습니다");
		}else {
			mav.addObject("msg","등록에 실패했습니다");
			
		}
		mav.addObject("location", "/admin/adminFAQ.do");
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/faqUpdate.do", method = RequestMethod.POST)
	public ModelAndView faqUpdate(@RequestParam String category, @RequestParam String title, @RequestParam String content, @RequestParam int faqNo,
									ModelAndView mav) {
		
		//textarea 줄개행 치환
		content = content.replace("\r\n","<br>");
		
		int result = aService.updateFAQ(category, title, content, faqNo);
		
		if(result>0) {
			mav.addObject("msg","수정이 완료되었습니다");
		}else {
			mav.addObject("msg","수정에 실패했습니다");
			
		}
		mav.addObject("location", "/admin/adminFAQ.do");
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/adminCoordi.do")
	public ModelAndView adminCoordi(HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectAllCoordi(currentPage);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminCoordi");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/coordiOneDelYNChange.do")
	public void coordiOneDelYNChange(@RequestParam int coordiNo, @RequestParam char delYN, HttpServletResponse response) throws IOException {
		
		//삼항연상자
		delYN = (delYN == 'Y')?'N':'Y';
		
		int result = aService.updateCoordiOneDelYNChange(coordiNo, delYN);
		
		if(result>0) {
			response.getWriter().print(delYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/coordiCheckedDelYNChange.do", method = RequestMethod.POST)
	public void coordiCheckedDelYNChange(@RequestParam String coordiNo, HttpServletResponse response) throws IOException {
		
		int result = aService.updateCoordiCheckedDelYNChange(coordiNo);
		
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/coordiOneItemInfo.do", method = RequestMethod.POST)
	public void coordiOneItemInfo(@RequestParam int coordiNo, HttpServletResponse response) throws IOException {
		
		ArrayList<PostCoordi> list = aService.selectOneCoordiItem(coordiNo);
		
		JSONArray jsonArray = new JSONArray();
		
		for(PostCoordi pc : list) {
			
			JSONObject json = new JSONObject();
			
			json.put("coordiNo", pc.getCoordiNo());
			json.put("categoryCode", pc.getCategoryCode());
			json.put("brand", pc.getBrand());
			json.put("categoryName", pc.getCategoryName());
			
			jsonArray.add(json);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonArray);
	}
	
	@RequestMapping(value = "/admin/coordiSearch.do", method = RequestMethod.GET)
	public ModelAndView coordiSearch(@RequestParam String type, @RequestParam String keyword, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectSearchCoordi(currentPage,type,keyword);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminCoordi");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/adminCoordiComment.do")
	public ModelAndView adminCoordiComment(@RequestParam int coordiNo, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		HashMap<String, Object> map = aService.selectAllCoordiComment(currentPage,coordiNo);
		
		mav.addObject("map", map);
		mav.addObject("coordiNo", coordiNo);
		mav.setViewName("admin/adminCoordiComment");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/coordiCommentOneDelYNChange.do", method = RequestMethod.POST)
	public void coordiCommentOneDelYNChange(@RequestParam int cmtNo, @RequestParam String cmtDelYN, HttpServletResponse response) throws IOException {
		
		//삼항연산자
		cmtDelYN = (cmtDelYN.equals("Y"))?"N":"Y";
		
		int result = aService.updateCoordiCommentOneDelYNChange(cmtNo, cmtDelYN);
		
		if(result>0) {
			response.getWriter().print(cmtDelYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/coordiCommentCheckedDelYNChange.do", method = RequestMethod.POST)
	public void coordiCommentCheckedDelYNChange(@RequestParam String cmtNo, HttpServletResponse response) throws IOException {
		
		int result = aService.updateCoordiCommentCheckedDelYNChange(cmtNo);
		
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		
	}
	
	@RequestMapping(value = "/admin/coordiCommentSearch.do", method = RequestMethod.GET)
	public ModelAndView coordiCommentSearch(@RequestParam int coordiNo, @RequestParam String type, @RequestParam String keyword, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectSearchCoordiComment(currentPage,type,keyword,coordiNo);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminCoordiComment");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/adminIttem.do")
	public ModelAndView adminIttem(HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectAllIttem(currentPage);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminIttem");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/ittemOneDelYNChange.do")
	public void ittemOneDelYNChange(@RequestParam int itItemNo, @RequestParam char delYN, HttpServletResponse response) throws IOException {
		
		//삼항연상자
		delYN = (delYN == 'Y')?'N':'Y';
		
		int result = aService.updateIttemOneDelYNChange(itItemNo, delYN);
		
		if(result>0) {
			response.getWriter().print(delYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/ittemCheckedDelYNChange.do", method = RequestMethod.POST)
	public void ittemCheckedDelYNChange(@RequestParam String itItemNo, HttpServletResponse response) throws IOException {
		
		int result = aService.updateIttemCheckedDelYNChange(itItemNo);
		
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/ittemSearch.do", method = RequestMethod.GET)
	public ModelAndView ittemSearch(@RequestParam String type, @RequestParam String keyword, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectSearchIttem(currentPage,type,keyword);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminIttem");
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/admin/adminIttemComment.do")
	public ModelAndView adminIttemComment(@RequestParam int itItemNo, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		HashMap<String, Object> map = aService.selectAllIttemComment(currentPage,itItemNo);
		
		mav.addObject("map", map);
		mav.addObject("itItemNo", itItemNo);
		mav.setViewName("admin/adminIttemComment");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/ittemCommentOneDelYNChange.do", method = RequestMethod.POST)
	public void ittemCommentOneDelYNChange(@RequestParam int cmtNo, @RequestParam String cmtDelYN, HttpServletResponse response) throws IOException {
		
		//삼항연산자
		cmtDelYN = (cmtDelYN.equals("Y"))?"N":"Y";
		
		int result = aService.updateIttemCommentOneDelYNChange(cmtNo, cmtDelYN);
		
		if(result>0) {
			response.getWriter().print(cmtDelYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping(value = "/admin/ittemCommentCheckedDelYNChange.do", method = RequestMethod.POST)
	public void ittemCommentCheckedDelYNChange(@RequestParam String cmtNo, HttpServletResponse response) throws IOException {
		
		int result = aService.updateIttemCommentCheckedDelYNChange(cmtNo);
		
		if(result>0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		
	}
	
	@RequestMapping(value = "/admin/ittemCommentSearch.do", method = RequestMethod.GET)
	public ModelAndView ittemCommentSearch(@RequestParam int itItemNo, @RequestParam String type, @RequestParam String keyword, HttpServletRequest request, ModelAndView mav) {
		
		//현재 페이지 번호
		int currentPage;
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> map = aService.selectSearchIttemComment(currentPage,type,keyword,itItemNo);
		
		mav.addObject("map", map);
		mav.setViewName("admin/adminIttemComment");
		
		return mav;
	}
	
	
}
