package kr.or.iei.postCoordi.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.iei.postCoordi.model.dao.BoardDto;
import kr.or.iei.postCoordi.model.dao.PostCoordiDAO;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

@Service
public class PostService implements PostServiceInterface{
	
	@Autowired
	private PostCoordiDAO postCoordiDAO;
	
	@Override
	public HashMap<String, Object> oneCoordiPost(int coordiNo) {
		
		return postCoordiDAO.oneCoordiPost(coordiNo);
	}
	 
	@Override
	public void insert(PostCoordi post) {
	postCoordiDAO.insertInfo(post);
	System.out.println(post.getCoordiNo());
		 	
	//postCoordiDAO.insertPic(post);
	//postCoordiDAO.insertCategory(post);
	 		
	}

	@Override
	public ArrayList<Integer> selectLikeList(String userId) {
		
		return postCoordiDAO.selectLikeList(userId);
	}

	@Override
	public ArrayList<Integer> selectScrapList(String userId) {
		// TODO Auto-generated method stub
		return postCoordiDAO.selectScrapList(userId);
	}

	@Override
	public int insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return postCoordiDAO.insertComment(map);
	}

	@Override
	public int deleteComment(int cmtNo) {
		
		return postCoordiDAO.deleteComment(cmtNo);
	}
}
	
 