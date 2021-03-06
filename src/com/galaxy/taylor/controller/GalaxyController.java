package com.galaxy.taylor.controller;

import java.math.BigDecimal;
import java.util.Date;

import com.galaxy.taylor.config.BlogMeConfig;
import com.galaxy.taylor.interceptor.AuthInterceptor;
import com.galaxy.taylor.model.User;
import com.galaxy.taylor.util.Constants;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;

/**
 * 登陆访问控制
 * 
 * @author lihl
 * 
 */
@Clear(AuthInterceptor.class)
public class GalaxyController extends Controller {
	// =========================登陆开始=========================
	public void index() {
		setAttr("error", "ajax设置请求属性");
		render("login.jsp");
	}
	public void yzm() {
		render("yzm.jsp");
	}
	

	public void doLogin() {
		User user = getModel(User.class, "loginUser");
		System.out.println("用户名：" + user.getLoginName());
		System.out.println("密    码：" + user.getPassword());
		if (checkUserLogin(user)) {
			User userLogin = User.dao.findFirst(
					"select * from c_user where loginName=? and password=?",
					user.getLoginName(), user.getPassword());
			getSession().setAttribute(Constants.LOGIN_USER, userLogin);

			//redirect("/blog?isMyBlog=true");
			redirect("/new_art");
		} else {
			setAttr("error", "用户名或密码错误");
			redirect("/index");
		}
	}

	private boolean checkUserLogin(User user) {
		User u = user.findFirst(
				"select * from c_user where loginName=?  and password=? ",
				user.getLoginName(), user.getPassword());
		if (u != null) {
			return true;
		}
		return false;
	}

	// =========================登陆结束=========================
	// =========================注册开始=========================
	/**
	 * 跳转到注册页面
	 */
	public void register() {
		render("register.jsp");
	}

	/**
	 * 用户注册
	 */
	public void doRegister() {
		User user = getModel(User.class, "registerUser");
		getSession().setAttribute("registerUser", user);
		if (checkUserExist(user)) {
			redirect("index/register");
		}

		// 设置用户状态，1：正常 2：冻结
		user.setStatus(new BigDecimal(1));
		// 设置用户类型，1：普通用户 2： 普通管理员 3：超级管理员
		user.setUserType(new BigDecimal(1));

		user.setCreateTime(new Date());
		user.save();
		System.out.println("用户[" + user.getUsername() + "]注册成功");

		render("login.jsp");
	}

	private boolean checkUserExist(User user) {
		User u = user.findFirst(
				"select  * from c_user  where username=?  or loginName = ? ",
				user.getUsername(), user.getLoginName());
		if (u != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public void logout(){
		getSession().removeAttribute(Constants.LOGIN_USER);
		redirect("/visitme");
	}
}
