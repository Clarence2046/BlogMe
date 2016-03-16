package com.galaxy.taylor.service;

import com.galaxy.taylor.model.Classify;

public class ClassifyService {
	
	
	public String saveAndReturnId(Classify classify){
		classify.save();
		
		Classify findFirst = Classify.dao.findFirst("select * from c_classify where description=?",classify.getDescription());
		
		return findFirst.getTypeId().toString();
	}
}
