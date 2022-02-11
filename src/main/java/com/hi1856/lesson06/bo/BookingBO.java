package com.hi1856.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hi1856.lesson06.dao.BookingDAO;
import com.hi1856.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	public BookingDAO bookingDAO;

	public List<Booking> bookingList() {
		return bookingDAO.bookingList();
	}
}
