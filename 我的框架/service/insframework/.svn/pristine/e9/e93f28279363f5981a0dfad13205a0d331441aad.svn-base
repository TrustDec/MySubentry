package com.insframework.component.service.file.doc;

import java.io.File;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.insframework.component.service.file.doc.bean.DocBean;
import com.jacob.com.ComThread;

@Component
public class DocTanferService {
	
	Logger logger = Logger.getLogger(DocTanferService.class);
	
	private final String PDF_SERVICE = "Acrobat.exe";
	
	// 直接调用这个方法即可
	public DocBean tranfer(String inputFile, String inputUrl) {
		
		int pos = inputFile.lastIndexOf(".");
		String suffix = inputFile.substring(pos + 1).toLowerCase();
		String notSuffix = inputFile.substring(0, pos);
		
		int posUrl = inputUrl.lastIndexOf(".");
		String urlNotSuffix = inputUrl.substring(0, posUrl);
		
		File file = new File(inputFile);
		if (!file.exists()) {
			logger.error("文件不存在！");
			return null;
		}
		DocBean docbean = new DocBean(); 
		try{	
			
			ComThread.InitSTA();
			
			boolean flag = false;
			
			//先结束进程
			Runtime.getRuntime().exec("taskkill /F /IM " + PDF_SERVICE);  
			Thread.sleep(1500);
			File hasFile = null;
			//源文件不是pdf先删除
			if (!suffix.equalsIgnoreCase("pdf")) {
				hasFile = new File(notSuffix + ".pdf");
				if(hasFile.exists()){				
					hasFile.delete();
				}
			}
			
			if(suffix.equals("doc") || suffix.equals("docx")
					|| suffix.equals("txt")) {				
				flag = OfficeTool.word2PDF(inputFile, notSuffix + ".pdf");
			} else if (suffix.equals("ppt") || suffix.equals("pptx")) {
				flag = OfficeTool.ppt2PDF(inputFile, notSuffix + ".pdf");
			} else if (suffix.equals("xls") || suffix.equals("xlsx")) {
				flag = OfficeTool.excel2PDF(inputFile, notSuffix + ".pdf");
			}else if(suffix.equals("xls") || suffix.equals("pdf")) {				
				flag = true;
			} else {
				System.out.println("文件格式不支持转换!");				
				
			}				
			
		
			Thread.sleep(1500);
			
			if(flag){
				//有可能转换失败（返回成功但是硬盘上没有此文件），所以在判断一次
				File checkFile = new File(notSuffix + ".pdf");
				if(checkFile.exists()){
					docbean.setPdfUrl(urlNotSuffix + ".pdf");				
				}else{
					docbean = null;
					return docbean;
				}
				
			}else{
				docbean = null;
				return docbean;
			}
			
			
			//先删除
			hasFile = new File(notSuffix + ".pdf.swf");
			if(hasFile.exists()){
				hasFile.delete();
			}
			//将pdf转为swf			
			flag = Print2FlashTool.toSwf(notSuffix + ".pdf");
			
			Thread.sleep(1500);
			
			if(flag){
				//有可能转换失败（返回成功但是硬盘上没有此文件），所以在判断一次
				File checkFile = new File(notSuffix + ".pdf.swf");				
				if(checkFile.exists()){
					docbean.setSwfUrl(urlNotSuffix + ".pdf.swf");		
				}else{
					docbean = null;
					return docbean;
				}				
					
			}else{
				docbean = null;
				return docbean;
			}
		}catch(Exception ex){
			logger.error("转换出错", ex);
			docbean = null;
			return docbean;
		}finally{			
			ComThread.Release();
			
			//先结束进程
			try {
				Runtime.getRuntime().exec("taskkill /F /IM " + PDF_SERVICE);
				Thread.sleep(500);
			} catch (Exception e) {				
				e.printStackTrace();
			}  
			
			
		}
		
		return docbean;		
	}
	
	
}
