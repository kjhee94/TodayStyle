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

}
