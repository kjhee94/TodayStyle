package kr.or.iei.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.coordi.model.vo.Coordi;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

public interface AdminService {

	HashMap<String, Integer> selectCountTodayNew();

	HashMap<String, Object> selectAllMember(int currentPage);

	int updateMemberOneEndYNChange(String userId, char endYN);

	int updateMemberCheckedEndYNChange(String userId);

	HashMap<String, Object> selectSearchMember(int currentPage, String type, String keyword);

	HashMap<String, Object> selectAllNotice(int currentPage);

	int updateNoticeOneEndYNChange(int noticeNo, char endYN);

	int updateNoticeCheckedEndYNChange(String noticeNo);

	HashMap<String, Object> selectSearchNotice(int currentPage, String type, String keyword);

	int insertNotice(String title, String content);

	int updateNotice(String title, String content, int noticeNo);

	HashMap<String, Object> selectAllFAQ(int currentPage);

	int updateFAQOneEndYNChange(int faqNo, char endYN);

	int updateFAQCheckedEndYNChange(String faqNo);

	HashMap<String, Object> selectSearchFAQ(int currentPage, String category, String keyword);

	int insertFAQ(String category, String title, String content);

	int updateFAQ(String category, String title, String content, int faqNo);

	HashMap<String, Object> selectAllCoordi(int currentPage);

	int updateCoordiOneDelYNChange(int coordiNo, char delYN);

	int updateCoordiCheckedDelYNChange(String coordiNo);
	
	ArrayList<PostCoordi> selectOneCoordiItem(int coordiNo);

	HashMap<String, Object> selectSearchCoordi(int currentPage, String type, String keyword);

	HashMap<String, Object> selectAllCoordiComment(int currentPage, int coordiNo);

	int updateCoordiCommentOneDelYNChange(int cmtNo, String cmtDelYN);

	int updateCoordiCommentCheckedDelYNChange(String cmtNo);

	HashMap<String, Object> selectSearchCoordiComment(int currentPage, String type, String keyword, int coordiNo);

	HashMap<String, Object> selectAllIttem(int currentPage);

	int updateIttemOneDelYNChange(int itItemNo, char delYN);

	int updateIttemCheckedDelYNChange(String itItemNo);

	HashMap<String, Object> selectSearchIttem(int currentPage, String type, String keyword);

	HashMap<String, Object> selectAllIttemComment(int currentPage, int itItemNo);

	int updateIttemCommentOneDelYNChange(int cmtNo, String cmtDelYN);

	int updateIttemCommentCheckedDelYNChange(String cmtNo);

	HashMap<String, Object> selectSearchIttemComment(int currentPage, String type, String keyword, int itItemNo);
}
