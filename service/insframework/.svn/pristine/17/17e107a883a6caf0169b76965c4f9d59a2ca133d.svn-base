package com.insframework.component.service.ext.grid;

import java.util.Map;


import org.springframework.stereotype.Component;

import com.insframework.common.spring.jdbc.mapper.ValueMapper;
import com.insframework.common.utils.TextUtil;
import com.insframework.common.utils.pager.Pager;
import com.insframework.component.service.ext.ExtBaseService;

@Component
public class GridService extends ExtBaseService{	
	
	
	/**
	 * 加载数据
	 * @param sql
	 * @param request
	 * @param response
	 */
	public Map<String, Object> loadData(GridTransModel model, String sql){
		return loadData(model, sql, new Object[]{}, null);
	}
	
	/**
	 * 加载数据
	 * @param sql
	 * @param request
	 * @param response
	 */
	public Map<String, Object> loadData(GridTransModel model, String sql, ValueMapper valueMapper){
		return loadData(model, sql, new Object[]{}, valueMapper);
	}
	
	/**
	 * 加载数据
	 * @param sql
	 * @param request
	 * @param response
	 */
	public Map<String, Object> loadData(GridTransModel model, String sql, Object[] args){
		return loadData(model, sql, args, null);
	}
	
	/**
	 * 加载数据
	 * @param sql
	 * @param valueMapper
	 * @param request
	 * @param response
	 */
	public Map<String, Object> loadData(GridTransModel model, String sql, Object[] args, ValueMapper valueMapper){			
		//排序字段
		if(model.getSortColumn() != null){
			//将原有的order by干掉
			if(sql.toUpperCase().indexOf("ORDER BY") != -1){
				sql = "select * from (" + sql.substring(0, sql.toUpperCase().indexOf("ORDER BY")) +")";
			}
			String orderByColumn = TextUtil.camelToUnderline(model.getSortColumn());
			sql += " ORDER BY " + orderByColumn + " " + model.getDirection();			
		}
		String totalSql = "SELECT COUNT(1) FROM ("+sql+") TEMP_COUNT_TABLE "; 
		int total = jdbcAssistant.queryAsInt(totalSql, args);		
		Pager<Map<String,Object>> pager = new Pager<Map<String,Object>>(total, model.getPageIndex(), model.getLimit());
		pager = jdbcAssistant.queryAsPager(sql, args, valueMapper, pager);		
		return pager.toMap();
	}
	

}
