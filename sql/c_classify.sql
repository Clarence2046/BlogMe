/*
Navicat MySQL Data Transfer

Source Server         : blogMe
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-05-06 17:48:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_classify
-- ----------------------------
DROP TABLE IF EXISTS `c_classify`;
CREATE TABLE `c_classify` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `parentTypeId` int(11) DEFAULT NULL COMMENT '父分类',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '访问的路径',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_classify
-- ----------------------------
INSERT INTO `c_classify` VALUES ('1', null, '流光', 'liug');
INSERT INTO `c_classify` VALUES ('2', null, '岁月', 'suiy');
INSERT INTO `c_classify` VALUES ('3', null, '海纳百川', 'hnbc');
INSERT INTO `c_classify` VALUES ('4', null, '札记', 'zhaj');
INSERT INTO `c_classify` VALUES ('5', null, '关于我', 'gyuw');
INSERT INTO `c_classify` VALUES ('6', null, '留声', 'lius');
INSERT INTO `c_classify` VALUES ('7', '3', '游戏人生', null);
INSERT INTO `c_classify` VALUES ('8', '3', '实用工具', null);
INSERT INTO `c_classify` VALUES ('9', '3', '优美散文', null);
INSERT INTO `c_classify` VALUES ('10', '1', 'jquery/管理系统', null);
INSERT INTO `c_classify` VALUES ('11', '1', '测试标签', null);
INSERT INTO `c_classify` VALUES ('12', '2', '1', null);
INSERT INTO `c_classify` VALUES ('13', '1', '缓存hibernate', null);
INSERT INTO `c_classify` VALUES ('14', '1', 'linux环境', null);
INSERT INTO `c_classify` VALUES ('15', '1', '权限框架', null);
INSERT INTO `c_classify` VALUES ('16', '1', 'qrcode', null);
