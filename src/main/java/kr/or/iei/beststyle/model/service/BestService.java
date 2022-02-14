package kr.or.iei.beststyle.model.service;

import java.util.ArrayList;

import kr.or.iei.beststyle.model.vo.Beststyle;

public interface BestService {

	ArrayList<Beststyle> AllBest();

	ArrayList<Integer> selectLikeList(String userId);

	ArrayList<Integer> selectScrapList(String userId);

	ArrayList<Beststyle> weekBest();

}
