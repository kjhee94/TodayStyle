package kr.or.iei.postCoordi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PostCoordiController {
	//코디 게시물 개별페이지
	@RequestMapping(value="/coordi/coordiPost.do",method=RequestMethod.GET)
	public String coordiPost(){
		return "postPage/coordiPost";
	}
	
	//코디 작성
	@RequestMapping(value="/coordi/insertCoordi.do",method=RequestMethod.GET)
	public String insertCoordi(){
		return "postPage/coordiInsert";
	}
	
	//코디 게시물 수정
	@RequestMapping(value="/coordi/coordiUpdate.do",method=RequestMethod.GET)
	public String coordiUpdate(){
		return "postPage/coordiUpdate";
	}
}
