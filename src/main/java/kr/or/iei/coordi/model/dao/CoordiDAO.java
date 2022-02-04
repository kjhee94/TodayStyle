package kr.or.iei.coordi.model.dao;

import java.util.ArrayList;

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

	public ArrayList<Object> getCoordiList(String season) {
		// TODO Auto-generated method stub
		
		 ArrayList<Object> list=new ArrayList(sqlSession.selectList("coordi.selectAllList",season));
		
		return list;
		
	}
}
