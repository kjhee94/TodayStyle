package kr.or.iei.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.board.model.vo.FAQ;
import kr.or.iei.board.model.vo.Notice;

public interface BoardService {

	ArrayList<FAQ> AllFAQ();


	HashMap<String, Object> NoticeList(int currentPage);


	Notice detailPage(int noticeNo);


	HashMap<String, Object> noticeSearch(int currentPage, String keyword);

	

}
