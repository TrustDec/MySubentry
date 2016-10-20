package com.insframework.system.map;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.insframework.common.utils.JsonUtil;

/**
 * 消息map
 * @author guom
 *
 */
public class Messager extends HashMap<String, Object>{
	
	private static final long serialVersionUID = 1L;		
	
	public Messager success(){
		this.put("success", true);
		return this;
	}
	
	public Messager error(){
		this.put("success", false);
		return this;
	} 
	
	public Messager data(Object value){
		super.put("data", value);	
		return this;
	}
	
	public Messager put(String key, Object value){						
		super.put(key, value);		
		return this;
	}
	
	public Messager putAllMap(Map<String, Object> m) {						
		super.putAll(m);		
		return this;
	}	
	
	public void send(HttpServletResponse response){			
		try {			
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write(JsonUtil.toJson(this));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
}
