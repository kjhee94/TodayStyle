package kr.or.iei.postItItem.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import kr.or.iei.postCoordi.model.vo.PostCoordi;
import kr.or.iei.postItItem.model.vo.PostItItem;

public interface PostItItemService {

	HashMap<String, Object> oneItItemPost(int itItemNo);

	ArrayList<Integer> selectLikeList(String userId);

	ArrayList<Integer> selectScrapList(String userId);

	int insertComment(HashMap<String, Object> map);

	int deleteComment(int cmtNo);

	void insert(PostItItem post) throws Exception;

	
	
}
