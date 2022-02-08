package kr.or.iei.admin.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	private void memberOneEndYNChange(@RequestParam String userId, @RequestParam char endYN, HttpServletResponse response) throws IOException {
		
		//삼항연상자
		endYN = (endYN == 'Y')?'N':'Y';
		
		int result = aService.updateMemberOneEndYNChange(userId, endYN);
		
		if(result>0) {
			response.getWriter().print(endYN);
		}else {
			response.getWriter().print(false);
		}
	}
	
	
	@RequestMapping(value = "/admin/adminCoordi.do")
	public String adminCoordi() {
		
		return "admin/adminCoordi";
	}
	
	@RequestMapping(value = "/admin/adminCoordiComment.do")
	private String adminCoordiComment() {
		
		return "admin/adminCoordiComment";
	}
	
	@RequestMapping(value = "/admin/adminIttem.do")
	public String adminIttem() {
		
		return "admin/adminIttem";
	}
	
	@RequestMapping(value = "/admin/adminIttemComment.do")
	private String adminIttemComment() {
		
		return "admin/adminIttemComment";
	}
	
	@RequestMapping(value = "/admin/adminNotice.do")
	public String adminNotice() {
		
		return "admin/adminNotice";
	}
	
	@RequestMapping(value = "/admin/adminFAQ.do")
	public String adminFAQ() {
		
		return "admin/adminFAQ";
	}
}
