package com.galaxy.taylor.controller;

import java.util.List;

import com.galaxy.taylor.model.Classify;
import com.jfinal.aop.Clear;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

public class GalaxyTestController extends Controller {
	public void index() {
		render("test.jsp");
	}

	@Clear
	@ActionKey("test_art")
	public void pubArt() {

		// 查询出所有父分类
		List<Classify> pclassify = Classify.dao.find("select * from c_classify where parentTypeId is null");
		setAttr("parents", pclassify);
		// 子分类
		List<Classify> cclassify = Classify.dao.find("select * from c_classify where parentTypeId is not null");
		setAttr("children", cclassify);
		render("pubArticle.jsp");
	}
}
