<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>天气查</title>
    <link rel="stylesheet" href="<%=basePath%>css/reset.css" />
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
</head>

<body>
<div class="wrap" id="app">
    <div class="search_form">
        <div class="logo"><img src="<%=basePath%>img/logo.jpg" alt="logo" width="260px" /></div>
        <div class="form_group">
            <input id="search" type="text" class="input_txt" placeholder="请输入查询的天气" value="${city}" @keyup.enter="queryWeather" />
            <button class="input_sub" @click="queryWeather">
                搜 索
            </button>
        </div>
        <div class="hotkey">
            <!-- <a href="javascript:;" @click="clickSearch('北京')">北京</a>
              <a href="javascript:;" @click="clickSearch('上海')">上海</a>
              <a href="javascript:;" @click="clickSearch('广州')">广州</a>
              <a href="javascript:;" @click="clickSearch('深圳')">深圳</a> -->
            <a href="javascript:;" v-for="hotCity in hotCitys" @click="clickSearch(hotCity)">{{ hotCity }}</a>
        </div>
    </div>
    <ul class="weather_list">
        <c:forEach items="${weatherInfo}" var="weather">
            <li style="{transitionDelay:${weather.index}*100+'ms'}">
                <div class="info_type">
                    <span class="iconfont">${weather.weather}</span>
                </div>
                <div class="info_temp">
                    <b>${weather.mintep} </b>
                    ~
                    <b>${weather.maxtep}</b>
                </div>
                <div class="info_date">
                    <span>${weather.date}</span>
                </div>

            </li>
        </c:forEach>

    </ul>
</div>
<!-- 开发环境版本，包含了有帮助的命令行警告 -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<%--<script src="https://unpkg.com/axios/dist/axios.min.js"></script>--%>
<script>
    new Vue({
        el: "#app",
        data: {
            city: "",
//            forecastList: [],
            hotCitys: ["北京", "上海", "广州", "深圳"]
        },
        methods: {
            queryWeather() {
//                this.forecastList = [];
                this.city = document.getElementById("search").value;
                window.location='<%=basePath%>weather/weather?city='+this.city;
            },
            clickSearch(city) {
                document.getElementById("search").value = city;
                this.queryWeather();
            }
        }
    });
</script>
</body>

</html>
