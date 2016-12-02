package com.insframework.system.context.init.impl;


import java.util.Properties;

import javax.servlet.ServletContext;

import com.insframework.common.utils.FileUtil;
import com.insframework.system.context.App;
import com.insframework.system.context.init.Initializer;



/**
 * 初始化全局参数
 * @author guom
 *
 */
public class ContextInitializer implements Initializer{
	
	@Override
	public void before(ServletContext ctx) throws Exception {	
		
	}

	@Override
	public void init(ServletContext ctx) throws Exception {	
		
		//加载jdbc配置文件
		Properties jdbcCfg = FileUtil.getProperties("/jdbc.properties");	
		if(jdbcCfg != null){
			App.DATABASE_TYPE = jdbcCfg.getProperty("database.type");
		}
		
		//加载全局配置文件
		Properties applictionCfg = FileUtil.getProperties("/application.properties");			
		if(applictionCfg != null){		
			
			//上下文路径
			App.CTX_PATH = applictionCfg.getProperty("CTX_PATH");
			ctx.setAttribute("CTX_PATH", App.CTX_PATH);
			
			//静态资源路径
			App.STATIC_PATH = applictionCfg.getProperty("STATIC_PATH");
			ctx.setAttribute("STATIC_PATH", App.STATIC_PATH);		
			
			//上传文件路径
			App.FILE_SYS = applictionCfg.getProperty("FILE_SYS");			
			App.FILE_SYS_URL = applictionCfg.getProperty("FILE_SYS_URL");		
			
			//文件服务器地址
			App.FILE_SYS_HOST = applictionCfg.getProperty("FILE_SYS_HOST");
			ctx.setAttribute("FILE_SYS_HOST", App.FILE_SYS_HOST);	
			
			//视频服务器地址
			App.FILE_VIDEO_HOST = applictionCfg.getProperty("FILE_VIDEO_HOST");
			ctx.setAttribute("FILE_VIDEO_HOST", App.FILE_VIDEO_HOST);	
			
			//报表服务器地址
			App.REPORT_SERVER = applictionCfg.getProperty("REPORT_SERVER");
			ctx.setAttribute("REPORT_SERVER", App.REPORT_SERVER);	
				    	
		}
	}

	@Override
	public void after(ServletContext ctx) throws Exception {		
		
	}

}
