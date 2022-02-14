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



     public void insertInfo(PostCoordi post){
            sqlSession.insert("post.insertInfo",post);
         
        }



     public void insertCategory(PostCoordi post){
            sqlSession.insert("post.insertCategory",post);
        }






}

