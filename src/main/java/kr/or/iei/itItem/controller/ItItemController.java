package kr.or.iei.itItem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ItItemController {
	
	@RequestMapping(value="/itItem/itItemList.do",method = RequestMethod.GET)
	public String itItemList() {
		
		return "itItem/itItemList";
	}
}
