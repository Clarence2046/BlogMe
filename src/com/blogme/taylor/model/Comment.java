package com.blogme.taylor.model;

import com.blogme.taylor.model.base.BaseComment;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Comment extends BaseComment<Comment> {
	public static final Comment dao = new Comment();
	
	public User getUser(){
		return User.dao.findFirst("select * from c_user where userId="+get("commentUserId"));
	};
}
