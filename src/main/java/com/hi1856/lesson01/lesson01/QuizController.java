package com.hi1856.lesson01.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01") // 공통되는 Mapping은 클레스 윗쪽으로 빼서 사용할수도 있다.
@Controller
public class QuizController {
	
	// http://localhost:80/lesson01/quiz01/1
	@RequestMapping("/1") // 뒤에 달라지는 부분만 쓸수 있다.
	@ResponseBody
	public String quiz01_1() {
		return "<h1>테스트 프로젝트 완성</h1><h3>해당 프로젝트를 통해서 문제를 진행합니다.</h3>";
	}
	
	//http://localhost:80/lesson01/quiz01/2
	
	@RequestMapping("/2")
	@ResponseBody
	public Map<String, Integer> quiz01_2() {
		Map<String, Integer> result = new HashMap<>();
		result.put("국어", 80);
		result.put("수학", 90);
		result.put("영어", 85);
		
		return result;
	}
} 
