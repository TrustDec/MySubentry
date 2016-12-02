package com.insframework.system.interceptor;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import com.insframework.common.spring.jdbc.JdbcAssistant;
import com.insframework.common.utils.SecurityUtil;
import com.insframework.common.utils.TextUtil;
import com.insframework.system.context.App;
import com.insframework.system.curruser.CurrentUser;
import com.insframework.system.curruser.UserSession;

/**
 * 记录日志
 * 
 * @author guom
 * 
 */
public class LogInterceptor implements HandlerInterceptor {

	private Logger logger = Logger.getLogger(LogInterceptor.class);

	@Autowired
	private JdbcAssistant jdbcAssistant;	
	
	private ThreadLocal<Long> startTime = new ThreadLocal<Long>();
	private ThreadLocal<Long> endTime = new ThreadLocal<Long>();

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 设置开始时间
		startTime.set(System.currentTimeMillis());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler, ModelAndView mav)
			throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {		
		
		CurrentUser currentUser = UserSession.getCurrentUser(request);

		// 设置结束时间
		endTime.set(System.currentTimeMillis());

		// 总耗时
		long execTimeMillis = endTime.get() - startTime.get();
		// 参数列表
		Map<String, String> pMap = TextUtil.getParameterMap(request);
		// 处理EXTjs传来的参数
		if (pMap.containsKey("_dc")) {
			pMap.remove("_dc");
		}
		if (pMap.containsKey("node") && pMap.get("node").equals("root")) {
			pMap.remove("node");
		}
		String params = pMap.keySet().size() > 0 ? pMap.toString() : "";
		// 创建人id
		String createUserId = currentUser == null ? null : currentUser.getId();
		// 创建人姓名
		String createUserName = currentUser == null ? null : currentUser
				.getName();
		//mobile
		if(TextUtil.isEmpty(createUserId)){
			createUserId = request.getParameter("CURRENT_USER_ID");
			if(TextUtil.isNotEmpty(createUserId)){
				createUserId = SecurityUtil.decrypt(createUserId);
				String sql = "select name from sys_user where id = '"+createUserId+"'";
				createUserName = jdbcAssistant.queryAsString(sql);
			}
		}
		// ip地址
		String ip = TextUtil.getIpAddr(request);
		// 操作id
		String operateId = null;
		// 操作编码
		String operateCode = null;
		// 错误详细
		String errorDetails = null;
		// 时间
		Date createTime = new Date();
		
		String isLog = null;

		if (handler instanceof HandlerMethod) {
			HandlerMethod method = (HandlerMethod) handler;
			String url = "";
			//方法上的requestmapping
			RequestMapping rm = method.getMethodAnnotation(RequestMapping.class);	
			//类上的requestmapping
			RequestMapping crm = method.getBean().getClass().getAnnotation(RequestMapping.class);
			
			if(rm!=null && rm.value()!=null && rm.value().length>0 && TextUtil.isNotEmpty(rm.value()[0]) && TextUtil.isNotEmpty(createUserId)){
				
				if(crm!=null && crm.value()!=null && crm.value().length>0 && TextUtil.isNotEmpty(crm.value()[0])){
					url = crm.value()[0] + rm.value()[0];
				}else{
					url = rm.value()[0];
				}				
				
				List<Map<String, Object>> operateList = null;
				try{
					if(App.Cache.SYSTEM_OPERATE_ALL_LIST == null){
						operateList = jdbcAssistant.query("select v.* from V_SYS_AUTHZ_OPERATES v");
					}else{
						operateList = App.Cache.SYSTEM_OPERATE_ALL_LIST;
					}		
				}catch(Exception e){}
						
				
				for(Map<String, Object> oper : operateList){
					String operUrls = oper.get("resourcePath").toString();
					if(operUrls.indexOf(",") == -1){
						if(url.equals(operUrls)){
							operateId = oper.get("id").toString();
							operateCode = oper.get("code").toString();
							isLog = oper.get("isLog").toString();
							break;
						}
					}else{
						for(String operUrl : operUrls.split(",")){
							if(url.equals(operUrl)){
								operateId = oper.get("id").toString();
								operateCode = oper.get("code").toString();
								isLog = oper.get("isLog").toString();
								break;
							}
						}
					}
					if(TextUtil.isNotEmpty(operateId) && TextUtil.isNotEmpty(operateCode)){
						break;
					}
				}
				
			}			
		
		}

		// 记录错误日志
		if (ex != null) {

			logger.error("[系统出现错误,已记录到系统日志,错误信息如下]:", ex);

			errorDetails = TextUtil.getExceptionDetails(ex);

			String sql = "insert into sys_log_error "
					+ " (id, create_user_id, create_user_name, create_time, ip, operate_id, operate_code, params, exec_timemillis, error_details) "
					+ " values " + " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

			jdbcAssistant.update(sql, new Object[] { TextUtil.getUUID(),
					createUserId, createUserName, createTime, ip, operateId,
					operateCode, params, execTimeMillis, errorDetails });

		} else {
			if (operateId != null && isLog != null && "Y".equals(isLog)) {
				
				//增删改查表格和增删改查树在编辑时load数据,不记录日志
				String nolog = request.getParameter("nolog");
				
				if(TextUtil.isEmpty(nolog)){
					String sql = "insert into sys_log "
							+ " (id, create_user_id, create_user_name, create_time, ip, operate_id, operate_code, params, exec_timemillis) "
							+ " values " + " (?, ?, ?, ?, ?, ?, ?, ?, ?)";

					jdbcAssistant.update(sql, new Object[] { TextUtil.getUUID(),
							createUserId, createUserName, createTime, ip,
							operateId, operateCode, params, execTimeMillis });
				}
				
				

			}
		}
	}

}
