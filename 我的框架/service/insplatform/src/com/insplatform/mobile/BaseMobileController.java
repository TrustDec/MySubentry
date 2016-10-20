package com.insplatform.mobile;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.insframework.system.base.controller.BaseController;
import com.insframework.system.curruser.CurrentUser;
import com.insplatform.system.login.service.LoginService;

public class BaseMobileController extends BaseController{
	
	@Autowired
	private LoginService loginService;
	
	public CurrentUser getCurrentUserMobile(HttpServletRequest request){	
//		return 	loginService.getCurrentUserById(request, "CURRENT_USER_ID", true);
		return 	loginService.getCurrentUserById(request, request.getParameter("CURRENT_USER_ID"), true);
	}
	
}
