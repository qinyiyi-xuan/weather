/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : weather

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2021-01-12 12:34:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for weather
-- ----------------------------
DROP TABLE IF EXISTS `weather`;
CREATE TABLE `weather` (
  `search` varchar(100) NOT NULL COMMENT '查询城市+当前日期',
  `index` int(11) DEFAULT NULL COMMENT '排序',
  `date` varchar(20) DEFAULT NULL,
  `weather` varchar(20) DEFAULT NULL COMMENT '查询结果',
  `mintep` varchar(20) NOT NULL COMMENT '查询日期',
  `maxtep` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
