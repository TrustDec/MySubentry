package com.insplatform.mobile.exam;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insplatform.mobile.BaseMobileController;
import com.insplatform.module.examination.service.ExaminationService;

@Controller
@RequestMapping("/mobile/rest/exam")
public class MobileExamController extends BaseMobileController{
	
	@Autowired
	private ExaminationService examinationService;
	
	
	/**
	 * 加载试题练习列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadExamList")
	public @ResponseBody Map<String, Object> loadExamList(
			HttpServletRequest request, HttpServletResponse response){
		String userId = this.getCurrentUserMobile(request).getId();
		String page = request.getParameter("page");
		return this.getMessager().data(examinationService.loadExamListFromMobil(page, userId));
	}
	
	/**
	 * 获取试卷信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getExamDetail")
	public @ResponseBody Map<String, Object> getExamDetail(
			HttpServletRequest request, HttpServletResponse response){
		String examId = request.getParameter("examId");
		return this.getMessager().data(examinationService.getExamDetailFromMobile(examId));
	}
}
