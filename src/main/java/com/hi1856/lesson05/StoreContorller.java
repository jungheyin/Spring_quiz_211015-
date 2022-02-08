package com.hi1856.lesson05;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreContorller {

	@RequestMapping("/store_view")
	public String store() {

		return "lesson05/store/store";
	}
}
