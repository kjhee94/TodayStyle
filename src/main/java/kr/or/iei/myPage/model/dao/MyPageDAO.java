package kr.or.iei.myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.myPage.model.vo.MyCoordiList;
import kr.or.iei.myPage.model.vo.MyItTemList;
import kr.or.iei.myPage.model.vo.ScrapCoordiList;
import kr.or.iei.myPage.model.vo.ScrapItTemList;

@Repository
public class MyPageDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;


	public String profileFilePath(String userId) {

		return sqlSession.selectOne("myPage.profileFilePath", userId);
	}

	public String followingNum(String userId) {
		
		return sqlSession.selectOne("myPage.followingNum", userId);
	}


	public String followerNum(String userId) {

		return sqlSession.selectOne("myPage.followerNum", userId);
	}


	public ArrayList<MyCoordiList> myCoordiList(String userId) {

		return new ArrayList<MyCoordiList>(sqlSession.selectList("myPage.myCoordiList", userId));
	}

	public ArrayList<MyItTemList> myItTemList(String userId) {

		return new ArrayList<MyItTemList>(sqlSession.selectList("myPage.myItTemList", userId));
	}

	public ArrayList<ScrapCoordiList> scrapCoordiList(String userId) {

		return new ArrayList<ScrapCoordiList>(sqlSession.selectList("myPage.scrapCoordiList", userId));
	}

	public ArrayList<ScrapItTemList> scrapItTemList(String userId) {

		return new ArrayList<ScrapItTemList>(sqlSession.selectList("myPage.scrapItTemList", userId));
	}


}
