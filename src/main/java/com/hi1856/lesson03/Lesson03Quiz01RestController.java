package com.hi1856.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hi1856.lesson03.bo.RealEstateBO;
import com.hi1856.lesson03.model.RealEstate;
@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03Quiz01RestController {
		
	@Autowired
	public RealEstateBO realEstateBO;
	
	// http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/1")
	public RealEstate quiz01_1( // Request로 받아온 파라미터
			@RequestParam(value = "id") int idParam // 필수 파라미터
			) {
		return realEstateBO.getRealEstateById(idParam); // jackson 라이브러리로 인해 json으로 변환
	}
	
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(
			@RequestParam(value = "rent_price") int rentPriceParam
			) {
		return realEstateBO.getRealEstateListByRentPrice(rentPriceParam);
	} 
	
	// http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3(
			@RequestParam(value = "area", required=true) int area , 
			@RequestParam(value = "price") int price
			) {
		return realEstateBO.getRealEstateListByAreaAndPrie(area, price);
	}
	
	// 디버깅의 결과를 보내는곳에 포인트지점으로 찍어준다.
	
	
}
