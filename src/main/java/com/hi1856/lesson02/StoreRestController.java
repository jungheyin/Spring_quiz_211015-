package com.hi1856.lesson02;

import java.util.List;

import org.apache.catalina.Store;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StoreRestController {
	
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01() {
		
	}
}
