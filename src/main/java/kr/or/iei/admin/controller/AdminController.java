package kr.or.iei.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin/adminMain.do")
	public String adminMain() {
		
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/admin/adminMember.do")
	public String adminMember() {
		
		return "admin/adminMember";
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
