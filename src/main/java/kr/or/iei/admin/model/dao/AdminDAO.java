package kr.or.iei.admin.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository
public class AdminDAO {

	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public Integer selectCountTodayNewMember() {
		
		Integer count = sqlSession.selectOne("admin.selectCountTodayNewMember");
		
		if(count==null) {
			count=0;
		}
		
		return count;
	}

	public Integer selectCountTodayNewCoordiPost() {
		Integer count = sqlSession.selectOne("admin.selectCountTodayNewCoordiPost");
		
		if(count==null) {
			count=0;
		}
		
		return count;
	}

	public Integer selectCountTodayNewIttemPost() {
		Integer count = sqlSession.selectOne("admin.selectCountTodayNewIttemPost");
		
		if(count==null) {
			count=0;
		}
		
		return count;
	}
	
	public ArrayList<Member> selectAllMember(int recordCountPerPage, int currentPage) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectAllMemberListPage", map));
		
		return list;
	}

	public String getMemberPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {
		
		//총 회원 수
		int recordTotalCount = totalMemberCount();
		
		//현재 페이지 수를 가지고 있는 변수
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		//공백페이지 네비 처리
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		//모양만들기
		StringBuilder sb = new StringBuilder();
		if(startNavi != 1) {
			
			sb.append("<li><a href='/admin/adminMember.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminMember.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminMember.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/adminMember.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalMemberCount() {
		
		return sqlSession.selectOne("admin.selectMemberTotalCount");
	}

	public int updateMemberOneEndYNChange(String userId, char endYN) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("endYN", endYN);
		
		return sqlSession.update("admin.updateMemberOneEndYNChange", map);
	}

	public int updateMemberCheckedEndYNChange(String userId) {
		
		String [] userIdArray = userId.split(",");
		
		int result = sqlSession.update("admin.updateMemberCheckedEndYNChange",userIdArray);
		
		return result;
	}

	public ArrayList<Member> selectSearchMember(int recordCountPerPage, int currentPage, String type, String keyword) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectSearchMemberListPage", map));
		
		return list;
	}

	public String getSearchMemberPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, String type,
			String keyword) {
		
		//총 회원 수
		int recordTotalCount = totalSearchMemberCount(type, keyword);
		
		//현재 페이지 수를 가지고 있는 변수
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		//공백페이지 네비 처리
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		//모양만들기
		StringBuilder sb = new StringBuilder();
		if(startNavi != 1) {
			
			sb.append("<li><a href='/admin/memberSearch.do?currentPage="+(startNavi-1)+"&keyword="+keyword+"&type="+type+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/memberSearch.do?currentPage="+i+"&keyword="+keyword+"&type="+type+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/memberSearch.do?currentPage="+i+"&keyword="+keyword+"&type="+type+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/memberSearch.do?currentPage="+(endNavi+1)+"&keyword="+keyword+"&type="+type+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalSearchMemberCount(String type, String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("admin.selectSearchMemberTotalCount", map);
	}

	public ArrayList<Member> selectAllNotice(int recordCountPerPage, int currentPage) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectAllNoticeListPage", map));
		
		return list;
	}

	public String getNoticePageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {
		
		//총 회원 수
		int recordTotalCount = totalNoticeCount();
		
		//현재 페이지 수를 가지고 있는 변수
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		//공백페이지 네비 처리
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		//모양만들기
		StringBuilder sb = new StringBuilder();
		if(startNavi != 1) {
			
			sb.append("<li><a href='/admin/adminNotice.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminNotice.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminNotice.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/adminNotice.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalNoticeCount() {
		
		return sqlSession.selectOne("admin.selectNoticeTotalCount");
	}

	public int updateNoticeOneEndYNChange(int noticeNo, char endYN) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("noticeNo",noticeNo);
		map.put("endYN",endYN);
		
		return sqlSession.update("admin.updateNoticeOneEndYNChange",map);
	}

	public int updateNoticeCheckedEndYNChange(String noticeNo) {
		
		String [] noticeNoArray = noticeNo.split(",");
		
		int result = sqlSession.update("admin.updateNoticeCheckedEndYNChange",noticeNoArray);
		
		return result;
	}

	public ArrayList<Member> selectSearchNotice(int recordCountPerPage, int currentPage, String type, String keyword) {

		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectSearchNoticeListPage", map));
		
		return list;
	}

	public String getSearchNoticePageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, String type,
			String keyword) {
		//총 회원 수
		int recordTotalCount = totalSearchNoticeCount(type, keyword);
		
		//현재 페이지 수를 가지고 있는 변수
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		//공백페이지 네비 처리
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		//모양만들기
		StringBuilder sb = new StringBuilder();
		if(startNavi != 1) {
			
			sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+(startNavi-1)+"&keyword="+keyword+"&type="+type+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+i+"&keyword="+keyword+"&type="+type+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+i+"&keyword="+keyword+"&type="+type+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+(endNavi+1)+"&keyword="+keyword+"&type="+type+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalSearchNoticeCount(String type, String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("admin.selectSearchNoticeTotalCount", map);
	}

	public int insertNotice(String title, String content) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("title", title);
		map.put("content", content);
		
		return sqlSession.insert("admin.insertNotice", map);
	}

	public int updateNotice(String title, String content, int noticeNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("title", title);
		map.put("content", content);
		map.put("noticeNo", noticeNo);
		
		return sqlSession.insert("admin.updateNotice", map);
	}
}
