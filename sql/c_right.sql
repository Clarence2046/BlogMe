/*
Navicat MySQL Data Transfer

Source Server         : blogMe
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-04 18:00:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_right
-- ----------------------------
DROP TABLE IF EXISTS `c_right`;
CREATE TABLE `c_right` (
  `rightId` int(11) NOT NULL,
  `rightName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rightUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rightId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_right
-- ----------------------------
