package com.hi1856.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi1856.lesson04.dao.SellerDAO;
import com.hi1856.lesson04.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	public SellerDAO sellerDAO;
	
	public void addSeller(String nickname, String profileImageUrl, double temperature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	// 하나의 객체를 가져오는것은 컬럼이 들어오는 클레스를 만들어주는것이 좋다.
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	public Seller getSellerById(int id) { // 반드시 id가 넘어와야하는 메소드이다!! int이므로 null 허용 안됨
		return sellerDAO.selectSellerById(id);
	}
 }
