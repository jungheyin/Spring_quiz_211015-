package com.hi1856.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hi1856.lesson04.model.Seller;

@Repository
public interface SellerDAO {
	
	public void insertSeller( // 하나의 Map으로 보내기 위해 @Pram을 보낸다.
			@Param("nickname") String nickname, 
			@Param("profileImageUrl") String profileImageUrl, 
			@Param("temperature") double temperature);
	
	public Seller selectLastSeller();
	
	public Seller selectSellerById(int id);
}
