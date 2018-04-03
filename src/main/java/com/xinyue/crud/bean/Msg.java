	package com.xinyue.crud.bean;
/*
 * 閫氱敤鐨勮繑鍥炵被
 * 
 * */

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//鐘舵?佺爜 100-鎴愬姛 200-澶辫触
	private int code;
	//鎻愮ず淇℃伅
	private String msg;
	
	//鐢ㄦ埛瑕佽繑鍥炵粰娓歌鍣ㄧ殑鏁版嵁
	private Map<String, Object>  extend = new HashMap<String,Object>();
	
	public static Msg success(){
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理成功！");
		return result;
	}
	public static Msg fail(){
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("处理失败！");
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
