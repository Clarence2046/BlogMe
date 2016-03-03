package com.blogme.taylor.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Enumeration;

import com.blogme.taylor.model.User;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * 主页访问
 * 
 * @author lihl
 * 
 */

public class BlogMeManageController extends Controller {
	public void index() {
		getSession().setAttribute("current", "view");
		render("main.jsp");
	}

	public void usermanage() {
		// 查询出所有的用户
		String sql = " from c_user where 1=1 ";

		// 可以加查询条件
		sql = appendQueryStr(sql);

		Page<User> res = doQuery(sql);
		
		setAttr("pages", res);
		// 将当前访问的菜单路径放入session之中
		getSession().setAttribute("current", "usermanage");
		render("main.jsp");
	}


	public void usermanageAjax() {
		// 查询出所有的用户
		String sql = " from c_user where 1=1 ";

		// 可以加查询条件
		sql = appendQueryStr(sql);

		Page<User> res = doQuery(sql);
	

		setAttr("pages", res);
		// 将当前访问的菜单路径放入session之中
		getSession().setAttribute("current", "usermanage");
		renderJson(res);
	}

	/**
	 * 
	 * 执行查询
	 * @param sql
	 * @return
	 */
	private Page<User> doQuery(String sql) {
		int pageNumber = 1;
		int pageSize = 5;
		
		String pn = getPara("pageNum");
		String ps = getPara("pageSize");
		if (pn != null && !"".equals(pn) ) {
			pageNumber = Integer.valueOf(pn);
		}
		if (ps!= null && !"".equals(ps) ) {
			pageSize = Integer.valueOf(ps);
		}
		
		Page<User> res = User.dao.paginate(pageNumber, pageSize, "select * ",
				sql);
		
		if(res.getList().size()==0 && pageNumber!=1){
			res = User.dao.paginate(1, pageSize, "select * ",
					sql);
		}
		return res;
	}
	
	/**
	 * 
	 * @param sql
	 * @return
	 */
	private String appendQueryStr(String sql) {
		StringBuilder  sb = new StringBuilder(sql);
		// 进行查询条件的添加
		Enumeration<String> paraNames = getParaNames();
		while (paraNames.hasMoreElements()) {
			String param = (String) paraNames.nextElement();
			if(getPara(param)!=null && !"".equals(getPara(param))){
				if("username".equals(param)){
					
					sb.append(" and username like '%"+getPara(param)+"%' ");
					setAttr("old_username", getPara(param));
					
				}else if("beginDate".equals(param)){
					
					sb.append(" and createTime >= '"+getPara(param)+"' ");
					setAttr("old_beginDate", getPara(param));
					
				}else if("endDate".equals(param)){
					
					sb.append(" and createTime <= '"+getPara(param)+" 23:59:59' ");
					setAttr("old_endDate", getPara(param));
				}
			}
		}
		
		return sb.toString();
	}

	/**
	 * 后台管理添加用户
	 */
	public void addUser() {
		User user = getModel(User.class, "registerUser");
		String type = getPara("type");
		if ("1".equals(type)) {
			if (User.checkUserExist(user)) {
				redirect("visitme/register");
			}

			// 设置用户状态，1：正常 2：冻结
			user.setStatus(new BigDecimal(1));
			// 设置用户类型，1：普通用户 2： 普通管理员 3：超级管理员
			// user.setUserType(new BigDecimal(1));

			user.setCreateTime(new Date());
			user.save();
			
		} else if ("2".equals(type)) {

			user.setUpdateTime(new Date());
			user.update();
		}

		// 将当前访问的菜单路径放入session之中
		getSession().setAttribute("current", "usermanage");
		redirect("/main/usermanage");
	}

}
