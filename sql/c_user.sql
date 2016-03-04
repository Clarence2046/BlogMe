/*
Navicat MySQL Data Transfer

Source Server         : blogMe
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-04 18:00:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `userId` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginName` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `status` decimal(1,0) DEFAULT NULL,
  `userType` decimal(1,0) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('1', 'taylor', 'taylor', '123456', '22', '11', '2016-03-02 00:00:00', null, '1', '2', '2016-03-02 16:52:20');
INSERT INTO `c_user` VALUES ('2', 'admin', 'admin', '111111', '19888888888', 'youxiang@yy.com', '2016-03-02 00:00:00', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('3', '1231', '123123', '1231', null, null, '2016-03-02 16:05:38', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('4', 'lihl', 'lihl', '123456', '1686868', '99!99', '2016-03-02 16:12:03', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('5', 'taylor', 'taylor', null, null, null, '2016-03-02 16:12:57', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('6', 'taylor', 'taylor', null, null, null, '2016-03-02 16:13:25', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('7', 'taylor', 'taylor', null, null, null, '2016-03-02 16:15:10', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('8', 'taylor', 'taylor', '111111', null, null, '2016-03-02 17:27:25', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('9', 'taylor1', 'taylor2', '111111', null, null, '2016-03-02 17:27:41', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('10', '秋风', '秋风', '111111', null, null, '2016-03-04 14:39:20', null, '1', '2', null);
