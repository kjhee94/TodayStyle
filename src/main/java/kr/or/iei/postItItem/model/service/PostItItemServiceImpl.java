package kr.or.iei.postItItem.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.postItItem.model.dao.PostItItemDAO;
import kr.or.iei.postItItem.model.vo.PostItItem;

@Service
public class PostItItemServiceImpl implements PostItItemService{

	@Autowired
	private PostItItemDAO iDAO;

	@Override
	public HashMap<String, Object> oneItItemPost(int itItemNo) {
		
		return iDAO.oneItItemPost(itItemNo);
	}
}
 