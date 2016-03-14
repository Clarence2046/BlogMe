package com.galaxy.taylor.model;

import javax.sql.DataSource;

import com.galaxy.taylor.config.BlogMeConfig;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.c3p0.C3p0Plugin;

public class BlogMeGenerator {
	public static final String jbdcurl="jdbc:mysql://localhost:3306/blogMe?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull";
	public static final String user="root";
	public static final String password="";
	
	public static DataSource getDataSource() {
		//PropKit.use("a_little_config.txt");
		C3p0Plugin c3p0Plugin = new C3p0Plugin(jbdcurl,user,password);
/*		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"),PropKit.get("password").trim());
*/		/*C3p0Plugin c3p0Plugin = BlogMeConfig.createC3p0Plugin();*/
	//	c3p0Plugin.setDriverClass("org.sqlite.JDBC");
		c3p0Plugin.start();
		return c3p0Plugin.getDataSource();
	}
	
	public static void main(String[] args) {
		// base model 
		String baseModelPackageName = "com.galaxy.taylor.model.base";
		// base model 
		String baseModelOutputDir = PathKit.getWebRootPath() + "/../src/com/galaxy/taylor/model/base";
		
		// model
		String modelPackageName = "com.galaxy.taylor.model";
		// model 
		String modelOutputDir = baseModelOutputDir + "/..";
		
		// 
		Generator gernerator = new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
		//
		gernerator.addExcludedTable("sqlite_sequence");
		// 
		gernerator.setGenerateDaoInModel(true);
		// 
		gernerator.setGenerateDataDictionary(false);
		// 
		gernerator.setRemovedTableNamePrefixes("t_","c_");
		// 
		gernerator.generate();
	}
}
