package kr.or.iei.postCoordi.model.service;

import kr.or.iei.postCoordi.model.vo.PostCoordi;

public class PostCoordiServiceImpl {


	public static PostCoordi insertPost(PostCoordi postCoordi) throws Exception {
 
		PostCoordi boardDto = new PostCoordi();
 
        int insertCnt = PostCoordiDAO.insertPost(boardForm);
 
        if (insertCnt > 0) {
            boardDto.setResult("SUCCESS");
        } else {
            boardDto.setResult("FAIL");
        }
 
        return boardDto;
    }

}
