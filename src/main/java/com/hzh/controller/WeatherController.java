package com.hzh.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hzh.pojo.WeatherInfo;
import com.hzh.service.WeatherInfoService;
import com.hzh.utils.GetWeatherUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 123 on 2021/1/8.
 */
@Controller
@RequestMapping("/weather")
public class WeatherController{

    @Autowired
    WeatherInfoService weatherInfoService;


    @RequestMapping("/weather")
    public String handleRequest(Model model,String city) throws Exception {
        //获取今日日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(new Date());
        //获取前台传过来的城市
//        String city = request.getParameter("city");

        if(StringUtils.isEmpty(city)){
            city = "北京";    //默认北京
        }

        //先去数据库中查询是否存在数据
        String search = city+"_"+date;
        List<WeatherInfo> list = weatherInfoService.getweather(search);//查找天气情况
        if(list==null || list.size()==0){
            //如果不存在数据则取采集数据
            String weatherJson = GetWeatherUtils.getWeather(city);

            System.out.println("数据库中不存在,采集数据结果："+weatherJson);

            JSONObject jsonObject = JSONObject.parseObject(weatherJson);
            JSONArray jsonArray = jsonObject.getJSONObject("data").getJSONArray("forecast");

            int index = 1;
            for (Object o : jsonArray) {
                JSONObject result = (JSONObject) o;
                WeatherInfo entity = new WeatherInfo();
                entity.setSearch(search);
                entity.setDate(result.getString("date"));
                entity.setIndex(index);
                entity.setMaxtep(result.getString("high"));
                entity.setMintep(result.getString("low"));
                entity.setWeather(result.getString("type"));

                weatherInfoService.InsertWeather(entity);

                list.add(entity);
                index++;
            }
        }

        model.addAttribute("weatherInfo",list );
        model.addAttribute("city",city);
        return "index";
    }
}

