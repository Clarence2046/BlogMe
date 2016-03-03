package com.blogme.taylor.controller;

import com.blogme.taylor.interceptor.AuthInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * 主页访问
 * 
 * @author lihl
 * 
 */

@Before(AuthInterceptor.class)
public class BlogMeHomeController extends Controller {
	public void index() {
			render("homePage.jsp");
	}

}
