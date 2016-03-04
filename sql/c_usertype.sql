/*
Navicat MySQL Data Transfer

Source Server         : blogMe
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-04 18:01:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_usertype
-- ----------------------------
DROP TABLE IF EXISTS `c_usertype`;
CREATE TABLE `c_usertype` (
  `userType` int(11) NOT NULL,
  `typeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_usertype
-- ----------------------------
