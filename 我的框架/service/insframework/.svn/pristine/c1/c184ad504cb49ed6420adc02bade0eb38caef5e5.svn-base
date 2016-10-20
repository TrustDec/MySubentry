package com.insframework.component.service.file;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.insframework.common.utils.FileUtil;
import com.insframework.component.service.file.bean.FileBean;
import com.insframework.system.context.App;


/**
 * 上传组件
 * @author guom
 *
 */
@Component
public class UploadService {
	
	Logger logger = Logger.getLogger(UploadService.class);	
	
	/**
	 * 上传普通附件
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public FileBean uploadFile(MultipartFile file) throws Exception{
		String basePath = App.FILE_SYS + File.separatorChar + "simple";
		String baseUrl = App.FILE_SYS_URL + "/" + "simple";
		return this.saveFile(file, basePath, baseUrl, true);		
	}
	
	/**
	 * 上传文件到临时目录
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public FileBean uploadByTemp(MultipartFile file) throws Exception{
		String basePath = App.FILE_SYS + File.separatorChar + "temp";
		String baseUrl = App.FILE_SYS_URL + "/" + "temp";
		return this.saveFile(file, basePath, baseUrl, false);
	}
	
	/**
	 * 上传文件到视频目录
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public FileBean uploadByVideo(MultipartFile file)throws Exception{
		String basePath = App.FILE_SYS + File.separatorChar + "video";
		String baseUrl = App.FILE_SYS_URL + "/" + "video";
		return this.saveFile(file, basePath, baseUrl, true); 
	}
	
	/**
	 * 上传文件到文档目录
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public FileBean uploadByDoc(MultipartFile file)throws Exception{
		String basePath = App.FILE_SYS + File.separatorChar + "doc";
		String baseUrl = App.FILE_SYS_URL + "/" + "doc";	
		return this.saveFile(file, basePath, baseUrl, true); 
	}
	
	/**
	 * 上传文件到文本编辑器目录
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public FileBean uploadByUeditor(MultipartFile file) throws Exception{
		String basePath = App.FILE_SYS + File.separatorChar + "ueditor";
		String baseUrl = App.FILE_SYS_URL + "/" + "ueditor";
		return this.saveFile(file, basePath, baseUrl, true);
	}
	
	/**
	 * 获取上传文件
	 * @param request
	 * @param name
	 * @return
	 */
	public MultipartFile getMultipartFile(HttpServletRequest request, String name) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;		
		Map<String,MultipartFile> fileMap = multipartRequest.getFileMap();
		MultipartFile mFile = (MultipartFile) fileMap.get(name);
		return mFile;
	}
	
	/**
	 * 获取上传文件列表
	 * @param request
	 * @param name
	 * @return
	 */
	public List<MultipartFile> getMultipartFiles(HttpServletRequest request, String name) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;		
		return multipartRequest.getFiles(name);
	}	
	
	/**
	 * 保存上传文件
	 * @param file				文件
	 * @param basePath			基础路径
	 * @param baseUrl			基础相对url
	 * @param useTimeDir		是否创建时间目录
	 * @return
	 * @throws Exception
	 */
	private FileBean saveFile(MultipartFile file, String basePath, String baseUrl, boolean useTimeDir) throws Exception{
		
		String fileName = FileUtil.getName(file.getOriginalFilename());
		String path = "";
		String url = "";
		try{
			if(useTimeDir){
				SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
				String dir = formater.format(new Date());
				path = basePath + File.separatorChar + dir + File.separatorChar + fileName;
				url = baseUrl + "/" + dir + "/" +  fileName;	
				FileUtil.mkDirs(basePath + File.separator + dir);
			}else{
				path = basePath + File.separatorChar + fileName;
				url = baseUrl + "/" + fileName;	
				FileUtil.mkDirs(basePath);
			}		
			this.saveMultipartFile(file, path);
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		FileBean fileBean = new FileBean();
		fileBean.setPath(path);
		fileBean.setUrl(url);
		return fileBean;
		
	}
	
	
	/**
	 * 保存上传文件
	 * @param file
	 * @param path
	 * @throws Exception
	 */
	private void saveMultipartFile(MultipartFile file, String path) throws Exception{
		file.transferTo(new File(path));
	}

}
