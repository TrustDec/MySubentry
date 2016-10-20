package com.insframework.common.spring.jdbc.mapper;



import java.util.Map;

/**
 * 值映射接口 
 */
public interface ValueMapper {
	
	/**
	 * 返回代码
	 */
	public enum RETURN_CODE{
		
		/**
		 * 继续遍历下一条
		 */
		NEXT,
		
		/**
		 * 停止遍历
		 */
		STOP
	}
	
	public RETURN_CODE map(Map<String, Object> record) throws Exception;
	
}
