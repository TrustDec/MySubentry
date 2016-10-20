package com.insframework.system.errorpage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.insframework.common.utils.JsonUtil;
import com.insframework.common.utils.TextUtil;
import com.insframework.system.base.controller.BaseController;

/**
 * 错误页面处理
 * @author guom
 *
 */
@Controller
public class ErrorController extends BaseController{	

	@RequestMapping(value = "/errorHandler/{errorType}")	
	public void errorHandler(@PathVariable("errorType") String errorType, 
			HttpServletRequest request, HttpServletResponse response, Throwable ex){
		if(TextUtil.isEmpty(errorType)){
			errorType = "500";
		}
		//先暂时这样处理
		this.renderJson(response, JsonUtil.toJson(this.getMessager().error().put("msg", "request is error")));
		//this.renderHtml(response, "<h1>"+errorType+"</h1>" + TextUtil.getExceptionDetails(ex).replaceAll("\r\n\tat", "<br/>"));
	} 
	
}
