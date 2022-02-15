package kr.or.iei.postItItem.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.postCoordi.model.vo.PostCoordi;
import kr.or.iei.postItItem.model.dao.PostItItemDAO;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Service
public class PostItItemServiceImpl implements PostItItemService{

	@Autowired
	private PostItItemDAO iDAO;

	@Override
	public HashMap<String, Object> oneItItemPost(int itItemNo) {
		
		return iDAO.oneItItemPost(itItemNo);
	}

	@Override
	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list=iDAO.selectLikeList(userId);
		return list;
	}

	@Override
	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list=iDAO.selectScrapList(userId);
		return list;
	}

	@Override
	public int insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return iDAO.insertComment(map);
	}

	@Override
	public int deleteComment(int cmtNo) {
		// TODO Auto-generated method stub
		return iDAO.deleteComment(cmtNo);
	}
	
	
	@Override
    public void insert(PostCoordi post, PostCoordi topPost, PostCoordi bottomPost, PostCoordi outerPost,
            PostCoordi accPost, PostCoordi shoesPost) {
        iDAO.insertInfo(post);
         System.out.println(post.getCoordiNo());

        iDAO.insertPic(post);


        topPost.setCoordiNo(post.getCoordiNo());
        bottomPost.setCoordiNo(post.getCoordiNo());
        accPost.setCoordiNo(post.getCoordiNo());
        outerPost.setCoordiNo(post.getCoordiNo());
        shoesPost.setCoordiNo(post.getCoordiNo());

         iDAO.insertCategory(topPost,bottomPost,accPost,outerPost,shoesPost);


    }
}
 