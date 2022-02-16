package kr.or.iei.postCoordi.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kr.or.iei.postCoordi.model.service.PostService;
import kr.or.iei.postCoordi.model.service.PostServiceInterface;
import kr.or.iei.postCoordi.model.vo.PostCoordi;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Controller
public class PostCoordiController {

    @Autowired
    private PostServiceInterface postService;
    
    @Autowired
    private MyPageService mpService;
    
    @Autowired
    private ServletContext context;
    
    @Autowired
    private PostService pService;
    
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

    //댓글 입력
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

    
    
    
    //코디 수정 페이지 이동
    @RequestMapping(value="/coordi/coordiUpdate.do",method=RequestMethod.GET)
    public String coordiUpdate(HttpServletRequest request,HttpSession session,@SessionAttribute Member m,PostCoordi post,Model model) throws Exception{
    	String userId = m.getUserId();
    	
    	post.setUserId(userId);
    	
    	PostCoordi result = pService.selectCoordi(post);
    	
    	if(result!=null)
    	{
    		session.setAttribute("post", post);
    		return "postPage/coordiUpdate";
    	}else { 
    		return "common/error_400";
    	}
    	
}
    
    //코디 수정페이지 이동2
    @RequestMapping(value="/coordi/coordiUpdate2.do",method=RequestMethod.GET)
    public ModelAndView coordiUpdate2(@RequestParam int coordiNo, ModelAndView mav,HttpServletRequest request){
    	HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("member");
    	HashMap<String, Object> map = postService.oneCoordiPost(coordiNo);
    	
    	
    	mav.addObject("map",map);
    	mav.setViewName("postPage/coordiUpdate");

        return mav;
    }

  
    
    //코디 수정 기능
    @RequestMapping(value="/coordi/updateCoordi.do",method=RequestMethod.GET)
    public String updateCoordi(HttpServletResponse response,@SessionAttribute Member m) throws Exception{
		PostCoordi post = new PostCoordi();
    	String userId = m.getUserId();
    	
    	
        return "postPage/coordiUpdate";
    }


    //코디 작성페이지 이동
    @RequestMapping(value="/coordi/insertCoordi.do",method=RequestMethod.GET)
    public String insertCoordi(){
        return "postPage/coordiInsert";
    }

    //코디 작성
    @RequestMapping( value = "/coordi/insertBoard.do", method=RequestMethod.POST)
    public String insertBoard(HttpServletRequest request, @SessionAttribute Member member) throws Exception{
        
    	String uploadPath = "/resources/images/coordi/";
		
	
		int uploadFileSizeLimit = 5*1024*1024; // 최대 업로드 파일 크기 5MB로 제한
	
		String encType="UTF-8";
	
		String uploadFilePath = context.getRealPath(uploadPath);// 실제 upload 전체경로
		
		
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
        String [] tag= multi.getParameterValues("tags");
        String tags = String.join(",", tag);
		String uploadFile = multi.getParameter("uploadFile");
		String coordiContent = multi.getParameter("coordi-content");
		String topBrand = multi.getParameter("top-textarea");
		String bottomBrand = multi.getParameter("bottom-textarea");
		String outerBrand = multi.getParameter("outer-textarea");
		String accBrand = multi.getParameter("acc-textarea");
		String shoesBrand = multi.getParameter("shoes-textarea");
		
		PostCoordi post = new PostCoordi();
		PostCoordi topPost = new PostCoordi();
		PostCoordi bottomPost = new PostCoordi();
		PostCoordi outerPost = new PostCoordi();
		PostCoordi accPost = new PostCoordi();
		PostCoordi shoesPost = new PostCoordi();
		
		post.setTemperature(temperature);
		post.setSeason(season);
		post.setGender(gender);
		post.setHashtag(tags);
		post.setCoordiContent(coordiContent);
		post.setUserId(member.getUserId());
		post.setFilePath(uploadPath+originalFileName);
		topPost.setCategoryCode(top);
		bottomPost.setCategoryCode(bottom);
		outerPost.setCategoryCode(outer);
		accPost.setCategoryCode(acc);
		shoesPost.setCategoryCode(shoes);
		topPost.setBrand(topBrand);
		bottomPost.setBrand(bottomBrand);
		outerPost.setBrand(outerBrand);
		accPost.setBrand(accBrand);
		shoesPost.setBrand(shoesBrand);

	


		pService.insert(post,topPost,bottomPost,outerPost,accPost,shoesPost);
    	
        return "redirect:/";
    }



    }


