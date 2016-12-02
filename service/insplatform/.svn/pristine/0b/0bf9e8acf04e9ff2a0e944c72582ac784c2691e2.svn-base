package com.insplatform.mobile.JPush;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insframework.common.utils.JPush;
import com.insplatform.mobile.BaseMobileController;

@Controller
@RequestMapping("/mobile/rest/JPush")
public class JPushController extends BaseMobileController {

	/**
	 * 极光推送的根据包名生成的ID(这个id的包名是com.SD_PRO.SD_PRO 这个包名仅仅测试适用)
	 */
	private final String APPKEY = "e5ec9fc33e0f8870d3f8bbe1";
	private final String MASTERSECRET = "e5ec9fc33e0f8870d3f8bbe1";

	/**
	 * 调用极光推送全部推送的方法 返回的是一个Map 发送成功返回发送的id和发送的no
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/sendMessage")
	public @ResponseBody
	Map<String, Object> sendMessage(HttpServletRequest request) {
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		Map<String, String> map = new HashMap<String, String>();
		return this.getMessager().data(
				JPush.SendPush(APPKEY, MASTERSECRET, content, title, map));
	}

}
