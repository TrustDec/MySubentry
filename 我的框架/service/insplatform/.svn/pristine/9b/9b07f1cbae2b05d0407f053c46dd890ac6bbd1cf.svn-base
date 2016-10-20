package com.insplatform.mobile.utils;



import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;

import com.insframework.common.utils.TextUtil;

/**
 * 查询条件Map
 * @author guom
 *
 */
public class MobileCondition extends LinkedHashMap<String, Object>{			
	
	private static final long serialVersionUID = 1L;
	


	public MobileCondition(HttpServletRequest request){
	
	}

	/**
	 * 构造查询条件map
	 * @param request
	 * @param keys
	 * @return
	 * 用法：
	 * 		new Condition(request, ["name","age","sex"]);
	 * 注意： 
	 * 		map中的查询条件全部为String类型，如果有特殊需求 那么在service中自己转换
	 */
	public MobileCondition(HttpServletRequest request, String...keys){
		
		for(String key : keys){
			String value = request.getParameter(key);
			if(TextUtil.isNotEmpty(value)){
				this.put(key, value);
			}
		}	
	}
	
	public boolean containsKey(Object key){		
		return super.containsKey(key);
	}
	
	public MobileCondition put(String key, Object value){				
		super.put(key, value);		
		return this;
	}
	
	
	public Object[] valueArray(){			
		return super.values().toArray();		
	}
	
	
}
