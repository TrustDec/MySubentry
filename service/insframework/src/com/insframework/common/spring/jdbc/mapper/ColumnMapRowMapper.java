package com.insframework.common.spring.jdbc.mapper;



import java.sql.Blob;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.util.LinkedCaseInsensitiveMap;
import com.insframework.common.utils.TextUtil;



/**
 * 将查询结结果集转换成Map<String,Object>
 * 从spring自带的拷过来的，加了些东西
 * @author guom
 *
 */
public class ColumnMapRowMapper  implements RowMapper<Map<String, Object>> {

	@Override
	public Map<String, Object> mapRow(ResultSet rs, int rowNum)
			throws SQLException {
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		Map<String, Object> mapOfColValues = createColumnMap(columnCount);
		for (int i = 1; i <= columnCount; i++) {
			String key = getColumnKey(lookupColumnName(rsmd, i));
			Object obj = getColumnValue(rs, i);
			mapOfColValues.put(key, obj);
		}
		return mapOfColValues;
	}
	
	protected Map<String, Object> createColumnMap(int columnCount) {
		return new LinkedCaseInsensitiveMap<Object>(columnCount);
	}
	
	protected String getColumnKey(String columnName) {
		return columnName;
	}
	
	public static String lookupColumnName(ResultSetMetaData resultSetMetaData, int columnIndex) throws SQLException {
		String name = resultSetMetaData.getColumnLabel(columnIndex);
		if (name == null || name.length() < 1) {
			name = resultSetMetaData.getColumnName(columnIndex);
		}
		//格式化变量名
		return TextUtil.underlineToCamel(name, false);
	}
	
	protected Object getColumnValue(ResultSet rs, int index) throws SQLException {
		Object obj = rs.getObject(index);		
		String className = null;
		if (obj != null) {
			className = obj.getClass().getName();
		}		
		if (obj instanceof Blob) {
			Blob blob = (Blob) obj;
			obj = blob.getBytes(1, (int) blob.length());			
		}
		else if (obj instanceof Clob) {
			Clob clob = (Clob) obj;
			obj = clob.getSubString(1, (int) clob.length());
		}
		else if ("oracle.sql.TIMESTAMP".equals(className) || "oracle.sql.TIMESTAMPTZ".equals(className)) {
			obj = rs.getTimestamp(index);
		}
		else if (className != null && className.startsWith("oracle.sql.DATE")) {
			String metaDataClassName = rs.getMetaData().getColumnClassName(index);
			if ("java.sql.Timestamp".equals(metaDataClassName) || "oracle.sql.TIMESTAMP".equals(metaDataClassName)) {
				obj = rs.getTimestamp(index);
			}
			else {
				obj = rs.getDate(index);
			}
		}
		else if (obj != null && obj instanceof java.sql.Date) {
			if ("java.sql.Timestamp".equals(rs.getMetaData().getColumnClassName(index))) {
				obj = rs.getTimestamp(index);
			}
		}
		//add by guom
		else if("java.lang.String".equals(className)){
			if(rs.getString(index) == null || rs.getString(index).equals("")){
				obj = "";
			}else{
				obj = rs.getString(index);
			}
		}		
		return obj;
	}
	
	
	
}
