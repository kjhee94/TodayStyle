package kr.or.iei.coordi.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.coordi.model.dao.CoordiDAO;
import kr.or.iei.coordi.model.vo.Coordi;

@Service
public class CoordiServiceImpl implements CoordiService{
	
	@Autowired
	private CoordiDAO coDAO;

	@Override
	public ArrayList<Coordi> getCoordiList(HashMap<String, String> pMap) {
		ArrayList<Coordi> list=coDAO.getCoordiList(pMap);
		return list;
	}

	@Override
	public ArrayList<Coordi> selectCategoryCoordiList(HashMap<String, Object> map) {
		ArrayList<Coordi> list=coDAO.selectCategoryCoordiList(map);
		return list;
	}

	@Override
	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list=coDAO.selectLikeList(userId);
		
		return list;
	}

	@Override
	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list =coDAO.selectScrapList(userId);
		return list;
	}

	@Override
	public int deleteLikeCoordi(HashMap<String, Object> map) {
		int result=coDAO.deleteLikeCoordi(map);
		return result;
	}

	@Override
	public int insertLikeCoordi(HashMap<String, Object> map) {
		int result=coDAO.insertLikeCoordi(map);
		return result;
	}

	@Override
	public int deletescrapCoordi(HashMap<String, Object> map) {
		int result=coDAO.deleteScrapCoordi(map);
		return result;
	}

	@Override
	public int insertScrapCoordi(HashMap<String, Object> map) {
		int result=coDAO.insertScrapCoordi(map);
		return result;
	}


}
