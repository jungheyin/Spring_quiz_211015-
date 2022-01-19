package com.hi1856.lesson03;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Lesson03Quiz01RestController {
	
	@RequestMapping("/lesson03/quiz01")
	public RealEstate quiz01(
			@RequestParam("id") int id
			) {
		return 
	}
}
