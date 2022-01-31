package kr.or.iei.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.iei.member.model.service.MemberService;

@Controller
public class BoardController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="/board/boardPage.do", method=RequestMethod.GET)
	public String boardPage()
	{
		return "board/boardPage";
	}
	
	@RequestMapping(value="/board/detailPage.do", method=RequestMethod.GET)
		public String detailPage()
		{
		return "board/detailPage";
		}
		
	

}
