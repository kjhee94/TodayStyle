package kr.or.iei.postItItem.model.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import kr.or.iei.postItItem.model.vo.PostItItem;

public interface PostItItemService {

	HashMap<String, Object> oneItItemPost(int itItemNo);
}
