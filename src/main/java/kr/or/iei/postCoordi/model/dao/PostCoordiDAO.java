package kr.or.iei.postCoordi.model.dao;

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



     public int insertInfo(PostCoordi post){
            return sqlSession.insert("post.insertInfo",post);
        }

     public int insertPic(PostCoordi post){
            return sqlSession.insert("post.insertPic",post);
        }

     public int insertCategory(PostCoordi post){
            return sqlSession.insert("post.insertCategory",post);
        }




    public int viewPost(PostCoordi post) {

        return sqlSession.insert("post.viewPost",post);
    }

}