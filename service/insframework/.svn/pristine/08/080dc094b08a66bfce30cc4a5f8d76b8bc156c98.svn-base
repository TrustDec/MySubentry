package com.insframework.system.curruser;

import javax.servlet.http.HttpServletRequest;

import com.insframework.system.context.App;

/**
 * 获取当前用户类
 * @author guom
 *
 */
public class UserSession {
	
	public static CurrentUser getCurrentUser(HttpServletRequest request){
		
		try{
			Object obj = request.getSession().getAttribute(App.CURRENT_USER);
			
			if(obj != null){
				return (CurrentUser)obj;
			}
		}catch(Exception ex){
			return null;
		}		
		
		return null;
	}
	
}
