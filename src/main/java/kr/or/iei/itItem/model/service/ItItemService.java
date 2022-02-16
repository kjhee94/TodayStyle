package kr.or.iei.itItem.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.itItem.model.vo.ItItem;

public interface ItItemService {

	ArrayList<ItItem> getItItemList(HashMap<String, Object> map);

	ArrayList<Integer> selectLikeList(String userId);

	ArrayList<Integer> selectScrapList(String userId);

	int deleteLikeItItem(HashMap<String, Object> map);

	int insertLikeItItem(HashMap<String, Object> map);

	int deletescrapItItem(HashMap<String, Object> map);

	int insertScrapItItem(HashMap<String, Object> map);

	ArrayList<ItItem> selectCategoryItItemList(HashMap<String, Object> map);


	

}
