package com.hi1856.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.hi1856.lesson04.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public void insertRealorBO(Realtor realtor);
	
	public Realtor selectRealtorById(int id);
}
