package kr.or.iei.admin.model.dao;

import java.util.ArrayList;
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
}
