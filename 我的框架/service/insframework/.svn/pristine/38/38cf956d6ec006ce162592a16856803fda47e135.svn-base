package com.insframework.common.utils;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * cooike操作工具
 */
public class CookieUtil {

	/**
	 * 根据名称读取Cookie
	 * 
	 */
	public static String readCokie(HttpServletRequest request, String name)
			throws ServletException, IOException {
		String value = null;
		if (name != null) {
			Cookie cookies[] = request.getCookies();
			if (cookies != null && cookies.length >= 2) {
				for (int i = 0; i < cookies.length; i++) {
					Cookie cookie = cookies[i];
					cookie.setPath("/");
					if (name.equals(cookie.getName())) {
						value = cookie.getValue();
					}
				}
			}
		}
		if (TextUtil.isNotEmpty(value)) {
			value = SecurityUtil.decrypt(value);
		}
		return value;
	}

	/**
	 * 清空cookie
	 */
	public static void clearCokie(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			cookie.setMaxAge(0);
			cookie.setPath("/");
            response.addCookie(cookie);  
		}

	}

	/**
	 * 写Cookie默认为一天 1440分钟
	 */
	public static void writeCokie(HttpServletResponse response, String name,
			String value) throws ServletException, IOException {

		writeCokie(response, name, value, 1440);
	}
	
	/**
	 * 写cookie
	 * @param response
	 * @param name
	 * @param value
	 * @param minute	分钟 如果要设置浏览器关闭时删除cookie可设置为-1
	 * @throws ServletException
	 * @throws IOException
	 */
	public static void writeCokie(HttpServletResponse response, String name,
			String value, int minute) throws ServletException, IOException {
		value = SecurityUtil.encrypt(value);		
		Cookie cookie = new Cookie(name, value);
		if(minute == -1){
			cookie.setMaxAge(-1);			
		}else{
			cookie.setMaxAge(minute * 60);			
		}		
		cookie.setPath("/");
		response.addCookie(cookie);
	}

}
