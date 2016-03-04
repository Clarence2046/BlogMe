/*
Navicat MySQL Data Transfer

Source Server         : blogMe
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-04 18:00:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_user_right
-- ----------------------------
DROP TABLE IF EXISTS `c_user_right`;
CREATE TABLE `c_user_right` (
  `userId` int(11) NOT NULL,
  `rightId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_user_right
-- ----------------------------
