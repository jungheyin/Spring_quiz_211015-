package com.hi1856.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hi1856.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	public RealEstate selectRealEstateById(@Param("id") int id); //@Param("id") 하나일땐 없어도 된다.
	
	public List<RealEstate> selectRealEstateListByRentPrice(@Param("rentPrice") int rentPrice); 
	// DB구문과 가깝기 때문에 select구문으로 해준다.
	// rentPrice를 반드시 받아야하므로 int형
	
	public List<RealEstate> selectRealEstateListByAreaAndPrie(
		// @Param 어노테이션은 파라미터들을 하나의 맵으로 만든다.
		// 예전에 하나의 Map으로 만드는 작업을 @Param으로 바뀌게 된것!!
			@Param("area") int area,
			@Param("price") int price);
	
	public RealEstate insertRealEstate(RealEstate realestate);
	
}
