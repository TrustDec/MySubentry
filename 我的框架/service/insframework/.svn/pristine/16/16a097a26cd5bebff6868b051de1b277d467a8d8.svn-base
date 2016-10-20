package com.insframework.system.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insframework.common.utils.TextUtil;
import com.insframework.system.context.App;

/**
 * 权限过滤器
 * @author guom
 *
 */
@WebFilter(filterName="authzFilter",urlPatterns="/*")
public class AuthzFiler implements Filter {
	
	//需要排除的页面
	private List<String> excludedPageArray;
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {		
		excludedPageArray = new ArrayList<String>();		
		excludedPageArray.add("/main");								//首页
		excludedPageArray.add("/px/course/loadHomeCourseList");		//index course list 8
		excludedPageArray.add("/login");							//登陆页面
		excludedPageArray.add("/captcha");							//验证码
		excludedPageArray.add("/mobile/rest");						//给移动终端提供数据服务
	}

	@Override
	public void destroy() {excludedPageArray=null;}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {	
		
		HttpServletRequest request = (HttpServletRequest)arg0;	
		HttpServletResponse response = (HttpServletResponse) arg1;	
		
		boolean isExcluded = false;		
		
		//如果没指定目录地址，直接跳转首页
		if(TextUtil.isEmpty(request.getServletPath()) || request.getServletPath().equals("/")){
			response.sendRedirect(App.CTX_PATH + "/main");
			return;
		}else{			
			//如果指定了目录地址，判断请求是否是例外			
			Iterator<String> iter = excludedPageArray.iterator();
			//System.out.println(request.getServletPath());
			while(iter.hasNext()){
				String excluded = iter.next();	
				if(request.getServletPath().startsWith(excluded)){
					isExcluded = true;
				}			
			}
		}		
		
		//如果不是例外，进行session校验
		if(!isExcluded){
			if(request.getSession().getAttribute(App.CURRENT_USER) == null){				
				//处理AJAX请求
				if(request.getHeader("x-requested-with") !=null 
					&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
					 response.setHeader("sessionStatus", "timeout"); 
					 response.getWriter().write("{\"sessionStatus\":\"timeout\"}");
				}else{	
					//一般请求
					response.sendRedirect(request.getContextPath() + "/login");
				}	
				return;
			}
			//处理用户实际是否具有此资源的访问权限(暂时不处理)
			
		}
		
		chain.doFilter(arg0, arg1);		
		
	}

	
	
}
