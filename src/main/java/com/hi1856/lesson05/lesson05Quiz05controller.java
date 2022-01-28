package com.hi1856.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class lesson05Quiz05controller {
	
	@RequestMapping("/lesson05/quiz05")
	public String quiz05_1() {
		
		return "lesson05/weatherhistory";
	}
}
