package kr.or.iei.postCoordi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.myPage.model.service.MyPageService;
import kr.or.iei.postCoordi.model.service.PostServiceInterface;
import kr.or.iei.postCoordi.model.vo.PostCoordi;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Controller
public class PostCoordiController {

    @Autowired
    private PostServiceInterface postService;
    
    @Autowired
    private MyPageService mpService;
    
    //코디 게시물 개별페이지 이동
    @RequestMapping(value="/coordi/coordiPost.do",method=RequestMethod.GET)
    public ModelAndView coordiPost(@RequestParam int coordiNo, ModelAndView mav,HttpServletRequest request){
    	HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("member");
    	HashMap<String, Object> map = postService.oneCoordiPost(coordiNo);
    	if(m!=null) {
			String userId=m.getUserId();
			String memberUserId=((PostCoordi)map.get("pc")).getUserId();
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
			ArrayList<Integer> likeList=postService.selectLikeList(userId);
			ArrayList<Integer> scrapList=postService.selectScrapList(userId);
			int likeResult=0;
			int scrapResult=0;
			if(likeList.contains(((PostCoordi)map.get("pc")).getCoordiNo())){
				likeResult=1;
			}
			if(scrapList.contains(((PostCoordi)map.get("pc")).getCoordiNo())){
				scrapResult=1;
			}
			map.put("likeResult", likeResult);
			map.put("scrapResult", scrapResult);
			
		}
    	mav.addObject("map",map);
    	mav.setViewName("postPage/coordiPost");

        return mav;
    }

    //코디 작성페이지 이동
    @RequestMapping(value="/coordi/insertCoordi.do",method=RequestMethod.GET)
    public String insertCoordi(){
        return "postPage/coordiInsert";
    }

    
    @Autowired
	ServletContext context;	
    
    //코디 작성
    @RequestMapping( value = "/coordi/insertBoard.do", method=RequestMethod.POST)
    public String insertBoard(HttpServletRequest request, @SessionAttribute Member member) throws Exception{
        
    	String uploadPath = "/resources/upload/uploadCoordi/";
		
	
		int uploadFileSizeLimit = 5*1024*1024; // 최대 업로드 파일 크기 5MB로 제한 (500*1024*1024 하면 500 MB)
	
		String encType="UTF-8";
	
		String uploadFilePath = context.getRealPath(uploadPath);// 실제 upload 전체경로
		
		//아래까지만 해도 파일이 업로드 잘 처리  됨
		MultipartRequest multi = new MultipartRequest(request, 
												uploadFilePath, 
												uploadFileSizeLimit, 
												encType, 
												new DefaultFileRenamePolicy());
    	
		String originalFileName = multi.getFilesystemName("uploadFile");

		String originalUploadFilePath = uploadPath+originalFileName;
		
		
		String temperature = multi.getParameter("temperature");
		String season = multi.getParameter("season");
		String gender = multi.getParameter("gender");
		String top = multi.getParameter("top");
		String bottom = multi.getParameter("bottom");
		String outer = multi.getParameter("outer");
		String shoes = multi.getParameter("shoes");
		String acc = multi.getParameter("acc");
		String tag = multi.getParameter("tags");
		String coordiContent = multi.getParameter("coordi-content");
		
		PostCoordi post = new PostCoordi();
		
		post.setTemperature(temperature);
		post.setSeason(season);
		post.setGender(gender);
		post.setHashtag(tag);
		post.setCoordiContent(coordiContent);
		post.setUserId(member.getUserId());


    	postService.insert(post);
        return "coordi/coordiList";
    }

    @RequestMapping(value="/coordi/insertComment.do", method=RequestMethod.GET)
    public String insertComment(@RequestParam String comment,@SessionAttribute Member member ,@RequestParam int coordiNo,Model model) {
    	String userId=member.getUserId();
    	HashMap<String, Object> map=new HashMap<String, Object>();
    	map.put("userId", userId);
    	map.put("comment", comment);
    	map.put("coordiNo", coordiNo);
    	int result=postService.insertComment(map);
    	HashMap<String, Object> resultMap = postService.oneCoordiPost(coordiNo);
    	model.addAttribute("map",resultMap);
    	return "postPage/insertCoordiComment";
    }
    
    @RequestMapping(value="/coordi/deleteComment.do",method=RequestMethod.GET)
    public String deleteComment(@RequestParam int cmtNo,Model model,@RequestParam int coordiNo) {
    	
    	int result=postService.deleteComment(cmtNo);
    	HashMap<String, Object> resultMap = postService.oneCoordiPost(coordiNo);
    	model.addAttribute("map",resultMap);
    	return "postPage/insertCoordiComment";
    }





}
