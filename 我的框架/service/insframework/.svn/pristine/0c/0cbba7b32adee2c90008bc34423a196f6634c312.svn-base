package com.insframework.system.base.service;



import java.io.Serializable;



/**
 * 基础服务接口
 * @author guom
 * 
 */
public interface BaseService <T extends Serializable>{
	
	/**
	 * 根据id获取对象
	 * @param id
	 * @return T
	 */	
	T get(Serializable id);
	
	/**
	 * 保存
	 * @param entity
	 * @return Serializable
	 */
	Serializable save(T entity);
	
	/**
	 * 更新
	 * @param entity
	 */
	void update(T entity);
	
	/**
	 * 根据id删除
	 * @param id
	 */
	void deleteById(Serializable id);
	
	/**
	 * 根据id数组删除
	 * @param ids
	 */
	void deleteByIds(String... ids);
	
	/**
	 * 删除所有
	 */
	void deleteAll();
	
	
}
