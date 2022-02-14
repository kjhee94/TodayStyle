package kr.or.iei.postCoordi.controller;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import kr.or.iei.postCoordi.model.dao.BoardDto;
import kr.or.iei.postCoordi.model.service.PostService;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

@Controller
public class PostCoordiController {


    @Autowired
    private PostService postService;


    //코디 게시물 개별페이지 이동
    @RequestMapping(value="/coordi/coordiPost.do",method=RequestMethod.GET)
    public String coordiPost(PostCoordi post){
        int result = postService.viewPost(post);

        return "postPage/coordiPost";
    }

    //코디 게시물 개별페이지 조회
    @RequestMapping(value="/coordi/coordiRead.do",method=RequestMethod.GET)
    public String coordiRead(PostCoordi post){
        int result = postService.viewPost(post);

        return "postPage/coordiPost";
    }


    //코디 작성페이지 이동
    @RequestMapping(value="/coordi/insertCoordi.do",method=RequestMethod.GET)
    public String insertCoordi(){
        return "postPage/coordiInsert";
    }

    //코디 작성
    @RequestMapping( value = "/coordi/insertBoard.do", method=RequestMethod.POST)
    public int insertBoard(HttpServletRequest request, PostCoordi post) throws Exception{

        int result = postService.insert(post);

        return 0; 
    }

    //코디 수정페이지 이동
    @RequestMapping(value="/coordi/coordiUpdate.do",method=RequestMethod.GET)
    public String coordiUpdate(){
        return "postPage/coordiUpdate";
    }






}
