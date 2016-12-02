package com.insframework.system.base.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.insframework.common.spring.editor.DateEditor;
import com.insframework.common.spring.editor.DoubleEditor;
import com.insframework.common.spring.editor.FloatEditor;
import com.insframework.common.spring.editor.IntEditor;
import com.insframework.common.spring.editor.LongEditor;
import com.insframework.common.utils.JsonUtil;
import com.insframework.common.utils.TextUtil;
import com.insframework.component.service.file.DownloadService;
import com.insframework.component.service.file.UploadService;
import com.insframework.system.curruser.CurrentUser;
import com.insframework.system.curruser.UserSession;
import com.insframework.system.map.Condition;
import com.insframework.system.map.Messager;


/**
 * 基础控制器
 * @author guom
 *
 */
public class BaseController{
	
	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected UploadService uploadService;
	
	@Autowired
	protected DownloadService downloadService;
	
	/**
	 * 表单数据绑定
	 * @param binder
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {		
		//整型
		binder.registerCustomEditor(int.class, new IntEditor());
		binder.registerCustomEditor(Integer.class, new IntEditor());
		//浮点型
		binder.registerCustomEditor(float.class, new FloatEditor());
		binder.registerCustomEditor(Float.class, new FloatEditor());
		//双精度浮点型
		binder.registerCustomEditor(double.class, new DoubleEditor());
		binder.registerCustomEditor(Double.class, new DoubleEditor());
		//长整型
		binder.registerCustomEditor(long.class, new LongEditor());
		binder.registerCustomEditor(Long.class, new LongEditor());
		//日期
		binder.registerCustomEditor(Date.class, new DateEditor());
		//字节数组
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
		binder.registerCustomEditor(Byte[].class, new ByteArrayMultipartFileEditor());
		//字符串
		binder.registerCustomEditor(String.class, null, new StringTrimmerEditor(true));
	}	
	
	/**
	 * 绑定对象
	 * @param request
	 * @param command
	 */
    protected void bindObject(HttpServletRequest request, Object command){       
    	ServletRequestDataBinder binder = 
    			new ServletRequestDataBinder(command);		
        initBinder(binder);
        binder.bind(request);        
    }
	
	/**
	 * 获取当前登录用户
	 * @param request
	 * @return
	 */
	protected CurrentUser getCurrentUser(HttpServletRequest request){
		return UserSession.getCurrentUser(request);
	}
	
	/**
	 * 向浏览器写json数据
	 * @param response
	 * @param content	
	 */	
	protected void renderJson(HttpServletResponse response, String content) {
		this.getMessager().success().data(content).send(response);
	}
	
	/**
	 * 向浏览器写html数据
	 * @param response
	 * @param content	
	 */
	protected void renderHtml(HttpServletResponse response, String content){		
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(content);
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	/**
	 * 向浏览器写text数据
	 * @param response
	 * @param content	
	 */
	protected void renderText(HttpServletResponse response, String content){		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write(content);
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取消息
	 * @param response
	 */
	protected Messager getMessager(){	
		return new Messager();
	}
	
	/**
	 * 获取查询条件map
	 * @return
	 */
	protected Condition getCondition(HttpServletRequest request){		
		return new Condition(request);
	}
	
	/**
	 * 获取查询条件map
	 * @param request
	 * @param keys
	 * @return
	 * 用法：
	 * 		new Condition(request, ["name","age","sex"]);
	 * 注意： 
	 * 		map中的查询条件全部为String类型，如果有特殊需求 那么在service中自己转换
	 */
	protected Condition getCondition(HttpServletRequest request, String...keys){		
		return new Condition(request, keys);
	}
	
	
	/**
	 * 获取所选择的行 (针对增删改查表格)
	 * 
	 * @param request
	 * @return
	 */		
	protected String[] getSelectedItems(HttpServletRequest request){			
		return getSelectedItems(request, null);
	}
	
	@SuppressWarnings("unchecked")
	protected String[] getSelectedItems(HttpServletRequest request, String name){		
		List<String> items = new ArrayList<String>();		
		String selectedItmes = request.getParameter(name==null ? "SELECT_ITEMS" : name);
		if(TextUtil.isNotEmpty(selectedItmes)){			
			items = JsonUtil.toObject(selectedItmes, List.class);
		}
		String [] ids = new String[items.size()];
		for(int i=0;i<items.size();i++){
			ids[i] = items.get(i).toString();
		}
		return ids;
	}	
	
		
}
