package kr.or.iei.postCoordi.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.iei.postCoordi.model.dao.BoardDto;
import kr.or.iei.postCoordi.model.dao.PostCoordiDAO;
import kr.or.iei.postCoordi.model.vo.PostCoordi;


@Service
public class PostService implements PostServiceInterface{
	
	 @Autowired
	 private PostCoordiDAO postCoordiDAO;
	
	 public int insertInfo(PostCoordi post) {
		
	 
	        return postCoordiDAO.insertInfo(post);
	       
	    }
	 public int insertPic(PostCoordi post) {
			
		 
	        return postCoordiDAO.insertPic(post);
	       
	    }	 
	 public int insertCategory(PostCoordi post) {
		
	 
	        return postCoordiDAO.insertCategory(post);
	       
	    }	 
	 
	 
	 
	public int viewPost(PostCoordi post) {
		
		
		return postCoordiDAO.viewPost(post);
	}
}
	
 