package com.hi1856.lesson05;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hi1856.lesson05.bo.WeatherHistoryBO;
import com.hi1856.lesson05.model.WeatherHistory;

@Controller
public class weatherHistoryController {
	
	// 날씨 정보 목록 화면
	// request(요청서) -> 서버(식당) -> request(음식)
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("weatherHistoryList", weatherHistoryList);
		
		return "weather_history/weather_history";
	}
	
	// 날씨 정보 입력 화면
	@RequestMapping("/add_weather_history_view")
	public String addWeahterHistoryView() {
		return "weather_history/add_weather_history";
	}
	
	// 날씨 입력 => 결과: 날씨 정보 목록 화면으로 리다이렉트
	@PostMapping("/add_weather_history") // 정보를 입력받아 보내주는 역활 
	public String addWeatherHistory(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("windSpeed") double windSpeed,
			HttpServletResponse response // servlet에서 사용한 이것을 사용할수있음
			
			) {
		// spring => date로 변경할수 없음
		// 1. string으로 받으면 되지만 db에서도 문제 없음(간단/ 별로안좋음)
		// 2. Model atributti로 받을 경우 @DateTimeFormat어노테이션을 사용하면 된다.
		//  -> model에서 date객체 위에 사용하면 된다. (내생각..)
		
		//DB INSERT
		weatherHistoryBO.addWeatherHistory(date, weather, microDust, temperatures, precipitation, windSpeed);
		// 날씨 정보 목록 화면으로 리다이렉트
		
//		return response.sendRedirect("/weather_history_view"); 나중에 예외처리 해야한다ㅏ..
		return "redirect:/weather_history_view"; // 간단하게 이렇게 할 수잇다.
		
		// @RequestParm() 입력해주고, 리다이렉트 입력하고 검증 한 후 insert 해주면 에러 났을 경우 insert에 문제인것을 알수 있음!!
	}
}
