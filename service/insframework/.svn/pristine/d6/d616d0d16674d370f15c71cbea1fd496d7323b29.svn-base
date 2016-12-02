package com.insframework.common.utils;

import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Blob;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

/**
 * 文本工具类
 */
public class TextUtil {

	
	/**
	 * 根据长度截取字符串 中英文截取后得到相同字节数的值
	 * @param str
	 * @param num
	 * @return
	 */
	public static String subStr(String str, int num) {   
	       int max = num;   
	       try {   
	           max = trimGBK(str.getBytes("GBK"),num);   
	       } catch (UnsupportedEncodingException e) {   
	           e.printStackTrace();   
	       }     
	       int sum = 0;   
	       if (str != null && str.length() > max) {   
	           StringBuilder sb = new StringBuilder(max);   
	           for (int i = 0; i < str.length(); i++) {   
	               int c = str.charAt(i);   
//	             if ((c & 0xff00) != 0)   
//	                 sum += 2;   
//	             else   
	                   sum += 1;   
	               if (sum <= max)   
	                   sb.append((char) c);   
	               else  
	                   break;   
	           }   
	           return sb.append("...").toString();   
	       } else  
	           return str != null ? str : "";   
	   }   
	      
	   private static int  trimGBK(byte[] buf,int n){     
	       int num = 0;     
	       boolean bChineseFirstHalf = false;   
	       if(buf.length < n )return buf.length;   
	       for(int i=0;i<n;i++)     
	       {     
	           if(buf[i]<0 && !bChineseFirstHalf){     
	               bChineseFirstHalf = true;     
	           }else{     
	               num++;     
	               bChineseFirstHalf = false;                   
	           }     
	       }     
	          
	       return num;     
	   }  	

	/**
	 * 删除字符串尾指定的字符
	 * 
	 * @param src
	 * @param endStr
	 * @return
	 */
	public static String delEndStr(String src, String endStr) {

		String tmp = src.trim();

		if (tmp.endsWith(endStr)) {

			return tmp.substring(0, tmp.length() - endStr.length());
		}

		return tmp;
	}

	/**
	 * 获取 UUID
	 * 
	 * @return
	 */
	public static String getUUID() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 判断字符串是否非空
	 * 
	 * @param text
	 * @return
	 */
	public static boolean isNotEmpty(String text) {

		return text != null && !"".equals(text) && !"null".equals(text)
				&& !"NULL".equals(text);
	}

	/**
	 * 判断字符串是否为空
	 * 
	 * @param text
	 * @return
	 */
	public static boolean isEmpty(String text) {
		return !isNotEmpty(text);
	}

	/**
	 * 变量名格式化
	 * 
	 * @param param
	 *            要格式化的字符串 PersonName 或 personName 转化为 person_name
	 * @return
	 */
	public static String camelToUnderline(String param) {
		if (param == null || "".equals(param.trim())) {
			return "";
		}
		int len = param.length();
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++) {
			char c = param.charAt(i);
			if (Character.isUpperCase(c)) {
				if (i != 0) {
					sb.append('_');
				}
				sb.append(Character.toLowerCase(c));
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}

	/**
	 * 反格式化变量名
	 * 
	 * @param param
	 *            要格式化的字符串
	 * @param flag
	 *            首字符是否需要大写 person_name 转化为 personName 或 PersonName
	 * @return
	 */
	public static String underlineToCamel(String param, boolean flag) {
		if (param == null || "".equals(param.trim())) {
			return "";
		}
		param = param.toLowerCase();
		int len = param.length();
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++) {
			char c = param.charAt(i);
			if (c == '_') {
				if (++i < len) {
					sb.append(Character.toUpperCase(param.charAt(i)));
				}
			} else {
				if (i == 0) {
					if (flag) {
						sb.append(Character.toUpperCase(c));
					} else {
						sb.append(Character.toLowerCase(c));
					}
				} else {
					sb.append(c);
				}
			}
		}
		return sb.toString();
	}
	
	/**
	 * 将字符串集合转换为sql字符串
	 * ps：转换结果例如：('str1','str2','str3')
	 * @param list
	 * @return
	 */
	public static String tansferListtoSqlString(Collection<String> list){
		if(list == null || list.size() == 0){
			//返回一个新的UUID 查询时不可能匹配到
			return " ('"+TextUtil.getUUID()+"') ";
		}
		//去重
		Set<String> set = new HashSet<String>();
		set.addAll(list);
		StringBuilder sb = new StringBuilder();		
		for(String str : set){
			if(TextUtil.isNotEmpty(str)){
				sb.append("'").append(str).append("'").append(",");
			}
		}
		//去逗号
		sb.deleteCharAt(sb.length() - 1);
		String str = " (" + sb.toString() + ") ";
		return str;
	}

	/**
	 * 字符串左补零
	 * 
	 * @param str
	 *            原始字符串
	 * @param length
	 *            补零后长度
	 * @return
	 */
	public static String addZeroForLeft(String str, int length) {
		while (str.length() < length) {
			StringBuffer sb = new StringBuffer();
			sb.append("0").append(str);
			str = sb.toString();
		}
		return str;
	}

	/**
	 * 字符串右补零
	 * 
	 * @param str
	 *            原始字符串
	 * @param length
	 *            补零后长度
	 * @return
	 */
	public static String addZeroForRight(String str, int length) {
		while (str.length() < length) {
			StringBuffer sb = new StringBuffer();
			sb.append(str).append("0");
			str = sb.toString();
		}
		return str;
	}

	/**
	 * 过滤字符串中的特殊字符
	 * 
	 * @param input
	 * @return
	 */
	public static String filter(String input) {
		return (input					
					.replaceAll("&",  "&#38")
					.replaceAll("\"", "&#34;")
					.replaceAll("'",  "&#39;")
					.replaceAll("<",  "&#60;")
					.replaceAll(">",  "&#62;")
				);
	}

	/**
	 * 反过滤
	 * 
	 * @param input
	 * @return
	 */
	public static String unFilter(String input) {
		return (input
					.replaceAll("&#62;", ">")
					.replaceAll("&#60;", "<")
					.replaceAll("&#39;", "'")
					.replaceAll("&#34;", "\"")					
					.replaceAll("&#38;", "&")
				);
	}

	/**
	 * 将 JDBC Blob 转换为 String <br/>
	 * 注意：只有 Blob 存储的内容为文本内容时才可执行该转换
	 * 
	 * @param blob
	 * @return
	 * @throws Exception
	 */
	public static String blob2String(Blob blob) throws Exception {

		StringBuilder content = new StringBuilder();

		InputStream is = blob.getBinaryStream();
		byte[] tmp = new byte[512];
		int len;
		while ((len = is.read(tmp)) != -1) {

			content.append(new String(tmp, 0, len));
		}

		return content.toString();
	}

	/**
	 * 将一个char字符转换位字节数组（2个字节），b[0]存储高位字符，大端
	 * 
	 * @param c
	 *            字符（java char 2个字节）
	 * @return 代表字符的字节数组
	 */
	public static byte[] charToBytes(char c) {
		byte[] b = new byte[8];
		b[0] = (byte) (c >>> 8);
		b[1] = (byte) c;
		return b;
	}

	/**
	 * 16进制转2进制
	 * 
	 * @param hexString
	 * @return
	 */
	public static String hexString2binaryString(String hexString) {
		if (hexString == null || hexString.length() % 2 != 0)
			return null;
		String bString = "", tmp;
		for (int i = 0; i < hexString.length(); i++) {
			tmp = "0000"
					+ Integer.toBinaryString(Integer.parseInt(
							hexString.substring(i, i + 1), 16));
			bString += tmp.substring(tmp.length() - 4);
		}
		return bString;
	}

	/**
	 * 2进制转16进制
	 * 
	 * @param bString
	 * @return
	 */
	public static String binaryString2hexString(String bString) {
		if (bString == null || bString.equals("") || bString.length() % 8 != 0)
			return null;
		StringBuffer tmp = new StringBuffer();
		int iTmp = 0;
		for (int i = 0; i < bString.length(); i += 4) {
			iTmp = 0;
			for (int j = 0; j < 4; j++) {
				iTmp += Integer.parseInt(bString.substring(i + j, i + j + 1)) << (4 - j - 1);
			}
			tmp.append(Integer.toHexString(iTmp));
		}
		return tmp.toString();
	}

	/**
	 * 将 16 进制转换为二进制
	 * 
	 * @param hexStr
	 * @return
	 */
	public static byte[] hexString2binary(String hexStr) {

		if (hexStr.length() < 1) {

			return null;
		}

		byte[] result = new byte[hexStr.length() / 2];
		for (int i = 0; i < hexStr.length() / 2; i++) {

			int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
			int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2),
					16);
			result[i] = (byte) (high * 16 + low);
		}

		return result;
	}

	/**
	 * 将二进制转换成 16 进制
	 * 
	 * @param data
	 * @return
	 */
	public static String binary2hexString(byte data[]) {

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < data.length; i++) {
			String hex = Integer.toHexString(data[i] & 0xFF);
			if (hex.length() == 1) {
				hex = '0' + hex;
			}
			sb.append(hex.toUpperCase());
		}

		return sb.toString();
	}

	/**
	 * 获取异常信息
	 * 
	 * @param ex
	 * @return
	 */
	public static String getExceptionDetails(Throwable ex) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		ex.printStackTrace(pw);
		pw.flush();
		sw.flush();
		return sw.toString();
	}
	
	/**
	 * 获取request中的map
	 * @param request
	 * @return
	 */
	public static Map<String,String> getParameterMap(HttpServletRequest request) {  
	    // 参数Map  
	    Map<String,String[]> properties = request.getParameterMap();
	    // 返回值Map  
	    Map<String,String> returnMap = new HashMap<String,String>();  
	    Iterator<Entry<String, String[]>> entries = properties.entrySet().iterator();  
	    Map.Entry<String,String[]> entry;  
	    String name = "";  
	    String value = "";  
	    while (entries.hasNext()) {  
	    	value = "";
	        entry = (Map.Entry<String,String[]>) entries.next();  
	        name = (String) entry.getKey();  
	        Object valueObj = entry.getValue();  
	        if(null == valueObj){  
	            value = "";  
	        }else if(valueObj instanceof String[]){  
	            String[] values = (String[])valueObj;  
	            for(int i=0;i<values.length;i++){  
	                value += values[i] + ",";  
	            }  
	            value = value.substring(0, value.length()-1);  
	        }else{  
	            value = valueObj.toString();  
	        }  
	        returnMap.put(name, value);  
	    }  
	    return returnMap;  
	}  
	
	/**
	 * 获取客户端的真实IP地址
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ipAddress = null;
		// ipAddress = this.getRequest().getRemoteAddr();
		ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}

		}

		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
															// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}

    /**
     * 去除html标签
     * @param htmlStr
     * @return
     */
    public static String delHTMLTag(String htmlStr){ 
        String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式 
        String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式 
        String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式 
         
        Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
        Matcher m_script=p_script.matcher(htmlStr); 
        htmlStr=m_script.replaceAll(""); //过滤script标签 
         
        Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
        Matcher m_style=p_style.matcher(htmlStr); 
        htmlStr=m_style.replaceAll(""); //过滤style标签 
         
        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
        Matcher m_html=p_html.matcher(htmlStr); 
        htmlStr=m_html.replaceAll(""); //过滤html标签 

        return htmlStr.trim(); //返回文本字符串 
    }

}