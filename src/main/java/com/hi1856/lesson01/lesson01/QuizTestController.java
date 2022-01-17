package com.hi1856.lesson01.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuizTestController {

	@RequestMapping("/lesson01/quiz03/test")
	public String view() {
		
		return "lesson01/test";
	}
}
