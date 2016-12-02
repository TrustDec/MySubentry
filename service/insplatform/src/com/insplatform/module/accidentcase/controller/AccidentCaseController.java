package com.insplatform.module.accidentcase.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.insframework.system.base.controller.BaseController;
import com.insframework.system.map.Condition;
import com.insplatform.module.accidentcase.model.AccidentCase;
import com.insplatform.module.accidentcase.service.AccidentCaseService;

@Controller
@RequestMapping("/px/accidentcase")
public class AccidentCaseController extends BaseController{
	
	@Autowired
	private AccidentCaseService accidentCaseService;
	
	/**
	 * 加载数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllGrid")
	public @ResponseBody Map<String, Object> loadAllGrid(
			HttpServletRequest request, HttpServletResponse response){
		Condition condition = this.getCondition(request,"name", "createUserName",  "timeEnd", "companyName", "timeStart", "address",  "type", "nature");
		return accidentCaseService.loadAllGrid(condition);
	}
	
	/**
	 * 加载数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllList")
	public @ResponseBody Map<String, Object> loadAllList(
			HttpServletRequest request, HttpServletResponse response){
		Condition condition = this.getCondition(request);
		return this.getMessager().success().data(accidentCaseService.loadAllList(condition));
	}	
	
	
	/**
	 * 加载单条数据
	 * @param id
	 * @return
	 */
	@RequestMapping("/load")
	public @ResponseBody Map<String, Object> load(@RequestParam("id") String id){		
		return this.getMessager().success().data(accidentCaseService.load(id));		
	}
	
	/**
	 * 加载附件信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("loadAttachment")
	public @ResponseBody Map<String, Object> loadAttachment(
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("accidentcaseId");
		Condition condition = this.getCondition(request);
		condition.put("accidentcaseId", id);
		return accidentCaseService.loadAttachment(condition);
	}
	
	/**
	 * 添加附件信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addAttachment")
	public @ResponseBody Map<String, Object> addAttachment(
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String [] ids = this.getSelectedItems(request,"idSer");
		accidentCaseService.addAttachment(id ,ids);
		return this.getMessager().success();
	}
	
	/**
	 * 删除附件信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteAttachment")
	public @ResponseBody Map<String, Object> deleteAttachment(
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String [] ids = this.getSelectedItems(request);
		accidentCaseService.deleteAttachment(id ,ids);
		return this.getMessager().success();
	}
	
	/**
	 * 新增
	 * @param dict
	 * @return
	 */
	@RequestMapping("/add")	
	public @ResponseBody Map<String, Object> add(AccidentCase accidentcase, HttpServletRequest request){
		accidentcase.setCreateUserId(this.getCurrentUser(request).getId());
		accidentcase.setCreateUserName(this.getCurrentUser(request).getName());	
		Date date = new Date();
		accidentcase.setCreateTime(date);
		accidentcase.setUpdateTime(date);
		accidentCaseService.save(accidentcase);
		return this.getMessager().success();
	}
	
	/**
	 * 编辑
	 * @param dict
	 * @return
	 */
	@RequestMapping("/update")	
	public @ResponseBody Map<String, Object> update(
		   @RequestParam("id") String id,
		   HttpServletRequest request){		
		AccidentCase accidentcase = accidentCaseService.get(id);
		accidentcase.setUpdateTime(new Date());
		this.bindObject(request, accidentcase);
		accidentCaseService.update(accidentcase);
		return this.getMessager().success();
	}
	
	/**
	 * 删除
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")	
	public @ResponseBody Map<String, Object> delete(HttpServletRequest request){
		String [] ids = this.getSelectedItems(request);
		accidentCaseService.deleteByIds(ids);
		return this.getMessager().success();
	}

	
}
