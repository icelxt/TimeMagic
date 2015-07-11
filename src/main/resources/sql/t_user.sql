/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2015-07-11 13:47:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `login_name` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `identity` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
