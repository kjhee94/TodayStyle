package kr.or.iei.coordi.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoordiController {
	
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
	public String coordiList() {
		return "coordi/coordiList";
	}
	
	
}
