package com.hi1856.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hi1856.lesson06.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> bookingList();
}
