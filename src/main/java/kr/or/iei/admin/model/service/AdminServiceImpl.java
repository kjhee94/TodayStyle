package kr.or.iei.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.admin.model.dao.AdminDAO;
import kr.or.iei.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO aDAO;

	@Override
	public HashMap<String, Integer> selectCountTodayNew() {
		
		Integer countTodayNewMember =  aDAO.selectCountTodayNewMember();
		Integer countTodayNewCoordiPost = aDAO.selectCountTodayNewCoordiPost();
		Integer countTodayNewIttemPost = aDAO.selectCountTodayNewIttemPost();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("countMember", countTodayNewMember);
		map.put("countCoordi", countTodayNewCoordiPost);
		map.put("countIttem", countTodayNewIttemPost);
		
		return map;
	}
	
	@Override
	public HashMap<String, Object> selectAllMember(int currentPage) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectAllMember(recordCountPerPage,currentPage);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getMemberPageNavi(recordCountPerPage,currentPage,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public int updateMemberOneEndYNChange(String userId, char endYN) {
		
		return aDAO.updateMemberOneEndYNChange(userId, endYN);
	}

	@Override
	public int updateMemberCheckedEndYNChange(String userId) {
		
		return aDAO.updateMemberCheckedEndYNChange(userId);
	}

	@Override
	public HashMap<String, Object> selectSearchMember(int currentPage, String type, String keyword) {
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectSearchMember(recordCountPerPage,currentPage,type,keyword);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getSearchMemberPageNavi(recordCountPerPage,currentPage,naviCountPerPage,type,keyword);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
			
		return map;
	}

}
