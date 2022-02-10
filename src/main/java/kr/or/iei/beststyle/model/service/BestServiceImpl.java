package kr.or.iei.beststyle.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.beststyle.model.dao.BestDAO;
import kr.or.iei.beststyle.model.vo.Beststyle;



@Service
public class BestServiceImpl implements BestService {

	@Autowired
	private BestDAO sDAO;

	@Override
	public ArrayList<Beststyle> AllBest() {
		return sDAO.AllBest();
	}

	@Override
	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list=sDAO.selectLikeList(userId);
		
		return list;
	}

	@Override
	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list =sDAO.selectScrapList(userId);
		return list;
	}

	@Override
	public ArrayList<Beststyle> weekBest() {
		return sDAO.weekBest();
	}
}
