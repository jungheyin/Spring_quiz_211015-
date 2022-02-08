package com.hi1856.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi1856.lesson06.bo.FavoriteBO;

@Controller
public class Lesson06Quiz01Controller {
	
	@Autowired
	public FavoriteBO favoriteBO;

	@RequestMapping("/lesson06/addFavorite_view")
	public String quiz01() {
		return "lesson06/favorite/favorite";
	}
	
	@PostMapping("/lesson06/aferFavorite")
	public String aferfavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert 
		favoriteBO.addFavorite(name, url);
		
		return "lesson06/favorite/afterFavorite";
		
		
	}
}
