package kr.or.iei.postItItem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.postCoordi.model.dao.BoardDto;
import kr.or.iei.postCoordi.model.vo.PostCoordi;
import kr.or.iei.postItItem.model.service.PostItItemServiceImpl;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Controller
public class PostItItemController {
	/*
	@Autowired
    private PostItItemServiceImpl postItItemServiceImpl;
	*/
	//잇템 게시물 개별페이지
	@RequestMapping(value="/coordi/ItPost.do",method=RequestMethod.GET)
	public String itPost(){
		return "postPage/itItemPost";
	}
	
	//잇템 작성 페이지 이동
	@RequestMapping(value="/coordi/ItInsert.do",method=RequestMethod.GET)
	public String ItInsert(){
		return "postPage/itItemInsert";
	}
	
	//잇템 수정페이지 이동
	@RequestMapping(value="/coordi/ItItemUpdate.do",method=RequestMethod.GET)
	public String coordiUpdate(){
		return "postPage/itItemUpdate";
	}



}
