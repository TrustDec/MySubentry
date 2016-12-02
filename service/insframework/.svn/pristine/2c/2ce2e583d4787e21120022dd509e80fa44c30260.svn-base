package com.insframework.common.spring.jdbc.impl;




import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import com.insframework.common.spring.jdbc.JdbcAssistant;
import com.insframework.common.spring.jdbc.mapper.ColumnMapRowMapper;
import com.insframework.common.spring.jdbc.mapper.ValueMapper;
import com.insframework.common.spring.jdbc.mapper.ValueMapper.RETURN_CODE;
import com.insframework.common.utils.pager.Pager;
import com.insframework.system.context.App;


/**
 * 数据库操作工具实现类
 * @author guom
 * 查询方法默认把列名驼峰化 如：user_name 转为 userName
 */
@Component("JdbcAssistantImpl")
public class JdbcAssistantImpl implements JdbcAssistant{
	
	@SuppressWarnings("unused")
	private Logger logger = Logger.getLogger(JdbcAssistantImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public int update(String sql) {		
		return update(sql,new Object[]{});
	}

	@Override
	public int update(String sql, Object... args) {			
		return jdbcTemplate.update(sql,args);
	}
	
	@Override
	public int update(PreparedStatementCreator psc, KeyHolder generatedKeyHolder) {			
		return jdbcTemplate.update(psc, generatedKeyHolder);
	}
	
	@Override
	public int update(String sql, PreparedStatementSetter pss) {		
		return jdbcTemplate.update(sql, pss);
	}
	
	@Override
	public void execute(String sql) {		
		jdbcTemplate.execute(sql);
	}

	@Override
	public void batchUpdate(String... sqls) {		
		jdbcTemplate.batchUpdate(sqls);
	}	
		
	@Override
	public List<Map<String, Object>> query(String sql) {		
		return query(sql, new Object[]{}, null);
	}

	@Override
	public List<Map<String, Object>> query(String sql, Object[] args) {		
		return query(sql, args, null);
	}

	@Override
	public List<Map<String, Object>> query(String sql, Object[] args,
			ValueMapper mapper) {		
		List<Map<String, Object>> results = 
				jdbcTemplate.query(sql, args, getColumnMapRowMapper());
		if(mapper != null){
			valueMapperRow(results, mapper);
		}
		return results;
	}
		
	@Override
	public Pager<Map<String, Object>> queryAsPager(String sql,
			Pager<Map<String, Object>> pager) {
		return queryAsPager(sql, new Object[]{}, null, pager);
	}

	@Override
	public Pager<Map<String, Object>> queryAsPager(String sql, Object[] args,
			Pager<Map<String, Object>> pager) {		
		return queryAsPager(sql, args, null, pager);
	}	
	
	@Override
	public Pager<Map<String, Object>> queryAsPager(String sql, Object[] args,
			ValueMapper mapper, Pager<Map<String, Object>> pager) {
		if(pager.getTotal() == 0){
			getTotal(sql, args, pager);			
		}
		pager.init();	
		String pagerSql = buildPagerSql(sql, pager);
		List<Map<String,Object>> data = query(pagerSql, args, mapper);
		pager.setData(data);
		return pager;
	}
	
	@Override
	public Map<String, Object> queryOne(String sql) {		
		return requiredSingleResult(query(sql));		
	}

	@Override
	public Map<String, Object> queryOne(String sql, Object[] args) {		
		return requiredSingleResult(query(sql, args));		
	}
	
	@Override
	public Map<String, Object> queryOne(String sql, Object[] args,
			ValueMapper mapper) {		
		return requiredSingleResult(query(sql, args, mapper));
	}	
	
	@Override
	public <T> List<T> queryAsList(String sql, Class<T> elementType,
			Object[] args) {		
		return jdbcTemplate.queryForList(sql, elementType, args);
	}

	
	@Override
	public <T> T queryAsObject(String sql, Class<T> requiredType) {				
		return jdbcTemplate.queryForObject(sql, requiredType);
	}

	@Override
	public <T> T queryAsObject(String sql, Object[] args, Class<T> requiredType) {		
		return jdbcTemplate.queryForObject(sql, args, requiredType);
	}
	
	@Override
	public <T> T queryAsObject(String sql, Object[] args, RowMapper<T> rowMapper) {		
		return jdbcTemplate.queryForObject(sql,args,rowMapper);
	}


	@Override
	public int queryAsInt(String sql) {			
		return queryAsInt(sql, new Object[]{});
	}
	
	@Override
	public int queryAsInt(String sql, Object[] args) {
		Number number = queryAsObject(sql, args, Integer.class);
		return (number != null ? number.intValue() : 0);	
	}

	@Override
	public long queryAsLong(String sql) {		
		return queryAsLong(sql, new Object[]{});
	}
	
	@Override
	public long queryAsLong(String sql, Object[] args) {
		Number number = queryAsObject(sql, args, Long.class);
		return (number != null ? number.longValue() : 0);
	}
	
	@Override
	public Double queryAsDouble(String sql) {		
		return queryAsDouble(sql, new Object[]{});
	}
	
	@Override
	public Double queryAsDouble(String sql, Object[] args) {
		Number number = queryAsObject(sql, args, Double.class);
		return (number != null ? number.doubleValue() : 0);
	}
	
	@Override
	public String queryAsString(String sql) {		
		return queryAsString(sql, new Object[]{});
	}
	
	@Override
	public String queryAsString(String sql, Object[] args) {		
		String str = null;
		try{
			str = queryAsObject(sql, args, String.class);
		}catch(Exception ex){}		
		return str == null ? "" : str;
	}
	
	@Override
	public JdbcTemplate getJdbcTemplate() {		
		return jdbcTemplate;
	}	
	
	
	/**
	 * 列映射器
	 * @return
	 */
	private RowMapper<Map<String, Object>> getColumnMapRowMapper() {
		return new ColumnMapRowMapper();
	}
	
	/**
	 * 值映射器
	 * @param rsList
	 * @param mapper
	 */
	private void valueMapperRow(List<Map<String, Object>> rsList,
			ValueMapper mapper) {
		if (rsList != null) {			
			Iterator<Map<String, Object>> it = rsList.iterator();
			while (it.hasNext()) {
				Map<String, Object> record = it.next();
				RETURN_CODE code = RETURN_CODE.NEXT;
				try {
					code = mapper.map(record);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (code == RETURN_CODE.STOP) {
					break;
				}
			}
		}
	}
	
	/**
	 * 获取总记录并且重新初始化Pager
	 * @param sql
	 * @param pager
	 */
	private <T>void getTotal(String sql, Object [] args, Pager<T> pager){
		String totalSql = "SELECT COUNT(1) FROM ("+sql+") TEMP_COUNT_TABLE ";
		int total = queryAsInt(totalSql, args);
		pager.setTotal(total);		
	}
	
	/**
	 * 创建分页语句
	 * @param sql
	 * @param type
	 * @return String
	 */
	private <T>String buildPagerSql(String sql,Pager<T> pager){		
		String type = App.DATABASE_TYPE.toUpperCase();
		int begin = (pager.getCurrentPage() - 1) * pager.getPageSize();
		int size = pager.getPageSize();
		StringBuffer sb = new StringBuffer();
		if("ORACLE".equals(type)){
			sb.append(" SELECT * FROM ");
			sb.append(" ( ");
			sb.append(" SELECT A.*, ROWNUM RN ");
			sb.append("  FROM ( ");
			sb.append(sql);
			sb.append(" ) A ");
			sb.append(" WHERE ROWNUM <= ");
			sb.append(begin + size);
			sb.append(" ) ");
			sb.append(" WHERE RN > ");
			sb.append(begin);
		}else if("MYSQL".equals(type)){
			sb.append(sql);
			sb.append(" LIMIT ");
			sb.append(begin);
			sb.append(",");
			sb.append(size);
		}
		return sb.toString();
	}
	
	/**
	 * 查询一条数据
	 * @param list
	 * @return 
	 */
	public Map<String, Object> requiredSingleResult(List<Map<String,Object>> list){
		if(list.size() == 0){
			return null;
		}else{
			return list.get(0);
		}
	}

	
	
	
	
}
