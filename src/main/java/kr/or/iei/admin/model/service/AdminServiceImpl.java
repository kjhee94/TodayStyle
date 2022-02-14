package kr.or.iei.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.admin.model.dao.AdminDAO;
import kr.or.iei.coordi.model.vo.Coordi;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

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

	@Override
	public HashMap<String, Object> selectAllNotice(int currentPage) {
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectAllNotice(recordCountPerPage,currentPage);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getNoticePageNavi(recordCountPerPage,currentPage,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public int updateNoticeOneEndYNChange(int noticeNo, char endYN) {
		
		return aDAO.updateNoticeOneEndYNChange(noticeNo,endYN);
	}

	@Override
	public int updateNoticeCheckedEndYNChange(String noticeNo) {
		
		return aDAO.updateNoticeCheckedEndYNChange(noticeNo);
	}

	@Override
	public HashMap<String, Object> selectSearchNotice(int currentPage, String type, String keyword) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectSearchNotice(recordCountPerPage,currentPage,type,keyword);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getSearchNoticePageNavi(recordCountPerPage,currentPage,naviCountPerPage,type,keyword);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
			
		return map;
	}

	@Override
	public int insertNotice(String title, String content) {
		
		return aDAO.insertNotice(title,content);
	}

	@Override
	public int updateNotice(String title, String content, int noticeNo) {
		
		return aDAO.updateNotice(title,content,noticeNo);
	}

	@Override
	public HashMap<String, Object> selectAllFAQ(int currentPage) {

		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectAllFAQ(recordCountPerPage,currentPage);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getFAQPageNavi(recordCountPerPage,currentPage,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public int updateFAQOneEndYNChange(int faqNo, char endYN) {
		
		return aDAO.updateFAQOneEndYNChange(faqNo,endYN);
	}

	@Override
	public int updateFAQCheckedEndYNChange(String faqNo) {
		
		return aDAO.updateFAQCheckedEndYNChange(faqNo);
	}

	@Override
	public HashMap<String, Object> selectSearchFAQ(int currentPage, String category, String keyword) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectSearchFAQ(recordCountPerPage,currentPage,category,keyword);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getSearchFAQPageNavi(recordCountPerPage,currentPage,naviCountPerPage,category,keyword);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
			
		return map;
	}

	@Override
	public int insertFAQ(String category, String title, String content) {
		
		return aDAO.insertFAQ(category,title,content);
	}

	@Override
	public int updateFAQ(String category, String title, String content, int faqNo) {
		
		return aDAO.updateFAQ(category,title,content,faqNo);
	}

	@Override
	public HashMap<String, Object> selectAllCoordi(int currentPage) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectAllCoordi(recordCountPerPage,currentPage);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getCoordiPageNavi(recordCountPerPage,currentPage,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}
	
	@Override
	public int updateCoordiOneDelYNChange(int coordiNo, char delYN) {
		
		return aDAO.updateCoordiOneDelYNChange(coordiNo,delYN);
	}

	@Override
	public int updateCoordiCheckedDelYNChange(String coordiNo) {
		
		return aDAO.updateCoordiCheckedDelYNChange(coordiNo);
	}

	@Override
	public ArrayList<PostCoordi> selectOneCoordiItem(int coordiNo) {
		
		return aDAO.selectOneCoordiItem(coordiNo);
	}

	@Override
	public HashMap<String, Object> selectSearchCoordi(int currentPage, String type, String keyword) {

		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectSearchCoordi(recordCountPerPage,currentPage,type,keyword);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getSearchCoordiPageNavi(recordCountPerPage,currentPage,naviCountPerPage,type,keyword);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
			
		return map;
	}

	@Override
	public HashMap<String, Object> selectAllCoordiComment(int currentPage, int coordiNo) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectAllCoordiComment(recordCountPerPage,currentPage,coordiNo);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getCoordiCommentPageNavi(recordCountPerPage,currentPage,naviCountPerPage,coordiNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public int updateCoordiCommentOneDelYNChange(int cmtNo, String cmtDelYN) {
		
		return aDAO.updateCoordiCommentOneDelYNChange(cmtNo,cmtDelYN);
	}

	@Override
	public int updateCoordiCommentCheckedDelYNChange(String cmtNo) {
		
		return aDAO.updateCoordiCommentCheckedDelYNChange(cmtNo);
	}
	
	@Override
	public HashMap<String, Object> selectSearchCoordiComment(int currentPage, String type, String keyword,
			int coordiNo) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectSearchCoordiComment(recordCountPerPage,currentPage,type,keyword,coordiNo);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getSearchCoordiCommentPageNavi(recordCountPerPage,currentPage,naviCountPerPage,type,keyword,coordiNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
			
		return map;
	}

	@Override
	public HashMap<String, Object> selectAllIttem(int currentPage) {

		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectAllIttem(recordCountPerPage,currentPage);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getIttemPageNavi(recordCountPerPage,currentPage,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public int updateIttemOneDelYNChange(int itItemNo, char delYN) {
		
		return aDAO.updateIttemOneDelYNChange(itItemNo,delYN);
	}

	@Override
	public int updateIttemCheckedDelYNChange(String itItemNo) {
		
		return aDAO.updateIttemCheckedDelYNChange(itItemNo);
	}

	@Override
	public HashMap<String, Object> selectSearchIttem(int currentPage, String type, String keyword) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectSearchIttem(recordCountPerPage,currentPage,type,keyword);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getSearchIttemPageNavi(recordCountPerPage,currentPage,naviCountPerPage,type,keyword);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
			
		return map;
	}

	@Override
	public HashMap<String, Object> selectAllIttemComment(int currentPage, int itItemNo) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectAllIttemComment(recordCountPerPage,currentPage,itItemNo);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getIttemCommentPageNavi(recordCountPerPage,currentPage,naviCountPerPage,itItemNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	@Override
	public int updateIttemCommentOneDelYNChange(int cmtNo, String cmtDelYN) {
		
		return aDAO.updateIttemCommentOneDelYNChange(cmtNo,cmtDelYN);
	}

	@Override
	public int updateIttemCommentCheckedDelYNChange(String cmtNo) {
		// TODO Auto-generated method stub
		return aDAO.updateIttemCommentCheckedDelYNChange(cmtNo);
	}

	@Override
	public HashMap<String, Object> selectSearchIttemComment(int currentPage, String type, String keyword,
			int itItemNo) {
		
		//한 페이지에 보여줄 게시물의 수 
		int recordCountPerPage = 10;
		
		ArrayList<Member> list = aDAO.selectSearchIttemComment(recordCountPerPage,currentPage,type,keyword,itItemNo);
		
		//페이지 네비
		int naviCountPerPage = 5;
		
		String pageNavi = aDAO.getSearchIttemCommentPageNavi(recordCountPerPage,currentPage,naviCountPerPage,type,keyword,itItemNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
			
		return map;
	}

}
