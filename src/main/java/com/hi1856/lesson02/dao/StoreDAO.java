package com.hi1856.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hi1856.lesson02.model.Store;

@Repository
public interface StoreDAO {

	public List<Store> selectStoreList();
}
