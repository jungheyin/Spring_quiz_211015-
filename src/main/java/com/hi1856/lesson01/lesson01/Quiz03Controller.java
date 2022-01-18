package com.hi1856.lesson01.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	// 뷰 이므로 @ResponseBody 없음!!
public class Quiz03Controller {

	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03_1() {
		
		return "lesson01/quiz03_1";	// jsp 뷰 경로
	}
}
