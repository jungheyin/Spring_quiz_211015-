package com.hi1856.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hi1856.lesson06.bo.FavoriteBO;
import com.hi1856.lesson06.model.Favorite;

@Controller
public class FavoriteController {
	@Autowired
	public FavoriteBO favoriteBO;
	
	// 즐겨찾기 추가 화면
	@RequestMapping("/lesson06/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/add_favorite";
	}
	
	// 즐겨찾기 추가 기능 - AJAX 호출로 들어오는 요청
	// responseBody에서만 Model 을 사용할수 없음!!
	@ResponseBody
	@PostMapping("/lesson06/add_favorite")
	public Map<String, String> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert  : insert할때에는 model(DTO)가 필요없음!
		favoriteBO.addFavorite(name, url);
		
		//return map => return json String : API역활
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		result.put("code", "1");
		
		return result;
		// 여기 까지 하고 확인해는것이 좋음!! 
}
	// 즐겨찾기 목록 화면
	@RequestMapping("/lesson06/favorite_list_view")
	public String favoriteListView(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/favorite_list";
		}
		// 여기까지 하고 또 확인하기!!
	} 
