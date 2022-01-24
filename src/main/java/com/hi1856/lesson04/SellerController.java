package com.hi1856.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi1856.lesson04.bo.SellerBO;

@RequestMapping("/lesson04/quiz01")
@Controller
public class SellerController {
	
	@Autowired
	public SellerBO sellerBO;
	@RequestMapping("/1")
	public String addSellerView() {
		return "/lesson04/addSeller";
	}

	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String name,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature
			) {
		
		sellerBO.addSeller(name, profileImageUrl, temperature);
		
		return "/lesson04/afterAddSeller";
	}
}
