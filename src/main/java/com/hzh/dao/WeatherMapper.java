package com.hzh.dao;

import com.hzh.pojo.WeatherInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

public interface WeatherMapper {

   public List<WeatherInfo> getweather(@Param("search")String search);//查找数据

   public int insertWeather(WeatherInfo weatherInfo);//插入数据


}
