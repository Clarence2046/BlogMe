package com.blogme.taylor.controller;

import java.util.Date;
import java.util.List;

import com.blogme.taylor.interceptor.AuthInterceptor;
import com.blogme.taylor.model.Blog;
import com.blogme.taylor.model.Comment;
import com.blogme.taylor.model.User;
import com.blogme.taylor.util.Constants;
import com.blogme.taylor.util.StringUtil;
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
		User user = Constants.getUserInSession(getSession());
		String isMyBlog = getPara("isMyBlog");
		List<Blog> blogs;
		if(isMyBlog!=null && "true".equals(isMyBlog)){
			blogs = Blog.getMyBlog(user.getUserId(),true);
			setAttr("blogs", blogs);
			
			render("blog.jsp");
		}else{
			blogs = Blog.getMyBlog(user.getUserId(),false);
			setAttr("blogs", blogs);
			
			render("publicBlog.jsp");
		}
		
	}

	public void publishBlog() {

		Blog blog = getModel(Blog.class);
		String content = getPara("content");
		blog.setBlogContent(content);

		blog.setPublishTime(new Date());
		blog.setUserId(1);
		
		Object user = getSession().getAttribute(Constants.LOGIN_USER);
		if(user!=null){
			User u = (User)user;
			blog.setUserId(u.getUserId());
		}
		
		
		blog.setViews(0);

		
		String contentWithNoHtml = StringUtil.clearHtmlStr(getPara("content"));
		
		blog.setContentWithNoHtml(contentWithNoHtml);
		blog.save();

		System.out.println(blog.getBlogTitle());
		System.out.println(content);

		// render("blog.jsp");
		redirect("/blog");

	}
	
	public void deleteBlog(){
		String blogId = getPara("blogId");
		
		Blog blog = Blog.dao.findById(blogId);
		
		//1:正常  2：删除
		blog.setStatus(2);
		
		blog.update();
		
		redirect("/blog");
	}
	
	public void blogDetail() {
		
		
		
		
		String blogId = getPara("blogId");
		Blog theBlog = Blog.dao.findById(blogId);
		setAttr("theBlog", theBlog);
		
		List<Blog> blogs = Blog.getMyBlog(theBlog.getUserId(), true);
		setAttr("blogs", blogs);
		
		
		//如果是不同用户查看则增加查看次数
		String sessionId = getSession().getId();
		Object exist = getSession().getAttribute("viewer"+sessionId);
		if(exist==null){
			theBlog.setViews(theBlog.getViews()+1);
			theBlog.update();
			getSession().setAttribute("viewer"+sessionId, "true");
		}
		
		
		render("blogDetails.jsp");
		
	}
	
	/**
	 * AJAX 评论
	 */
	public void commentBlog() {
		
		Comment comment = new Comment();
		
		comment.setBlogId(getParaToInt("blogId"));
		comment.setCommentContent(getPara("content"));
		comment.setCommentTime(new Date());
		
		comment.setCommentUserId(3);
		Object user = getSession().getAttribute(Constants.LOGIN_USER);
		if(user!=null){
			User u = (User)user;
			comment.setCommentUserId(u.getUserId());
		}
		
		System.out.println(getPara("content"));
		comment.save();
		renderJson("result","success");
	}

}
