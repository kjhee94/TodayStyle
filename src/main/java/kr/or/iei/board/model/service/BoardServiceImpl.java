package kr.or.iei.board.model.service;

import java.util.ArrayList;

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
	public ArrayList<Notice> AllNotice() {
		return bDAO.AllNotice();
	}


	

}
