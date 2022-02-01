package kr.or.iei.board.model.service;

import java.util.ArrayList;

import kr.or.iei.board.model.vo.FAQ;
import kr.or.iei.board.model.vo.Notice;

public interface BoardService {

	ArrayList<FAQ> AllFAQ();

	ArrayList<Notice> AllNotice();

	

}
