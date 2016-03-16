package com.galaxy.taylor.controller.front;

import java.util.List;

import com.galaxy.taylor.interceptor.AuthInterceptor;
import com.galaxy.taylor.model.Blog;
import com.galaxy.taylor.model.Classify;
import com.galaxy.taylor.model.User;
import com.galaxy.taylor.util.Constants;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * 主页访问
 * 
 * @author lihl
 * 
 */

@Clear
public class GalaxyHomeController extends Controller {
	
	/**
	 * 个人主页 >>首页
	 */
	@Clear
	public void index() {
			setAttr("viewPage", "home");
		
			User user = User.dao.findFirst("select * from c_user where username='admin'");
			
			String conditions = " order by PublishTime desc";
			List<Blog> articles = Blog.getArticles(conditions );
			
			setAttr("articles", articles);
			
			render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>流光
	 */
	@Clear
	@ActionKey("liug")
	public void liug() {
		setAttr("viewPage", "liug");
		//查询当前分类下的文章
		String conditions = " and (type =1 or type in (select typeId from c_classify where parentTypeId=1)) order by PublishTime desc";
		List<Blog> articles = Blog.getArticles(conditions);
		setAttr("articles", articles);
		
		//查询所有分类下标签
		List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId=1");
		setAttr("classifies", classifies);
		
		//当前分类下阅读最多的文章(热门文章)
		String conditions1 = " and (type =1 or type in (select typeId from c_classify where parentTypeId=1)) order by views desc";
		List<Blog> articles1 = Blog.getArticles(conditions1);
		setAttr("hotarticles", articles1);
		
		render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>岁月
	 */
	@Clear
	@ActionKey("suiy")
	public void suiy() {
		setAttr("viewPage", "suiy");
		//时间历程
		render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>海纳百川
	 */
	@Clear
	@ActionKey("hnbc")
	public void hnbc() {
		setAttr("viewPage", "hnbc");
		
		//查询当前分类下的文章
		String conditions = " and (type =3 or type in (select typeId from c_classify where parentTypeId=3)) order by PublishTime desc";
		List<Blog> articles = Blog.getArticles(conditions);
		setAttr("articles", articles);
		
		//查询所有分类下标签
		List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId=3");
		setAttr("classifies", classifies);
		
		//当前分类下阅读最多的文章(热门文章)
		String conditions1 = " and (type =3 or type in (select typeId from c_classify where parentTypeId=3)) order by views desc";
		List<Blog> articles1 = Blog.getArticles(conditions1);
		setAttr("hotarticles", articles1);
		
		render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>札记
	 */
	@Clear
	@ActionKey("zhaj")
	public void zhaj() {
		setAttr("viewPage", "zhaj");
		
		//查询当前分类下的文章
		String conditions = " and (type =4 or type in (select typeId from c_classify where parentTypeId=4)) order by PublishTime desc";
		List<Blog> articles = Blog.getArticles(conditions);
		setAttr("articles", articles);
		
		//查询所有分类下标签
		List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId=4");
		setAttr("classifies", classifies);
		
		//当前分类下阅读最多的文章(热门文章)
		String conditions1 = " and (type =4 or type in (select typeId from c_classify where parentTypeId=4)) order by views desc";
		List<Blog> articles1 = Blog.getArticles(conditions1);
		setAttr("hotarticles", articles1);
		
		render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>关于我
	 */
	@Clear
	@ActionKey("gyuw")
	public void aboutme() {
		setAttr("viewPage", "gyuw");
		render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>留声
	 */
	@Clear
	@ActionKey("lius")
	public void leaveMessage() {
		setAttr("viewPage", "lius");
		render("homePage.jsp");
	}
	
	
	/**
	 * 文章详情
	 */
	 @ActionKey("art_d")
	public void articleDetail(){
		setAttr("viewPage", "art_detail");
		
		String artNo = getPara("art");
		Blog article = Blog.dao.findById(artNo);
		
		Integer type = article.getType();
		
		Classify classify = Classify.dao.findById(type);
		
		Integer parentTypeId = classify.getParentTypeId();
		
		if(parentTypeId!=null){
			Classify classifyP = Classify.dao.findById(parentTypeId);
			String description = classifyP.getDescription();
			setAttr("bread_second", description);
			setAttr("trueUrl", classifyP.getUrl());
			
			//查询当前分类下标签
			List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId=?",parentTypeId);
			setAttr("classifies", classifies);
		}
		setAttr("bread_third", classify.getDescription());
		
		setAttr("article", article);
		
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
