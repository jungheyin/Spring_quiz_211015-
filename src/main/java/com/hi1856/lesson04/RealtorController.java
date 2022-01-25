package com.hi1856.lesson04;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealtorController {
	
	@GetMapping("/1")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor
			) {
				
		// db insert
				
		//db select
		return ;
	}
}
