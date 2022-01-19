package com.hi1856.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hi1856.lesson02.bo.StoreBO;
import com.hi1856.lesson02.model.Store;

@RestController
public class Lesson02Quiz01RestController {
	
	@Autowired
	private StoreBO storeBO; //ID: Dependency Injection : new를 하지 않아도 되게 해주는것
	
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01() {
		return storeBO.getStoreList(); 
	}
}
