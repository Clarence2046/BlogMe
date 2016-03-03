package com.blogme.taylor.service;

import com.blogme.taylor.model.User;

public class UserService {
	public boolean checkUserExist(User user) {
		User u = User.dao.findFirst(
				"select  * from c_user  where username=?  or loginName = ? ",
				user.getUsername(), user.getLoginName());
		if (u != null) {
			return true;
		} else {
			return false;
		}
	}
}
