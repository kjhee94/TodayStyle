package kr.or.iei.itItem.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.itItem.model.dao.ItItemDAO;
import kr.or.iei.itItem.model.vo.ItItem;

@Service
public class ItItemServiceImpl implements ItItemService{

	@Autowired
	private ItItemDAO itDAO;

	@Override
	public ArrayList<ItItem> getItItemList() {
		ArrayList<ItItem> list=itDAO.getItItemList();
		return list;
	}

	@Override
	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list =itDAO.selectLikeList(userId);
		return list;
	}

	@Override
	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list = itDAO.selectScrapList(userId);
		return list;
	}

	@Override
	public int deleteLikeItItem(HashMap<String, Object> map) {
		int result=itDAO.deleteLikeItItem(map);
		return result;
	}

	@Override
	public int insertLikeItItem(HashMap<String, Object> map) {
		int result=itDAO.insertLikeItItem(map);
		return result;
	}

	@Override
	public int deletescrapItItem(HashMap<String, Object> map) {
		int result=itDAO.deletescrapItItem(map);
		return result;
	}

	@Override
	public int insertScrapItItem(HashMap<String, Object> map) {
		int result=itDAO.insertScrapItItem(map);
		return result;
	}

	@Override
	public ArrayList<ItItem> selectCategoryItItemList(HashMap<String, Object> map) {
		ArrayList<ItItem> list=itDAO.selectCategoryItItemList(map);
		return list;
	}
	
	
}
