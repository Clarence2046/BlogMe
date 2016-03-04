package com.blogme.taylor.interceptor;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

public class AuthInterceptor implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
			System.out.println("对访问路径"+inv.getActionKey()+"进行登陆拦截......");
			
			//查询当前用户具有的菜单权限
			Map<String,String>  m = new HashMap<String,String>();
			m.put("流光", "time");
			m.put("关于", "about");
			m.put("博客", "blog");
			m.put("测试页面", "test");
			m.put("后台管理", "main");
			inv.getController().getSession().setAttribute("auths", m);
			inv.invoke();
	}

}
