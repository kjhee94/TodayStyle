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
	
	 public int insert(PostCoordi post) {
		 postCoordiDAO.insertPic(post);
		 postCoordiDAO.insertCategory(post);
	 
	     return postCoordiDAO.insertInfo(post);
	       
	    }
 
	 
	 
	 
	public int viewPost(PostCoordi post) {
		
		
		return postCoordiDAO.viewPost(post);
	}
}
	
 