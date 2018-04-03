package com.xinyue.crud.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.crud.bean.Msg;
import com.xinyue.crud.bean.User;
import com.xinyue.crud.service.wetherData;
import com.xinyue.crud.util.HttpUtils;

@Controller
public class weatherController {
	
	@Autowired
	wetherData wetherData;
	
	@ResponseBody
	@RequestMapping("/getuser")
	public Msg getuser(@RequestParam("city")String city){	
		System.out.println(city);
	    return Msg.success().add("data", wetherData.data(city));    
	}
}
