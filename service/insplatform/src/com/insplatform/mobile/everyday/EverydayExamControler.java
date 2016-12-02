package com.insplatform.mobile.everyday;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insframework.system.curruser.CurrentUser;
import com.insplatform.mobile.BaseMobileController;
import com.insplatform.module.everyday.service.EverydaySettingService;

@Controller
@RequestMapping("/mobile/rest/everydayexam")
public class EverydayExamControler extends BaseMobileController {

	@Autowired
	private EverydaySettingService everydaySettingService;

	@RequestMapping("/checkHasTodayExam")
	public @ResponseBody
	Map<String, Object> checkHasTodayExam(HttpServletRequest request) {
		String date = request.getParameter("date");
		CurrentUser user = this.getCurrentUserMobile(request);
		return this.getMessager().data(
				everydaySettingService.checkHasTodayExam(user.getId(), date));
	}

	@RequestMapping("/loadTodayExam")
	public @ResponseBody
	Map<String, Object> loadTodayExam(HttpServletRequest request) {
		String date = request.getParameter("date");
		return this.getMessager().data(
				everydaySettingService.loadTodayExam(date));
	}

	@RequestMapping("/addCurrentRecourse")
	public @ResponseBody
	Map<String, Object> addCurrentRecourse(HttpServletRequest request) {
		CurrentUser user = this.getCurrentUserMobile(request);
		String settingId = request.getParameter("SettingId");
		String myAnswer = request.getParameter("MyAnswer");
		String isRight = request.getParameter("IsRight");
		return this.getMessager().data(
				everydaySettingService.addCurrentRecourse(user.getId(),
						settingId, myAnswer, isRight));
	}

	@RequestMapping("/loadMyEverydayExam")
	public @ResponseBody
	Map<String, Object> loadMyEverydayExam(HttpServletRequest request) {
		CurrentUser user = this.getCurrentUserMobile(request);
		String idx = request.getParameter("idx");
		return this.getMessager().data(
				everydaySettingService.loadMyEverydayExam(user.getId(), idx));
	}

	@RequestMapping("/loadMyEverydayExamInfo")
	public @ResponseBody
	Map<String, Object> loadMyEverydayExamInfo(HttpServletRequest request) {
		CurrentUser user = this.getCurrentUserMobile(request);
		String id = request.getParameter("id");
		return this.getMessager()
				.data(everydaySettingService.loadMyEverydayExamInfo(
						user.getId(), id));
	}
}
