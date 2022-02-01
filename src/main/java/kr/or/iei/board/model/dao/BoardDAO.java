package kr.or.iei.board.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.board.model.vo.FAQ;
import kr.or.iei.board.model.vo.Notice;

@Repository
public class BoardDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	
	public ArrayList<FAQ> AllFAQ() {
		return new ArrayList<FAQ> (sqlSession.selectList("board.AllFAQ"));
	}


	public ArrayList<Notice> AllNotice() {
		return new ArrayList<Notice> (sqlSession.selectList("board.AllNotice"));
	}

	

	
	
}
