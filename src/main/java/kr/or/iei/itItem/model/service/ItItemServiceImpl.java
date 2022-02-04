package kr.or.iei.itItem.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.itItem.model.dao.ItItemDAO;
import kr.or.iei.itItem.model.vo.ItItem;

@Service
public class ItItemServiceImpl implements ItItemService{

	@Autowired
	private ItItemDAO itDAO;

	@Override
	public ArrayList<Object> getItItemList() {
		ArrayList<Object> list=itDAO.getItItemList();
		return list;
	}
	
	
}
