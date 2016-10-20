package com.insframework.system.file;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insframework.common.utils.TextUtil;
import com.insframework.component.service.file.bean.FileBean;
import com.insframework.system.base.controller.BaseController;

@Controller
@RequestMapping("/file")
public class FileController extends BaseController{
	
	/**
	 * 上传文件
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/upload")
	public @ResponseBody Map<String, Object> upload(HttpServletRequest request) throws Exception{
		//文件input框的name
		String fileName = request.getParameter("fileName");
		//上传类型
		String type = request.getParameter("fileType");
		FileBean fileBean = null;
		if(TextUtil.isNotEmpty(type)){
			//根据上传类型上传到不同的目录
			if("temp".equals(type.toLowerCase())){
				fileBean = uploadService.uploadByTemp(uploadService.getMultipartFile(request, fileName));
			}else{
				fileBean = uploadService.uploadFile(uploadService.getMultipartFile(request, fileName));
			}
		}else{
			fileBean = uploadService.uploadFile(uploadService.getMultipartFile(request, fileName));
		}		
		if(fileBean != null){
			return this.getMessager().success().put("url", fileBean.getUrl()).put("path", fileBean.getPath());
		}else{
			return this.getMessager().error();
		}
	}
	
}
