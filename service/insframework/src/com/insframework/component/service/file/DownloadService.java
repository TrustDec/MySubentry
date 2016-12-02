package com.insframework.component.service.file;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.insframework.common.utils.FileUtil;



/**
 * 下载组件
 * @author guom
 *
 */
@Component
public class DownloadService {
	
	Logger logger = Logger.getLogger(DownloadService.class);	
	
	/**
	 * 下载文件	
	 * @param filePath 文件路径
	 * @param response
	 * @throws Exception
	 */
	public void downloadFile(String filePath, HttpServletResponse response){		
		downloadFile(filePath, null, response);
	}
	

	/**
	 * 下载文件 	 
	 * @param filePath
	 *            文件路径
	 * @param newFileName
	 *            下载文件名称（包含扩展名）
	 * @param response
	 * @throws Exception
	 */
	public void downloadFile(String filePath, String newFileName,
			HttpServletResponse response){
		InputStream is = null;
		OutputStream os = null;
		try{
			File file = new File(filePath);
			String fileName = newFileName == null ? file.getName() : newFileName;					
			String finalFileName = new String(fileName.getBytes("utf-8"), "iso8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ finalFileName + "\"");		
			response.setHeader("charset", "utf-8");
			response.setHeader("Content-Length", String.valueOf(file.length()));
			is = new FileInputStream(file);	
			os = response.getOutputStream();		
			FileUtil.transfer(is, os);		
			os.flush();
		}catch(Exception ex){
			
		}finally{
			if(is != null){
				try {
					is.close();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}
			if(os != null){				
				try {
					os.close();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}				
		}
		
	}
	
	
	/**
	 * 从互联网url下载文件
	 * @param url
	 * @param newFileName
	 * @param localPath
	 * @throws Exception
	 */
	public void downloadFileByNet(String url, String localPath){
		//String fileName = url.substring(url.lastIndexOf("/") + 1, url.length());	
		InputStream is = null;  
		OutputStream os = null; 		
		try{
			URL uri = new URL(url); 
			is = uri.openStream();  
			os = new FileOutputStream(new File(localPath)); 
			FileUtil.transfer(is, os);
			is.close();
			os.flush();
			os.close();
		}catch( Exception ex){
			
		}finally {
			if(is != null){
				try {
					is.close();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}
			if(os != null){				
				try {
					os.close();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}			
		}
		
	}	
}
