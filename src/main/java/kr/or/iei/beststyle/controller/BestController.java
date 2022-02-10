package kr.or.iei.beststyle.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.beststyle.model.service.BestService;
import kr.or.iei.beststyle.model.vo.Beststyle;
import kr.or.iei.member.model.vo.Member;

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
	public ModelAndView weekbestPage(HttpServletRequest request,ModelAndView mav,HttpSession session)
	{
		Member m=(Member)session.getAttribute("member");
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<Beststyle> list = sService.weekBest();
	
		//오늘
		Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	    String toDay = date.format(today);

	    //하루 전
	    Calendar day = Calendar.getInstance();
	    day.add(Calendar.DATE , -1);
	    String beforeDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day.getTime());
	    

	    //한주 전
	    Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -7);
	    String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
	    

		//팔로우리스트와 좋아요 리스트 가져오기(로그인 한경우)
				if(m!=null) {
				String userId=m.getUserId();
				ArrayList<Integer> likeList=sService.selectLikeList(userId);
				ArrayList<Integer> scrapList=sService.selectScrapList(userId);
				map.put("likeList", likeList);
				map.put("scrapList", scrapList);
						}
				mav.addObject("beforeDate",beforeDate);
				mav.addObject("beforeWeek",beforeWeek);
				mav.addObject("list", list);
				mav.addObject("map", map);
				mav.setViewName("beststyle/weekBestPage"); 
				return mav;
				
	}
	
	@RequestMapping(value="/beststyle/bestOfbestPage.do",method=RequestMethod.GET)
	public ModelAndView bestOfbestPage(HttpServletRequest request,ModelAndView mav,HttpSession session)
	{
		Member m=(Member)session.getAttribute("member");
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<Beststyle> list = sService.AllBest();
		
		//팔로우리스트와 좋아요 리스트 가져오기(로그인 한경우)
		if(m!=null) {
		String userId=m.getUserId();
		ArrayList<Integer> likeList=sService.selectLikeList(userId);
		ArrayList<Integer> scrapList=sService.selectScrapList(userId);
		map.put("likeList", likeList);
		map.put("scrapList", scrapList);
				}
        
		
		mav.addObject("list", list);
		mav.addObject("map", map);
		mav.setViewName("beststyle/bestOfbestPage"); 
		return mav;
		
	}
}
