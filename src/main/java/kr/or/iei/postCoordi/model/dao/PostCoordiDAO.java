package kr.or.iei.postCoordi.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.postCoordi.model.vo.PostCoordi;

@Repository
public class PostCoordiDAO {

    @Autowired
    @Qualifier(value="sqlSessionTemplate")
    private SqlSessionTemplate sqlSession;

	public HashMap<String, Object> oneCoordiPost(int coordiNo) {
		
		PostCoordi pc = sqlSession.selectOne("post.oneCoordiPost",coordiNo);
		ArrayList<PostCoordi> itemList = new ArrayList<PostCoordi>(sqlSession.selectList("post.itemList",coordiNo));
		ArrayList<PostCoordi> cmtList = new ArrayList<PostCoordi>(sqlSession.selectList("post.cmtList",coordiNo));
		Integer countLike = sqlSession.selectOne("post.countLike",coordiNo);
		if(countLike==null) {
			countLike=0;
		}
		Integer countScrap = sqlSession.selectOne("post.countScrap",coordiNo);
		if(countScrap==null) {
			countScrap=0;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pc",pc);
		map.put("itemList",itemList);
		map.put("cmtList",cmtList);
		map.put("countLike",countLike);
		map.put("countScrap",countScrap);
		
		return map;
	}

	public void insertCategory(PostCoordi post){
		sqlSession.insert("post.insertCategory",post);
	}

	public ArrayList<Integer> selectLikeList(String userId) {
		ArrayList<Integer> list =new ArrayList<Integer>(sqlSession.selectList("post.selectLikeList",userId));
		return list;
	}

	public ArrayList<Integer> selectScrapList(String userId) {
		ArrayList<Integer> list =new ArrayList<Integer>(sqlSession.selectList("post.selectScrapList",userId));
		return list;
	}

	public int insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("post.insertComment",map);
	}

	public int deleteComment(int cmtNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("post.deleteComment",cmtNo);
	}
	
	 public void insertInfo(PostCoordi post){
         sqlSession.insert("post.insertInfo",post);

     }

 public void insertPic(PostCoordi post) {
     sqlSession.insert("post.insertPic",post);

 }

 public void insertCategory(PostCoordi topPost,PostCoordi bottomPost,
         PostCoordi accPost, PostCoordi outerPost, PostCoordi shoesPost) {



     System.out.println(topPost +"/"+ topPost.getBrand().length() );
     System.out.println(bottomPost+"/"+ bottomPost.getBrand().length() );
     System.out.println(outerPost+"/"+ outerPost.getBrand().length() );
     System.out.println(accPost+"/"+ accPost.getBrand().length() );
     System.out.println(shoesPost+"/"+ shoesPost.getBrand().length() );

     if(topPost.getBrand().length()!=0)
     {
         sqlSession.insert("post.insertCategory",topPost);
     }


     if(bottomPost.getBrand().length()!=0)
     {
         sqlSession.insert("post.insertCategory",bottomPost);
     }


     if(accPost.getBrand().length()!=0)
     {
         sqlSession.insert("post.insertCategory",accPost);
     }


     if(outerPost.getBrand().length()!=0)
     {
         sqlSession.insert("post.insertCategory",outerPost);
     }


     if(shoesPost.getBrand().length()!=0)
     {
         sqlSession.insert("post.insertCategory",shoesPost);
     }





 }

public PostCoordi selectPost(PostCoordi post) {
	
	return sqlSession.selectOne("post.selectCoordi",post);
}






}