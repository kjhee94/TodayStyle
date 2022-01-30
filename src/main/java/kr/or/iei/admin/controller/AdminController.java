package kr.or.iei.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin/adminMain.do")
	public String name() {
		
		return "admin/adminMain";
	}
}
