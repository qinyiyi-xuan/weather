package com.hzh.service;

import com.hzh.dao.WeatherMapper;
import com.hzh.pojo.WeatherInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by 123 on 2021/1/9.
 */
public class WeatherInfoServiceImpl implements WeatherInfoService {

    private WeatherMapper weatherMapper;

    public void setWeatherMapper(WeatherMapper weatherMapper) {
        this.weatherMapper = weatherMapper;
    }

    @Override
    public List<WeatherInfo> getweather(String id) {
        return weatherMapper.getweather(id);
    }

    @Override
    public int InsertWeather(WeatherInfo weatherInfo) {
        return weatherMapper.insertWeather(weatherInfo);
    }
}
