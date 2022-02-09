package kr.or.iei.beststyle.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.beststyle.model.service.BestService;
import kr.or.iei.beststyle.model.vo.Beststyle;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.myPage.model.service.MemberSettingService;
import kr.or.iei.myPage.model.vo.ProfileImg;

@Controller
public class BestController {
	
	@Autowired
	private BestService sService;
	
	
	@RequestMapping(value="/beststyle/bestPage.do", method=RequestMethod.GET)
	public String bestPage()
	{
		return "beststyle/bestPage";
	}
	
	@RequestMapping(value="/beststyle/weekBestPage.do", method=RequestMethod.GET)
	public String weekbestPage()
	{
		return "beststyle/weekBestPage";
	}
	
	@RequestMapping(value="/beststyle/bestOfbestPage.do",method=RequestMethod.GET)
	public ModelAndView bestOfbestPage(HttpServletRequest request,ModelAndView mav)
	{
		
        
		ArrayList<Beststyle> list = sService.AllBest();
		mav.addObject("list", list);
		mav.setViewName("beststyle/bestOfbestPage"); 
		return mav;
		
	}
}
