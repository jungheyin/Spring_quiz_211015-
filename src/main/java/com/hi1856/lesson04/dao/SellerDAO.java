package com.hi1856.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository

public interface SellerDAO {
	
	public void insertSeller(
			@Param("name") String name, 
			@Param("profileImageUrl")String profileImageUrl, 
			@Param("temperature")double temperature);
}
