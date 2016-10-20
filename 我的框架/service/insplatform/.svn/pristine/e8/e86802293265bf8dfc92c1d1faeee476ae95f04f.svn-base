package com.insplatform.mobile.question;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insframework.system.curruser.CurrentUser;
import com.insplatform.mobile.BaseMobileController;
import com.insplatform.module.bbs.question.service.BbsQuestionService;

@Controller("BbsQuestionControllerMobile")
@RequestMapping("/mobile/rest/bbs/question")
public class BbsQuestionController extends BaseMobileController {

	@Autowired
	private BbsQuestionService bbsQuestionService;

	/**
	 * 加载数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllList")
	public @ResponseBody
	Map<String, Object> loadAllList(HttpServletRequest request,
			HttpServletResponse response) {
		String type = request.getParameter("type");
		String idx = request.getParameter("idx");
		return this.getMessager().data(
				bbsQuestionService.loadAllListMobile(type, idx));
	}

	/**
	 * 加载详细数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllListInfo")
	public @ResponseBody
	Map<String, Object> loadAllListInfo(HttpServletRequest request,
			HttpServletResponse response) {
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		String id = request.getParameter("id");
		return this.getMessager().data(
				bbsQuestionService.loadAllListInfoMobile(user.getId(), id));
	}

	/**
	 * 加载评论详细数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllCommentInfo")
	public @ResponseBody
	Map<String, Object> loadAllCommentInfo(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		return this.getMessager().data(
				bbsQuestionService.loadAllCommentInfoMobile(id));
	}

	/**
	 * 根据查询条件查询问题
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadSearchList")
	public @ResponseBody
	Map<String, Object> loadSearchList(HttpServletRequest request,
			HttpServletResponse response) {
		String info = request.getParameter("info");
		String idx = request.getParameter("idx");
		String index = request.getParameter("index");
		return this.getMessager().data(
				bbsQuestionService.loadSearchListMobile(index, idx, info));
	}

	/**
	 * 新增提问
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addQuestion")
	public @ResponseBody
	Map<String, Object> addQuestion(HttpServletRequest request,
			HttpServletResponse response) {
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");
		bbsQuestionService.addQuestionMobile(title, user.getId(), comment);
		return this.getMessager().success();
	}

	/**
	 * 新增回答
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addAnswer")
	public @ResponseBody
	Map<String, Object> addAnswer(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		String comment = request.getParameter("comment");
		bbsQuestionService.addAnswerMobile(user.getId(), id, comment);
		return this.getMessager().success();
	}

	/**
	 * 新增回答回复
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addAnswerHF")
	public @ResponseBody
	Map<String, Object> addAnswerHF(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		String comment = request.getParameter("comment");
		bbsQuestionService.addAnswerHFMobile(id, user.getId(), comment);
		return this.getMessager().success();
	}

	/**
	 * 更改关注
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/changeHeart")
	public @ResponseBody
	Map<String, Object> changeHeart(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		bbsQuestionService.changeHeartMobile(user.getId(), type, id);
		return this.getMessager().success();
	}

	@RequestMapping("/loadAllIAsk")
	public @ResponseBody
	Map<String, Object> loadAllIAsk(HttpServletRequest request,
			HttpServletResponse response) {
		String type = request.getParameter("type");
		String idx = request.getParameter("idx");
		CurrentUser user = this.getCurrentUserMobile(request);
		return this.getMessager().data(
				bbsQuestionService.loadAllIAskMobile(type, user.getId(), idx));
	}

}
