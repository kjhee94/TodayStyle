package kr.or.iei.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.board.model.dao.BoardDAO;
import kr.or.iei.board.model.vo.FAQ;
import kr.or.iei.board.model.vo.Notice;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public ArrayList<FAQ> AllFAQ() {
		return bDAO.AllFAQ();
	}



	@Override
	public HashMap<String, Object> NoticeList(int currentPage) {
		int recordCountPerPage = 10;
		ArrayList<Notice> list = bDAO.NoticeList(currentPage,recordCountPerPage);
		
		int naviCountPerPage = 5;
		
		String pageNavi = bDAO.getPageNavi(naviCountPerPage,recordCountPerPage,currentPage);
		
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("list",list);
		hm.put("pageNavi", pageNavi);
		
		return hm;
	}



	@Override
	public Notice detailPage(int noticeNo) {
		Notice n = bDAO.detailPage(noticeNo);
		return n;
	}



	@Override
	public HashMap<String, Object> noticeSearch(int currentPage, String keyword) {
		int recordCountPerPage = 10;
		
		ArrayList<Notice> list = bDAO.noticeSearch(currentPage,recordCountPerPage,keyword);
		
		int naviCountPerPage = 5;
		
		String pageNavi = bDAO.getSearchPageNavi(naviCountPerPage,recordCountPerPage,currentPage,keyword);

		
		//리턴을 하기 위하여 HashMap 객체를 만들어서 리턴
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}


	

}
