package kr.or.iei.myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.myPage.model.vo.MyCoordiList;
import kr.or.iei.myPage.model.vo.MyItTemList;
import kr.or.iei.myPage.model.vo.ScrapCoordiList;
import kr.or.iei.myPage.model.vo.ScrapItTemList;
import kr.or.iei.myPage.model.vo.Comments;
import kr.or.iei.myPage.model.vo.Follow;

public interface MyPageService {

	// 프로필 - 프로필 이미지 경로
	String profileFilePath(String userId);
	
	// 프로필 - 사용자가 팔로우한 사람 수
	String followingNum(String userId);

	// 프로필 - 사용자를 팔로우한 사람 수
	String followerNum(String userId);

	// myStyle - 사용자의 코디 리스트 (번호, 경로)
	ArrayList<MyCoordiList> myCoordiList(String userId);
	// myStyle - 사용자의 잇템 리스트 (번호, 경로)
	ArrayList<MyItTemList> myItTemList(String userId);

	// scrap coordi
	ArrayList<ScrapCoordiList> scrapCoordiList(String userId);
	
	// scrap itTem
	ArrayList<ScrapItTemList> scrapItTemList(String userId);

	// follower list
	ArrayList<Follow> followerList(String userId);

	// following list
	ArrayList<Follow> followingList(String userId);

	//unFollow
	int unFollow(HashMap<String, Object> map);
	//follow
	int follow(HashMap<String, Object> map);
	
	// 댓글(코디) 페이지 데이터 맵
	HashMap<String, Object> commentsPageDataMap(int currentPage, String userId);

	// 댓글(잇템) 페이지 데이터 맵
	HashMap<String, Object> itTemPageDataMap(int currentPage, String userId);


}
