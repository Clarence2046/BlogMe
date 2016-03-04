package com.blogme.taylor.controller;

import com.blogme.taylor.interceptor.AuthInterceptor;
import com.blogme.taylor.model.Blog;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * 主页访问
 * 
 * @author lihl
 * 
 */

@Before(AuthInterceptor.class)
public class BlogMeBlogController extends Controller {
	public void index() {
			render("blog.jsp");
	}
	public void publishBlog() {
		
		Blog blog = getModel(Blog.class);
		System.out.println(blog.getBlogTitle());
		System.out.println(blog.getBlogContent());
		
		//render("blog.jsp");
	}

}
