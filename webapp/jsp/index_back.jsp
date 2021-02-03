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
            <input type="text" class="input_txt" placeholder="请输入查询的天气" v-model="city" @keyup.enter="queryWeather" />
            <button class="input_sub" @click="queryWeather">
                搜 索
            </button>
        </div>
        <div class="hotkey">
            <!-- <a href="javascript:;" @click="clickSearch('北京')">北京</a>
              <a href="javascript:;" @click="clickSearch('上海')">上海</a>
              <a href="javascript:;" @click="clickSearch('广州')">广州</a>
              <a href="javascript:;" @click="clickSearch('深圳')">深圳</a> -->
            <a href="javascript:;" v-for="city in hotCitys" @click="clickSearch(city)">{{ city }}</a>
        </div>
    </div>
    <ul class="weather_list">
        <%--        <li v-for="(item,index) in forecastList" :key="item.date" :style="{transitionDelay:index*100+'ms'}">--%>
        <%--            <div class="info_type">--%>
        <%--                <span class="iconfont">{{ item.type }}</span>--%>
        <%--            </div>--%>
        <%--            <div class="info_temp">--%>
        <%--                <b>{{ item.low}}</b>--%>
        <%--                ~--%>
        <%--                <b>{{ item.high}}</b>--%>

        <%--            </div>--%>
        <%--            <div class="info_date">--%>
        <%--                <span>{{ item.date }}</span>--%>
        <%--            </div>--%>
        <%--        </li>--%>

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
<!-- 官网提供的 axios 在线地址 -->
<%--<script src="https://unpkg.com/axios/dist/axios.min.js"></script>--%>
<script>
    new Vue({
        el: "#app",
        data: {
            city: "武汉",
            forecastList: [],
            hotCitys: ["北京", "上海", "广州", "深圳"]
        },
        methods: {
            queryWeather() {
                this.forecastList = [];
                window.location='http://localhost:8080/WeatherTest/WeatherInfoController/weather';
                <%--axios--%>
                <%--    .get(`http://wthrcdn.etouch.cn/weather_mini?city=${this.city}`)--%>
                <%--    .then(res => {--%>
                <%--        console.log(res);--%>
                <%--        this.forecastList = res.data.data.forecast;--%>
                <%--    })--%>
                <%--    .catch(err => {--%>
                <%--        console.log(err);--%>
                <%--    })--%>
                <%--    .finally(() => { });--%>
            },
            clickSearch(city) {
                this.city = city;
                this.queryWeather();
            }
        }
    });
</script>
</body>

</html>
