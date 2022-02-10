package kr.or.iei.myPage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.myPage.model.dao.MyPageDAO;
import kr.or.iei.myPage.model.vo.MyCoordiList;
import kr.or.iei.myPage.model.vo.MyItTemList;
import kr.or.iei.myPage.model.vo.ScrapCoordiList;
import kr.or.iei.myPage.model.vo.ScrapItTemList;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO mpDAO;

	@Override
	public String profileFilePath(String userId) {

		return mpDAO.profileFilePath(userId);
	}

	@Override
	public String followingNum(String userId) {
		
		return mpDAO.followingNum(userId);
	}

	@Override
	public String followerNum(String userId) {

		return mpDAO.followerNum(userId);
	}

	@Override
	public ArrayList<MyCoordiList> myCoordiList(String userId) {

		return mpDAO.myCoordiList(userId);
	}

	@Override
	public ArrayList<MyItTemList> myItTemList(String userId) {

		return mpDAO.myItTemList(userId);
	}

	@Override
	public ArrayList<ScrapCoordiList> scrapCoordiList(String userId) {

		return mpDAO.scrapCoordiList(userId);
	}

	@Override
	public ArrayList<ScrapItTemList> scrapItTemList(String userId) {

		return mpDAO.scrapItTemList(userId);
	}

}
