package com.insframework.system.context.init;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.web.context.ServletContextAware;

/**
 * 应用程序初始化
 * @author guom
 *
 */
public class AppInitalizer implements ServletContextAware{
	
	Logger logger = Logger.getLogger(AppInitalizer.class);
	
	private List<Initializer> initializers;
	
	@Override
	public void setServletContext(ServletContext ctx) {
		try {
			if(initializers != null){
				for(Initializer initializer : initializers){					
					initializer.before(ctx);					
					initializer.init(ctx);
					initializer.after(ctx);
				}
			}
			logger.info("[上下文初始化成功]");
		} catch (Exception e) {	
			logger.error("[上下文初始化失败]", e);
			e.printStackTrace();
		}
	}
	
	public List<Initializer> getInitializers() {
		return initializers;
	}

	public void setInitializers(List<Initializer> initializers) {
		this.initializers = initializers;
	}

	
	
}
