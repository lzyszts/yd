/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yd

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-11-13 22:29:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yd_admin
-- ----------------------------
DROP TABLE IF EXISTS `yd_admin`;
CREATE TABLE `yd_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `login_pwd` char(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `login_salt` char(6) NOT NULL DEFAULT '' COMMENT '登录密码配合加密字符串',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱（最大长度60个字符）',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `admin_des` varchar(11) DEFAULT '' COMMENT '管理员描述',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `login_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '所属角色组',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用,0禁用,1启用',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of yd_admin
-- ----------------------------
INSERT INTO `yd_admin` VALUES ('1', 'admin', '2f5cd557978af2b6c00ab2ff6db4dc79', '843980', '362603286@qq.com', '', '超级管理员', '0', '46', '1573630423', '1', '0', '1556358557', '1', null);

-- ----------------------------
-- Table structure for yd_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `yd_admin_log`;
CREATE TABLE `yd_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `code` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态代码',
  `username` varchar(30) NOT NULL DEFAULT '0' COMMENT '操作者用户名',
  `info` varchar(100) DEFAULT '' COMMENT '说明',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '0' COMMENT 'ip地址',
  `get` varchar(255) NOT NULL DEFAULT '' COMMENT '请求地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of yd_admin_log
-- ----------------------------
INSERT INTO `yd_admin_log` VALUES ('1', '-1', '未登录用户', '提示信息：管理员不存在', '1569482828', '192.168.1.254', '/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('2', '1', 'admin', '提示信息：登录成功', '1569482833', '192.168.1.254', '/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('3', '-1', '未登录用户', '提示信息：管理员不存在', '1570899704', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('4', '1', 'admin', '提示信息：登录成功', '1570899710', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('5', '-1', '未登录用户', '提示信息：管理员不存在', '1571037823', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('6', '1', 'admin', '提示信息：登录成功', '1571037827', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('7', '1', 'admin', '提示信息：登录成功', '1571205406', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('8', '1', 'admin', '提示信息：登录成功', '1571209265', '192.168.1.2', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('9', '1', 'admin', '提示信息：权限修改成功', '1571246180', '192.168.1.254', '/yd/public/index.php/admin/auth/authedit');
INSERT INTO `yd_admin_log` VALUES ('10', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('11', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('12', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('13', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('14', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('15', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('16', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('17', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('18', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('19', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('20', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('21', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('22', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('23', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('24', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('25', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('26', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('27', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('28', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('29', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('30', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('31', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('32', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('33', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('34', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('35', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('36', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('37', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('38', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('39', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('40', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('41', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('42', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('43', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('44', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('45', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('46', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('47', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('48', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('49', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('50', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('51', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('52', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('53', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('54', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('55', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('56', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('57', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('58', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('59', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('60', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('61', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('62', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('63', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('64', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('65', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('66', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('67', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('68', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('69', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('70', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('71', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('72', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('73', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('74', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('75', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('76', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('77', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('78', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('79', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('80', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('81', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('82', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('83', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('84', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('85', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('86', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('87', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('88', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('89', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('90', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('91', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('92', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('93', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('94', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('95', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('96', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('97', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('98', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('99', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('100', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('101', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('102', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('103', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('104', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('105', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('106', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('107', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('108', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('109', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('110', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('111', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('112', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('113', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('114', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('115', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('116', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('117', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('118', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('119', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('120', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('121', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('122', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('123', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('124', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('125', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('126', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('127', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('128', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('129', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('130', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('131', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('132', '1', 'admin', '提示信息：角色修改成功', '1571246188', '192.168.1.254', '/yd/public/index.php/admin/role/roleedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('133', '1', 'admin', '提示信息：登录成功', '1571246244', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('134', '-1', '未登录用户', '提示信息：管理员不存在', '1571304731', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('135', '1', 'admin', '提示信息：登录成功', '1571304737', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('136', '1', 'admin', '提示信息：登录成功', '1571391638', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('137', '1', 'admin', '提示信息：登录成功', '1571391750', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('138', '1', 'admin', '提示信息：登录成功', '1572168806', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('139', '1', 'admin', '提示信息：登录成功', '1572190941', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('140', '1', 'admin', '提示信息：登录成功', '1572240572', '192.168.1.254', '/yd/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('141', '1', 'admin', '提示信息：登录成功', '1573027133', '192.168.1.254', '/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('142', '1', 'admin', '提示信息：网站配置信息修改成功', '1573027976', '192.168.1.254', '/admin/config/email');
INSERT INTO `yd_admin_log` VALUES ('143', '1', 'admin', '提示信息：登录成功', '1573462860', '192.168.1.254', '/yd2/public/index.php/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('144', '1', 'admin', '提示信息：登录成功', '1573463400', '192.168.1.254', '/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('145', '1', 'admin', '提示信息：登录成功', '1573534980', '192.168.1.254', '/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('146', '-1', 'admin', '提示信息：上传文件后缀不允许', '1573535177', '192.168.1.254', '/admin/config/uploadslide');
INSERT INTO `yd_admin_log` VALUES ('147', '-1', 'admin', '提示信息：上传图片类型不能为空', '1573535198', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('148', '-1', 'admin', '提示信息：上传图片类型不能为空', '1573535202', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('149', '1', 'admin', '提示信息：网站配置信息修改成功', '1573535222', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('150', '1', 'admin', '提示信息：上传成功', '1573535230', '192.168.1.254', '/admin/config/uploadslide');
INSERT INTO `yd_admin_log` VALUES ('151', '1', 'admin', '提示信息：添加轮播图成功', '1573535235', '192.168.1.254', '/admin/config/slideadd');
INSERT INTO `yd_admin_log` VALUES ('152', '1', 'admin', '提示信息：上传成功', '1573535256', '192.168.1.254', '/admin/config/uploadslide');
INSERT INTO `yd_admin_log` VALUES ('153', '1', 'admin', '提示信息：添加轮播图成功', '1573535259', '192.168.1.254', '/admin/config/slideadd');
INSERT INTO `yd_admin_log` VALUES ('154', '1', 'admin', '提示信息：上传成功', '1573542913', '192.168.1.254', '/admin/file/uploadvideologo');
INSERT INTO `yd_admin_log` VALUES ('155', '1', 'admin', '提示信息：上传成功', '1573542934', '192.168.1.254', '/admin/file/uploadvideo');
INSERT INTO `yd_admin_log` VALUES ('156', '1', 'admin', '提示信息：添加下载成功', '1573542935', '192.168.1.254', '/admin/file/videoadd');
INSERT INTO `yd_admin_log` VALUES ('157', '1', 'admin', '提示信息：上传成功', '1573545375', '192.168.1.254', '/admin/config/uploadslide');
INSERT INTO `yd_admin_log` VALUES ('158', '1', 'admin', '提示信息：添加轮播图成功', '1573545378', '192.168.1.254', '/admin/config/slideadd');
INSERT INTO `yd_admin_log` VALUES ('159', '1', 'admin', '提示信息：上传成功', '1573545393', '192.168.1.254', '/admin/config/uploadslide');
INSERT INTO `yd_admin_log` VALUES ('160', '1', 'admin', '提示信息：添加轮播图成功', '1573545395', '192.168.1.254', '/admin/config/slideadd');
INSERT INTO `yd_admin_log` VALUES ('161', '1', 'admin', '提示信息：上传成功', '1573545562', '192.168.1.254', '/admin/file/uploadvideologo');
INSERT INTO `yd_admin_log` VALUES ('162', '1', 'admin', '提示信息：上传成功', '1573545577', '192.168.1.254', '/admin/file/uploadvideo');
INSERT INTO `yd_admin_log` VALUES ('163', '1', 'admin', '提示信息：添加下载成功', '1573545584', '192.168.1.254', '/admin/file/videoadd');
INSERT INTO `yd_admin_log` VALUES ('164', '1', 'admin', '提示信息：上传成功', '1573545670', '192.168.1.254', '/admin/file/uploadvideologo');
INSERT INTO `yd_admin_log` VALUES ('165', '-1', 'admin', '提示信息：上传视频大小必须为100-40960KB之间', '1573545711', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('166', '1', 'admin', '提示信息：上传成功', '1573545753', '192.168.1.254', '/admin/file/uploadvideo');
INSERT INTO `yd_admin_log` VALUES ('167', '1', 'admin', '提示信息：添加下载成功', '1573545760', '192.168.1.254', '/admin/file/videoadd');
INSERT INTO `yd_admin_log` VALUES ('168', '1', 'admin', '提示信息：上传成功', '1573546001', '192.168.1.254', '/admin/file/uploaddownloadlogo');
INSERT INTO `yd_admin_log` VALUES ('169', '1', 'admin', '提示信息：上传成功', '1573546031', '192.168.1.254', '/admin/file/uploadfile');
INSERT INTO `yd_admin_log` VALUES ('170', '1', 'admin', '提示信息：添加下载成功', '1573546037', '192.168.1.254', '/admin/file/downloadadd');
INSERT INTO `yd_admin_log` VALUES ('171', '1', 'admin', '提示信息：上传成功', '1573546592', '192.168.1.254', '/admin/config/uploadlogo');
INSERT INTO `yd_admin_log` VALUES ('172', '1', 'admin', '提示信息：链接信息修改成功', '1573546593', '192.168.1.254', '/admin/config/linkedit/id/1');
INSERT INTO `yd_admin_log` VALUES ('173', '1', 'admin', '提示信息：上传成功', '1573546599', '192.168.1.254', '/admin/config/uploadlogo');
INSERT INTO `yd_admin_log` VALUES ('174', '1', 'admin', '提示信息：链接信息修改成功', '1573546600', '192.168.1.254', '/admin/config/linkedit/id/2');
INSERT INTO `yd_admin_log` VALUES ('175', '1', 'admin', '提示信息：网站前台配置信息修改成功', '1573547896', '192.168.1.254', '/admin/config/info');
INSERT INTO `yd_admin_log` VALUES ('176', '1', 'admin', '提示信息：网站前台配置信息修改成功', '1573547901', '192.168.1.254', '/admin/config/info');
INSERT INTO `yd_admin_log` VALUES ('177', '1', 'admin', '提示信息：网站前台配置信息修改成功', '1573547909', '192.168.1.254', '/admin/config/info');
INSERT INTO `yd_admin_log` VALUES ('178', '1', 'admin', '提示信息：网站配置信息修改成功', '1573547936', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('179', '1', 'admin', '提示信息：网站配置信息修改成功', '1573547945', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('180', '1', 'admin', '提示信息：网站配置信息修改成功', '1573548007', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('181', '1', 'admin', '提示信息：网站配置信息修改成功', '1573548012', '192.168.1.254', '/admin/config/website');
INSERT INTO `yd_admin_log` VALUES ('182', '1', 'admin', '提示信息：上传成功', '1573548538', '192.168.1.254', '/admin/config/uploadlogo');
INSERT INTO `yd_admin_log` VALUES ('183', '1', 'admin', '提示信息：链接信息修改成功', '1573548539', '192.168.1.254', '/admin/config/linkedit/id/3');
INSERT INTO `yd_admin_log` VALUES ('184', '1', 'admin', '提示信息：权限插入成功', '1573548890', '192.168.1.254', '/admin/auth/authadd');
INSERT INTO `yd_admin_log` VALUES ('185', '1', 'admin', '提示信息：权限修改成功', '1573548938', '192.168.1.254', '/admin/auth/authedit');
INSERT INTO `yd_admin_log` VALUES ('186', '1', 'admin', '提示信息：权限修改成功', '1573548956', '192.168.1.254', '/admin/auth/authedit');
INSERT INTO `yd_admin_log` VALUES ('187', '1', 'admin', '提示信息：权限修改成功', '1573549573', '192.168.1.254', '/admin/auth/authedit');
INSERT INTO `yd_admin_log` VALUES ('188', '1', 'admin', '提示信息：加盟信息提交成功', '1573549596', '192.168.1.254', '/home/index/join');
INSERT INTO `yd_admin_log` VALUES ('189', '-1', 'admin', '提示信息：系统默认分类无法删除', '1573550003', '192.168.1.254', '/admin/article/categorydel');
INSERT INTO `yd_admin_log` VALUES ('190', '1', 'admin', '提示信息：文章分类插入成功', '1573554339', '192.168.1.254', '/admin/article/categoryadd');
INSERT INTO `yd_admin_log` VALUES ('191', '1', 'admin', '提示信息：文章分类修改成功', '1573555492', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('192', '1', 'admin', '提示信息：文章分类插入成功', '1573555520', '192.168.1.254', '/admin/article/categoryadd');
INSERT INTO `yd_admin_log` VALUES ('193', '1', 'admin', '提示信息：文章分类插入成功', '1573555537', '192.168.1.254', '/admin/article/categoryadd');
INSERT INTO `yd_admin_log` VALUES ('194', '1', 'admin', '提示信息：文章分类插入成功', '1573555545', '192.168.1.254', '/admin/article/categoryadd');
INSERT INTO `yd_admin_log` VALUES ('195', '1', 'admin', '提示信息：文章分类修改成功', '1573555552', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('196', '1', 'admin', '提示信息：上传成功', '1573558545', '192.168.1.254', '/admin/article/uploadheadimg');
INSERT INTO `yd_admin_log` VALUES ('197', '1', 'admin', '提示信息：上传成功', '1573558734', '192.168.1.254', '/admin/article/uploadheadimg');
INSERT INTO `yd_admin_log` VALUES ('198', '1', 'admin', '提示信息：文章插入成功', '1573558753', '192.168.1.254', '/admin/article/articleadd');
INSERT INTO `yd_admin_log` VALUES ('199', '1', 'admin', '提示信息：登录成功', '1573630423', '192.168.1.254', '/admin/index/login');
INSERT INTO `yd_admin_log` VALUES ('200', '1', 'admin', '提示信息：文章分类修改成功', '1573630450', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('201', '1', 'admin', '提示信息：文章分类修改成功', '1573630457', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('202', '1', 'admin', '提示信息：文章分类修改成功', '1573630548', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('203', '1', 'admin', '提示信息：上传成功', '1573633843', '192.168.1.254', '/admin/article/uploadheadimg');
INSERT INTO `yd_admin_log` VALUES ('204', '1', 'admin', '提示信息：文章插入成功', '1573633884', '192.168.1.254', '/admin/article/articleadd');
INSERT INTO `yd_admin_log` VALUES ('205', '1', 'admin', '提示信息：文章分类修改成功', '1573637706', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('206', '1', 'admin', '提示信息：文章分类修改成功', '1573637714', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('207', '1', 'admin', '提示信息：文章分类修改成功', '1573637720', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('208', '1', 'admin', '提示信息：文章分类修改成功', '1573637726', '192.168.1.254', '/admin/article/categoryedit');
INSERT INTO `yd_admin_log` VALUES ('209', '1', 'admin', '提示信息：上传成功', '1573652248', '192.168.1.254', '/admin/article/uploadheadimg');
INSERT INTO `yd_admin_log` VALUES ('210', '1', 'admin', '提示信息：文章插入成功', '1573652262', '192.168.1.254', '/admin/article/articleadd');

-- ----------------------------
-- Table structure for yd_article
-- ----------------------------
DROP TABLE IF EXISTS `yd_article`;
CREATE TABLE `yd_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '标题',
  `describe` varchar(255) DEFAULT '' COMMENT '描述',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类id',
  `head_img_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '缩略图id',
  `title_color` char(7) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `content` text COMMENT '内容',
  `content_imgs_ids` varchar(100) DEFAULT NULL COMMENT '内容中的图片ids',
  `access_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `author` varchar(32) DEFAULT NULL COMMENT '作者',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_top` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶（0否, 1是）',
  `position` varchar(100) DEFAULT '' COMMENT '工作地点',
  `work_number` tinyint(3) unsigned DEFAULT '0' COMMENT '招聘人数',
  `education` varchar(16) DEFAULT '' COMMENT '学历要求',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `state` (`state`),
  KEY `access_count` (`access_count`),
  KEY `article_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='文章';

-- ----------------------------
-- Records of yd_article
-- ----------------------------
INSERT INTO `yd_article` VALUES ('1', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('2', '测试文章', '', '1', '20', '', '1', '<p>料 牛肉（腰排肉）2斤；萝卜（红皮白芯）1个；葱半根；姜5片；花椒6克；盐适量；味精适量；鸡粉适量；胡椒粉适量；香菜末一捏；香油几滴 做法</p><p><br/></p><p>准备好腰排肉2斤左右</p><p>切块</p><p>把牛肉块焯水，把血水和脏物煮出之后将肉块捞出清洗干净。</p><p>萝卜去皮，切大块，焯水，焯完水后立即放入冷水中拔着待用（等牛肉熟了以后再放入牛肉中)</p><p>锅内放一点点油，加入葱、姜、花椒炝锅</p><p>加水煮，多加水，然后放入盐、味精、鸡粉，水煮开后尝咸淡，稍淡为宜。</p><p>放入高压锅中，10~15分钟即可（上汽之后计时的话10分钟，从放锅里就开始计时的话15分钟）</p><p>牛肉熟了以后把萝卜从冷水中捞出，倒入高压锅，上汽之后开始计时，1分钟，千万不能超时（超时的话萝卜太烂了）</p><p>撒上胡椒粉、香菜末、香油，开始品尝美味吧！！</p><p><br/></p>', '', '0', 'admin', '0', '0', '', '0', '', '1573633884', '1573633884');
INSERT INTO `yd_article` VALUES ('3', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('4', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('5', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('6', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('7', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('8', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('9', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('10', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('11', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('12', '牦牛珍品礼盒装', '从选材到研发精心为你缔造送礼佳品', '4', '19', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191112/f081bf36db30866f82bb6a7019e30e3f.jpg\" title=\"f081bf36db30866f82bb6a7019e30e3f.jpg\" alt=\"10.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/56401e143aac77aee8fc2414f4744a92.jpg\" title=\"56401e143aac77aee8fc2414f4744a92.jpg\" alt=\"12.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/22a0136ecbd271674e28b5c54db1c384.jpg\" title=\"22a0136ecbd271674e28b5c54db1c384.jpg\" alt=\"13.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/f5ad50d87205e6995c81c31028366e25.jpg\" title=\"f5ad50d87205e6995c81c31028366e25.jpg\" alt=\"14.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg\" title=\"cb029fc00f5448f4c272cfb7381b6fc9.jpg\" alt=\"11.jpg\"/></p>', '14,15,16,17,18', '0', 'admin', '0', '0', '', '0', '', '1573558753', '1573558753');
INSERT INTO `yd_article` VALUES ('13', '藏香猪', '从选材到研发精心为你缔造送礼佳品2', '5', '21', '', '1', '<p><img src=\"http://192.168.1.254:9003/static/upload/20191113/3fbf25126eff906e52d9013e7ae6ed31.jpg\" title=\"3fbf25126eff906e52d9013e7ae6ed31.jpg\" alt=\"timg (3)w.jpg\"/><img src=\"http://192.168.1.254:9003/static/upload/20191113/94c433f36525551536b4bae14ab07ce5.jpg\" title=\"94c433f36525551536b4bae14ab07ce5.jpg\" alt=\"14.jpg\"/></p>', '22,23', '0', 'admin', '0', '0', '', '0', '', '1573652262', '1573652262');

-- ----------------------------
-- Table structure for yd_article_access_log
-- ----------------------------
DROP TABLE IF EXISTS `yd_article_access_log`;
CREATE TABLE `yd_article_access_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `date_y` char(4) DEFAULT NULL,
  `date_m` char(2) DEFAULT NULL,
  `date_d` char(2) DEFAULT NULL,
  `date` char(8) NOT NULL DEFAULT '' COMMENT '日期',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='文章访问统计表';

-- ----------------------------
-- Records of yd_article_access_log
-- ----------------------------
INSERT INTO `yd_article_access_log` VALUES ('1', '2019', '11', '12', '20191112', '0');
INSERT INTO `yd_article_access_log` VALUES ('2', '2019', '11', '13', '20191113', '1');

-- ----------------------------
-- Table structure for yd_article_category
-- ----------------------------
DROP TABLE IF EXISTS `yd_article_category`;
CREATE TABLE `yd_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `location` varchar(32) DEFAULT NULL COMMENT '跳转模块，例如index/about',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `column_id` int(11) DEFAULT NULL COMMENT '所属栏目id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除字段',
  PRIMARY KEY (`id`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='文章分类';

-- ----------------------------
-- Records of yd_article_category
-- ----------------------------
INSERT INTO `yd_article_category` VALUES ('1', '新闻资讯', 'news.html', '1', '0', '6', '1557386135', '1573630450', null);
INSERT INTO `yd_article_category` VALUES ('2', '公司新闻', 'position.html', '1', '0', '6', '1557386129', '1573630457', null);
INSERT INTO `yd_article_category` VALUES ('3', '招聘信息', 'position.html', '1', '0', '6', '1558073548', '1573630548', null);
INSERT INTO `yd_article_category` VALUES ('4', '牦牛系列', '', '1', '0', '3', '1573554339', '1573637706', null);
INSERT INTO `yd_article_category` VALUES ('5', '藏香猪系列', '', '1', '1', '3', '1573555520', '1573637714', null);
INSERT INTO `yd_article_category` VALUES ('6', '藏山羊系列', '', '1', '2', '3', '1573555537', '1573637720', null);
INSERT INTO `yd_article_category` VALUES ('7', '其他', '', '1', '3', '3', '1573555545', '1573637726', null);

-- ----------------------------
-- Table structure for yd_auth
-- ----------------------------
DROP TABLE IF EXISTS `yd_auth`;
CREATE TABLE `yd_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限父级id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '权限名称',
  `module` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `control` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '权限层级',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `is_new` tinyint(4) DEFAULT '0' COMMENT '是否新页面打开',
  `icon` char(60) NOT NULL DEFAULT '' COMMENT '图标class',
  `type` tinyint(3) unsigned NOT NULL COMMENT '0后台权限、1前台权限',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Records of yd_auth
-- ----------------------------
INSERT INTO `yd_auth` VALUES ('2', '0', '权限控制', 'admin', 'power', 'index', '0', '5', '1', '0', 'icon-other', '0', '1567675837');
INSERT INTO `yd_auth` VALUES ('3', '2', '角色管理', 'admin', 'role', 'index', '1', '0', '1', '0', '', '0', '1556259434');
INSERT INTO `yd_auth` VALUES ('4', '2', '权限列表', 'admin', 'auth', 'index', '1', '0', '1', '0', '', '0', '1555898261');
INSERT INTO `yd_auth` VALUES ('5', '2', '管理员列表', 'admin', 'admin', 'index', '1', '0', '1', '0', '', '0', '1555898295');
INSERT INTO `yd_auth` VALUES ('7', '3', '添加', 'admin', 'role', 'roleAdd', '2', '0', '0', '0', '', '0', '1556259296');
INSERT INTO `yd_auth` VALUES ('8', '3', '编辑', 'admin', 'role', 'roleEdit', '2', '0', '0', '0', '', '0', '1556272673');
INSERT INTO `yd_auth` VALUES ('9', '3', '删除', 'admin', 'role', 'roleDel', '2', '0', '0', '0', '', '0', '1556259326');
INSERT INTO `yd_auth` VALUES ('14', '4', '添加', 'admin', 'auth', 'authAdd', '2', '0', '0', '0', '', '0', '1556380517');
INSERT INTO `yd_auth` VALUES ('15', '4', '编辑', 'admin', 'auth', 'authEdit', '2', '0', '0', '0', '', '0', '1556259731');
INSERT INTO `yd_auth` VALUES ('16', '4', '删除', 'admin', 'auth', 'authDel', '2', '0', '0', '0', '', '0', '1556259621');
INSERT INTO `yd_auth` VALUES ('17', '5', '添加', 'admin', 'admin', 'adminAdd', '2', '0', '0', '0', '', '0', '1556259704');
INSERT INTO `yd_auth` VALUES ('18', '5', '编辑', 'admin', 'admin', 'adminEdit', '2', '0', '0', '0', '', '0', '1556259750');
INSERT INTO `yd_auth` VALUES ('19', '5', '删除', 'admin', 'admin', 'adminDel', '2', '0', '0', '0', '', '0', '1556259771');
INSERT INTO `yd_auth` VALUES ('20', '5', '启用/禁用', 'admin', 'admin', 'adminSwitch', '2', '0', '0', '0', '', '0', '1556259790');
INSERT INTO `yd_auth` VALUES ('21', '0', '文章管理', 'admin', 'article', 'index', '0', '1', '1', '0', 'icon-wenzhang', '0', '1571246180');
INSERT INTO `yd_auth` VALUES ('22', '21', '文章分类', 'admin', 'article', 'articleCategory', '1', '1', '1', '0', '', '0', '1558078105');
INSERT INTO `yd_auth` VALUES ('23', '21', '文章列表', 'admin', 'article', 'articleList', '1', '0', '1', '0', '', '0', '1558078115');
INSERT INTO `yd_auth` VALUES ('28', '22', '添加', 'admin', 'article', 'categoryAdd', '2', '0', '0', '0', '', '0', '1556444730');
INSERT INTO `yd_auth` VALUES ('29', '22', '编辑', 'admin', 'article', 'categoryEdit', '2', '0', '0', '0', '', '0', '1556444747');
INSERT INTO `yd_auth` VALUES ('30', '22', '删除', 'admin', 'article', 'categoryDel', '2', '0', '0', '0', '', '0', '1556444775');
INSERT INTO `yd_auth` VALUES ('31', '23', '添加', 'admin', 'article', 'articleAdd', '2', '0', '0', '0', '', '0', '1556521600');
INSERT INTO `yd_auth` VALUES ('32', '23', '编辑', 'admin', 'article', 'articleEdit', '2', '0', '0', '0', '', '0', '1556521632');
INSERT INTO `yd_auth` VALUES ('33', '23', '删除', 'admin', 'article', 'articleDel', '2', '0', '0', '0', '', '0', '1556521670');
INSERT INTO `yd_auth` VALUES ('34', '2', '管理员日志', 'admin', 'log', 'index', '1', '4', '1', '0', '', '0', '1557933779');
INSERT INTO `yd_auth` VALUES ('35', '34', '删除', 'admin', 'log', 'logDel', '2', '0', '0', '0', '', '0', '1557400182');
INSERT INTO `yd_auth` VALUES ('36', '0', '系统配置', 'admin', 'config', 'index', '0', '4', '1', '0', 'icon-gongnengjianyi', '0', '1567676185');
INSERT INTO `yd_auth` VALUES ('37', '36', '后台设置', 'admin', 'config', 'website', '1', '0', '1', '0', '', '0', '1558445242');
INSERT INTO `yd_auth` VALUES ('38', '36', '邮件配置', 'admin', 'config', 'email', '1', '2', '1', '0', '', '0', '1558000218');
INSERT INTO `yd_auth` VALUES ('39', '36', '链接管理', 'admin', 'config', 'link', '1', '3', '1', '0', '', '0', '1558000209');
INSERT INTO `yd_auth` VALUES ('41', '39', '添加', 'admin', 'config', 'linkAdd', '2', '0', '0', '0', '', '0', '1557883270');
INSERT INTO `yd_auth` VALUES ('42', '39', '编辑', 'admin', 'config', 'linkEdit', '2', '0', '0', '0', '', '0', '1557883297');
INSERT INTO `yd_auth` VALUES ('43', '39', '删除', 'admin', 'config', 'linkDel', '2', '0', '0', '0', '', '0', '1557883319');
INSERT INTO `yd_auth` VALUES ('44', '36', '栏目管理', 'admin', 'config', 'column', '1', '4', '1', '0', '', '0', '1558313354');
INSERT INTO `yd_auth` VALUES ('45', '44', '添加', 'admin', 'config', 'columnAdd', '2', '0', '0', '0', '', '0', '1558314089');
INSERT INTO `yd_auth` VALUES ('46', '44', '编辑', 'admin', 'config', 'columnEdit', '2', '0', '0', '0', '', '0', '1558314115');
INSERT INTO `yd_auth` VALUES ('47', '44', '删除', 'admin', 'config', 'columnDel', '2', '0', '0', '0', '', '0', '1558314134');
INSERT INTO `yd_auth` VALUES ('51', '36', '前台配置', 'admin', 'config', 'info', '1', '1', '1', '0', '', '0', '1558445273');
INSERT INTO `yd_auth` VALUES ('56', '0', '首页', 'home', 'index', 'index', '0', '0', '0', '0', '', '1', '1567415661');
INSERT INTO `yd_auth` VALUES ('57', '0', '图片管理', 'admin', 'config', 'index', '0', '2', '1', '0', 'icon-tupian', '0', '1567675585');
INSERT INTO `yd_auth` VALUES ('58', '57', '轮播图管理', 'admin', 'config', 'slide', '1', '0', '1', '0', '', '0', '1567675613');
INSERT INTO `yd_auth` VALUES ('59', '58', '添加', 'admin', 'config', 'slideAdd', '2', '0', '0', '0', '', '0', '1567675637');
INSERT INTO `yd_auth` VALUES ('60', '58', '编辑', 'admin', 'config', 'slideEdit', '2', '0', '0', '0', '', '0', '1567675656');
INSERT INTO `yd_auth` VALUES ('61', '58', '删除', 'admin', 'config', 'slideDel', '2', '0', '0', '0', '', '0', '1567675673');
INSERT INTO `yd_auth` VALUES ('62', '0', '文件管理', 'admin', 'config', 'download', '0', '3', '1', '0', 'icon-wenjianjia-zhankai', '0', '1567675855');
INSERT INTO `yd_auth` VALUES ('63', '62', '下载管理', 'admin', 'file', 'download', '1', '0', '1', '0', '', '0', '1567688655');
INSERT INTO `yd_auth` VALUES ('64', '63', '添加', 'admin', 'file', 'downloadAdd', '2', '0', '0', '0', '', '0', '1567688681');
INSERT INTO `yd_auth` VALUES ('65', '63', '编辑', 'admin', 'file', 'downloadEdit', '2', '0', '0', '0', '', '0', '1567688665');
INSERT INTO `yd_auth` VALUES ('66', '63', '删除', 'admin', 'file', 'downloadDel', '2', '0', '0', '0', '', '0', '1567688674');
INSERT INTO `yd_auth` VALUES ('67', '62', '视频管理', 'admin', 'file', 'video', '1', '0', '1', '0', '', '0', '1567689337');
INSERT INTO `yd_auth` VALUES ('68', '67', '添加', 'admin', 'file', 'videoAdd', '2', '0', '0', '0', '', '0', '1567689368');
INSERT INTO `yd_auth` VALUES ('69', '67', '编辑', 'admin', 'file', 'videoEdit', '2', '0', '0', '0', '', '0', '1567689469');
INSERT INTO `yd_auth` VALUES ('70', '67', '删除', 'admin', 'file', 'videoDel', '2', '0', '0', '0', '', '0', '1567689495');
INSERT INTO `yd_auth` VALUES ('71', '21', '加盟信息', 'admin', 'article', 'infolist', '1', '2', '1', '0', '', '0', '1573549573');

-- ----------------------------
-- Table structure for yd_column
-- ----------------------------
DROP TABLE IF EXISTS `yd_column`;
CREATE TABLE `yd_column` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目父级id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `control` char(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '栏目层级',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0否，1是）',
  `is_new` tinyint(4) DEFAULT '0' COMMENT '是否新页面打开',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='栏目表';

-- ----------------------------
-- Records of yd_column
-- ----------------------------
INSERT INTO `yd_column` VALUES ('1', '0', '首页', 'index', 'index', '0', '0', '1', '0', '1567648985');
INSERT INTO `yd_column` VALUES ('2', '0', '公司介绍', 'index', 'about', '0', '1', '1', '0', '1567649340');
INSERT INTO `yd_column` VALUES ('3', '0', '产品中心', 'index', 'product', '0', '2', '1', '0', '1567649361');
INSERT INTO `yd_column` VALUES ('4', '0', '寻味记', 'index', 'xunweiji', '0', '3', '1', '0', '1567649388');
INSERT INTO `yd_column` VALUES ('5', '0', '企业服务', 'index', 'service', '0', '4', '1', '0', '1567649406');
INSERT INTO `yd_column` VALUES ('6', '0', '新闻资讯', 'index', 'news', '0', '5', '1', '0', '1567649432');
INSERT INTO `yd_column` VALUES ('7', '0', '招商加盟', 'index', 'join', '0', '6', '1', '0', '1567649452');

-- ----------------------------
-- Table structure for yd_config
-- ----------------------------
DROP TABLE IF EXISTS `yd_config`;
CREATE TABLE `yd_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置值',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `type` char(5) NOT NULL DEFAULT '' COMMENT '类型（admin后台, home前台）',
  `only_tag` varchar(60) NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `only_tag` (`only_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='基本配置参数';

-- ----------------------------
-- Records of yd_config
-- ----------------------------
INSERT INTO `yd_config` VALUES ('1', '首页名称', '四川野嘀食品有限责任公司', '网站的名称', 'admin', 'sitename', '0');
INSERT INTO `yd_config` VALUES ('2', '网站域名', 'http://kuaidanshou.com', '域名', 'admin', 'domain', '0');
INSERT INTO `yd_config` VALUES ('3', '上传图片类型', 'png,gif,jpeg,jpg', '设置允许上传图片类型，不同类型用\",\"隔开', 'admin', 'imgType', '0');
INSERT INTO `yd_config` VALUES ('4', '图片上传大小', '3072', '最大上传 3MB', 'admin', 'uploadImgSize', '0');
INSERT INTO `yd_config` VALUES ('5', '上传文件类型', 'exe', '允许上传文件类型，不同类型用\",\"隔开', 'admin', 'fileType', '0');
INSERT INTO `yd_config` VALUES ('6', '文件上传大小', '10240', '最大上传 40MB', 'admin', 'uploadFileSize', '0');
INSERT INTO `yd_config` VALUES ('7', '版权信息', 'copyright @ 2019-2029 野嘀食品(蜀ICP备19026702号-1)', '网站版权信息', 'admin', 'copyright', '0');
INSERT INTO `yd_config` VALUES ('8', 'SMTP服务器', 'smtp.qq.com', '如：smtp.163.com', 'admin', 'mailSmtpServer', '0');
INSERT INTO `yd_config` VALUES ('9', 'SMTP端口', '465', '一般为 25 或 465', 'admin', 'mailSmtpPort', '0');
INSERT INTO `yd_config` VALUES ('10', '发件人邮箱', '3626032862@qq.com', '', 'admin', 'mailSendUsername', '0');
INSERT INTO `yd_config` VALUES ('11', '发件人昵称', '野嘀', '', 'admin', 'mailSendName', '0');
INSERT INTO `yd_config` VALUES ('12', '邮箱密码', 'bssoieypkcpkbgec', '', 'admin', 'mailSendPwd', '0');
INSERT INTO `yd_config` VALUES ('13', '客服电话', '400-1858-0011', '', 'home', 'phone', '0');
INSERT INTO `yd_config` VALUES ('14', '服务时间', '8：00AM ～ 23：00 PM', '', 'home', 'workTime', '0');
INSERT INTO `yd_config` VALUES ('15', '客服QQ号', '362603286', '', 'home', 'qq', '0');
INSERT INTO `yd_config` VALUES ('16', '视频上传类型', 'mp4', '允许上传视频类型，不同类型用\",\"隔开', 'admin', 'videoType', '0');
INSERT INTO `yd_config` VALUES ('17', '视频上传大小', '40960', '最大上传 40MB', 'admin', 'uploadVideoSize', '0');

-- ----------------------------
-- Table structure for yd_download
-- ----------------------------
DROP TABLE IF EXISTS `yd_download`;
CREATE TABLE `yd_download` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `download_name` varchar(30) NOT NULL DEFAULT '' COMMENT '软件名称',
  `type` varchar(32) NOT NULL COMMENT '分组标识关键字',
  `logo_id` int(11) unsigned DEFAULT '0' COMMENT '图标LOGOid',
  `file_id` int(11) NOT NULL COMMENT '文件信息表对应的id',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `describe` varchar(60) NOT NULL DEFAULT '' COMMENT '下载描述',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='下载链接维护表';

-- ----------------------------
-- Records of yd_download
-- ----------------------------
INSERT INTO `yd_download` VALUES ('1', '天池早笋探索之旅', 'video', '3', '1', '', '', '0', '1', '1573542935', '0');
INSERT INTO `yd_download` VALUES ('2', '秏牛酱头', 'video', '6', '2', '', '', '0', '1', '1573545584', '0');
INSERT INTO `yd_download` VALUES ('3', '高山牦牛', 'video', '7', '3', '', '', '0', '1', '1573545760', '0');

-- ----------------------------
-- Table structure for yd_download_access_log
-- ----------------------------
DROP TABLE IF EXISTS `yd_download_access_log`;
CREATE TABLE `yd_download_access_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `date_y` char(4) DEFAULT NULL,
  `date_m` char(2) DEFAULT NULL,
  `date_d` char(2) DEFAULT NULL,
  `date` char(8) NOT NULL DEFAULT '' COMMENT '日期',
  `count` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '次数',
  `total_count` int(11) unsigned DEFAULT '0' COMMENT '当前总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='下载统计表';

-- ----------------------------
-- Records of yd_download_access_log
-- ----------------------------
INSERT INTO `yd_download_access_log` VALUES ('1', null, null, null, '', '0', '0');

-- ----------------------------
-- Table structure for yd_file_info
-- ----------------------------
DROP TABLE IF EXISTS `yd_file_info`;
CREATE TABLE `yd_file_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL COMMENT '上传的用户名',
  `real_name` varchar(150) DEFAULT NULL COMMENT '上传文件真实名',
  `file_name` varchar(150) DEFAULT NULL COMMENT '文件名',
  `src` varchar(255) DEFAULT NULL COMMENT '文件src',
  `real_path` varchar(255) DEFAULT NULL COMMENT '图片盘符真实路径',
  `add_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '临时文件0正式1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='文件上传信息表';

-- ----------------------------
-- Records of yd_file_info
-- ----------------------------
INSERT INTO `yd_file_info` VALUES ('1', 'admin', 'f6497dfd3e0fd1f075b6da0b666118d1(1).mp4', 'c4e5cb5102cfea48114c71e6471dbe7b05dd50.mp4', '32\\c4e5cb5102cfea48114c71e6471dbe7b05dd50.mp4', 'D:\\project\\yd\\public\\static\\download\\32\\c4e5cb5102cfea48114c71e6471dbe7b05dd50.mp4', '1573542934', '1');
INSERT INTO `yd_file_info` VALUES ('2', 'admin', '秏牛酱头图视频音乐2.mp4', 'db8bd123bb899ca3bd8597d20aacbba4a44de6.mp4', '3f\\db8bd123bb899ca3bd8597d20aacbba4a44de6.mp4', 'D:\\project\\yd\\public\\static\\download\\3f\\db8bd123bb899ca3bd8597d20aacbba4a44de6.mp4', '1573545577', '1');
INSERT INTO `yd_file_info` VALUES ('3', 'admin', '高山牦牛配音版.mp4', 'qwewqeqwe.mp4', '3b\\qwewqeqwe.mp4', 'D:\\project\\yd\\public\\static\\download\\3f\\db8bd123bb899ca3bd8597d20aacbba4a44de6.mp4', '1573545577', '1');

-- ----------------------------
-- Table structure for yd_img_info
-- ----------------------------
DROP TABLE IF EXISTS `yd_img_info`;
CREATE TABLE `yd_img_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `real_name` varchar(150) DEFAULT NULL COMMENT '上传图片真实名',
  `img_name` varchar(150) DEFAULT NULL COMMENT '图片名',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `src` varchar(255) DEFAULT NULL COMMENT '图片src',
  `real_path` varchar(255) DEFAULT NULL COMMENT '图片盘符真实路径',
  `add_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '临时图片0正式1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='图片上传表';

-- ----------------------------
-- Records of yd_img_info
-- ----------------------------
INSERT INTO `yd_img_info` VALUES ('1', 'timg (3)w.jpg', 'd98eeb3f788b9ee4a8d08168ec50d1c0.jpg', 'admin', '20191112/d98eeb3f788b9ee4a8d08168ec50d1c0.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\d98eeb3f788b9ee4a8d08168ec50d1c0.jpg', '1573535230', '1');
INSERT INTO `yd_img_info` VALUES ('2', '首页phone.jpg', '25cabf87bf9c41b26184aef1363fe6e7.jpg', 'admin', '20191112/25cabf87bf9c41b26184aef1363fe6e7.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\25cabf87bf9c41b26184aef1363fe6e7.jpg', '1573535256', '1');
INSERT INTO `yd_img_info` VALUES ('3', 'v1.jpg', '8c590f3ad4f58fec7a8ebef033c6a0d4.jpg', 'admin', '20191112/8c590f3ad4f58fec7a8ebef033c6a0d4.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\8c590f3ad4f58fec7a8ebef033c6a0d4.jpg', '1573542913', '1');
INSERT INTO `yd_img_info` VALUES ('4', 'timg-(4)w.jpg', '2b8a275776dac55a359ffec82ba38aef.jpg', 'admin', '20191112/2b8a275776dac55a359ffec82ba38aef.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\2b8a275776dac55a359ffec82ba38aef.jpg', '1573545375', '1');
INSERT INTO `yd_img_info` VALUES ('5', '手机-banner3.jpg', 'f8b3de2196e5ce4d6b6394a710f00a9e.jpg', 'admin', '20191112/f8b3de2196e5ce4d6b6394a710f00a9e.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\f8b3de2196e5ce4d6b6394a710f00a9e.jpg', '1573545393', '1');
INSERT INTO `yd_img_info` VALUES ('6', 'v3.jpg', '1979d00774b6ea5c5e80923fb46ae580.jpg', 'admin', '20191112/1979d00774b6ea5c5e80923fb46ae580.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\1979d00774b6ea5c5e80923fb46ae580.jpg', '1573545562', '1');
INSERT INTO `yd_img_info` VALUES ('7', 'v2.jpg', 'c9b4776058d7a80db1a8f967cef05d86.jpg', 'admin', '20191112/c9b4776058d7a80db1a8f967cef05d86.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\c9b4776058d7a80db1a8f967cef05d86.jpg', '1573545669', '1');
INSERT INTO `yd_img_info` VALUES ('8', 'v1.jpg', 'fbdf929f7e42eda562a590fdbca9ac79.jpg', 'admin', '20191112/fbdf929f7e42eda562a590fdbca9ac79.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\fbdf929f7e42eda562a590fdbca9ac79.jpg', '1573546001', '1');
INSERT INTO `yd_img_info` VALUES ('9', '1573546571.png', 'cda127d6ee5d21d0830c3121002a4e10.png', 'admin', '20191112/cda127d6ee5d21d0830c3121002a4e10.png', 'D:\\project\\yd\\public\\static\\upload\\20191112\\cda127d6ee5d21d0830c3121002a4e10.png', '1573546592', '1');
INSERT INTO `yd_img_info` VALUES ('10', '1573546571.png', '80bbb9b7cf6b7c408ef9bc8e0e7313b6.png', 'admin', '20191112/80bbb9b7cf6b7c408ef9bc8e0e7313b6.png', 'D:\\project\\yd\\public\\static\\upload\\20191112\\80bbb9b7cf6b7c408ef9bc8e0e7313b6.png', '1573546599', '1');
INSERT INTO `yd_img_info` VALUES ('11', '1573546571.png', 'eb67899fd6cfa60568d5b3070892a278.png', 'admin', '20191112/eb67899fd6cfa60568d5b3070892a278.png', 'D:\\project\\yd\\public\\static\\upload\\20191112\\eb67899fd6cfa60568d5b3070892a278.png', '1573548538', '1');
INSERT INTO `yd_img_info` VALUES ('14', '10.jpg', 'f081bf36db30866f82bb6a7019e30e3f.jpg', 'admin', '20191112/f081bf36db30866f82bb6a7019e30e3f.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\f081bf36db30866f82bb6a7019e30e3f.jpg', '1573558689', '1');
INSERT INTO `yd_img_info` VALUES ('15', '11.jpg', 'cb029fc00f5448f4c272cfb7381b6fc9.jpg', 'admin', '20191112/cb029fc00f5448f4c272cfb7381b6fc9.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\cb029fc00f5448f4c272cfb7381b6fc9.jpg', '1573558692', '1');
INSERT INTO `yd_img_info` VALUES ('16', '12.jpg', '56401e143aac77aee8fc2414f4744a92.jpg', 'admin', '20191112/56401e143aac77aee8fc2414f4744a92.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\56401e143aac77aee8fc2414f4744a92.jpg', '1573558697', '1');
INSERT INTO `yd_img_info` VALUES ('17', '13.jpg', '22a0136ecbd271674e28b5c54db1c384.jpg', 'admin', '20191112/22a0136ecbd271674e28b5c54db1c384.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\22a0136ecbd271674e28b5c54db1c384.jpg', '1573558701', '1');
INSERT INTO `yd_img_info` VALUES ('18', '14.jpg', 'f5ad50d87205e6995c81c31028366e25.jpg', 'admin', '20191112/f5ad50d87205e6995c81c31028366e25.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191112\\f5ad50d87205e6995c81c31028366e25.jpg', '1573558705', '1');
INSERT INTO `yd_img_info` VALUES ('19', 'product1.png', 'e295f856d7f047ca015e202bfa89e29d.png', 'admin', '20191112/e295f856d7f047ca015e202bfa89e29d.png', 'D:\\project\\yd\\public\\static\\upload\\20191112\\e295f856d7f047ca015e202bfa89e29d.png', '1573558734', '1');
INSERT INTO `yd_img_info` VALUES ('20', '11.jpg', '6bbf40d4ebe2b757473603ae372f33c5.jpg', 'admin', '20191113/6bbf40d4ebe2b757473603ae372f33c5.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191113\\6bbf40d4ebe2b757473603ae372f33c5.jpg', '1573633843', '1');
INSERT INTO `yd_img_info` VALUES ('21', 'v3.jpg', '43c954bb03e827bd00900f4fe9b81fef.jpg', 'admin', '20191113/43c954bb03e827bd00900f4fe9b81fef.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191113\\43c954bb03e827bd00900f4fe9b81fef.jpg', '1573652248', '1');
INSERT INTO `yd_img_info` VALUES ('22', 'timg (3)w.jpg', '3fbf25126eff906e52d9013e7ae6ed31.jpg', 'admin', '20191113/3fbf25126eff906e52d9013e7ae6ed31.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191113\\3fbf25126eff906e52d9013e7ae6ed31.jpg', '1573652258', '1');
INSERT INTO `yd_img_info` VALUES ('23', '14.jpg', '94c433f36525551536b4bae14ab07ce5.jpg', 'admin', '20191113/94c433f36525551536b4bae14ab07ce5.jpg', 'D:\\project\\yd\\public\\static\\upload\\20191113\\94c433f36525551536b4bae14ab07ce5.jpg', '1573652261', '1');

-- ----------------------------
-- Table structure for yd_info
-- ----------------------------
DROP TABLE IF EXISTS `yd_info`;
CREATE TABLE `yd_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '联系人姓名',
  `wx` varchar(60) DEFAULT '' COMMENT '微信号',
  `sheng` varchar(32) DEFAULT '' COMMENT '省份',
  `city` varchar(32) DEFAULT '' COMMENT '城市',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `describe` varchar(100) DEFAULT '' COMMENT '留言',
  `ip` varchar(16) DEFAULT NULL COMMENT 'ip地址',
  `date` date DEFAULT NULL COMMENT '日期',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='信息维护表';

-- ----------------------------
-- Records of yd_info
-- ----------------------------
INSERT INTO `yd_info` VALUES ('1', '刘振阳', 'lzyszts', '四川', '德阳', '19950618188', '', '192.168.1.254', '2019-11-12', '1573549596');

-- ----------------------------
-- Table structure for yd_link
-- ----------------------------
DROP TABLE IF EXISTS `yd_link`;
CREATE TABLE `yd_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) NOT NULL DEFAULT '' COMMENT '网站名称',
  `type` varchar(32) NOT NULL COMMENT '分组标识关键字',
  `thumb_id` int(11) unsigned DEFAULT '0' COMMENT '网站LOGOid',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '网站地址',
  `describe` varchar(60) NOT NULL DEFAULT '' COMMENT '网站描述',
  `icon` varchar(60) DEFAULT NULL COMMENT 'icon class名',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新窗口打开（0否，1是）',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接';

-- ----------------------------
-- Records of yd_link
-- ----------------------------
INSERT INTO `yd_link` VALUES ('1', '官方微博', 'footer', '9', '#', '', 'icon-weibo', '0', '1', '0', '1567587475', '1573546593');
INSERT INTO `yd_link` VALUES ('2', '官方微信', 'footer', '10', '#', '', 'icon-weixin', '1', '1', '0', '1567588870', '1573546600');
INSERT INTO `yd_link` VALUES ('3', '淘宝旗舰店', 'footer', '11', '#', '', '', '2', '1', '0', '1567588884', '1573548539');

-- ----------------------------
-- Table structure for yd_page_access_log
-- ----------------------------
DROP TABLE IF EXISTS `yd_page_access_log`;
CREATE TABLE `yd_page_access_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `date` char(8) NOT NULL DEFAULT '' COMMENT '日期',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面访问统计表';

-- ----------------------------
-- Records of yd_page_access_log
-- ----------------------------

-- ----------------------------
-- Table structure for yd_role
-- ----------------------------
DROP TABLE IF EXISTS `yd_role`;
CREATE TABLE `yd_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色组id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_des` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of yd_role
-- ----------------------------
INSERT INTO `yd_role` VALUES ('1', '默认角色', '所有用户默认权限', '1', null, '1566550892');
INSERT INTO `yd_role` VALUES ('2', '前台用户', '前台普通用户登录后自动赋予', '1', null, '1571246188');

-- ----------------------------
-- Table structure for yd_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `yd_role_auth`;
CREATE TABLE `yd_role_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `auth_id` (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色与权限关联表';

-- ----------------------------
-- Records of yd_role_auth
-- ----------------------------
INSERT INTO `yd_role_auth` VALUES ('1', '2', '1', '1571246188');

-- ----------------------------
-- Table structure for yd_slide
-- ----------------------------
DROP TABLE IF EXISTS `yd_slide`;
CREATE TABLE `yd_slide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `column_id` int(11) NOT NULL COMMENT '所属栏目id',
  `type` varchar(32) NOT NULL COMMENT '分类标识关键字',
  `event_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '事件类型（0 无操作, 1 跳转链接, 2 打开地图，3 拨打电话）',
  `event_value` varchar(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `img_id` int(11) NOT NULL COMMENT '图片id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图片';

-- ----------------------------
-- Records of yd_slide
-- ----------------------------
INSERT INTO `yd_slide` VALUES ('1', '0', 'slide', '0', '', '1', '首页大图1', '1', '0', '', '1573535235', '0');
INSERT INTO `yd_slide` VALUES ('2', '0', 'slide-phone', '0', '', '2', '大图1-手机', '1', '0', '', '1573535259', '0');
INSERT INTO `yd_slide` VALUES ('3', '0', 'slide', '0', '', '4', '首页大图2', '1', '0', '', '1573545378', '0');
INSERT INTO `yd_slide` VALUES ('4', '0', 'slide-phone', '0', '', '5', '大图2-手机', '1', '0', '', '1573545395', '0');
