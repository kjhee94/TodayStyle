package kr.or.iei.postCoordi.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.postCoordi.model.service.PostCoordiServiceImpl;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

@Controller
public class PostCoordiController {
	
	@Autowired
	private PostCoordiServiceImpl postCoordiServiceImpl;
	
	//코디 게시물 개별페이지
	@RequestMapping(value="/coordi/coordiPost.do",method=RequestMethod.GET)
	public String coordiPost(){
		return "postPage/coordiPost";
	}
	
	//코디 작성페이지 이동
	@RequestMapping(value="/coordi/insertCoordi.do",method=RequestMethod.GET)
	public String insertCoordi(){
		return "postPage/coordiInsert";
	}
	
	//코디 작성
    @RequestMapping( value = "/postCoordi/coordiPost")
    @ResponseBody
    public PostCoordi insertBoard(HttpServletRequest request, HttpServletResponse response, PostCoordi PostCoordi) throws Exception{
        
    	PostCoordi postCoordi = PostCoordiServiceImpl.insertPost(PostCoordi);
        
        return postCoordi;
    }
	
	//코디 게시물 수정
	@RequestMapping(value="/coordi/coordiUpdate.do",method=RequestMethod.GET)
	public String coordiUpdate(){
		return "postPage/coordiUpdate";
	}
}
