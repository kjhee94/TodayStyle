package kr.or.iei.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.member.model.vo.Member;

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

}
