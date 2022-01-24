package com.hi1856.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi1856.lesson04.dao.SellerDAO;

@Service
public class SellerBO {
	
	@Autowired
	public SellerDAO sellerDAO;
	public void addSeller(String name, String profileImageUrl, double temperature) {
		sellerDAO.insertSeller(name, profileImageUrl, temperature);
	}

}
