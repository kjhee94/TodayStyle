package kr.or.iei.myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.myPage.model.vo.MyCoordiList;
import kr.or.iei.myPage.model.vo.MyItTemList;
import kr.or.iei.myPage.model.vo.ScrapCoordiList;
import kr.or.iei.myPage.model.vo.ScrapItTemList;
import kr.or.iei.board.model.vo.Notice;
import kr.or.iei.myPage.model.vo.Comments;
import kr.or.iei.myPage.model.vo.Follow;

@Repository
public class MyPageDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;


	public String profileFilePath(String userId) {

		return sqlSession.selectOne("myPage.profileFilePath", userId);
	}

	public String followingNum(String userId) {
		
		return sqlSession.selectOne("myPage.followingNum", userId);
	}


	public String followerNum(String userId) {

		return sqlSession.selectOne("myPage.followerNum", userId);
	}


	public ArrayList<MyCoordiList> myCoordiList(String userId) {

		return new ArrayList<MyCoordiList>(sqlSession.selectList("myPage.myCoordiList", userId));
	}

	public ArrayList<MyItTemList> myItTemList(String userId) {

		return new ArrayList<MyItTemList>(sqlSession.selectList("myPage.myItTemList", userId));
	}

	public ArrayList<ScrapCoordiList> scrapCoordiList(String userId) {

		return new ArrayList<ScrapCoordiList>(sqlSession.selectList("myPage.scrapCoordiList", userId));
	}

	public ArrayList<ScrapItTemList> scrapItTemList(String userId) {

		return new ArrayList<ScrapItTemList>(sqlSession.selectList("myPage.scrapItTemList", userId));
	}

	public ArrayList<Follow> followerList(String userId) {
		
		return new ArrayList<Follow>(sqlSession.selectList("myPage.followerList", userId));
	}

	public ArrayList<Follow> followingList(String userId) {

		return new ArrayList<Follow>(sqlSession.selectList("myPage.followingList", userId));
	}

	public int unFollow(HashMap<String, Object> map) {
		
		return (sqlSession.delete("myPage.unFollow", map));
	}

	public int follow(HashMap<String, Object> map) {

		return (sqlSession.insert("myPage.follow", map));
	}


	public ArrayList<Notice> commentsPageDataList(int currentPage, int recordCountPerPage, String userId) {
		
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("userId", userId);
		
		return new ArrayList<Notice> (sqlSession.selectList("myPage.commentsCoordiList",map));
	}

	public String getPageNavi(int naviCountPerPage, int recordCountPerPage, int currentPage, String userId) {
		int recordTotalCount = totalCount(userId);//전체 글 갯수
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
			sb.append("<li><a href='/myPage/commentsCoordi.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li> ");
		}
		
		for(int i = startNavi; i<=endNavi; i++)
		{
			if(i==currentPage)
			{
				sb.append("<li><a href='/myPage/commentsCoordi.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}
			else
			{
			sb.append("<li><a href='/myPage/commentsCoordi.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		if(endNavi!=pageTotalCount)
		{
			sb.append("<li><a href='/myPage/commentsCoordi.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		
		return sb.toString();
	}


	private int totalCount(String userId) {
		return sqlSession.selectOne("myPage.totalCount", userId);
		
	}

	public ArrayList<Notice> itTemPageDataList(int currentPage, int recordCountPerPage, String userId) {
		
		int start = currentPage * recordCountPerPage - (recordCountPerPage-1);
		int end = currentPage * recordCountPerPage;
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("userId", userId);
		
		return new ArrayList<Notice> (sqlSession.selectList("myPage.itTemPageDataList",map));
	}
	
	public String getItTemPageNavi(int naviCountPerPage, int recordCountPerPage, int currentPage, String userId) {
		int recordTotalCount = totalCountItTem(userId);//전체 글 갯수
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
			sb.append("<li><a href='/myPage/commentsItTem.do?currentPage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li> ");
		}
		
		for(int i = startNavi; i<=endNavi; i++)
		{
			if(i==currentPage)
			{
				sb.append("<li><a href='/myPage/commentsItTem.do?currentPage="+i+"' class='page_active'>"+i+"</a></li>");
			}
			else
			{
			sb.append("<li><a href='/myPage/commentsItTem.do?currentPage="+i+"'>"+i+"</a></li>");
			}
		}
		
		if(endNavi!=pageTotalCount)
		{
			sb.append("<li><a href='/myPage/commentsItTem.do?currentPage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");
		}
		
		
		return sb.toString();
	}


	private int totalCountItTem(String userId) {
		return sqlSession.selectOne("myPage.totalCountItTem", userId);
		
	}

	public int deleteItTemComment(int cmtNo) {

		return sqlSession.update("myPage.deleteItTemComment", cmtNo);
	}

	public int deleteCoordiComment(int cmtNo) {
		
		return sqlSession.update("myPage.deleteCoordiComment", cmtNo);
	}


	public String memberNickname(String memberUserId) {
		
		return sqlSession.selectOne("myPage.memberNickname", memberUserId);
	}

	public String memberEndYN(String memberUserId) {
		
		return sqlSession.selectOne("myPage.memberEndYN", memberUserId);
	}

	public int memberFollowYN(HashMap<String, Object> map) {
		
		return sqlSession.selectOne("myPage.memberFollowYN", map)!=null?1:0;
	}

}
