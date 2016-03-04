package com.blogme.taylor.config;

import com.blogme.taylor.controller.BlogMeBlogController;
import com.blogme.taylor.controller.BlogMeHomeController;
import com.blogme.taylor.controller.BlogMeManageController;
import com.blogme.taylor.controller.BlogMeTestController;
import com.blogme.taylor.controller.BlogMeVisitController;
import com.blogme.taylor.model._MappingKit;
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
			me.add("/visitme", BlogMeVisitController.class,"views/user/");
			me.add("/home", BlogMeHomeController.class,"views/blogme/");
			me.add("/test", BlogMeTestController.class,"views/test/");
			me.add("/main", BlogMeManageController.class,"views/manage/");
			me.add("/blog", BlogMeBlogController.class,"views/blog/");
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

	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new UrlSkipHandler("/jsFiles", false));
		me.add(new UrlSkipHandler("/images", false));
	}

}
