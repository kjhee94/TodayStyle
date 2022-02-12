package kr.or.iei.myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.board.model.vo.Notice;
import kr.or.iei.myPage.model.dao.MyPageDAO;
import kr.or.iei.myPage.model.vo.MyCoordiList;
import kr.or.iei.myPage.model.vo.MyItTemList;
import kr.or.iei.myPage.model.vo.ScrapCoordiList;
import kr.or.iei.myPage.model.vo.ScrapItTemList;
import kr.or.iei.myPage.model.vo.Comments;
import kr.or.iei.myPage.model.vo.Follow;

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

	@Override
	public ArrayList<Follow> followerList(String userId) {

		return mpDAO.followerList(userId);
	}

	@Override
	public ArrayList<Follow> followingList(String userId) {

		return mpDAO.followingList(userId);
	}

	@Override
	public int unFollow(HashMap<String, Object> map) {

		return mpDAO.unFollow(map);
	}

	@Override
	public int follow(HashMap<String, Object> map) {

		return mpDAO.follow(map);
	}


	@Override
	public HashMap<String, Object> commentsPageDataMap(int currentPage, String userId) {
		
		int recordCountPerPage = 5;
		ArrayList<Notice> list = mpDAO.commentsPageDataList(currentPage,recordCountPerPage, userId);
		
		int naviCountPerPage = 5;
		
		String pageNavi = mpDAO.getPageNavi(naviCountPerPage,recordCountPerPage,currentPage, userId);
		
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("list",list);
		hm.put("pageNavi", pageNavi);
		
		return hm;
	}

	@Override
	public HashMap<String, Object> itTemPageDataMap(int currentPage, String userId) {

		int recordCountPerPage = 5;
		ArrayList<Notice> list = mpDAO.itTemPageDataList(currentPage,recordCountPerPage, userId);
		
		int naviCountPerPage = 5;
		
		String pageNavi = mpDAO.getItTemPageNavi(naviCountPerPage,recordCountPerPage,currentPage, userId);
		
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("list",list);
		hm.put("pageNavi", pageNavi);
		
		return hm;
	}

}
