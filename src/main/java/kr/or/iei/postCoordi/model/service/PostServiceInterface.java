package kr.or.iei.postCoordi.model.service;


import kr.or.iei.postCoordi.model.dao.BoardDto;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

public interface PostServiceInterface {
	
	//코디 등록
	int insert(PostCoordi post) throws Exception;
	

	
	int viewPost(PostCoordi post) throws Exception;
}
