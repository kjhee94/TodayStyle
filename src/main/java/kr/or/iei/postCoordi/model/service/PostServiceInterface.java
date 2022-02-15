package kr.or.iei.postCoordi.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.postCoordi.model.dao.BoardDto;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

public interface PostServiceInterface {
	
	HashMap<String, Object> oneCoordiPost(int coordiNo);
	
	//코디 등록
	void insert(PostCoordi post) throws Exception;

	ArrayList<Integer> selectLikeList(String userId);

	ArrayList<Integer> selectScrapList(String userId);

	int insertComment(HashMap<String, Object> map);

	int deleteComment(int cmtNo);
	
}
