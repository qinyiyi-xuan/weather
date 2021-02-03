package com.hzh.service;

import org.springframework.stereotype.Service;
import com.hzh.pojo.WeatherInfo;

import java.util.List;

@Service
public interface WeatherInfoService {

    public List<WeatherInfo> getweather(String id);

    public int InsertWeather(WeatherInfo weatherInfo);
}
