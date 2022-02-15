package kr.or.iei.postCoordi.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.postCoordi.model.dao.BoardDto;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

public interface PostServiceInterface {
	
	HashMap<String, Object> oneCoordiPost(int coordiNo);

	ArrayList<Integer> selectLikeList(String userId);

	ArrayList<Integer> selectScrapList(String userId);

   	int insertComment(HashMap<String, Object> map);

   	int deleteComment(int cmtNo);

	void insert(PostCoordi post, PostCoordi topPost, PostCoordi bottomPost, PostCoordi outerPost, PostCoordi accPost,
			PostCoordi shoesPost) throws Exception;
}
