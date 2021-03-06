package com.galaxy.taylor.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("c_blog", "blogId", Blog.class);
		arp.addMapping("c_classify", "typeId", Classify.class);
		arp.addMapping("c_comment", "commentId", Comment.class);
		arp.addMapping("c_right", "rightId", Right.class);
		arp.addMapping("c_user", "userId", User.class);
		arp.addMapping("c_user_right", "userId", UserRight.class);
		arp.addMapping("c_usertype", "userType", Usertype.class);
	}
}

