package com.blogme.taylor.util;

import javax.servlet.http.HttpSession;

import com.blogme.taylor.model.User;

public class Constants {
	public static final String LOGIN_USER="loginUser";
	
	public static User getUserInSession(HttpSession session){
		
		return (User) session.getAttribute(LOGIN_USER);
	}
}
