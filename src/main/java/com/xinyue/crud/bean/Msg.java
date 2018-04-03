	package com.xinyue.crud.bean;
/*
 * 通用的返回类
 * 
 * */

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//状�?�码 100-成功 200-失败
	private int code;
	//提示信息
	private String msg;
	
	//用户要返回给游览器的数据
	private Map<String, Object>  extend = new HashMap<String,Object>();
	
	public static Msg success(){
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("����ɹ���");
		return result;
	}
	public static Msg fail(){
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("����ʧ�ܣ�");
		return result;
	}
	
	public Msg add(String key,Object value){
		this.getExtend().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	
}
