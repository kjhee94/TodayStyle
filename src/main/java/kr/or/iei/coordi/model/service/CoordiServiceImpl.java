package kr.or.iei.coordi.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.coordi.model.dao.CoordiDAO;
import kr.or.iei.coordi.model.vo.Coordi;

@Service
public class CoordiServiceImpl implements CoordiService{
	
	@Autowired
	private CoordiDAO coDAO;

	@Override
	public ArrayList<Object> getCoordiList(String season) {
		ArrayList<Object> list=coDAO.getCoordiList(season);
		return list;
	}
}
