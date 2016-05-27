package com.galaxy.taylor.controller.front;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.galaxy.taylor.interceptor.AuthInterceptor;
import com.galaxy.taylor.model.Blog;
import com.galaxy.taylor.model.Classify;
import com.galaxy.taylor.model.Comment;
import com.galaxy.taylor.model.User;
import com.galaxy.taylor.util.Constants;
import com.galaxy.taylor.util.Html2PDF;
import com.galaxy.taylor.util.StringUtil;
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
@Before(AuthInterceptor.class)
public class GalaxyBlogController extends Controller {

	/**
	 * 访问博客
	 */
	public void index() {
		User user = Constants.getUserInSession(getSession());
		String isMyBlog = getPara("isMyBlog");
		List<Blog> blogs;
		if (isMyBlog != null && "true".equals(isMyBlog)) {
			blogs = Blog.getMyBlog(user.getUserId(), true);
			setAttr("blogs", blogs);

			render("blog.jsp");
		} else {
			blogs = Blog.getMyBlog(user.getUserId(), false);
			setAttr("blogs", blogs);

			render("publicBlog.jsp");
		}

	}

	/**
	 * 发布文章
	 */
	public void publishBlog() {

		Blog blog = getModel(Blog.class);
		String content = getPara("content");
		String personalBlog = getPara("personalBlog");
		blog.setBlogContent(content);

		blog.setPublishTime(new Date());
		blog.setUserId(1);

		Object user = getSession().getAttribute(Constants.LOGIN_USER);
		if (user != null) {
			User u = (User) user;
			blog.setUserId(u.getUserId());
		}

		blog.setViews(0);

		String contentWithNoHtml = StringUtil.clearHtmlStr(getPara("content"));

		blog.setContentWithNoHtml(contentWithNoHtml);
		blog.save();

		System.out.println(blog.getBlogTitle());
		System.out.println(content);

		// render("blog.jsp");
		if ("true".equals(personalBlog)) {
			redirect("/blog?isMyBlog=true");
		} else {
			redirect("/blog");
		}

	}

	/**
	 * 删除文章
	 */
	public void deleteBlog() {
		String blogId = getPara("blogId");

		Blog blog = Blog.dao.findById(blogId);

		// 1:正常 2：删除
		blog.setStatus(2);

		blog.update();

		redirect("/blog?isMyBlog=true");
	}


	/**
	 * 查看文章详情
	 */
	public void blogDetail() {

		String blogId = getPara("blogId");
		Blog theBlog = Blog.dao.findById(blogId);
		setAttr("theBlog", theBlog);

		List<Blog> blogs = Blog.getMyBlog(theBlog.getUserId(), true);
		setAttr("blogs", blogs);

		// 如果是不同用户查看则增加查看次数
		String sessionId = getSession().getId();
		Object exist = getSession().getAttribute("viewer" + sessionId);
		if (exist == null) {
			theBlog.setViews(theBlog.getViews() + 1);
			theBlog.update();
			getSession().setAttribute("viewer" + sessionId, "true");
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
		if (user != null) {
			User u = (User) user;
			comment.setCommentUserId(u.getUserId());
		}

		System.out.println(getPara("content"));
		comment.save();
		renderJson("result", "success");
	}

	/**
	 * 删除评论
	 */
	public void deleteComment() {
		String commentId = getPara("commentId");

		Comment comment = Comment.dao.findById(commentId);

		Integer blogId = comment.getBlogId();

		comment.delete();

		redirect("/blog/blogDetail?blogId=" + blogId);
	}
	
	//------------------------------------------单独发布文章页面------------------------------------------------
	
	
	@ActionKey("new_art")
	public void writeArticle(){
		
		//查询出所有父分类
		List<Classify>  pclassify = Classify.dao.find("select * from c_classify where parentTypeId is null");
		setAttr("parents", pclassify);
		//子分类
		List<Classify>  cclassify = Classify.dao.find("select * from c_classify where parentTypeId is not null");
		setAttr("children", cclassify);
		
		
		//一个map
		
		Map map = new HashMap();
		map.put("key1", null);
		setAttr("mm", map);
		
		
		render("pubArticle.jsp");
	}
	
	@ActionKey("all_art")
	public void allArticles(){
		//子分类
		List<Classify>  cclassify = Classify.dao.find("select * from c_classify where parentTypeId is not null");
		setAttr("children", cclassify);
		
		renderJson("children", cclassify);
	}
	
	@ActionKey("spe_art")
	public void indicateArticles(){
		String parentId = getPara("pid");
		//子分类
		List<Classify>  cclassify = Classify.dao.find("select * from c_classify where parentTypeId =?",parentId);
		setAttr("children", cclassify);
		
		renderJson("children", cclassify);
	}
	
	/**
	 * 发布文章
	 */
	@Clear
	@ActionKey("pub_art")
	public void publishArticle() {

		Blog blog = getModel(Blog.class);
		//String content = getPara("content");
		//String personalBlog = getPara("personalBlog");
		//blog.setBlogContent(content);

		blog.setPublishTime(new Date());
		blog.setUserId(1);

		Object user = getSession().getAttribute(Constants.LOGIN_USER);
		if (user != null) {
			User u = (User) user;
			blog.setUserId(u.getUserId());
		}

		blog.setViews(0);

		//String contentWithNoHtml = StringUtil.clearHtmlStr(getPara("content"));

		//blog.setContentWithNoHtml(contentWithNoHtml);
		
		String parentTypeId = getPara("parentTypeId");
		String childid = getPara("childid");
		String newDescription = getPara("newDescription");
		
		if(childid==null || "".equals(childid)){
			if(newDescription==null || "".equals(newDescription)){
				if(parentTypeId==null || "".equals(parentTypeId)){
					//自动归为海纳百川
					blog.setType(3);
				}else{
					blog.setType(Integer.valueOf(parentTypeId));
				}
			}else{
				Classify  classify = new Classify();
				classify.setDescription(newDescription);
				//新加了标签newDescription,先存储新的,然后设置给article
				if(parentTypeId !=null && !"".equals(parentTypeId)){
					classify.setParentTypeId(Integer.valueOf(parentTypeId));
				}else{
					//自动归为海纳百川
					classify.setParentTypeId(3);
				}
				classify.save();
				Integer typeId = classify.getTypeId();
				blog.setType(typeId);
			}
		}else{
			blog.setType(Integer.valueOf(childid));
		}
		
		blog.save();

		//System.out.println(blog.getBlogTitle());
		//System.out.println(content);

		// render("blog.jsp");
		
		String basepath = getSession().getServletContext().getRealPath("/temp");
		
		String blogContent = blog.getBlogContent();
		Html2PDF.convertHtmlStr2PDF(blogContent, basepath+"/2.pdf",basepath);
		
		
		redirect("/new_art");

	}
	
	@ActionKey("ajaxCheckClassify")
	public void ajaxCheckClassify(){
		String newDescription = getPara("newd");
		Classify classify = Classify.dao.findFirst("select * from c_classify where description = ?", newDescription.trim());
		if(classify==null){
			renderJson("result", false);
		}else{
			renderJson("result", true);
		}
	}
	
	
	//-------------------------------------------所有文章管理------------------------------------------
	
	@ActionKey("mng_art")
	public void manageArticles(){
		//获取所有的文章
		List<Blog> articles = Blog.getArticles("");
		
		setAttr("allArts", articles);
		
		
		render("articles.jsp");
		
	}
	
	
	/**
	 * 删除文章
	 */
	@ActionKey("art_del")
	public void deleteArt() {
		String blogId = getPara("blogId");
		
		Blog blog = Blog.dao.findById(blogId);
		
		// 1:正常 2：删除
		blog.setStatus(2);
		
		blog.update();
		
		redirect("/mng_art");
	}
	
	@ActionKey("art_edit")
	public void editArt(){
		String bid = getPara("blogId");
		
		if(bid!=null){
			Integer id = Integer.valueOf(bid);
			Blog blog = Blog.dao.findById(id);
			
			setAttr("blog", blog);
		}
		render("editArticle.jsp");
	}
	
	@ActionKey("upd_art")
	public void updateArt(){
		Blog blog = getModel(Blog.class);
		
		blog.update();
		redirect("/mng_art");
	}
	
}
