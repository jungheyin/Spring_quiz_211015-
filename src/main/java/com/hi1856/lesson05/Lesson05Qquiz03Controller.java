package com.hi1856.lesson05;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson05Qquiz03Controller {
		
	@RequestMapping("/lesson05/quiz03")
	public String quiz03(Model model) {
		// 1.
		List<Integer> candidates = new ArrayList<>();
		candidates.add(263001);
		candidates.add(173942); 
		candidates.add(563057); 
		
		// 2.
		List<Map<String, Object>> cardBills = new ArrayList<>();

		Map<String, Object> cardBill = new HashMap<>();
		cardBill.put("store", "GS48");
		cardBill.put("pay", 7800);
		cardBill.put("date", "2025-09-14");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "현태백화점");
		cardBill.put("pay", 2750000);
		cardBill.put("date", "2025-09-18");
		cardBill.put("installment", "3개월");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "요촌치킨");
		cardBill.put("pay", 180000);
		cardBill.put("date", "2025-09-20");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);
		
		
		// 1.
		// 무엇가 값을 구하는 것을 BO에서 하는것이 더 적절하다!!
		int totalCount = 0; // null이 들어갈 일이 없어 0으로 해줌
		for (Integer candidate : candidates) {
			totalCount += candidate;
		}
		
		model.addAttribute("candidates", candidates);
		model.addAttribute("totalCount", totalCount);
		//2.
		model.addAttribute("cardBill", cardBill);
		return "lesson05/quiz03";
	}
}
