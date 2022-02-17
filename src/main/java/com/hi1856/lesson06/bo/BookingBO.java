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

	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public int addBooking(String name, String date, int day,
			int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber) ;
		
	}
	
	public Booking getBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		// List를 가져와서 하나만 꺼내서 보내온다.
		List<Booking> bookingList = bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
		
		Booking booking = null; // 무엇으로 return을 해야하는지 알아야한다!!
		//하나만 꺼낸다. - 마지막 하나를 꺼낸다.
		// 만약에 비워져 있을경우 에러가 날수 있다!!
		// 없는지 null 인지 확인 해보는 것도 좋다.
		// null 일경우 메소드는 사용할 수 없다. 
		
		if(bookingList.isEmpty() == false) { // 데이터가 있을 때
			booking = bookingList.get(bookingList.size() - 1); // 0부터 가져오므로 1를 빼준다.
		}
	
		return booking; 
	}
	
	// BO에서 가공한다.
	// 
}
