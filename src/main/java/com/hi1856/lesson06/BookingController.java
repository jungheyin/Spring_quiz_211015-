package com.hi1856.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hi1856.lesson06.bo.BookingBO;
import com.hi1856.lesson06.model.Booking;

@Controller
public class BookingController {
	
	@Autowired
	public BookingBO bookingBO;
	@RequestMapping("/booking_list_view")
	public String bookingView(Model model) { // 화면일때만 Model 객체로 가져온다. 
											// ajax에서 data는 Model로 가져오는것 아님!!
		
		List<Booking> bookingList = bookingBO.getBookingList(); // 여기서 잘 가져와졌는지 디버깅 걸어보는것도 좋다.
		model.addAttribute("bookingList", bookingList);
		return"/lesson06/booking_list";
	}
	
	// 예약 삭제 - ajax 호출
	@ResponseBody
	@DeleteMapping("/booking_delete")
	public Map<String, String> deleteBooking(
			@RequestParam("id") int id) {
		
		// delete query
		int count = bookingBO.deleteBookingById(id); // count가 1보다 작으면 실패이다.
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		if (count < 1) {
			result.put("result", "fail");
		}
		
		return result;
	}
	// 예약하기 추가- ajax 
	@PostMapping("/booking_add_booking")
	@ResponseBody
	public Map<String, String> addBooking (
			@RequestParam("name") String name,
			@RequestParam("date") String date, // date 이지만 string으로 받아도 된다. select일때는 date타입으로 받고 insert할때는 String으로 한다.
			@RequestParam("day") int day,
			@RequestParam("headcont") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		// state: 대기중 : 암묵적으로 대기중으로 통해 BO,DAO에서 신경 안쓰게 한다.
		// 이것은 mapper에서 하는것이 더 좋다.
		
		
		//db insert
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		// result map => json
		Map<String, String> result = new HashMap<>();
		result.put("result", "success"); // 공공API의 대해 알아보는것도 좋다.
		result.put("code", "1"); // 공공API의 대해 알아보는것도 좋다.
		
		if (count < 1) {
			result.put("result", "fail");
			result.put("code", "500");
			
		}
		return result;
	}
	
	// 3. 예약조회
	 @RequestMapping("/booking_look_up")
	 public String lookup() {
		 return "booking_main";
	 }
	// 예약 조회 - ajax
	 // 데이터를 뿌려져야 하므로 API를
	@ResponseBody
	@PostMapping("/booking_look_up_booking")
	public Map<String, Object> lookUpBooking( // 디버깅 걸수 있는 포인트
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		// db insert by name, phoneNumber
		// 한사람이 여러번 예약할 수도 있어서 여러행이 나올수 있기 때문에 list로 가져오는것이 더 좋다.
		// 여기에서는 겹치는게 없는 가정하에 가져오는것으로 한다.
		Booking booking = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		// 결과 map => json
		Map<String, Object> result = new HashMap<>(); // json을 만들기 위한 map이다!
		// api 는 제이슨으로 알아서 서버와의 약속하는것!!
		
		if (booking != null) {
			// 성공시
			// {"result": "success",
			// "code::"1",
			// "booking": {"name":"신보람", "phoneNumber":"010-2222-2222"}}
			result.put("result", "success");
			result.put("code", 1);
			result.put("booking", booking);
		} else {
		// 실패시, 업으면
		// {"result":"fail:, "code":500}
			result.put("result", "faul");
			result.put("code", 500);
		}
		return result;
	}
}
