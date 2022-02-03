package kr.or.iei.coordiPost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoordiPostController {
	
	//코디 게시물 개별페이지
	@RequestMapping(value="/coordi/coordiPost.do",method=RequestMethod.GET)
	public String coordiPost(){
		return "postPage/postPage";
	}
	
	//잇템 게시물 개별페이지
	@RequestMapping(value="/coordi/ItPost.do",method=RequestMethod.GET)
	public String itPost(){
		return "postPage/itPostPage";
	}
	
	//코디 작성
	@RequestMapping(value="/coordi/coordiInsert.do",method=RequestMethod.GET)
	public String coordiInsert(){
		return "postPage/coordiInsert";
	}
	
	//코디 게시물 수정
	@RequestMapping(value="/coordi/coordiUpdate.do",method=RequestMethod.GET)
	public String coordiUpdate(){
		return "postPage/coordiUpdate";
	}
	
	//잇템 작성
	@RequestMapping(value="/coordi/ItInsert.do",method=RequestMethod.GET)
	public String ItInsert(){
		return "postPage/itItemInsert";
	}
}
