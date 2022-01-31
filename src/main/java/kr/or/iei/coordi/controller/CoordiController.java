package kr.or.iei.coordi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoordiController {
	
	@RequestMapping(value="/coordi/coordiList.do",method=RequestMethod.GET)
	public String coordiList() {
		return "coordi/coordiList";
	}
}
