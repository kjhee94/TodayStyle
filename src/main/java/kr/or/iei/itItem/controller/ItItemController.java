package kr.or.iei.itItem.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.coordi.model.service.CoordiService;
import kr.or.iei.coordi.model.vo.Coordi;
import kr.or.iei.itItem.model.service.ItItemService;
import kr.or.iei.itItem.model.vo.ItItem;
import kr.or.iei.member.model.vo.Member;

@Controller
public class ItItemController {
	
	@Autowired
	private ItItemService itService;
	
	
	@RequestMapping(value="/itItem/itItemList.do",method = RequestMethod.GET)
	public ModelAndView itItemList(ModelAndView mav,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("member");
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<ItItem> itItemList=itService.getItItemList();
		
		//팔로우리스트와 좋아요 리스트 가져오기(로그인 한경우)
		if(m!=null) {
			String userId=m.getUserId();
			ArrayList<Integer> likeList=itService.selectLikeList(userId);
			ArrayList<Integer> scrapList=itService.selectScrapList(userId);
			map.put("likeList", likeList);
			map.put("scrapList", scrapList);
		}

		map.put("itItemList", itItemList);
		mav.addObject("map", map);
		mav.setViewName("itItem/itItemList");
		return mav;
	}
	@RequestMapping(value="/itItem/unlikeItItem.do",method = RequestMethod.GET)
	public String unlikeItItem(@RequestParam int itItemNo,@SessionAttribute Member member) {
		
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("itItemNo", itItemNo);
		map.put("userId", userId);
		
		int result=itService.deleteLikeItItem(map);
		return "itItem/itItemList";
	}
	
	@RequestMapping(value="/itItem/likeItItem.do",method=RequestMethod.GET)
	public String likeItItem(@RequestParam int itItemNo,@SessionAttribute Member member) {
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("itItemNo", itItemNo);
		map.put("userId", userId);
		
		int result=itService.insertLikeItItem(map);
		
		return "itItem/itItemList";
	}
	
	@RequestMapping(value="/itItem/unscrapItItem.do",method = RequestMethod.GET)
	public String unscrapItItem(@RequestParam int itItemNo,@SessionAttribute Member member) {
		
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("itItemNo", itItemNo);
		map.put("userId", userId);
		
		int result=itService.deletescrapItItem(map);
		return "itItem/itItemList";
	}
	
	@RequestMapping(value="/itItem/scrapItItem.do",method=RequestMethod.GET)
	public String scrapItItem(@RequestParam int itItemNo,@SessionAttribute Member member) {
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("itItemNo", itItemNo);
		map.put("userId", userId);
		
		int result=itService.insertScrapItItem(map);
		
		return "itItem/itItemList";
	}
	
	@RequestMapping(value="/itItem/categoryItItemList.do",method=RequestMethod.GET)
	public String categoryItItemList(HttpServletRequest request,Model model) {
		String item=request.getParameter("item");
		String filter=request.getParameter("filter");
		HashMap<String, Object> map=new HashMap<String, Object>();
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("member");
		//팔로우리스트와 좋아요 리스트 가져오기(로그인 한경우)
		if(m!=null) {
			String userId=m.getUserId();
			ArrayList<Integer> likeList=itService.selectLikeList(userId);
			ArrayList<Integer> scrapList=itService.selectScrapList(userId);
			model.addAttribute("likeList", likeList);
			model.addAttribute("scrapList", scrapList);
		}
		
		if(item!=""&&item!=null) {
			String [] itemArray=item.split("/");
			map.put("item", itemArray);
		}
		map.put("filter", filter);
		System.out.println(map.get("filter"));
		ArrayList<ItItem> list=itService.selectCategoryItItemList(map);
		model.addAttribute("filter",filter);
		model.addAttribute("list",list);
		return "itItem/categoryList";
	}
}
