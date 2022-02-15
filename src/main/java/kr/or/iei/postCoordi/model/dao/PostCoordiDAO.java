package kr.or.iei.postCoordi.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.postCoordi.model.vo.PostCoordi;

@Repository
public class PostCoordiDAO {

    @Autowired
    @Qualifier(value="sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

	public HashMap<String, Object> oneCoordiPost(int coordiNo) {
		
		PostCoordi pc = sqlSession.selectOne("post.oneCoordiPost",coordiNo);
		ArrayList<PostCoordi> itemList = new ArrayList<PostCoordi>(sqlSession.selectList("post.itemList",coordiNo));
		ArrayList<PostCoordi> cmtList = new ArrayList<PostCoordi>(sqlSession.selectList("post.cmtList",coordiNo));
		Integer countLike = sqlSession.selectOne("post.countLike",coordiNo);
		if(countLike==null) {
			countLike=0;
		}
		Integer countScrap = sqlSession.selectOne("post.countScrap",coordiNo);
		if(countScrap==null) {
			countScrap=0;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pc",pc);
		map.put("itemList",itemList);
		map.put("cmtList",cmtList);
		map.put("countLike",countLike);
		map.put("countScrap",countScrap);
		
		return map;
	}

	public void insertInfo(PostCoordi post){
		sqlSession.insert("post.insertInfo",post);
	 
	}

	public void insertCategory(PostCoordi post){
		sqlSession.insert("post.insertCategory",post);
	}
}

