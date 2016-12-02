package com.insplatform.mobile;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.insframework.system.curruser.CurrentUser;

@RestController
@RequestMapping("/mobile/rest/test")
public class TestController extends BaseMobileController{	
	
	@RequestMapping("/add")
	public Map<String, Object> add(HttpServletRequest request){
		
		CurrentUser user = this.getCurrentUserMobile(request);
		System.out.println(user);
		return null;
	}
	
}
