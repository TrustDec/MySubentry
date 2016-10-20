package com.insplatform.mobile.accidentcase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insplatform.mobile.BaseMobileController;
import com.insplatform.module.accidentcase.service.AccidentCaseService;

@Controller("AccidentCaseControllerMobile")
@RequestMapping("/mobile/rest/accidentcase")
public class AccidentCaseController extends BaseMobileController {

	@Autowired
	private AccidentCaseService accidentCaseService;

	@RequestMapping("/loadAccidentCaseList")
	public @ResponseBody
	Map<String, Object> loadAccidentCaseListMobile(HttpServletRequest request,
			HttpServletResponse response) {
		String idx = request.getParameter("idx");
		return this.getMessager().data(
				accidentCaseService.loadAccidentCaseListMobile(idx));
	}

	@RequestMapping("/loadAccidentCase")
	public @ResponseBody
	Map<String, Object> loadAccidentCaseMobile(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		return this.getMessager().data(
				accidentCaseService.loadAccidentCaseMobile(id));
	}
}
