package kr.or.iei.coordi.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.or.iei.HomeController;
import kr.or.iei.coordi.model.service.CoordiService;
import kr.or.iei.coordi.model.vo.Coordi;
import kr.or.iei.member.model.vo.Member;

@Controller
public class CoordiController {
	
	@Autowired
	private CoordiService coService;
	
	@RequestMapping(value="/rest/setSession.do",method = RequestMethod.POST)
	public void test(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String longitude=request.getParameter("longitude");
		String latitude=request.getParameter("latitude");	
		/*
		 * HttpSession session=request.getSession(); session.setAttribute("longitude",
		 * longitude); session.setAttribute("latitude", latitude);
		 */
		
		String addr = coordToAddr(longitude, latitude);
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(addr);
		
		
		return ;
	}
	
	
	
	   /**
  * 경위도 정보로 주소를 불러오는 메소드
  * @throws UnsupportedEncodingException 
  */
  public String coordToAddr(String longitude, String latitude){
    String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+longitude+"&y="+latitude;
    String addr = "";
    try{
      addr = getRegionAddress(getJSONData(url));
      //LOGGER.info(addr);
    }catch(Exception e){
      System.out.println("주소 api 요청 에러");
      e.printStackTrace();
    }
      return addr;
  }

/**
  * REST API로 통신하여 받은 JSON형태의 데이터를 String으로 받아오는 메소드
  */
	private String getJSONData(String apiUrl) throws Exception {
	HttpURLConnection conn = null;
	StringBuffer response = new StringBuffer();
	 
	//인증키 - KakaoAK하고 한 칸 띄워주셔야해요!
	String auth = "KakaoAK " + "6049a9bd67aed72a071284407a545777";

	//URL 설정
    URL url = new URL(apiUrl);
     
    conn = (HttpURLConnection) url.openConnection();
    
    //Request 형식 설정
    conn.setRequestMethod("GET");
    conn.setRequestProperty("X-Requested-With", "curl");
    conn.setRequestProperty("Authorization", auth);

    //request에 JSON data 준비
    conn.setDoOutput(true);
     
    //보내고 결과값 받기
    int responseCode = conn.getResponseCode();
    if (responseCode == 400) {
        System.out.println("400:: 해당 명령을 실행할 수 없음");
    } else if (responseCode == 401) {
        System.out.println("401:: Authorization가 잘못됨");
    } else if (responseCode == 500) {
        System.out.println("500:: 서버 에러, 문의 필요");
    } else { // 성공 후 응답 JSON 데이터받기
    	 
    	 Charset charset = Charset.forName("UTF-8");
         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));
         
         String inputLine;
         while ((inputLine = br.readLine()) != null) {
         	response.append(inputLine); 
         } 
     }
     
     return response.toString();
}

	 /**
	  * JSON형태의 String 데이터에서 주소값(address_name)만 받아오기
	  * @throws JSONException 
	  */
		private String getRegionAddress(String jsonString) {
	    String value = "";
	    String value1 = "";
	    String value2 = "";
	    
	    JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
	    JSONObject meta = (JSONObject) jObj.get("meta");
	    long size = (Long) meta.get("total_count");
	    
	    if(size>0){
	        JSONArray jArray = (JSONArray) jObj.get("documents");
	        JSONObject subJobj = (JSONObject) jArray.get(0);
	        JSONObject roadAddress =  (JSONObject) subJobj.get("road_address");
	        
	        if(roadAddress == null){
	            JSONObject subsubJobj = (JSONObject) subJobj.get("address");
	            value1 = (String) subsubJobj.get("region_1depth_name");
	            value2 = (String) subsubJobj.get("region_2depth_name");
	        }else{
	        	value1 = (String) roadAddress.get("region_1depth_name");
	        	value2 = (String) roadAddress.get("region_2depth_name");
	        }
				/*
				 * if(value.equals("") || value==null){ subJobj = (JSONObject) jArray.get(1);
				 * subJobj = (JSONObject) subJobj.get("address"); value1 =(String)
				 * subJobj.get("region_1depth_name"); value2 =(String)
				 * subJobj.get("region_2depth_name"); }
				 */
	        value=value1+" "+value2;
	    }
	    return value;
	}
	
	@RequestMapping(value="/coordi/coordiList.do",method=RequestMethod.GET)
	public ModelAndView coordiList(ModelAndView mav,HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("member");
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, String> pMap =new HashMap<String, String>();
		ArrayList<Coordi> coordiList=coService.getCoordiList(pMap);
		
		//팔로우리스트와 좋아요 리스트 가져오기(로그인 한경우)
		if(m!=null) {
			String userId=m.getUserId();
			ArrayList<Integer> likeList=coService.selectLikeList(userId);
			ArrayList<Integer> scrapList=coService.selectScrapList(userId);
			map.put("likeList", likeList);
			map.put("scrapList", scrapList);
		}

		map.put("coordiList", coordiList);
		mav.addObject("map", map);
		mav.setViewName("coordi/coordiList");
		return mav;
	}
	
	@RequestMapping(value="/coordi/categoryCoordiList.do",method=RequestMethod.GET)
	public String seasonList(HttpServletRequest request,HttpServletResponse response,Model model){
		String seasons=request.getParameter("season");
		String genders=request.getParameter("gender");
		String temp=request.getParameter("temp");
		String items=request.getParameter("item");
		String filter=request.getParameter("filter");
		String keyword=request.getParameter("keyword");
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("member");
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(m!=null) {
			String userId=m.getUserId();
			ArrayList<Integer> likeList=coService.selectLikeList(userId);
			ArrayList<Integer> scrapList=coService.selectScrapList(userId);
			model.addAttribute("likeList",likeList);
			model.addAttribute("scrapList",scrapList);
		}
		
		if(seasons!=""&&seasons!=null) {
			String [] seasonArray=seasons.split("/");
			map.put("season", seasonArray);
		}
		if(genders!=""&&genders!=null) {
			String [] genderArray=genders.split("/");
			map.put("gender", genderArray);
		}
		if(items!=""&&items!=null) {
			String [] itemArray=items.split("/");
			map.put("item", itemArray);
		}
		if(temp!=null&&temp!="") {
			map.put("temp", temp);
		}
		if(keyword!=null&&keyword!="") {
			map.put("keyword",keyword);
		}
		map.put("filter", filter);
		ArrayList<Coordi> list =coService.selectCategoryCoordiList(map);
		model.addAttribute("filter",filter);
		model.addAttribute("list", list);
		return "coordi/categoryList";
		
		
 	}
	
	@RequestMapping(value="/coordi/unlikeCoordi.do",method = RequestMethod.GET)
	public String unlikeCoordi(@RequestParam int coordiNo,@SessionAttribute Member member) {
		
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coordiNo", coordiNo);
		map.put("userId", userId);
		
		int result=coService.deleteLikeCoordi(map);
		return "coordi/coordiList";
	}
	
	@RequestMapping(value="/coordi/likeCoordi.do",method=RequestMethod.GET)
	public String likeCoordi(@RequestParam int coordiNo,@SessionAttribute Member member) {
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coordiNo", coordiNo);
		map.put("userId", userId);
		
		int result=coService.insertLikeCoordi(map);
		
		return "coordi/coordiList";
	}
	
	@RequestMapping(value="/coordi/unscrapCoordi.do",method = RequestMethod.GET)
	public String unscrapCoordi(@RequestParam int coordiNo,@SessionAttribute Member member) {
		
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coordiNo", coordiNo);
		map.put("userId", userId);
		
		int result=coService.deletescrapCoordi(map);
		return "coordi/coordiList";
	}
	
	@RequestMapping(value="/coordi/scrapCoordi.do",method=RequestMethod.GET)
	public String scrapCoordi(@RequestParam int coordiNo,@SessionAttribute Member member) {
		String userId= member.getUserId();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coordiNo", coordiNo);
		map.put("userId", userId);
		
		int result=coService.insertScrapCoordi(map);
		
		return "coordi/coordiList";
	}
	
	@RequestMapping(value="/coordi/topCoordiList",method = RequestMethod.GET)
	public String topCoordiList(@RequestParam String userId,Model model) {
		ArrayList<Coordi> list= coService.selectTopCoordiList(userId);
		model.addAttribute("list", list);
		return "coordi/topCoordiListAjax";
	}
}
