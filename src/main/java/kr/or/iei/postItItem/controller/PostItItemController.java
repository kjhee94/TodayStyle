package kr.or.iei.postItItem.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.myPage.model.service.MyPageService;
import kr.or.iei.postItItem.model.service.PostItItemService;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Controller
public class PostItItemController {
	
	@Autowired
	private PostItItemService iService;
	
	@Autowired
	private MyPageService mpService;

    //잇템 게시물 개별페이지
    @RequestMapping(value="/coordi/ItPost.do",method=RequestMethod.GET)
    public ModelAndView itPost(@RequestParam int itItemNo, ModelAndView mav,HttpServletRequest request){
    	HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("member");
    	HashMap<String, Object> map = iService.oneItItemPost(itItemNo);
    	if(m!=null) {
			String userId=m.getUserId();
			String memberUserId=((PostItItem)map.get("pi")).getUserId();
			HashMap<String, Object> followMap=new HashMap<String, Object>();
			followMap.put("userId", userId);
			followMap.put("memberUserId", memberUserId);
			int memberFollowYN=mpService.memberFollowYN(followMap);
			String followBtn;
		    if(memberFollowYN == 1){
		        followBtn = "팔로잉";
		    }else{
		        followBtn = "팔로우";
		    }
		    map.put("followBtn", followBtn);  
			ArrayList<Integer> likeList=iService.selectLikeList(userId);
			ArrayList<Integer> scrapList=iService.selectScrapList(userId);
			int likeResult=0;
			int scrapResult=0;
			if(likeList.contains(((PostItItem)map.get("pi")).getItItemNo())){
				likeResult=1;
			}
			if(scrapList.contains(((PostItItem)map.get("pi")).getItItemNo())){
				scrapResult=1;
			}
			map.put("likeResult", likeResult);
			map.put("scrapResult", scrapResult);
			
		}
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
    
    @RequestMapping(value="/itItem/insertComment.do",method=RequestMethod.GET)
    public String insertComment(@RequestParam String comment,@SessionAttribute Member member ,@RequestParam int itItemNo,Model model) {
    	String userId=member.getUserId();
    	HashMap<String, Object> map=new HashMap<String, Object>();
    	map.put("userId", userId);
    	map.put("comment", comment);
    	map.put("itItemNo", itItemNo);
    	int result=iService.insertComment(map);
    	HashMap<String, Object> resultMap = iService.oneItItemPost(itItemNo);
    	model.addAttribute("map",resultMap);
    	return "postPage/insertComment";
    }
    
    @RequestMapping(value="/itItem/deleteComment.do",method=RequestMethod.GET)
    public String deleteComment(@RequestParam int cmtNo,Model model,@RequestParam int itItemNo) {
    	int result=iService.deleteComment(cmtNo);
    	HashMap<String, Object> resultMap = iService.oneItItemPost(itItemNo);
    	model.addAttribute("map",resultMap);
    	return "postPage/insertComment";
    }
}