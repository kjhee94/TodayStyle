package kr.or.iei.coordi.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.coordi.model.vo.Coordi;

@Repository
public class CoordiDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public ArrayList<Coordi> getCoordiList(HashMap<String, String> pMap) {
		// TODO Auto-generated method stub
		
		 ArrayList<Coordi> list=new ArrayList(sqlSession.selectList("coordi.selectAllList",pMap));
		
		return list;
		
	}

	public ArrayList<Coordi> selectCategoryCoordiList(HashMap<String, Object> map) {
		ArrayList<Coordi> list=new ArrayList(sqlSession.selectList("coordi.selectCategoryList",map));
		return list;
	}

	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list=new ArrayList(sqlSession.selectList("coordi.selectLikeList",userId));
		return list;
	}

	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list=new ArrayList(sqlSession.selectList("coordi.selectScrapList",userId));
		return list;
	}

	public int deleteLikeCoordi(HashMap<String, Object> map) {
		int result=sqlSession.delete("coordi.deleteLikeCoordi",map);
		return result;
	}

	public int insertLikeCoordi(HashMap<String, Object> map) {
		int result=sqlSession.insert("coordi.insertLikeCoordi",map);
		return result;
	}

	public int deleteScrapCoordi(HashMap<String, Object> map) {
		int result=sqlSession.delete("coordi.deleteScrapCoordi",map);
		return result;
	}

	public int insertScrapCoordi(HashMap<String, Object> map) {
		int result=sqlSession.insert("coordi.insertScrapCoordi",map);
		return result;
	}

	public ArrayList<Coordi> selectTopCoordiList(String userId) {
		ArrayList<Coordi> list=new ArrayList(sqlSession.selectList("coordi.selectTopCoordiList",userId));
		return list;
	}

}
