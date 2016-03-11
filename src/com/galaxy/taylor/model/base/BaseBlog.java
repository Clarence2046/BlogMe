package com.galaxy.taylor.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseBlog<M extends BaseBlog<M>> extends Model<M> implements IBean {

	public void setBlogId(java.lang.Integer blogId) {
		set("blogId", blogId);
	}

	public java.lang.Integer getBlogId() {
		return get("blogId");
	}

	public void setUserId(java.lang.Integer userId) {
		set("userId", userId);
	}

	public java.lang.Integer getUserId() {
		return get("userId");
	}

	public void setBlogTitle(java.lang.String blogTitle) {
		set("blogTitle", blogTitle);
	}

	public java.lang.String getBlogTitle() {
		return get("blogTitle");
	}

	public void setBlogContent(java.lang.String blogContent) {
		set("blogContent", blogContent);
	}

	public java.lang.String getBlogContent() {
		return get("blogContent");
	}

	public void setPublishTime(java.util.Date publishTime) {
		set("publishTime", publishTime);
	}

	public java.util.Date getPublishTime() {
		return get("publishTime");
	}

	public void setAttachments(java.lang.String attachments) {
		set("attachments", attachments);
	}

	public java.lang.String getAttachments() {
		return get("attachments");
	}

	public void setViews(java.lang.Integer views) {
		set("views", views);
	}

	public java.lang.Integer getViews() {
		return get("views");
	}

	public void setContentWithNoHtml(java.lang.String contentWithNoHtml) {
		set("contentWithNoHtml", contentWithNoHtml);
	}

	public java.lang.String getContentWithNoHtml() {
		return get("contentWithNoHtml");
	}

	public void setStatus(java.lang.Integer status) {
		set("status", status);
	}

	public java.lang.Integer getStatus() {
		return get("status");
	}

}