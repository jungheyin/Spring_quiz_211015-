package com.hi1856.lesson06.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hi1856.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {

	public void insertFavorite( // 2개 이상일때는 @Param을 붙여서 map으로 만들어 줘야한다.
			@Param("name") String name,
			@Param("url") String url);
	
	public List<Favorite> selectFavoriteList();
	
	public Favorite selectFavoriteByUrl(String url);
	
	public Favorite deleteFavoriteById(int id);
}
