package kr.or.iei.postItItem.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.postItItem.model.service.PostItItemService;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Controller
public class PostItItemController {
	
	@Autowired
	private PostItItemService iService;

    //잇템 게시물 개별페이지
    @RequestMapping(value="/coordi/ItPost.do",method=RequestMethod.GET)
    public ModelAndView itPost(@RequestParam int itItemNo, ModelAndView mav){

    	HashMap<String, Object> map = iService.oneItItemPost(itItemNo);
    	
    	mav.addObject("map", map);
    	mav.setViewName("postPage/itItemPost");
    	
        return mav;
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