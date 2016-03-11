package com.galaxy.taylor.controller;

import com.galaxy.taylor.model.User;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;


@Clear
public class GalaxyAjaxController extends Controller{
	
	public void checkUsername(){
		
		String fieldId = getPara("fieldId");
		String fieldValue = getPara("fieldValue");
		
		System.out.println("fieldId="+fieldId);
		System.out.println("fieldValue="+fieldValue);
		User user = new User();
		user.setUsername(fieldValue);
		user.setLoginName(fieldValue);
		
		boolean isExist = User.checkUserExist(user);
		if(isExist){
			renderJson("[\""+fieldId+"\",false]");
		}else{
			renderJson("[\""+fieldId+"\",true]");
		}
		
	}
	

}
