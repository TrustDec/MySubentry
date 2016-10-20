package com.insframework.system.base.service.impl;



import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;


import com.insframework.common.spring.jdbc.JdbcAssistant;
import com.insframework.component.service.ext.grid.GridService;
import com.insframework.component.service.ext.tree.TreeService;
import com.insframework.system.base.repository.BaseRepository;
import com.insframework.system.base.service.BaseService;


/**
 * 基础服务抽象类
 * @author guom
 *
 * @param <T>
 */
public abstract class BaseServiceImpl<T extends Serializable> implements BaseService<T>{	
	
	@Autowired
	protected JdbcAssistant jdbcAssistant;	
	
	@Autowired
	protected GridService gridService;
	
	@Autowired
	protected TreeService treeService;
		
	@Override	
	public T get(Serializable id) {		
		return getRepository().get(id);
	}

	@Override
	public Serializable save(T entity) {		
		return getRepository().save(entity);
	}

	@Override
	public void update(T entity) {
		getRepository().update(entity);
	}

	@Override
	public void deleteById(Serializable id) {
		getRepository().deleteById(id);
	}

	@Override
	public void deleteByIds(String... ids) {		
		getRepository().deleteByIds(ids);
	}

	@Override
	public void deleteAll() {
		getRepository().deleteAll();
	}
	
	public abstract BaseRepository<T> getRepository();

}
