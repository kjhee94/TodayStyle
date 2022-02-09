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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.admin.model.service.AdminService;
import kr.or.iei.member.model.vo.Member;

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
	public String adminFAQ() {
		
		return "admin/adminFAQ";
	}
	
	
	
	
	
	@RequestMapping(value = "/admin/adminCoordi.do")
	public String adminCoordi() {
		
		return "admin/adminCoordi";
	}
	
	@RequestMapping(value = "/admin/adminCoordiComment.do")
	public String adminCoordiComment() {
		
		return "admin/adminCoordiComment";
	}
	
	@RequestMapping(value = "/admin/adminIttem.do")
	public String adminIttem() {
		
		return "admin/adminIttem";
	}
	
	@RequestMapping(value = "/admin/adminIttemComment.do")
	public String adminIttemComment() {
		
		return "admin/adminIttemComment";
	}
	
	
}
