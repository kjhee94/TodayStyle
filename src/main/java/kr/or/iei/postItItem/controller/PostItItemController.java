package kr.or.iei.postItItem.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.myPage.model.service.MyPageService;
import kr.or.iei.postCoordi.model.vo.PostCoordi;
import kr.or.iei.postItItem.model.service.PostItItemService;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Controller
public class PostItItemController {
	
	@Autowired
	private PostItItemService iService;
	
	@Autowired
	private MyPageService mpService;
	
	@Autowired
	private ServletContext context;

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
    
  //잇템 작성 페이지 이동
    @RequestMapping(value="/coordi/ItInsert.do",method=RequestMethod.GET)
    public String ItInsert(){
        return "postPage/itItemInsert";
    }
    
  //잇템 작성
    @RequestMapping( value = "/coordi/insertIt.do", method=RequestMethod.POST)
    public String insertBoard(HttpServletRequest request, @SessionAttribute Member member) throws Exception{
        
        String uploadPath = "/resources/images/itItem/";
        
    
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
        
        String gender = multi.getParameter("gender");
        String top = multi.getParameter("top");
        String bottom = multi.getParameter("bottom");
        String outer = multi.getParameter("outer");
        String shoes = multi.getParameter("shoes");
        String acc = multi.getParameter("acc");
        String tag = multi.getParameter("tags");
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
        
        post.setGender(gender);
        post.setHashtag(tag);
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

    


        iService.insert(post,topPost,bottomPost,outerPost,accPost,shoesPost);
        
        return "redirect:/";
    }
    
    
    
   
}