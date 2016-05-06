package com.galaxy.taylor.controller.front;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.galaxy.taylor.model.Blog;
import com.galaxy.taylor.model.Classify;
import com.galaxy.taylor.model.User;
import com.galaxy.taylor.util.Constants;
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
	private int pagesize = 3;
	
	
	/**
	 * 个人主页 >>首页
	 */
	@Clear
	public void index() {
			setAttr("viewPage", "home");
		
			User user = User.dao.findFirst("select * from c_user where username='admin' ");
			
			String conditions = " and type not in (2,5,6) order by PublishTime desc";
			List<Blog> articles = Blog.getArticles(conditions );
			
			setAttr("articles", articles);
			
			//获取热门文章
			conditions = " and type!=5  order by views desc";
			List<Blog> hots = Blog.getArticles(conditions );
			
			setAttr("hotarticles", hots);
			
			//获取分类标签
			
			List<Classify> classifies = Classify.dao.find("select c.typeId, c.parentTypeId, c.description,cp.url from c_classify c, c_classify cp where c.parenttypeid=cp.typeid");
			for (Classify classify : classifies) {
				System.out.println(classify.getUrl()+"?tid="+classify.getTypeId());
			}
			
			setAttr("classifies", classifies);
			
			
			//获取推荐文章,后台自己设定的一个标记,尚未做
			
			render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>流光
	 */
	@Clear
	@ActionKey("liug")
	public void liug() {
		setAttr("viewPage", "liug");
		
		//获取typeid, 用户点击分类标签
		String typeId = getPara("tid");
		
		//获取分页,每页展示8篇文章
		String para = getPara("currentPage");
		String limit = " limit 0,"+pagesize;
		
		setAttr("currentPage", 1);
		setAttr("pagesize", pagesize);
		if(para!=null && !"".equals(para)){
			int curPage = Integer.valueOf(para);
			int pageBegin = (curPage-1) * pagesize;
			limit = " limit "+pageBegin+","+pagesize;
			setAttr("currentPage", curPage);
		}
		
		//应该判断输入的字符是不是包含sql相关的语句,如果有空格,以空格为分隔符解析
		String term = getPara("term");
		
		if(term!=null && !"".equals(term.trim())){
			setAttr("term", term);
			search(term,limit);
		}else{
			//查询当前分类下的文章
			String conditions = " and (type =1 or type in (select typeId from c_classify where parentTypeId=1)) order by PublishTime desc "+limit;
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditions = " and (type = '"+intg+"') order by PublishTime desc "+limit;
			}
			
			String conditionsc = " and (type =1 or type in (select typeId from c_classify where parentTypeId=1)) order by PublishTime desc ";
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditionsc = " and (type = '"+intg+"') order by PublishTime desc";
			}
			
			List<Blog> articles = Blog.getArticles(conditions);
			
			int count = Blog.getArticlesCount(conditionsc);
			
			setAttr("totalPages", count%pagesize==0?count/pagesize:(count/pagesize+1));
			
			setAttr("articles", articles);
			
			//查询所有分类下标签
			List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId=1");
			setAttr("classifies", classifies);
			
			//当前分类下阅读最多的文章(热门文章)
			String conditions1 = " and (type =1 or type in (select typeId from c_classify where parentTypeId=1)) order by views desc";
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditions1 = " and (type = '"+intg+"') order by views desc";
			}
			
			List<Blog> articles1 = Blog.getArticles(conditions1);
			setAttr("hotarticles", articles1);
			
			setAttr("choosedType", typeId);
		}
		
		
		
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
		
		//获取typeid, 用户点击分类标签
		String typeId = getPara("tid");
		
		//应该判断输入的字符是不是包含sql相关的语句,如果有空格,以空格为分隔符解析
		String term = getPara("term");
		
		//获取分页,每页展示8篇文章
		String para = getPara("currentPage");
		String limit = " limit 0,"+pagesize;
		setAttr("currentPage", 1);
		setAttr("pagesize", pagesize);
		if(para!=null && !"".equals(para)){
			int curPage = Integer.valueOf(para);
			int pageBegin = (curPage-1) * pagesize;
			limit = " limit "+pageBegin+","+pagesize;
			setAttr("currentPage", curPage);
		}
		
		if(term!=null && !"".equals(term.trim())){
			search(term,limit);
		}else{
			//查询当前分类下的文章
			String conditions = " and (type =3 or type in (select typeId from c_classify where parentTypeId=3)) order by PublishTime desc" +limit;
			
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditions = " and (type = '"+intg+"') order by PublishTime desc "+limit;
			}
			
			List<Blog> articles = Blog.getArticles(conditions);
			setAttr("articles", articles);
			
			
			String conditionsc = " and (type =3 or type in (select typeId from c_classify where parentTypeId=3)) order by PublishTime desc" ;
			
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditionsc = " and (type = '"+intg+"') order by PublishTime desc ";
			}
			int count = Blog.getArticlesCount(conditionsc);
			
			setAttr("totalPages", count%pagesize==0?count/pagesize:(count/pagesize+1));
			
			//查询所有分类下标签
			List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId=3");
			setAttr("classifies", classifies);
			
			//当前分类下阅读最多的文章(热门文章)
			String conditions1 = " and (type =3 or type in (select typeId from c_classify where parentTypeId=3)) order by views desc";
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditions1 = " and (type = '"+intg+"') order by views desc";
			}
			
			
			List<Blog> articles1 = Blog.getArticles(conditions1);
			setAttr("hotarticles", articles1);
			
			setAttr("choosedType", typeId);
		}
		render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>札记
	 */
	@Clear
	@ActionKey("zhaj")
	public void zhaj() {
		setAttr("viewPage", "zhaj");
		
		
		//获取typeid, 用户点击分类标签
		String typeId = getPara("tid");
		
		//应该判断输入的字符是不是包含sql相关的语句,如果有空格,以空格为分隔符解析
		String term = getPara("term");
		
		//获取分页,每页展示8篇文章
		String para = getPara("currentPage");
		
		String limit = " limit 0,"+pagesize;
		setAttr("currentPage", 1);
		setAttr("pagesize", pagesize);
		if(para!=null && !"".equals(para)){
			int curPage = Integer.valueOf(para);
			int pageBegin = (curPage-1) * pagesize;
			limit = " limit "+pageBegin+","+pagesize;
			setAttr("currentPage", curPage);
		}

		
		if(term!=null &&!"".equals(term.trim())){
			search(term,limit);
		}else{
			//查询当前分类下的文章
			String conditions = " and (type =4 or type in (select typeId from c_classify where parentTypeId=4)) order by PublishTime desc" +limit;
			
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditions = " and (type = '"+intg+"') order by PublishTime desc "+limit;
			}
			
			List<Blog> articles = Blog.getArticles(conditions);
			setAttr("articles", articles);
			
			String conditionsc = " and (type =4 or type in (select typeId from c_classify where parentTypeId=4)) order by PublishTime desc" ;
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditionsc = " and (type = '"+intg+"') order by PublishTime desc ";
			}
			int count = Blog.getArticlesCount(conditionsc);
			
			setAttr("totalPages", count%pagesize==0?count/pagesize:(count/pagesize+1));
			
			//查询所有分类下标签
			List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId=4");
			setAttr("classifies", classifies);
			
			//当前分类下阅读最多的文章(热门文章)
			String conditions1 = " and (type =4 or type in (select typeId from c_classify where parentTypeId=4)) order by views desc";
			if(typeId!=null && typeId!=""){
				Integer intg = Integer.valueOf(typeId);
				conditions = " and (type = '"+intg+"') order by views desc ";
			}
			
			List<Blog> articles1 = Blog.getArticles(conditions1);
			setAttr("hotarticles", articles1);
			
			setAttr("choosedType", typeId);
		}
		render("homePage.jsp");
	}
	
	/**
	 * 个人主页 >>关于我
	 */
	@Clear
	@ActionKey("gyuw")
	public void aboutme() {
		setAttr("viewPage", "gyuw");
		
		Blog aboutme = Blog.dao.findFirst("select cb.* from c_blog cb, c_classify cc where (cb.type=cc.typeId and cc.url='gyuw' ) ");
		
		setAttr("aboutme", aboutme);
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
	
	
	private static final Map<Integer,Map<Integer,Blog>> cacheBlogMap = new ConcurrentHashMap<Integer, Map<Integer,Blog>>();
	
	/**
	 * 文章详情
	 */
	 @ActionKey("art_d")
	public void articleDetail(){
		setAttr("viewPage", "art_detail");
		
		String artNo = getPara("art");
		Blog article = Blog.dao.findById(artNo);
		
		//获取是否有查询条目,高亮查询词语,jsp 对url进行了encodeURI 处理,所以在取值是需要转码,不然中文是乱码的
		String term = getPara("t");
		
		String highlight = term;
		if(term!=null && !"".equals(term.trim())){
			try {
				term =new String(term.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			highlight = "<font color='red'>"+term+"</font>";
			String blogContent = article.getBlogContent();
			String newOne = blogContent.replace(term, highlight);
			article.setBlogContent(newOne);
			
			setAttr("term", term);
		}
		
		
		
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
		
		//当前选中文章的索引
		Integer cindex = 1;
		if(getPara("currentIndex")!=null){
			
			 cindex =Integer.valueOf(getPara("currentIndex"));
		}
		if(cacheBlogMap.get(type)==null){
			Map<Integer,Blog> map = new HashMap<Integer,Blog>();
			//查询所有文章,放入map : pre cur  nex
			List<Blog> articles = Blog.getArticles(" and type='"+type+"' order by publishtime desc");
			
			if(articles!=null && articles.size()>0){
				int index = 0;
				for (Blog blog : articles) {
					map.put(++index, blog);
					if(blog.getBlogId().equals(article.getBlogId())){
						cindex = index;
						setAttr("currentIndex", index);
					}
				}
			}
			
			setAttr("pre", map.get(cindex-1));
			setAttr("next", map.get(cindex+1));
			
			cacheBlogMap.put(type, map);
		}else{
			Map<Integer, Blog> map = cacheBlogMap.get(type);
			
			setAttr("pre", map.get(cindex-1));
			setAttr("next", map.get(cindex+1));
			
			setAttr("currentIndex", cindex);
		}
		
		
		
		setAttr("bread_third", classify.getDescription());
		
		
		// 如果是不同用户查看则增加查看次数
		String sessionId = getSession().getId();
		Object exist = getSession().getAttribute("viewer" + sessionId);
		if (exist == null) {
			article.setViews(article.getViews() + 1);
			article.update();
			getSession().setAttribute("viewer" + sessionId, "true");
		}
		
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

	/**
	 * 用户使用搜索功能
	 */
	private void search(String term, String limit){
		
		//获取从哪个分类下执行的查询
		String page = getPara("page");
		setAttr("viewPage", page);
		
		//获取page的分类编号
		
		Classify classify = new Classify();
		classify = classify.getClassifyByUrl("%"+page+"%");
		
		if(classify==null){
			System.out.println("未找到分类");
			render("homePage.jsp");
			return;
		}
		
		if(term!=null && !"".equals(term.trim())){
			setAttr("highlight", term);
			String highlight = "<font color='red'>"+term+"</font>";
			
			//查询当前分类下的文章
			String conditions = " and (type ='"+classify.getTypeId() +"' or type in (select typeId from c_classify where parentTypeId='"+classify.getTypeId() +"')) and ( blogContent like '%"+term+"%' or blogTitle like '%"+term+"%') order by PublishTime desc" +limit;
			List<Blog> articles = Blog.getArticles(conditions);
			setAttr("articles", articles);
			
			String conditionsc = " and (type ='"+classify.getTypeId() +"' or type in (select typeId from c_classify where parentTypeId='"+classify.getTypeId() +"')) and ( blogContent like '%"+term+"%' or blogTitle like '%"+term+"%') order by PublishTime desc";
			int count = Blog.getArticlesCount(conditionsc);
			
			setAttr("totalPages", count%pagesize==0?count/pagesize:(count/pagesize+1));
			
			//对查询出的文章进行高亮处理
			if(articles!=null){
				for (Blog blog : articles) {
					String blogContent = blog.getContentWithNoHtml();
					String newOne = blogContent.replace(term, highlight);
					blog.setContentWithNoHtml(newOne);
				}
			}
			
			
			//查询所有分类下标签
			List<Classify> classifies = Classify.dao.find("select * from c_classify where parentTypeId='"+classify.getTypeId() +"'");
			setAttr("classifies", classifies);
			
			//当前分类下阅读最多的文章(热门文章)
			String conditions1 = " and (type ='"+classify.getTypeId() +"' or type in (select typeId from c_classify where parentTypeId='"+classify.getTypeId() +"')) order by views desc";
			List<Blog> articles1 = Blog.getArticles(conditions1);
			setAttr("hotarticles", articles1);
			
			
		}
	}
	
}
