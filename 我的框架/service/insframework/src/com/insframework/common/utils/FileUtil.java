package com.insframework.common.utils;




import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * 文件处理工具类
 * @author guom
 *
 */
public class FileUtil {
	
	
	/**
	 * 获取资源配置文件
	 * @param path
	 * @return
	 */
	public static Properties getProperties(String path){
		Properties prop = new Properties();
		try {
			InputStream in = FileUtil.class.getResourceAsStream(path);
			prop.load(in);
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
		return prop;
	}
	
	/**
	 * 获取文件拓展名（不包含 .）
	 * 
	 * @param fileName
	 * @return
	 */
	public static String getFileExtName(String fileName){
		
		if(fileName != null){
			
			int posi = fileName.lastIndexOf(".");
			
			return fileName.substring(posi + 1).toLowerCase();
		}
		
		return null;
	}
	
	
	/**
	 * 依据原始文件名生成新文件名
	 * @return
	 */
	public static String getName(String fileName) {
		Random random = new Random();
		return "" + System.currentTimeMillis()
				+ random.nextInt(10000) + "." + getFileExtName(fileName);
	}
	
	
	/**
	 * 文件类型判断
	 * 
	 * @param fileName
	 * @return
	 */
	public static boolean checkFileType(String fileName, String[] types) {
		Iterator<String> type = Arrays.asList(types).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 创建目录
	 * @param dir
	 */
	public static void mkDirs(String dir){
		File file = new File(dir);
		if(!file.isDirectory()){
			file.mkdirs();
		}		
	}
	
	/**
     * 从流中获取字符数据
     * @param in
     * @return
     * @throws IOException
     */
    public static String loadStream(InputStream in) throws IOException{         
        StringBuffer sb = new StringBuffer();
    	BufferedReader bf = new BufferedReader(new InputStreamReader(in)); 
    	String value = "";
    	while((value = bf.readLine()) != null){
    		sb.append(value);
    	}    	
    	return sb.toString();  
    }  
    
    /**
     * 使用response流输出图片
     * @param response
     * @param is
     */
    public static void writeImage(HttpServletResponse response, InputStream is) throws Exception{
    	response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream responseOutputStream = response.getOutputStream();
		transfer(is, responseOutputStream);
		responseOutputStream.flush();
		responseOutputStream.close();		
    }
	
	/**
	 * 输入输出流转换
	 * @param in
	 * @param out
	 * @return
	 * @throws IOException
	 */
	public static int transfer(InputStream in, OutputStream out)
			throws IOException {
		int total = 0;
		byte[] buffer = new byte[4096];
		int bytesRead = in.read(buffer);
		while (bytesRead != -1) {
			out.write(buffer, 0, bytesRead);
			total += bytesRead;
			bytesRead = in.read(buffer);
		}
		return total;
	}	
	
	/**
	 * 字节数组转InputStream
	 * @param buf
	 * @return
	 */
	public static final InputStream byte2Input(byte[] buf) {  
        return new ByteArrayInputStream(buf);  
    }  
	
	/**
	 * InputStream 转字节数组
	 * @param inStream
	 * @return
	 * @throws IOException
	 */
    public static final byte[] input2byte(InputStream inStream)  
            throws IOException {  
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();  
        byte[] buff = new byte[4096];  
        int bytesRead = inStream.read(buff);  
        while(bytesRead != -1){
        	swapStream.write(buff, 0, bytesRead);
        	bytesRead = inStream.read(buff);  
        }       
        return swapStream.toByteArray();  
    }  
	  

}
