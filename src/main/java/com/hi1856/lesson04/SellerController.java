package com.hi1856.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi1856.lesson04.bo.SellerBO;
import com.hi1856.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class SellerController {
	
	@Autowired
	public SellerBO sellerBO;
	
	// 1. 판매자 푸가 view 화면
	// http://localhost/lesson04/quiz01/1
	@RequestMapping("/1")
	public String quiz01_1() {
		return "lesson04/addSeller"; // view의 경로에는 절대경로 이지만 설정을 해놨으므로 상대경로처럼 보이는것!!
	}
	// 1. [추가]를 눌렀을때 DB에 정보가 추가될때 
	// http://localhost/lesson04/quiz01/quiz01/add_seller
	@PostMapping("/add_seller")
	public String addSeller(
			// 쿼리 파라미터 => 필수값과 비필수값인지 확인하고 보내줘야한다.
			@RequestParam("nickname") String name,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl, // String 부터는 컬럼 이름과 같게해주는것이 좋다.
			@RequestParam("temperature") double temperature // 비필수 일때는 null 허용이므로  Double로해줘야한다. 필수 일때는 double 로 쓰기
			) {
		
		// DB 인서트
		sellerBO.addSeller(name, profileImageUrl, temperature);
		// view 결과값 => 응답값!!
		return "lesson04/afterAddSeller";
	}
	
	// 2. http://localhost/lesson04/quiz01/quiz01/seller_info
	@GetMapping("/seller_info")
	public String sllerInfo(
			@RequestParam(value="id", required=false) Integer id, 
			Model model) {
			
			if (id == null) {
				// 최근 sller 1행 정보 select 
				Seller seller = sellerBO.getLastSeller();
				model.addAttribute("seller", seller);
			} else {
				Seller seller = sellerBO.getSellerById(id);
				model.addAttribute("seller", seller);
			}
			
			
			{
		return"lesson04/sellerInfo";
	}
	
	// id가 잇으면 받고 id가 없으면 null로 잡는다.
}
}
