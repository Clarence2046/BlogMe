package com.blogme.taylor.model;

import com.blogme.taylor.model.base.BaseUser;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class User extends BaseUser<User> {
	public static final User dao = new User();
	
	public static boolean checkUserExist(User user) {
		User u = dao.findFirst(
				"select  * from c_user  where username=?  or loginName = ? ",
				user.getUsername(), user.getLoginName());
		if (u != null) {
			return true;
		} else {
			return false;
		}
	}
}
