package kr.or.iei.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.board.model.vo.FAQ;
import kr.or.iei.board.model.vo.Notice;

@Repository
public class BoardDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	
	public ArrayList<FAQ> AllFAQ(String type) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("type",type);
		return new ArrayList<FAQ> (sqlSession.selectList("board.buttonFAQ",map));
	}


	public ArrayList<Notice> NoticeList(int currentPage, int recordCountPerPage) {
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		return new ArrayList<Notice> (sqlSession.selectList("board.NoticeList",map));
	}


	public String getPageNavi(int naviCountPerPage, int recordCountPerPage, int currentPage) {
		int recordTotalCount = totalCount();//전체 글 갯수
		int pageTotalCount = 0; //전체 페이지 개수
		

		if((recordTotalCount % recordCountPerPage)>0)
		{
			pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		int startNavi = (((currentPage-1) / naviCountPerPage) * naviCountPerPage) + 1;
		int endNavi = startNavi + (naviCountPerPage-1);
		
		
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}

		
		//PageNavi 모양 만들기
		
		StringBuilder sb = new StringBuilder();
		
		if(startNavi!=1)
		{
			sb.append("<li><a href='/board/NoticePage.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li> ");
		}
		
		for(int i = startNavi; i<=endNavi; i++)
		{
			if(i==currentPage)
			{
				sb.append("<li><a href='/board/NoticePage.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}
			else
			{
			sb.append("<li><a href='/board/NoticePage.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		if(endNavi!=pageTotalCount)
		{
			sb.append("<li><a href='/board/NoticePage.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		
		return sb.toString();
	}


	private int totalCount() {
		return sqlSession.selectOne("board.totalCount");
		
	}


	public Notice detailPage(int noticeNo) {
		return sqlSession.selectOne("board.detailPage",noticeNo);
	}


	public ArrayList<Notice> noticeSearch(int currentPage, int recordCountPerPage, String keyword) {
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		return new ArrayList<Notice> (sqlSession.selectList("board.noticeSearch",map));
	}


	public String getSearchPageNavi(int naviCountPerPage, int recordCountPerPage, int currentPage, String keyword) {
			
			int recordTotalCount = totalSearchCount(keyword); //전체 글 갯수
			
			int pageTotalCount = 0; //전체 페이지 개수
		
			if((recordTotalCount % recordCountPerPage)>0)
			{
				pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
			}else
			{
				pageTotalCount = recordTotalCount / recordCountPerPage;
			}
			
		
			int startNavi = (((currentPage-1) / naviCountPerPage) * naviCountPerPage) + 1;
			int endNavi = startNavi + (naviCountPerPage-1);
		
			if(endNavi > pageTotalCount)
			{
				endNavi = pageTotalCount;
			}

			
			// PageNavi 모양 만들기
			
					StringBuilder sb = new StringBuilder();
					
					if(startNavi!=1)
					{
				
						
						sb.append("<li><a href='/board/noticeSearch.do?currentPage="+(startNavi-1)+"&keyword="+keyword+"'><i class='fas fa-chevron-left'></i></a></li>");
					}
					
					for(int i=startNavi; i<=endNavi;i++)
					{
						if(i==currentPage)
						{

							sb.append("<li><a href='/board/noticeSearch.do?currentPage="+i+"&keyword="+keyword+"' class='page_active'>"+i+"</a></li>");
						}else
						{
							
							
							sb.append("<li><a href='/board/noticeSearch.do?currentPage="+i+"&keyword="+keyword+"'>"+i+"</a></li>");
						}
						
					}
					
					if(endNavi!=pageTotalCount)
					{
						
						
						sb.append("<li><a href='/board/noticeSearch.do?currentPage="+(endNavi+1)+"&keyword="+keyword+"'><i class='fas fa-chevron-right'></i></a></li>");
					}
			
			
			return sb.toString();
		}


	private int totalSearchCount(String keyword) {
		return sqlSession.selectOne("board.totalSearchCount",keyword);
	}


	public ArrayList<FAQ> buttonFAQ(String type) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("type",type);
		return new ArrayList<FAQ> (sqlSession.selectList("board.buttonFAQ",map));
	}


	
}
