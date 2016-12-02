package com.insframework.system.context.init.impl;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.insframework.common.spring.jdbc.JdbcAssistant;
import com.insframework.system.context.App;
import com.insframework.system.context.init.Initializer;


/**
 * 初始化缓存
 * @author guom 
 *
 */
public class CacheInitializer implements Initializer{
	
	@Autowired
	private JdbcAssistant jdbcAssistant;

	@Override
	public void before(ServletContext ctx) throws Exception {
		
	}

	@Override
	public void init(ServletContext ctx) throws Exception {
		//所有操作列表
		String sql = "select v.* from V_SYS_AUTHZ_OPERATES v where v.resource_path is not null ";
		App.Cache.SYSTEM_OPERATE_ALL_LIST = jdbcAssistant.query(sql);	
	}

	@Override
	public void after(ServletContext ctx) throws Exception {
		
	}

}
