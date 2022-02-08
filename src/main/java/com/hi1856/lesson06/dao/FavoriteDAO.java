package com.hi1856.lesson06.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteDAO {

	public void insertFavorite(String name, String url);
}
