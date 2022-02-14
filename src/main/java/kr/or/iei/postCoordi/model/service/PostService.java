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
	
	 public void insert(PostCoordi post) {
		 	postCoordiDAO.insertInfo(post);
		 	System.out.println(post.getCoordiNo());
		 	
			//postCoordiDAO.insertPic(post);
		 	//postCoordiDAO.insertCategory(post);
		 		
	    }


}
	
 