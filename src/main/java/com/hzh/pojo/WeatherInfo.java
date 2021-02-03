package com.hzh.pojo;

import java.util.Date;

public class WeatherInfo {
    private int id;
    private String search;
    private int index;
    private String date;//日期
    private String weather;//天气
    private String mintep;//最低温度
    private String maxtep;//最高温度

    public WeatherInfo(){}

    public WeatherInfo(int id, String search, int index, String date, String weather, String mintep, String maxtep) {
        this.id = id;
        this.search = search;
        this.index = index;
        this.date = date;
        this.weather = weather;
        this.mintep = mintep;
        this.maxtep = maxtep;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getWeather() {
        return weather;
    }

    public void setWeather(String weather) {
        this.weather = weather;
    }

    public String getMintep() {
        return mintep;
    }

    public void setMintep(String mintep) {
        this.mintep = mintep;
    }

    public String getMaxtep() {
        return maxtep;
    }

    public void setMaxtep(String maxtep) {
        this.maxtep = maxtep;
    }
}
