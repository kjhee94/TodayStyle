package kr.or.iei;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.iei.coordi.model.service.CoordiService;
import kr.or.iei.coordi.model.vo.Coordi;
import kr.or.iei.itItem.model.service.ItItemService;
import kr.or.iei.itItem.model.vo.ItItem;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CoordiService coService;
	
	@Autowired
	private ItItemService itService;
	
	@Autowired
	private MemberService mService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mav) {
		String season=getSeason();
		HashMap<String, String> pMap=new HashMap<String, String>();
		pMap.put("season", season);
		ArrayList<Coordi> coordiList=coService.getCoordiList(pMap);
		ArrayList<ItItem> itItemList=itService.getItItemList();
		ArrayList<Member> topFollowList=mService.selectTopFollowList();
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("coordiList", coordiList);
		map.put("itItemList", itItemList);
		map.put("topFollowList",topFollowList);
		mav.addObject("map", map);
		mav.setViewName("index");
		return mav;
	}
	
	public String getSeason() {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		String todayStr = sdf.format(today);
		String season="";
		if(todayStr.equals("01")||todayStr.equals("02")||todayStr.equals("12")) {
			season="겨울";
		}else if(todayStr.equals("03")||todayStr.equals("04")||todayStr.equals("05")){
			season="봄";
		}else if(todayStr.equals("06")||todayStr.equals("07")||todayStr.equals("08")) {
			season="여름";
		}else {
			season="가을";
		}
		
		return season;
	}
	
}
