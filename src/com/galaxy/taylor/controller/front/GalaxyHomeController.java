package com.galaxy.taylor.controller.front;

import java.util.List;

import com.galaxy.taylor.interceptor.AuthInterceptor;
import com.galaxy.taylor.model.Blog;
import com.galaxy.taylor.model.User;
import com.galaxy.taylor.util.Constants;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * 主页访问
 * 
 * @author lihl
 * 
 */

@Before(AuthInterceptor.class)
public class GalaxyHomeController extends Controller {
	public void index() {
			render("homePage.jsp");
	}
	
	
	
	/**
	 * 前台个人信息展示页面
	 */
	public void userspace(){
		User user = (User)getSession().getAttribute(Constants.LOGIN_USER);
		
		//获取用户基本信息
		user = User.dao.findById(user.getUserId());
		
		setAttr("user", user);
		
		//获取发表的博客列表
		List<Blog> myBlog = Blog.getMyBlog(user.getUserId(), true);
		
		setAttr("blogList", myBlog);
		
		render("userspace.jsp");
	}

}
