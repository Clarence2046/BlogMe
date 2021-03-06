package com.galaxy.taylor.interceptor;

import java.util.HashMap;
import java.util.Map;

import com.galaxy.taylor.util.Constants;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

public class AuthInterceptor implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
			System.out.println("对访问路径"+inv.getActionKey()+"进行登陆拦截......");
			
			Object user = inv.getController().getSession().getAttribute(Constants.LOGIN_USER);
			if(user==null){
				inv.getController().redirect("/");
			}else{
				//查询当前用户具有的菜单权限
				Map<String,String>  m = new HashMap<String,String>();
				m.put("流光", "home");
				m.put("发布文章", "new_art");
				m.put("文章管理", "mng_art");
				m.put("博客", "blog");
				m.put("我的博客", "blog?isMyBlog=true");
				m.put("测试页面", "test");
				m.put("后台管理", "backend_2016");
				inv.getController().getSession().setAttribute("auths", m);
				inv.invoke();
			}
			
	}

}
