package com.insframework.system.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * AJAX跨域过滤器
 * @author guom
 */
@WebFilter(filterName="accessControlFilter",urlPatterns="/*")
public class AccessControlFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {	
		
		HttpServletRequest request = (HttpServletRequest)arg0;	
		HttpServletResponse response = (HttpServletResponse) arg1;		
			
		String userAgent = request.getHeader("user-agent").toUpperCase();
		/**
		 * 如果客户端是手机网页，允许跨域访问
		 */
		if(userAgent.indexOf("IPHONE")!=-1 
				|| userAgent.indexOf("ANDROID")!=-1
				|| userAgent.indexOf("PHONEGAP")!=-1
				|| userAgent.indexOf("MOBILE")!=-1){
			
			// 指定允许其他域名访问 
			response.setHeader("Access-Control-Allow-Origin", "*");
			// 响应类型  
			response.setHeader("Access-Control-Allow-Methods", "GET,POST");
			// 响应头设置
			response.setHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");	
		}	
		
		chain.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	
	@Override
	public void destroy() {}


}