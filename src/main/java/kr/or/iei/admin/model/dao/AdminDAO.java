package kr.or.iei.admin.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.coordi.model.vo.Coordi;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.postCoordi.model.vo.PostCoordi;

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
			
			sb.append("<li><a href='/admin/memberSearch.do?currentPage="+(startNavi-1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/memberSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/memberSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/memberSearch.do?currentPage="+(endNavi+1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
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
		
		//총 게시물 수
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
		
		//총 게시물 수
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
			
			sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+(startNavi-1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/noticeSearch.do?currentPage="+(endNavi+1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
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

	public ArrayList<Member> selectAllFAQ(int recordCountPerPage, int currentPage) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectAllFAQListPage", map));
		
		return list;
	}

	public String getFAQPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {
		
		//총 게시물 수
		int recordTotalCount = totalFAQCount();
		
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
			
			sb.append("<li><a href='/admin/adminFAQ.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminFAQ.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminFAQ.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/adminFAQ.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalFAQCount() {
		
		return sqlSession.selectOne("admin.selectFAQTotalCount");
	}

	public int updateFAQOneEndYNChange(int faqNo, char endYN) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("faqNo", faqNo);
		map.put("endYN", endYN);
		
		return sqlSession.update("admin.updateFAQOneEndYNChange",map);
	}

	public int updateFAQCheckedEndYNChange(String faqNo) {
		
		String [] faqNoArray = faqNo.split(",");
		
		int result = sqlSession.update("admin.updateFAQCheckedEndYNChange",faqNoArray);
		
		return result;
	}

	public ArrayList<Member> selectSearchFAQ(int recordCountPerPage, int currentPage, String category, String keyword) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectSearchFAQListPage", map));
		
		return list;
	}

	public String getSearchFAQPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, String category,
			String keyword) {
		
		//총 게시물 수
		int recordTotalCount = totalSearchFAQCount(category, keyword);
		
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
			
			sb.append("<li><a href='/admin/faqSearch.do?currentPage="+(startNavi-1)+"&category="+category+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/faqSearch.do?currentPage="+i+"&category="+category+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/faqSearch.do?currentPage="+i+"&category="+category+"&keyword="+keyword+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/faqSearch.do?currentPage="+(endNavi+1)+"&category="+category+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalSearchFAQCount(String category, String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("admin.selectSearchFAQTotalCount", map);
	}

	public int insertFAQ(String category, String title, String content) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category);
		map.put("title", title);
		map.put("content", content);
		
		return sqlSession.insert("admin.insertFAQ", map);
	}

	public int updateFAQ(String category, String title, String content, int faqNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("category", category);
		map.put("title", title);
		map.put("content", content);
		map.put("faqNo", faqNo);
		
		return sqlSession.update("admin.updateFAQ", map);
	}

	public ArrayList<Member> selectAllCoordi(int recordCountPerPage, int currentPage) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectAllCoordiListPage", map));
		
		return list;
	}

	public String getCoordiPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {
		
		//총 게시물 수
		int recordTotalCount = totalCoordiCount();
		
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
			
			sb.append("<li><a href='/admin/adminCoordi.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminCoordi.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminCoordi.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/adminCoordi.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalCoordiCount() {

		return sqlSession.selectOne("admin.selectCoordiTotalCount");
	}

	public int updateCoordiOneDelYNChange(int coordiNo, char delYN) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("coordiNo", coordiNo);
		map.put("delYN", delYN);
		
		return sqlSession.update("admin.updateCoordiOneDelYNChange", map);
	}

	public int updateCoordiCheckedDelYNChange(String coordiNo) {

		String [] coordiNoArray = coordiNo.split(",");
		
		int result = sqlSession.update("admin.updateCoordiCheckedDelYNChange",coordiNoArray);
		
		return result;
	}

	public ArrayList<PostCoordi> selectOneCoordiItem(int coordiNo) {
		
		ArrayList<PostCoordi> list = new ArrayList<PostCoordi>(sqlSession.selectList("admin.selectOneCoordiItem",coordiNo));
		
		return list;
	}

	public ArrayList<Member> selectSearchCoordi(int recordCountPerPage, int currentPage, String type, String keyword) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectSearchCoordiListPage", map));
		
		return list;
	}

	public String getSearchCoordiPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, String type,
			String keyword) {
		
		//총 게시물 수
		int recordTotalCount = totalSearchCoordiCount(type, keyword);
		
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
			
			sb.append("<li><a href='/admin/coordiSearch.do?currentPage="+(startNavi-1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/coordiSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/coordiSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/coordiSearch.do?currentPage="+(endNavi+1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalSearchCoordiCount(String type, String keyword) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("admin.selectSearchCoordiTotalCount", map);
	}

	public ArrayList<Member> selectAllCoordiComment(int recordCountPerPage, int currentPage, int coordiNo) {

		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("coordiNo", coordiNo);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectAllCoordiCommentListPage", map));
		
		return list;
	}

	public String getCoordiCommentPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage,
			int coordiNo) {
		
		//총 게시물 수
		int recordTotalCount = totalCoordiCommentCount(coordiNo);
		
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
			
			sb.append("<li><a href='/admin/adminCoordiComment.do?coordiNo="+coordiNo+"&currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminCoordiComment.do?coordiNo="+coordiNo+"&currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminCoordiComment.do?coordiNo="+coordiNo+"&currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/adminCoordiComment.do?coordiNo="+coordiNo+"&currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalCoordiCommentCount(int coordiNo) {
		
		return sqlSession.selectOne("admin.selectCoordiCommentTotalCount",coordiNo);
	}

	public int updateCoordiCommentOneDelYNChange(int cmtNo, String cmtDelYN) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cmtNo", cmtNo);
		map.put("cmtDelYN", cmtDelYN);
		
		return sqlSession.update("admin.updateCoordiCommentOneDelYNChange", map);
	}

	public int updateCoordiCommentCheckedDelYNChange(String cmtNo) {

		String [] cmtNoArray = cmtNo.split(",");
		
		int result = sqlSession.update("admin.updateCoordiCommentCheckedDelYNChange",cmtNoArray);
		
		return result;
	}

	public ArrayList<Member> selectSearchCoordiComment(int recordCountPerPage, int currentPage, String type,
			String keyword, int coordiNo) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("coordiNo", coordiNo);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectSearchCoordiCommentListPage", map));
		
		return list;
	}

	public String getSearchCoordiCommentPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage,
			String type, String keyword, int coordiNo) {
		//총 게시물 수
		int recordTotalCount = totalSearchCoordiCommentCount(coordiNo, type, keyword);
		
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
			
			sb.append("<li><a href='/admin/coordiCommentSearch.do?coordiNo="+coordiNo+"&currentPage="+(startNavi-1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/coordiCommentSearch.do?coordiNo="+coordiNo+"&currentPage="+i+"&type="+type+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/coordiCommentSearch.do?coordiNo="+coordiNo+"&currentPage="+i+"&type="+type+"&keyword="+keyword+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/coordiCommentSearch.do?coordiNo="+coordiNo+"&currentPage="+(endNavi+1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();

	}

	private int totalSearchCoordiCommentCount(int coordiNo, String type, String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("coordiNo", coordiNo);
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("admin.selectSearchCoordiCommentTotalCount",map);
	}

	public ArrayList<Member> selectAllIttem(int recordCountPerPage, int currentPage) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectAllIttemListPage", map));
		
		return list;
	}

	public String getIttemPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {

		//총 게시물 수
		int recordTotalCount = totalIttemCount();
		
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
			
			sb.append("<li><a href='/admin/adminIttem.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminIttem.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminIttem.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/adminIttem.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalIttemCount() {
		
		return sqlSession.selectOne("admin.selectIttemTotalCount");
	}

	public int updateIttemOneDelYNChange(int itItemNo, char delYN) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("itItemNo", itItemNo);
		map.put("delYN", delYN);
		
		return sqlSession.update("admin.updateIttemOneDelYNChange",map);
	}

	public int updateIttemCheckedDelYNChange(String itItemNo) {
		
		String [] itItemNoArray = itItemNo.split(",");
		
		return sqlSession.update("admin.updateIttemCheckedDelYNChange",itItemNoArray);
	}

	public ArrayList<Member> selectSearchIttem(int recordCountPerPage, int currentPage, String type, String keyword) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectSearchIttemListPage", map));
		
		return list;
	}

	public String getSearchIttemPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, String type,
			String keyword) {
		
		///총 게시물 수
		int recordTotalCount = totalSearchIttemCount(type, keyword);
		
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
			
			sb.append("<li><a href='/admin/ittemSearch.do?currentPage="+(startNavi-1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/ittemSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/ittemSearch.do?currentPage="+i+"&type="+type+"&keyword="+keyword+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/ittemSearch.do?currentPage="+(endNavi+1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}
	
	private int totalSearchIttemCount(String type, String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("admin.selectSearchIttemTotalCount", map);
	}

	public ArrayList<Member> selectAllIttemComment(int recordCountPerPage, int currentPage, int itItemNo) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("itItemNo", itItemNo);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectAllIttemCommentListPage", map));
		
		return list;
	}

	public String getIttemCommentPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, int itItemNo) {
		
		//총 게시물 수
		int recordTotalCount = totalIttemCommentCount(itItemNo);
		
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
			
			sb.append("<li><a href='/admin/adminIttemComment.do?itItemNo="+itItemNo+"&currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/adminIttemComment.do?itItemNo="+itItemNo+"&currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/adminIttemComment.do?itItemNo="+itItemNo+"&currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/adminIttemComment.do?itItemNo="+itItemNo+"&currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalIttemCommentCount(int itItemNo) {
		
		return sqlSession.selectOne("admin.selectIttemCommentTotalCount",itItemNo);
	}

	public int updateIttemCommentOneDelYNChange(int cmtNo, String cmtDelYN) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cmtNo", cmtNo);
		map.put("cmtDelYN", cmtDelYN);
		
		return sqlSession.update("admin.updateIttemCommentOneDelYNChange", map);
	}

	public int updateIttemCommentCheckedDelYNChange(String cmtNo) {
		
		String [] cmtNoArray = cmtNo.split(",");
		
		int result = sqlSession.update("admin.updateIttemCommentCheckedDelYNChange",cmtNoArray);
		
		return result;
	}

	public ArrayList<Member> selectSearchIttemComment(int recordCountPerPage, int currentPage, String type,
			String keyword, int itItemNo) {
		
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("itItemNo", itItemNo);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Member> list = new ArrayList<Member>(sqlSession.selectList("admin.selectSearchIttemCommentListPage", map));
		
		return list;
	}

	public String getSearchIttemCommentPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage,
			String type, String keyword, int itItemNo) {
		
		//총 게시물 수
		int recordTotalCount = totalSearchIttemCommentCount(itItemNo, type, keyword);
		
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
			
			sb.append("<li><a href='/admin/ittemCommentSearch.do?itItemNo="+itItemNo+"&currentPage="+(startNavi-1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
		}
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li><a href='/admin/ittemCommentSearch.do?itItemNo="+itItemNo+"&currentPage="+i+"&type="+type+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
			}else {
				sb.append("<li><a href='/admin/ittemCommentSearch.do?itItemNo="+itItemNo+"&currentPage="+i+"&type="+type+"&keyword="+keyword+"'>"+i+"</a></li>");
			}
		}
		if(endNavi != pageTotalCount) {
			sb.append("<li><a href='/admin/ittemCommentSearch.do?itItemNo="+itItemNo+"&currentPage="+(endNavi+1)+"&type="+type+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		return sb.toString();
	}

	private int totalSearchIttemCommentCount(int itItemNo, String type, String keyword) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("itItemNo", itItemNo);
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("admin.selectSearchIttemCommentTotalCount",map);
	}

}
