package com.hi1856.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi1856.lesson03.dao.RealEstateDAO;
import com.hi1856.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	public RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstateById(int id) {
		return realEstateDAO.selectRealEstateById(id); 
	}
	
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) { // 여기서 rentPrice값이 필수값이므로 DB와 상관없이 int값으로 넣어준다.
		return realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateListByAreaAndPrie(int area, int price) {
		return realEstateDAO.selectRealEstateListByAreaAndPrie(area, price);
	}
	
	public RealEstate addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
}
