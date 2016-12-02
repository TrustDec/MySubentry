package com.insframework.component.controller.captcha;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.insframework.common.utils.CaptchaUtil;
import com.insframework.system.base.controller.BaseController;

/**
 * 生成验证码
 * @author guom
 */
@Controller
@RequestMapping("captcha")
public class CaptchaController extends BaseController{
	
	@RequestMapping("generate")
	public void generate(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream responseOutputStream = response.getOutputStream();
		String code = CaptchaUtil.generateVerifyCode(4);
		request.getSession().setAttribute("CAPTCHA", code);
		int width = 200, height = 80;
		CaptchaUtil.outputImage(width, height, responseOutputStream, code);
		responseOutputStream.flush();
		responseOutputStream.close();				
	}
		
}
