package kr.or.iei.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.board.model.service.BoardService;
import kr.or.iei.board.model.vo.FAQ;
import kr.or.iei.board.model.vo.Notice;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="/board/boardPage.do", method=RequestMethod.GET)
	public ModelAndView boardPage(ModelAndView mav)
//	public String boardPage(ModelAndView mav)
	{
		ArrayList<FAQ> list = bService.AllFAQ();
		ArrayList<Notice> nlist = bService.AllNotice();
		System.out.println(nlist);
		mav.addObject("list", list);
		mav.addObject("nlist", nlist);
		mav.setViewName("board/boardPage"); 
		return mav;
		
//		return "board/boardPage";
	}
	
	@RequestMapping(value="/board/detailPage.do", method=RequestMethod.GET)
		public String detailPage()
		{
		return "board/detailPage";
		}
		
	

}
