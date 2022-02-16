package kr.or.iei.itItem.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.itItem.model.vo.ItItem;

@Repository
public class ItItemDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<ItItem> getItItemList(HashMap<String, Object> map) {
		ArrayList<ItItem> list=new ArrayList(sqlSession.selectList("itItem.selectAllList",map));
		return list;
	}

	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list=new ArrayList(sqlSession.selectList("itItem.selectLikeList",userId));
		return list;
	}

	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list=new ArrayList(sqlSession.selectList("itItem.selectScrapList",userId));
		return list;
	}

	public int deleteLikeItItem(HashMap<String, Object> map) {
		int result=sqlSession.delete("itItem.deleteLikeItItem",map);
		return result;
	}

	public int insertLikeItItem(HashMap<String, Object> map) {
		int result=sqlSession.delete("itItem.insertLikeItItem",map);
		return result;
	}

	public int deletescrapItItem(HashMap<String, Object> map) {
		int result=sqlSession.delete("itItem.deletescrapItItem",map);
		return result;
	}

	public int insertScrapItItem(HashMap<String, Object> map) {
		int result=sqlSession.delete("itItem.insertScrapItItem",map);
		return result;
	}

	public ArrayList<ItItem> selectCategoryItItemList(HashMap<String, Object> map) {
		ArrayList<ItItem> list=new ArrayList(sqlSession.selectList("itItem.selectCategoryItItemList",map));
		return list;
	}


}
