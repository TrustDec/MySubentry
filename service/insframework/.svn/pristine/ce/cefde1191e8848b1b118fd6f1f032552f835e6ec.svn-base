package com.insframework.common.spring.jdbc;


import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.KeyHolder;
import com.insframework.common.spring.jdbc.mapper.ValueMapper;
import com.insframework.common.utils.pager.Pager;



/**
 * jdbc操作工具接口
 * @author guom
 * 查询方法默认将列名驼峰化  例如：user_name >>> userName
 */
public interface JdbcAssistant {
	
	/**
	 * 更新操作
	 * @param sql
	 * @return int
	 */
	int update(String sql);
	
	/**
	 * 更新操作
	 * @param sql
	 * @param args 参数数组
	 * @return
	 */
	int update(String sql,Object... args);
	
	/**
	 * 更新操作
	 * @param psc
	 * @param generatedKeyHolder
	 * @return 
	 */
	int update(final PreparedStatementCreator psc, final KeyHolder generatedKeyHolder);
	
	/**
	 * 更新操作
	 * @param sql
	 * @param pss
	 * @return
	 */
	int update(String sql, PreparedStatementSetter pss);
	
	/**
	 * 执行sql脚本
	 * @param sql
	 */
	void execute(String sql);
	
	/**
	 * 批量更新
	 * @param sql
	 */
	void batchUpdate(String... sqls);	
		
	/**
	 * 查询
	 * @param sql 
	 * @return List<Map<String, Object>>
	 */
	List<Map<String, Object>> query(String sql);
	
	/**
	 * 查询
	 * @param sql
	 * @param args 参数数组
	 * @return List<Map<String, Object>>
	 */
	List<Map<String, Object>> query(String sql,Object[] args);
	
	/**
	 * 查询
	 * @param sql
	 * @param args 参数数组
	 * @param mapper 值映射器
	 * @return List<Map<String, Object>>
	 */
	List<Map<String, Object>> query(String sql, Object[] args, ValueMapper mapper);
		
	/**
	 * 分页查询
	 * @param sql
	 * @param database
	 * @return Pager<Map<String, Object>>
	 */
	Pager<Map<String, Object>> queryAsPager(String sql, Pager<Map<String, Object>> pager);
	
	/**
	 * 分页查询
	 * @param sql
	 * @param args
	 * @param database
	 * @return Pager<Map<String, Object>>
	 */
	Pager<Map<String, Object>> queryAsPager(String sql, Object[] args, Pager<Map<String, Object>> pager);
	
	/**
	 * 分页查询
	 * @param sql
	 * @param args
	 * @param mapper
	 * @param database
	 * @return Pager<Map<String, Object>>
	 */
	Pager<Map<String, Object>> queryAsPager(String sql, Object[] args, ValueMapper mapper, Pager<Map<String, Object>> pager);
	
		
	/**
	 * 查询单条记录
	 * @param sql
	 * @return Map<String, Object>
	 */
	Map<String, Object> queryOne(String sql);
	
	/**
	 * 查询单条记录
	 * @param sql
	 * @param args 参数数组
	 * @return Map<String, Object>
	 */
	Map<String, Object> queryOne(String sql, Object[] args);	
	
	/**
	 * 查询单条记录
	 * @param sql
	 * @param args 参数数组
	 * @return Map<String, Object>
	 */
	Map<String, Object> queryOne(String sql, Object[] args, ValueMapper mapper);
	
	/**
	 * 查询结果转为list
	 * @param sql
	 * @param args
	 * @param mapper
	 * @return
	 */
	<T> List<T> queryAsList(String sql, Class<T> elementType, Object[] args);	
	
	/**
	 * 查询结果转为 Object
	 * @param sql
	 * @param requiredType 对象类型
	 * @return T
	 */
	<T> T queryAsObject(String sql, Class<T> requiredType);
	
	/**
	 * 查询结果转为 Object
	 * @param sql
	 * @param args 参数数组
	 * @param requiredType 对象类型
	 * @return T
	 */
	<T> T queryAsObject(String sql, Object[] args, Class<T> requiredType);
	
	/**
	 * 查询结果转为 Object
	 * @param sql
	 * @param args 参数数组
	 * @param requiredType 对象类型
	 * @param 映射器
	 * @return
	 */
	<T> T queryAsObject(String sql, Object[] args, RowMapper<T> rowMapper);
	
	/**
	 * 将查询结果转为int
	 * @param sql
	 * @return int
	 */
	int queryAsInt(String sql);
	
	/**
	 * 将查询结果转为int
	 * @param sql
	 * @param args
	 * @return
	 */
	int queryAsInt(String sql, Object[] args);
	
	/**
	 * 将查询结果转为long
	 * @param sql
	 * @return long
	 */
	long queryAsLong(String sql);
	
	/**
	 * 将查询结果转为long
	 * @param sql
	 * @return long
	 */
	long queryAsLong(String sql, Object[] args);
	
	/**
	 * 将查询结果转为Double
	 * @param sql
	 * @return Double
	 */
	Double queryAsDouble(String sql);
	
	/**
	 * 将查询结果转为Double
	 * @param sql
	 * @return Double
	 */
	Double queryAsDouble(String sql, Object[] args);
	
	/**
	 * 将查询结果转为String
	 * @param sql
	 * @return String
	 */
	String queryAsString(String sql);
	
	/**
	 * 将查询结果转为String
	 * @param sql
	 * @return String
	 */
	String queryAsString(String sql, Object[] args);	
	
	/**
	 * 获取jdbcTemplate
	 * @return
	 */
	JdbcTemplate getJdbcTemplate();
	
}
