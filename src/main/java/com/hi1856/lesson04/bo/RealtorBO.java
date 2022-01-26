package com.hi1856.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi1856.lesson04.dao.RealtorDAO;
import com.hi1856.lesson04.model.Realtor;

@Service
public class RealtorBO {
	
	@Autowired
	public RealtorDAO realtorDAO;
	
	public void addRealorBO(Realtor realtor) {
		realtorDAO.insertRealorBO(realtor);
	}
	
	public Realtor getRealtorById(int id) {
		return realtorDAO.selectRealtorById(id);
	}
}
