package com.hi1856.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi1856.lesson06.dao.FavoriteDAO;
import com.hi1856.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	public FavoriteDAO favoriteDAO; 

	public void addFavorite(String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavoriteList() {
	 return favoriteDAO.selectFavoriteList();
	}
	
	public Favorite getFavoriteByUrl(String url) {
	 return favoriteDAO.selectFavoriteByUrl(url);
	}
	
	// 삭제 성공 여부 이용할것이다.
	public  int deleteFavoriteById(int id) {
		return favoriteDAO.deleteFavoriteById(id);
		
	}
}