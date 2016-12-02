package com.insplatform.mobile.course;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insframework.common.utils.TextUtil;
import com.insplatform.mobile.BaseMobileController;
import com.insplatform.module.course.course.service.CourseService;
import com.insplatform.module.course.courseworktype.service.CourseWorktypeService;
import com.insplatform.module.question.service.QuestionAnswerService;
import com.insplatform.module.resource.service.ResourceService;

@Controller
@RequestMapping("/mobile/rest/course")
public class MobileCourseController extends BaseMobileController{
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CourseWorktypeService courseWorktypeService;
	
	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private QuestionAnswerService questionAnswerService;
	
	/**
	 * 首页课程列表加载
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/homeCourse")
	public @ResponseBody Map<String, Object> loadHomeCourse(
			HttpServletRequest request, HttpServletResponse response){
		return this.getMessager().data(courseService.loadHomeCourseFromMobile());
	}
	
	/**
	 * 根据课程id查询课程详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/courseDetail")
	public @ResponseBody Map<String, Object> loadCourseDetail(
			HttpServletRequest request, HttpServletResponse response){
		String courseId = request.getParameter("courseId");
		Map<String, Object> course = courseService.loadCourseDetailFromMobile(courseId);
		List<Map<String, Object>> worktypes = courseWorktypeService.loadCourseWorktypes(courseId);
		List<Map<String, Object>> kpointResourceList = resourceService.loadCourseResource(courseId);
		boolean hasFocusCourse = courseService.hasFocusCourse(this.getCurrentUserMobile(request).getId(), courseId);
		boolean hasStudyedCourse = courseService.hasStudyedCourse(this.getCurrentUserMobile(request).getId(), courseId);
		return this.getMessager().success().put("course", course)
										   .put("worktypes", worktypes)
										   .put("kpointResourceList", kpointResourceList)
										   .put("hasFocusCourse", hasFocusCourse == true ? "Y" : "N")
										   .put("hasStudyedCourse", hasStudyedCourse == true ? "Y" : "N");
		
	}
	
	/**
	 * 用户点击关注课程
	 * @param request
	 * @return
	 */
	@RequestMapping("/collectCourse")
	public @ResponseBody Map<String, Object> focuseCourse(HttpServletRequest request){
		String type = request.getParameter("type");
		String courseId = request.getParameter("courseId");
		String userId = this.getCurrentUserMobile(request).getId();
		if(TextUtil.isNotEmpty(type) && TextUtil.isNotEmpty(courseId)){
			courseService.updateFocuseCourse(userId, courseId, type);			
		}
		return this.getMessager().success();
	}
	
	/**
	 * 添加用户学习过的课程
	 * @param request
	 * @return
	 */
	@RequestMapping("/studyedCourse")
	public @ResponseBody Map<String, Object> studyedCourse(HttpServletRequest request){		
		String courseId = request.getParameter("courseId");
		String resourceId = request.getParameter("resourceId");
		String resourceType = request.getParameter("resourceType");
		String userId = this.getCurrentUserMobile(request).getId();		
		courseService.updateStudyedCourse(userId, courseId);	
		resourceService.updateStudyedResource(userId, resourceId, resourceType);
		return this.getMessager().success();
	}
	
	/**
	 * 加载全部课程
	 * @param request
	 * @return
	 */
	@RequestMapping("/loadAllCourseList")
	public @ResponseBody Map<String, Object> loadAllCourseList(HttpServletRequest request){
		String userId = this.getCurrentUserMobile(request).getId();	
		return courseService.loadAllListFromMobile(request,userId);			
	}
	
	/**
	 * 加载课程列表的查询条件
	 * @param request
	 * @return
	 */
	@RequestMapping("/loadCourseListCondition")
	public @ResponseBody Map<String, Object> loadCourseListCondition(HttpServletRequest request){
		String id = request.getParameter("id");
		String tip = request.getParameter("tip");
		return courseService.loadListConditionFromMobile(id, tip);			
	}
	
	/**
	 * 点击课程目录加载资源详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadDetail")
	public @ResponseBody Map<String, Object> loadDetail(HttpServletRequest request){		
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		return resourceService.load(id, type);
	}
	
	/**
	 * 获取试题答案及选项
	 * @param id
	 * @return
	 */
	@RequestMapping("/loadAnswer")
	public @ResponseBody Map<String, Object> loadAnswer(@RequestParam("id") String id){
		List<Map<String, Object>> answer = questionAnswerService.loadAnswerByQueId(id);		
		return this.getMessager().success().put("answer", answer);
	}

	/**
	 * 根据课程资源id加载资源评论
	 * @param request
	 * @return
	 */
	@RequestMapping("/loadCommentByResourceId")
	public @ResponseBody Map<String, Object> loadCommentByResourceId(HttpServletRequest request){			
		String id = request.getParameter("id");		
		return this.getMessager().success().put("list", resourceService.loadCommentByResourceIdFromMobile(id));
	} 
	
	/**
	 * 根据课程资源id加载资源笔记
	 * @param request
	 * @return
	 */
	@RequestMapping("/loadNoteByResourceId")
	public @ResponseBody Map<String, Object> loadNoteByResourceId(HttpServletRequest request){			
		String id = request.getParameter("id");		
		return this.getMessager().success().put("list", resourceService.loadNoteByResourceIdFromMobile(id, this.getCurrentUserMobile(request).getId()));
	} 
	
	/**
	 * 保存资源评论
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveComment")
	public @ResponseBody Map<String, Object> saveComment(HttpServletRequest request){	
		String content = request.getParameter("content");
		String resourceId = request.getParameter("resourceId");
		String userId = this.getCurrentUserMobile(request).getId();
		String userName = this.getCurrentUserMobile(request).getName();
		resourceService.saveCommentFromMobile(content, resourceId, userId, userName);
		return this.getMessager().success();
	} 
	
	/**
	 * 保存资源笔记
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveNote")
	public @ResponseBody Map<String, Object> saveNote(HttpServletRequest request){	
		String content = request.getParameter("content");
		String isOpen = request.getParameter("isOpen");
		String resourceId = request.getParameter("resourceId");
		String userId = this.getCurrentUserMobile(request).getId();
		String userName = this.getCurrentUserMobile(request).getName();
		resourceService.saveNoteFromMobile(content, isOpen, resourceId, userId, userName);
		return this.getMessager().success();
	} 
}
