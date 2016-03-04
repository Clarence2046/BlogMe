/*
Navicat MySQL Data Transfer

Source Server         : blogMe
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-04 18:00:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_blog
-- ----------------------------
DROP TABLE IF EXISTS `c_blog`;
CREATE TABLE `c_blog` (
  `blogId` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客编号',
  `userId` int(11) DEFAULT NULL COMMENT '发布人',
  `blogTitle` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '博客标题',
  `blogContent` varchar(21000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '博客内容',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `attachments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附件',
  `views` int(255) DEFAULT NULL COMMENT '被查看次数',
  PRIMARY KEY (`blogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_blog
-- ----------------------------
