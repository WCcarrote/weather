package com.xinyue.crud.test;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.xinyue.crud.util.HttpUtils;

public class h_HHZ {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 String host = "http://jisutqybmf.market.alicloudapi.com";
		    String path = "/weather/query";
		    String method = "GET";
		    String appcode = "0395eb1b493d46c49be943af338c2051";
		    Map<String, String> headers = new HashMap<String, String>();
		    //�����header�еĸ�ʽ(�м���Ӣ�Ŀո�)ΪAuthorization:APPCODE 83359fd73fe94948385f570e3c139105
		    headers.put("Authorization", "APPCODE " + appcode);
		    Map<String, String> querys = new HashMap<String, String>();
		    querys.put("city", "����");


		    try {
		    	/**
		    	* ��Ҫ��ʾ����:
		    	* HttpUtils���
		    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
		    	* ����
		    	*
		    	* ��Ӧ�����������
		    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
		    	*/
		    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
		    	System.out.println(response.toString());
		    	//��ȡresponse��body
//		    	System.out.println(response.getEntity());
		    	System.out.println(EntityUtils.toString(response.getEntity()));
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }

	}

}
