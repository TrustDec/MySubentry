package com.insframework.component.controller.dateutils;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.insframework.common.utils.DateUtil;
import com.insframework.system.base.controller.BaseController;

/**
 * 年、月动态加载
 * @author lihua
 */
@Controller
@RequestMapping("date")
public class DateDynamicListController extends BaseController{
	/**
	 * 加载年,norm,默认为0；为-1代表年份从上一年开始
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllYear")
	public @ResponseBody Map<String, Object> loadAllYear(
			HttpServletRequest request, HttpServletResponse response){
		 int norm=Integer.parseInt(request.getParameter("norm"));
		 List<Map<String,Object>> listYear =new ArrayList<Map<String,Object>>();
		 for(int i=0;i<5;i++)
		 {
			 Map<String,Object> map=new HashMap<String,Object>();
			 int year=DateUtil.getToYear()+i+norm;
			 map.put("value", year);
			 map.put("text", year);
			 listYear.add(map);
		 }
		 return this.getMessager().success().data(listYear);
		
	}
	
	/**
	 * num 一共生成多少年 默认生成 3年
	 * offset 向今年往后推移多少年 （默认1年） 
	 * sort 排序 sort=desc未逆序，其他均为asc正序
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllYear2")
	public @ResponseBody Map<String, Object> loadAllYear2(
			HttpServletRequest request, HttpServletResponse response){
		String numStr = request.getParameter("num");
		if (numStr==null) {
			numStr="3";
		}
		int num = Integer.parseInt(numStr);
		String offsetStr = request.getParameter("offset");
		if (offsetStr==null) {
			offsetStr="1";
		}
		String sort = request.getParameter("sort");
		if (!"desc".equals(sort)) {
			sort="asc";
		}
		int offset=Integer.parseInt(offsetStr);
		List<Map<String,Object>> listYear =new ArrayList<Map<String,Object>>();
		if ("asc".equals(sort)) {
			for(int i=1; i<=num;i++) {
				setYearToList(listYear,i,num,offset);
			}
		} else {
			for(int i=num; i>0;i--) {
				setYearToList(listYear,i,num,offset);
			}
		}
		return this.getMessager().success().data(listYear);
		
	}
	
	
	
	private void setYearToList(List<Map<String, Object>> listYear, int i,
			int num, int offset) {
		Map<String,Object> map=new HashMap<String,Object>();
		int year=DateUtil.getToYear()+i-num+offset;
		map.put("value", year);
		map.put("text", year);
		listYear.add(map);
	}
	/**
	 * 加载月
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllMonth")
	public @ResponseBody Map<String, Object> loadAllMonth(
			HttpServletRequest request, HttpServletResponse response){
		 List<Map<String,Object>> listMonth =new ArrayList<Map<String,Object>>();
		 for(int i=1;i<13;i++)
		 {
			 Map<String,Object> map=new HashMap<String,Object>();
			 map.put("value", i);
			 map.put("text", i);
			 listMonth.add(map);
		 }
		 return this.getMessager().success().data(listMonth);
		
	}
	/**
	 * 加载月
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/loadAllMonth2")
	public @ResponseBody Map<String, Object> loadAllMonth2(
			HttpServletRequest request, HttpServletResponse response){
		List<Map<String,Object>> listMonth =new ArrayList<Map<String,Object>>();
		String[] monthAry = new String[]{"0","一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
		for(int i=1;i<13;i++){
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("value", i);
			map.put("text", monthAry[i]);
			listMonth.add(map);
		}
		return this.getMessager().success().data(listMonth);
		
	}
	
	
	

		
}
