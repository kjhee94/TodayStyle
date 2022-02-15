package kr.or.iei.postItItem.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import kr.or.iei.postCoordi.model.vo.PostCoordi;
import kr.or.iei.postItItem.model.vo.PostItItem;

import org.springframework.stereotype.Repository;

@Repository
public class PostItItemDAO {

	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public HashMap<String, Object> oneItItemPost(int itItemNo) {
		
		PostItItem pi = sqlSession.selectOne("postItItem.oneItItemPost", itItemNo);
		ArrayList<PostItItem> imgList = new ArrayList<PostItItem>(sqlSession.selectList("postItItem.oneImgList", itItemNo));
		ArrayList<PostItItem> cmtList = new ArrayList<PostItItem>(sqlSession.selectList("postItItem.oneCmtList", itItemNo));
		Integer ItItemLike = sqlSession.selectOne("postItItem.oneItItemLike", itItemNo);
		if(ItItemLike==null) {
			ItItemLike=0;
		}
		Integer ItItemScrap = sqlSession.selectOne("postItItem.oneItItemScrap", itItemNo);
		if(ItItemScrap==null) {
			ItItemScrap=0;
		}
		
		System.out.println(pi);
		System.out.println(imgList);
		System.out.println(cmtList);
		System.out.println(ItItemLike);
		System.out.println(ItItemScrap);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pi",pi);
		map.put("imgList",imgList);
		map.put("cmtList",cmtList);
		map.put("ItItemLike",ItItemLike);
		map.put("ItItemScrap",ItItemScrap);
		
		return map;
	}

	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list=new ArrayList<Integer>(sqlSession.selectList("postItItem.selectLikeList",userId));
		return list;
	}

	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list=new ArrayList<Integer>(sqlSession.selectList("postItItem.selectScrapList",userId));
		return list;
	}

	public int insertComment(HashMap<String, Object> map) {
		
		return sqlSession.insert("postItItem.insertComment",map);
	}

	public int deleteComment(int cmtNo) {
		
		return sqlSession.update("postItItem.deleteComment",cmtNo);
	}

}
