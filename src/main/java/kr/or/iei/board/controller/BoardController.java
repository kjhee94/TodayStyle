package kr.or.iei.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.board.model.service.BoardService;
import kr.or.iei.board.model.vo.FAQ;
import kr.or.iei.board.model.vo.Notice;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="/board/NoticePage.do", method=RequestMethod.GET)
	public ModelAndView NoticePage(HttpServletRequest request, ModelAndView mav)
	{
		int currentPage;
		if (request.getParameter("currentPage")==null)
		{
			currentPage = 1;
		}else {

			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		HashMap<String, Object> pageDataMap = bService.NoticeList(currentPage);

		ArrayList<Notice> nlist = (ArrayList<Notice>)pageDataMap.get("list");
		String pageNavi = (String)pageDataMap.get("pageNavi");
		

		mav.addObject("pageDataMap", pageDataMap);
		mav.addObject("currentPage", currentPage);
		mav.addObject("nlist", nlist);
		mav.addObject("pageNavi", pageNavi);
		mav.setViewName("board/NoticePage"); 
		return mav;

	}
	
	@RequestMapping(value="/board/detailPage.do", method=RequestMethod.GET)
		public ModelAndView detailPage(HttpServletRequest request,HttpServletResponse response,ModelAndView mav
			)
		{
	
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		Notice n = bService.detailPage(noticeNo);
		mav.addObject("n", n);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board/detailPage"); 
		return mav;
		
		}
		
	@RequestMapping(value="/board/noticeSearch.do",  method=RequestMethod.GET)
	public ModelAndView noticeSearch(HttpServletRequest request,ModelAndView mav)
	{
		int currentPage;
		if (request.getParameter("currentPage")==null)
		{
			currentPage = 1;
		}else {

			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		String keyword = request.getParameter("keyword");
		HashMap<String,Object> map = bService.noticeSearch(currentPage,keyword); 
		
		HashMap<String, Object> pageDataMap = bService.NoticeList(currentPage);

		ArrayList<Notice> nlist = (ArrayList<Notice>)map.get("list");
		String pageNavi = (String)map.get("pageNavi");
		
		mav.addObject("map",map);
		mav.addObject("currentPage",currentPage);
		mav.addObject("nlist", nlist);
		mav.addObject("pageDataMap", pageDataMap);
		mav.addObject("pageNavi", pageNavi);
		mav.addObject("keyword",keyword);
		mav.setViewName("board/NoticePage");
		return mav;
	}
	
	
	
	@RequestMapping(value="/board/FAQPage.do", method=RequestMethod.GET)
	public ModelAndView FAQPage(HttpServletRequest request, ModelAndView mav,@RequestParam String type)
	{
		
		ArrayList<FAQ> list = bService.AllFAQ(type);

		
		mav.addObject("list", list);
		mav.setViewName("board/FAQPage"); 
		return mav;
	}
	

	@RequestMapping(value="/board/faqClick.do")
	public ModelAndView FAQType(HttpServletRequest request, ModelAndView mav,@RequestParam String type)
	{

		ArrayList<FAQ> list = bService.AllFAQ(type);

		mav.addObject("list", list);
		mav.setViewName("board/FAQPage"); 
		return mav;
	}

}
