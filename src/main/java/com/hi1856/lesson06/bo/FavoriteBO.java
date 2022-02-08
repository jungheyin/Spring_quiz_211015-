package com.hi1856.lesson06.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi1856.lesson06.dao.FavoriteDAO;

@Service
public class FavoriteBO {
	
	@Autowired
	public FavoriteDAO favoriteDAO; 

	public void addFavorite(String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}
}
