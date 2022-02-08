package com.hi1856.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hi1856.lesson05.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {
	
	public List<WeatherHistory> selectWeatherHistoryList();
	
	public void selectWeatherHistory(
			@Param("date")String date, 
			@Param("weather")String weather,
			@Param("microDust")String microDust,
			@Param("temperatures")double temperatures,
			@Param("precipitation")double precipitation,
			@Param("windSpeed")double windSpeed);
}
