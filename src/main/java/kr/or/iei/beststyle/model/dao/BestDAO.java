package kr.or.iei.beststyle.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.beststyle.model.vo.Beststyle;
import kr.or.iei.board.model.vo.FAQ;

@Repository
public class BestDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public ArrayList<Beststyle> AllBest() {
		return new ArrayList<Beststyle> (sqlSession.selectList("beststyle.AllBest"));
	}

	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list=new ArrayList(sqlSession.selectList("beststyle.selectLikeList",userId));
		return list;
	}

	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list=new ArrayList(sqlSession.selectList("beststyle.selectScrapList",userId));

		return list;
	}

	public ArrayList<Beststyle> weekBest() {
		return new ArrayList<Beststyle> (sqlSession.selectList("beststyle.weekBest"));
	}

}
