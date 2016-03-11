package com.galaxy.taylor.config;

import com.galaxy.taylor.controller.GalaxyAjaxController;
import com.galaxy.taylor.controller.GalaxyMgrController;
import com.galaxy.taylor.controller.GalaxyTestController;
import com.galaxy.taylor.controller.GalaxyController;
import com.galaxy.taylor.controller.front.GalaxyBlogController;
import com.galaxy.taylor.controller.front.GalaxyHomeController;
import com.galaxy.taylor.interceptor.AuthInterceptor;
import com.galaxy.taylor.model._MappingKit;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.ext.handler.UrlSkipHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

/**
 *
 * 
 * @author lihl
 * 
 */
public class BlogMeConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		PropKit.use("a_little_config.txt");
		me.setDevMode(true);

		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		
			//登录注册用控制器
			me.add("/index", GalaxyController.class,"views/user/");
			me.add("/", GalaxyController.class,"views/user/");
			me.add("/visitme", GalaxyController.class,"views/user/");
			
			
			//测试专用控制器
			me.add("/test", GalaxyTestController.class,"views/test/");
			
			//后台管理
			me.add("/main", GalaxyMgrController.class,"views/manage/");
			
			//前台访问
			me.add("/home", GalaxyHomeController.class,"views/front/home/");
			me.add("/blog", GalaxyBlogController.class,"views/front/blog/");
			
			//ajax请求专用controller
			me.add("/ajax", GalaxyAjaxController.class);
	}

	@Override
	public void configPlugin(Plugins me) {
		C3p0Plugin c3p0Plugin = createC3p0Plugin();

		// sqlite
	//	c3p0Plugin.setDriverClass("org.sqlite.JDBC");

		me.add(c3p0Plugin);

		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);

		//arp.setDialect(new Sqlite3Dialect());
		 _MappingKit.mapping(arp);
	}

	public static C3p0Plugin createC3p0Plugin() {
		//String path ="jdbc:sqlite:"+ Thread.currentThread().getContextClassLoader().getResource("/blogme.db").getPath();
		//System.out.println("jdbc url = "+path);
		return new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"),
				PropKit.get("password").trim());
	}

	@Override
	public void configInterceptor(Interceptors me) {
			me.addGlobalActionInterceptor(new AuthInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new UrlSkipHandler("/jsFiles", false));
		me.add(new UrlSkipHandler("/images", false));
	}

}
