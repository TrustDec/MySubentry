package com.insframework.system.base.repository.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import com.insframework.common.persistence.annotation.Id;
import com.insframework.common.persistence.annotation.Table;
import com.insframework.common.persistence.annotation.Transient;
import com.insframework.common.persistence.constant.SQL_CONSTANT;
import com.insframework.common.persistence.constant.SQL_CONSTANT.ID_STRATEGY;
import com.insframework.common.persistence.constant.SQL_CONSTANT.OPER;
import com.insframework.common.spring.jdbc.JdbcAssistant;
import com.insframework.common.spring.jdbc.mapper.BeanPropertyRowMapper;
import com.insframework.common.utils.TextUtil;
import com.insframework.component.service.ext.grid.GridService;
import com.insframework.component.service.ext.tree.TreeService;
import com.insframework.system.base.repository.BaseRepository;



/**
 * 基础DAO实现类
 * @author guom
 *
 * @param <T>
 */
public class BaseRepositoryImpl<T extends Serializable> implements BaseRepository<T>{
	
	protected Logger logger = Logger.getLogger(this.getClass());
		
	@Autowired
	protected JdbcAssistant jdbcAssistant;	
	
	@Autowired
	protected GridService gridService;
	
	@Autowired
	protected TreeService treeService;
	
	
	private Class<T> entityClass;
	
	@SuppressWarnings("unchecked")
	public Class<T> getEntityClass() {
		if (entityClass == null) {			
			ParameterizedType type = (ParameterizedType) getClass()
					.getGenericSuperclass();
			entityClass = (Class<T>) type.getActualTypeArguments()[0];
		}
		return entityClass;
	}

	@Override
	public T get(Serializable id) {			
		StringBuffer sb = new StringBuffer();
		sb.append(" SELECT * FROM ");
		sb.append(" "+getTableName()+" ");
		sb.append(" WHERE ");
		sb.append(" "+getIdColumnName()+" ");
		sb.append(" = ?");
		T entity = (T) jdbcAssistant.queryAsObject(sb.toString(), new Object[] { id },
				BeanPropertyRowMapper.newInstance(getEntityClass()));			
		return entity;
	}

	@Override
	public Serializable save(T entity) {
		final String sql = buildSql(SQL_CONSTANT.OPER.INSERT);
		ID_STRATEGY strategy = getIdStrategy();
		Serializable f_id = null;
		switch (strategy) {
		case IDENTITY:
			//logger.info(sql);
			final Object[] args = getArgs(SQL_CONSTANT.OPER.INSERT, entity, null);		
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcAssistant.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con)
						throws SQLException {
					PreparedStatement  ps = 
							con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
					for(int i=1;i<=args.length;i++){
						ps.setObject(i, args[i-1]);
					}				
					return ps;
				}
			}, keyHolder);		
			f_id =  keyHolder.getKey();
			break;
		case UUID:
			f_id = TextUtil.getUUID();
			Object[] uArgs = getArgs(SQL_CONSTANT.OPER.INSERT, entity, String.valueOf(f_id));
			jdbcAssistant.update(sql, uArgs);
			break;
		default:
			break;
		}		
		return f_id;
	}

	@Override
	public void update(T entity) {
		String sql = buildSql(SQL_CONSTANT.OPER.UPDATE);
		Object[] args = getArgs(SQL_CONSTANT.OPER.UPDATE, entity, null);	
		jdbcAssistant.update(sql,args);
	}

	@Override
	public void deleteById(Serializable id) {		
		String sql = buildSql(OPER.DELETE);
		StringBuffer sb = new StringBuffer();
		sb.append(sql);
		sb.append(" WHERE ");
		sb.append(getIdColumnName());
		sb.append(" = ?");
		jdbcAssistant.update(sb.toString(),id);
	}
	
	@Override
	public void deleteByIds(String... ids) {
		if(ids.length > 0){
			if(ids != null && ids.length>0){
				String [] sqls = new String [ids.length];
				int i = 0;
				for(String id : ids){				
					String sql = buildSql(OPER.DELETE);
					StringBuffer sb = new StringBuffer();
					sb.append(sql);
					sb.append(" WHERE ");
					sb.append(getIdColumnName());
					sb.append(" = '"+id+"'");
					sqls[i] = sb.toString();
					i++;
				}	
				jdbcAssistant.batchUpdate(sqls);
			}		
		}
		
	}

	@Override
	public void deleteAll() {
		String sql = " TRUNCATE TABLE " + getTableName();		
		jdbcAssistant.update(sql);
	}

	
	/**
	 * 获取表名
	 * @param c
	 * @return String
	 */
	private String getTableName(){
		Table table = 
				getEntityClass().getAnnotation(Table.class);
		if(table == null){
			logger.error("获取表名发生异常，实体类没有定义@Table");
			throw new RuntimeException("获取表名发生异常，实体类没有定义@Table");			
		}
		String tableName = table.value();
		//如果设置了表名，则使用设置的表名
		if(TextUtil.isEmpty(tableName)){
			tableName = TextUtil.camelToUnderline(entityClass.getSimpleName());
		}
		String schema = table.schema();
		//如果设置了schema，则使用schema.tableName的方式
		if(TextUtil.isNotEmpty(schema)){
			tableName = schema + "." + tableName;
		}		
		return tableName;				
	}
	
	/**
	 * 获取主键列名
	 * @return String
	 */
	private String getIdColumnName(){		
		String name = "";
		Class<?> c = getEntityClass();
		Field [] fields = c.getDeclaredFields();				
		for(Field field : fields){
			if(field.isAnnotationPresent(Id.class)){
				name = TextUtil.camelToUnderline(field.getName());
			}
		}
		if(TextUtil.isEmpty(name)){
			logger.error("获取主键发生异常，实体类没有主键@Id");
			throw new RuntimeException("获取主键发生异常，实体类没有主键@Id");			
		}		
		return name;
	}
	
	/**
	 * 获取主键生成策略
	 * @param field
	 * @return ID_STRATEGY
	 */
	private ID_STRATEGY getIdStrategy(){
		Class<?> c = getEntityClass();
		Field [] fields = c.getDeclaredFields();
		for(Field field : fields){
			if(field.isAnnotationPresent(Id.class)){
				return getIdStrategy(field);
			}
		}
		return null;
	}
	
	private ID_STRATEGY getIdStrategy(Field field){		
		Id id = field.getAnnotation(Id.class);
		return id.strategy();
	}
	
	/**
	 * 判断字段是否为static、final
	 * @param field
	 * @return boolean
	 */
	public boolean isSerialVersionUuid(Field field){
		boolean flag = false;
		if(Modifier.isStatic(field.getModifiers())
				&& Modifier.isFinal(field.getModifiers())){
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 根据标示创建sql语句
	 * @param Oper
	 * @return String 
	 */
	private String buildSql(SQL_CONSTANT.OPER Oper){		
		Field[] fields =
				getEntityClass().getDeclaredFields();
		String sql = "";
		switch (Oper) {
		case INSERT:
			sql = buildInsertSql(fields);
			break;
		case UPDATE:
			sql = buildUpdateSql(fields);
			break;
		case DELETE:
			sql = buildDeleteSql(fields);
			break;	
		case SELECT:
			sql = buildSelectSql(fields);
			break;	
		default:
			break;
		}
		return sql;
	} 
	
	/**
	 * 获取参数数组
	 * @param Oper     sql表示 INSERT、UPDATE、DELETE
	 * @param entity   实体类
	 * @param f_id	   insert时使用的id(主键生成策略为UUID、或手动填写时使用)
	 * 				      如果主键生成策略为identity时传null
	 * @return Object[]
	 */
	private Object [] getArgs(OPER Oper,T entity,String f_id){
		Field[] fields = 
				getEntityClass().getDeclaredFields();
		Object [] args = null;
		if(Oper == OPER.INSERT){
			args = getInsertArgs(fields, entity, f_id);
		}else if(Oper == OPER.UPDATE){
			args = getUpdateArgs(fields, entity);
		}		
		return args;
	}
	
	
	/**
	 * 创建insert语句
	 * @param fields
	 * @return String
	 */
	private String buildInsertSql(Field[] fields){
		StringBuffer sb = new StringBuffer();
		int fieldCount = 0;
		sb.append(" INSERT INTO ");
		sb.append(" "+getTableName()+" ");
		sb.append("(");
		for(Field field : fields){
			if(field.isAnnotationPresent(Transient.class)){
				continue;
			}	
			if(isSerialVersionUuid(field)){
				continue;
			}
			fieldCount++;
			field.setAccessible(true);
			String column = TextUtil.camelToUnderline(field.getName());
			sb.append(column).append(",");
		}
		sb = sb.deleteCharAt(sb.length() - 1);
		sb.append(") VALUES (");
		for(int i=0;i<fieldCount;i++){
			sb.append("?,");
		}
		sb = sb.deleteCharAt(sb.length() - 1);
		sb.append(")");
		return sb.toString();
	}
	
	/**
	 * 创建update语句
	 * @param fields
	 * @return String
	 */
	private String buildUpdateSql(Field[] fields){
		String id = getIdColumnName();
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE ");
		sb.append(" "+getTableName()+" ");
		sb.append(" SET ");
		for(Field field : fields){
			if(field.isAnnotationPresent(Transient.class)){
				continue;
			}
			if(isSerialVersionUuid(field)){
				continue;
			}
			String column = TextUtil.camelToUnderline(field.getName());				
			if(column.equals(id)){
				continue;
			}
			sb.append(column).append("=").append("?,");
		}
		sb = sb.deleteCharAt(sb.length() - 1);
		sb.append(" WHERE "+id+"=?");
		return sb.toString();
	}
	
	/**
	 * 创建删除语句
	 * @param fields
	 * @return String
	 */
	public String buildDeleteSql(Field[] fields){
		StringBuffer sb = new StringBuffer();
		sb.append(" DELETE FROM ");
		sb.append(" "+getTableName()+" ");
		return sb.toString();
	}	
	
	/**
	 * 创建查询语句
	 * @param fields
	 * @return String
	 */
	public String buildSelectSql(Field[] fields){
		StringBuffer sb = new StringBuffer();
		sb.append(" SELECT ");
		for(Field field : fields){
			if(field.isAnnotationPresent(Transient.class)){
				continue;
			}
			if(isSerialVersionUuid(field)){
				continue;
			}
			String column = TextUtil.camelToUnderline(field.getName());
			sb.append(column).append(",");			
		}
		sb = sb.deleteCharAt(sb.length() - 1);
		sb.append(" FROM ");
		sb.append(" "+getTableName()+" ");
		return sb.toString();
	}	
	
	/**
	 * 获取新增参数数组
	 * @param fields	实体类的字段列表
	 * @param entity	实体类
	 * @param f_id		insert时使用的id(主键生成策略为UUID、或手动填写时使用) 
	 * 					如果主键生成策略为identity时传null
	 * @return
	 */
	private Object[] getInsertArgs(Field[] fields, T entity, String f_id){
		String id = getIdColumnName();
		List<Object> args = new ArrayList<Object>();		
		for(Field field : fields){
			if(field.isAnnotationPresent(Transient.class)){
				continue;
			}	
			if(isSerialVersionUuid(field)){
				continue;
			}
			String column = TextUtil.camelToUnderline(field.getName());				
			if(column.equals(id)){				
				ID_STRATEGY strategy = getIdStrategy(field);
				switch (strategy) {
				case UUID:
					args.add(f_id);
					break;
				case IDENTITY:
					args.add(null);
					break;
				default:
					break;
				}
			}else{
				field.setAccessible(true);
				try {
					args.add(field.get(entity));
				}  catch (IllegalAccessException e) {					
					e.printStackTrace();
				}
			}
		}	
		return args.toArray();
	}
	
	/**
	 * 获取更新参数组
	 * @param fields
	 * @param entity
	 * @return Object[]
	 */
	private Object[] getUpdateArgs(Field[] fields, T entity){
		String id = getIdColumnName();
		Object idValue = null;
		List<Object> args = new ArrayList<Object>();
		for(Field field : fields){
			if(field.isAnnotationPresent(Transient.class)){
				continue;
			}	
			if(isSerialVersionUuid(field)){
				continue;
			}
			String column = TextUtil.camelToUnderline(field.getName());
			field.setAccessible(true);
			if(column.equals(id)){					
				try {
					idValue = field.get(entity);
				}  catch (IllegalAccessException e) {					
					e.printStackTrace();
				}
				continue;
			}else{
				try {
					args.add(field.get(entity));
				}  catch (IllegalAccessException e) {					
					e.printStackTrace();
				}
			}
		}
		args.add(idValue);
		return args.toArray();
	}


	
	
}


