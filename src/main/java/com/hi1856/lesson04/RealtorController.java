package com.hi1856.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi1856.lesson04.bo.RealtorBO;
import com.hi1856.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealtorController {
	
	@Autowired
	public RealtorBO realtorBO;
	
	// http://localhost/lesson04/quiz02/1
	@GetMapping("/1")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor, // Realtor이라는 클레스가 있어야한다.
			Model model) {
				
		// db insert => id 반환을 받고 
			realtorBO.addRealorBO(realtor);
			
		//db select => 반환 받은 id로 
			realtor =  realtorBO.getRealtorById(realtor.getId()); // realtor을 재활용 하거나 새로운 변수를 만들어서 사용하거나 상황에따라 사용하기
			
		//jsp에서 사용할 객체를 model에 담는다.
		model.addAttribute("realtor", realtor);
		
		// 추가된 공인중개사 jsp
		return "lesson04/afterAddRealtor";
	}
}
