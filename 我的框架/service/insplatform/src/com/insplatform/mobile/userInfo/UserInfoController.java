package com.insplatform.mobile.userInfo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insframework.system.curruser.CurrentUser;
import com.insplatform.mobile.BaseMobileController;
import com.insplatform.system.user.service.UserService;

@Controller
@RequestMapping("/mobile/rest")
public class UserInfoController extends BaseMobileController{

	@Autowired
	private UserService userService; 
	
	@RequestMapping("/loadUserInfo")
	public @ResponseBody
	Map<String, Object> loadUserInfo(HttpServletRequest request,
			HttpServletResponse response) {
		CurrentUser user = this.getCurrentUserMobile(request);
		return this.getMessager().data(
				userService.load(user.getId()));
	}
}
