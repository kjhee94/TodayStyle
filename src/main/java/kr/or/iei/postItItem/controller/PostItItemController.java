package kr.or.iei.postItItem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PostItItemController {
	
	//잇템 게시물 개별페이지
	@RequestMapping(value="/coordi/ItPost.do",method=RequestMethod.GET)
	public String itPost(@RequestParam int itItemNo){
		
		
		return "postPage/itItemPost";
	}
	
	//잇템 작성 페이지 이동
	@RequestMapping(value="/coordi/ItInsert.do",method=RequestMethod.GET)
	public String ItInsert(){
		return "postPage/itItemInsert";
	}
	
	//잇템 게시물 수정
	@RequestMapping(value="/coordi/ItItemUpdate.do",method=RequestMethod.GET)
	public String coordiUpdate(){
		return "postPage/itItemUpdate";
	}
}
