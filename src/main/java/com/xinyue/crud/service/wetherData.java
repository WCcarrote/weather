package com.xinyue.crud.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xinyue.crud.util.HttpUtils;

@Service
public class wetherData {
	public JSONObject data(String city){
		String host = "http://jisutqybmf.market.alicloudapi.com";
	    String path = "/weather/query";
	    String method = "GET";
	    String appcode = "0395eb1b493d46c49be943af338c2051";
	    Map<String, String> headers = new HashMap<String, String>();
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("city", city);
	    JSONObject jsStr = null;
	    try {
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
	    	System.out.println(response.getEntity());
	    	String S = EntityUtils.toString(response.getEntity());
	    	jsStr = JSONObject.parseObject(S);
	    	System.out.println(jsStr);
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    return jsStr;
	}
}
