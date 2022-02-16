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

	
	@Override
	public void insert(PostCoordi post, PostCoordi topPost, PostCoordi bottomPost, PostCoordi outerPost, PostCoordi accPost, PostCoordi shoesPost) throws Exception {
       
		postCoordiDAO.insertInfo(post);
		System.out.println(post.getCoordiNo());

		postCoordiDAO.insertPic(post);


        topPost.setCoordiNo(post.getCoordiNo());
        bottomPost.setCoordiNo(post.getCoordiNo());
        accPost.setCoordiNo(post.getCoordiNo());
        outerPost.setCoordiNo(post.getCoordiNo());
        shoesPost.setCoordiNo(post.getCoordiNo());

        postCoordiDAO.insertCategory(topPost,bottomPost,accPost,outerPost,shoesPost);

    }

	@Override
	public PostCoordi selectCoordi(PostCoordi post) {
		
		PostCoordi result = postCoordiDAO.selectPost(post);
		return result;
	}
}
	
 