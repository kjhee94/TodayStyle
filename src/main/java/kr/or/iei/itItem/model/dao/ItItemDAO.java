package kr.or.iei.itItem.model.dao;

import java.util.ArrayList;

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
	
	public ArrayList<Object> getItItemList() {
		ArrayList<Object> list=new ArrayList(sqlSession.selectList("itItem.selectAllList"));
		return list;
	}

}
