package com.insplatform.mobile.article;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insframework.system.curruser.CurrentUser;
import com.insframework.system.map.Condition;
import com.insplatform.mobile.BaseMobileController;
import com.insplatform.module.bbs.article.service.BbsArticleService;

@Controller("BbsArticleControllerMobile")
@RequestMapping("/mobile/rest/bbs/article")
public class BbsArticleController extends BaseMobileController {

	@Autowired
	private BbsArticleService bbsArticleService;

	/**
	 * 加载标题
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadArticleTitle")
	public @ResponseBody
	Map<String, Object> loadArticleTitle(HttpServletRequest request,
			HttpServletResponse response) {
		Condition condition = this.getCondition(request);
		return this.getMessager().data(
				bbsArticleService.loadArticleTitleMobile(condition));
	}

	
	
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
				bbsArticleService.loadAllListMobile(type,idx));
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
		CurrentUser user = this.getCurrentUserMobile(request);
		String id = request.getParameter("id");
		return this.getMessager().data(
				bbsArticleService.loadAllListInfoMobile(id,user.getId()));
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
				bbsArticleService.loadAllCommentInfoMobile(id));
	}

	/**
	 * 新增回复
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addComment")
	public @ResponseBody
	Map<String, Object> addComment(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		String comment = request.getParameter("comment");
		System.out.println(comment);
		bbsArticleService.addCommentMobile(user.getId(),id,comment);
		return this.getMessager().success();
	}
	
	/**
	 * 新增回复评论
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addCommentHF")
	public @ResponseBody
	Map<String, Object> addCommentHF(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		String comment = request.getParameter("comment");
		System.out.println(comment);
		bbsArticleService.addCommentHFMobile(user.getId(),id,comment);
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
		bbsArticleService.changeHeartMobile(user.getId(),type,id);
		return this.getMessager().success();
	}
	
	/**
	 * 我的文章
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadArticleAsI")
	public @ResponseBody
	Map<String, Object> loadArticleAsI(HttpServletRequest request,
			HttpServletResponse response) {
		String type = request.getParameter("type");
		String idx = request.getParameter("idx");
		CurrentUser user = this.getCurrentUserMobile(request);// 获取当前用户
		return this.getMessager().data(bbsArticleService.loadArticleAsIMobile(user.getId(),type,idx));
	}

}
