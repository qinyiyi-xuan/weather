package com.hzh.utils;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.zip.GZIPInputStream;

/**
 * Created by 123 on 2021/1/8.
 */
public class GetWeatherUtils {

    public static void main(String[] args) {
//        String city = "北京";
//        String weather = getWeather(city);
//        System.out.println(weather);

//        String s = new String("北京".getBytes(), Charset.forName("GB2312"));
//        System.out.println("北京:"+s);
//
//        String b = new String(s.toCharArray("gb2312"),"utf-8");
//        System.out.println("北京:"+b);
//
//        String a = convertEncodingFormat(s, "GB2312", "utf-8");
//        System.out.println("北京:"+a);
    }

    /**
     * 将一段错误解码的字符串重新解码
     */
    public static String convertEncodingFormat(String str, String formatFrom, String FormatTo) {
        String result = null;
        if (!(str == null || str.length() == 0)) {
            try {
                result = new String(str.getBytes(formatFrom), FormatTo);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static String getWeather(String city) {
        String jsonString = null;
        try {
            String link = "http://wthrcdn.etouch.cn/weather_mini?city="+ city;
            URL url = new URL(link);

            URLConnection urlConnection = url.openConnection();
            urlConnection.connect();
            InputStream is = urlConnection.getInputStream();
            BufferedInputStream bis = new BufferedInputStream(is);
            bis.mark(2);
            // 取前两个字节
            byte[] header = new byte[2];
            int result = bis.read(header);
            // reset输入流到开始位置
            bis.reset();
            // 判断是否是GZIP格式
            int headerData = getShort(header);
            if (result != -1 && headerData == 0x1f8b) {
                is = new GZIPInputStream(bis);
            } else {
                is = bis;
            }
            InputStreamReader reader = new InputStreamReader(is, "utf-8");
            char[] data = new char[100];
            int readSize;
            StringBuffer sb = new StringBuffer();
            while ((readSize = reader.read(data)) > 0) {
                sb.append(data, 0, readSize);
            }
            jsonString = sb.toString();
            bis.close();
            reader.close();

//            System.out.println(jsonString);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonString;
    }

    private static int getShort(byte[] data) {
        return (int) ((data[0] << 8) | data[1] & 0xFF);
    }
}
