package com.insframework.common.utils;



import java.io.IOException;
import java.text.SimpleDateFormat;
import com.fasterxml.jackson.databind.ObjectMapper;


/**
 * json处理工具类
 *  
 */
public class JsonUtil {
	private static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	private static final ObjectMapper mapper;

	public ObjectMapper getMapper() {
		return mapper;
	}

	static {
		SimpleDateFormat dateFormat = new SimpleDateFormat(DEFAULT_DATE_FORMAT);
		mapper = new ObjectMapper();
		mapper.setDateFormat(dateFormat);
		
	}

	public static String toJson(Object obj) {
		try {
			return mapper.writeValueAsString(obj);
		} catch (Exception e) {
			throw new RuntimeException("转换json字符失败!");
		}
	}

	public static <T> T toObject(String json, Class<T> clazz) {
		try {
			return mapper.readValue(json, clazz);
		} catch (IOException e) {
			throw new RuntimeException("将json字符转换为对象时失败!");
		}
	}
	

}