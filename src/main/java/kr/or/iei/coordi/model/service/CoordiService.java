package kr.or.iei.coordi.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.or.iei.coordi.model.vo.Coordi;

public interface CoordiService {

	ArrayList<Coordi> getCoordiList(HashMap<String, String> pMap);

	ArrayList<Coordi> selectCategoryCoordiList(HashMap<String, Object> map);

	ArrayList<Integer> selectLikeList(String userId);

	ArrayList<Integer> selectScrapList(String userId);

	int deleteLikeCoordi(HashMap<String, Object> map);

	int insertLikeCoordi(HashMap<String, Object> map);

	int deletescrapCoordi(HashMap<String, Object> map);

	int insertScrapCoordi(HashMap<String, Object> map);

	ArrayList<Coordi> selectTopCoordiList(String userId);


}
