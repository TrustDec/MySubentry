package com.insframework.common.utils;



import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/**
 * httpClient基本工具类
 * 所用到的jar包：commons-logging-1.2.jar、httpclient-4.5.2.jar、httpcore-4.4.4.jar
 * @author guom
 *
 */
public class HttpClientSimpleUtil {
	
	//超时时间10秒
	private static final int TIME_OUT = 10 * 1000;	
	
	//最多请求次数
	private static final int MAX_CONNECT = 3;
	
	/**
	 * 配置项
	 * @param httpRequestBase
	 */
	private static void config(HttpRequestBase httpRequestBase){
		//设置header
		//httpRequestBase.setHeader("", "");...
		
		RequestConfig requestConfig = RequestConfig.custom()
				.setConnectionRequestTimeout(TIME_OUT)
				.setConnectTimeout(TIME_OUT).setSocketTimeout(TIME_OUT).build();
		httpRequestBase.setConfig(requestConfig);
	}
	
	/**
	 * 获取httpClient
	 * @return
	 */
	private static CloseableHttpClient getHttpClient(){
		return HttpClients.createDefault();
		
		/**
		 * 多线程抓取网页提高效率，（还不太明白，暂时不管）		
		PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
		cm.setMaxTotal(200);		
		cm.setDefaultMaxPerRoute(20);
		HttpHost httpHost = new HttpHost(hostname, port);		
		cm.setMaxPerRoute(new HttpRoute(httpHost), 100);
		CloseableHttpClient httpClient = HttpClients.custom()
				.setConnectionManager(cm).build();
		 */
	}
	
	/**
	 * 如果请求失败，重复执行
	 * @param httpClient
	 * @param httpRequestBase
	 * @return
	 */
	public static CloseableHttpResponse executeMethod(CloseableHttpClient httpClient, HttpRequestBase httpRequestBase){
		int count = MAX_CONNECT;
		CloseableHttpResponse response = null;
		while(count > 0){
			try{
				response = httpClient.execute(httpRequestBase,	HttpClientContext.create());
				if(response.getStatusLine().getStatusCode() == HttpStatus.SC_OK){					
					break;
				}else{
					count--;
				}				
			}catch(Exception ex){
				ex.printStackTrace();
				count--;
			}			
		}
		return response;
	}
	
	
	/**
	 * get请求
	 * @param url
	 * @return
	 */
	public static String get(String url){
		HttpGet httpget = new HttpGet(url);
		config(httpget);
		CloseableHttpClient httpClient = null;
		CloseableHttpResponse response = null;		
		try{
			httpClient = getHttpClient();
			response = executeMethod(httpClient, httpget);	
			if(response.getStatusLine().getStatusCode() != HttpStatus.SC_OK){		
				return null;
			}
			HttpEntity entity = response.getEntity();
			String result = EntityUtils.toString(entity, "utf-8");
			EntityUtils.consume(entity);						
			return result;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try {
				if (response != null)
					response.close();
				if(httpClient != null){
					httpClient.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}		
		}		
		return null;		
	}
	
	/**
	 * post请求
	 * @param url
	 * @return
	 */
	public static String post(String url, Map<String, Object> params){
		HttpPost httppost = new HttpPost(url);
		config(httppost);
		setPostParams(httppost, params);
		CloseableHttpClient httpClient = null;
		CloseableHttpResponse response = null;		
		try{
			httpClient = getHttpClient();
			response = executeMethod(httpClient, httppost);
			if(response.getStatusLine().getStatusCode() != HttpStatus.SC_OK){		
				return null;
			}
			HttpEntity entity = response.getEntity();
			String result = EntityUtils.toString(entity, "utf-8");
			EntityUtils.consume(entity);			
			return result;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try {
				if (response != null)
					response.close();
				if(httpClient != null){
					httpClient.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}		
		}		
		return null;		
	}
	
	/**
	 * 设置post请求参数
	 * @param httpost
	 * @param params
	 */
	private static void setPostParams(HttpPost httpost,
			Map<String, Object> params) {
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		Set<String> keySet = params.keySet();
		for (String key : keySet) {
			nvps.add(new BasicNameValuePair(key, params.get(key).toString()));
		}
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 测试
	 * @param args
	 */
	public static void main(String[] args) {
		//test get
		System.out.println(HttpClientSimpleUtil.get("https://www.baidu.com"));	
	}

}
