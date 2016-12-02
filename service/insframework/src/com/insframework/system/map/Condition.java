package com.insframework.system.map;



import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;

import com.insframework.common.utils.TextUtil;
import com.insframework.component.service.ext.grid.GridTransModel;
import com.insframework.system.curruser.CurrentUser;
import com.insframework.system.curruser.UserSession;

/**
 * 查询条件Map
 * @author guom
 *
 */
public class Condition extends LinkedHashMap<String, Object>{			
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 表格分页
	 */
	private GridTransModel gridTransModel;
	
	/**
	 * 当前用户
	 */
	private CurrentUser currentUser;		


	public Condition(HttpServletRequest request){
		initCurrentUser(request);
		initGridModel(request);
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
	public Condition(HttpServletRequest request, String...keys){
		
		for(String key : keys){
			String value = request.getParameter(key);
			if(TextUtil.isNotEmpty(value)){
				this.put(key, value);
			}
		}	
		
		initCurrentUser(request);
		initGridModel(request);
		
	}
	
	public boolean containsKey(Object key){		
		return super.containsKey(key);
	}
	
	public Condition put(String key, Object value){				
		super.put(key, value);		
		return this;
	}
	
	
	public Object[] valueArray(){			
		return super.values().toArray();		
	}
	
	private void initGridModel(HttpServletRequest request){
		gridTransModel = new GridTransModel(request);
	}
	
	private void initCurrentUser(HttpServletRequest request){
		currentUser = UserSession.getCurrentUser(request);
	}
	
	public GridTransModel getGridTransModel() {
		return gridTransModel;
	}

	public CurrentUser getCurrentUser() {
		return currentUser;
	}
	
	
	
}
