package kr.or.iei.myPage.model.service;

import java.util.ArrayList;

import kr.or.iei.myPage.model.vo.MyCoordiList;
import kr.or.iei.myPage.model.vo.MyItTemList;

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


}
