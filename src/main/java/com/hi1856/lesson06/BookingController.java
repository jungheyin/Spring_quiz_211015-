package com.hi1856.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hi1856.lesson06.bo.BookingBO;
import com.hi1856.lesson06.model.Booking;

@Controller
public class BookingController {
	
	@Autowired
	public BookingBO bookingBO;
	@RequestMapping("/lesson06/booking_view")
	public String bookingView(Model model) {
		
		List<Booking> bookingList = bookingBO.bookingList();
		model.addAttribute("bookingList", bookingList);
		return"/lesson06/booking_list";
	}

	
}
