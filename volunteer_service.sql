/*
Navicat MySQL Data Transfer

Source Server         : code1
Source Server Version : 100124
Source Host           : localhost:3306
Source Database       : volunteer_service

Target Server Type    : MYSQL
Target Server Version : 100124
File Encoding         : 65001

Date: 2019-01-02 12:15:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for academic
-- ----------------------------
DROP TABLE IF EXISTS `academic`;
CREATE TABLE `academic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '学院名称',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='学院表';

-- ----------------------------
-- Records of academic
-- ----------------------------
INSERT INTO `academic` VALUES ('1', '建筑工程学院', '2018-09-11 13:28:10');
INSERT INTO `academic` VALUES ('2', '体育学院', '2018-09-11 13:28:10');
INSERT INTO `academic` VALUES ('3', '软件工程学院', '2018-09-13 17:23:29');
INSERT INTO `academic` VALUES ('4', '音乐学院', '2018-09-13 17:37:02');
INSERT INTO `academic` VALUES ('5', '信息学院', '2018-12-14 14:15:33');
INSERT INTO `academic` VALUES ('6', '工程学院', '2018-12-14 14:15:33');
INSERT INTO `academic` VALUES ('7', '园林学院', '2018-12-14 14:15:33');
INSERT INTO `academic` VALUES ('8', '林学院', '2018-12-14 14:15:33');
INSERT INTO `academic` VALUES ('9', '材料学院', '2018-12-14 14:15:33');
INSERT INTO `academic` VALUES ('10', '机电学院', '2018-12-14 14:15:33');
INSERT INTO `academic` VALUES ('11', '理学院', '2018-12-14 14:15:34');
INSERT INTO `academic` VALUES ('12', '文法学院', '2018-12-14 14:15:34');
INSERT INTO `academic` VALUES ('13', '信息与计算机工程学院', '2018-12-19 09:28:27');

-- ----------------------------
-- Table structure for bs_menu
-- ----------------------------
DROP TABLE IF EXISTS `bs_menu`;
CREATE TABLE `bs_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(15) DEFAULT NULL COMMENT '菜单名称',
  `gid` int(10) unsigned DEFAULT NULL,
  `module` varchar(20) DEFAULT NULL COMMENT '对应模块',
  `controller` varchar(20) DEFAULT NULL COMMENT '对应控制器',
  `action` varchar(20) DEFAULT NULL COMMENT '对应操作',
  `params` varchar(128) DEFAULT NULL COMMENT '请求参数（?id=）',
  `pid` int(11) DEFAULT '0' COMMENT '上级id',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0禁用，1显示，2隐藏，3授权后显示）',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序（倒序）',
  `icon` varchar(25) DEFAULT NULL COMMENT '菜单样式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of bs_menu
-- ----------------------------
INSERT INTO `bs_menu` VALUES ('5', '账号管理', '2', 'admin', '', '', '', '0', '2', '99', 'icon-group');
INSERT INTO `bs_menu` VALUES ('6', '登陆账号', '2', 'admin', 'user', 'index', '', '5', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('7', '角色管理', '2', 'admin', 'role', 'index', '', '5', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('8', '菜单管理', '2', 'admin', 'menu', 'index', '', '5', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('29', '会员管理', '1', 'admin', '', '', '', '0', '2', '100', 'icon-list');
INSERT INTO `bs_menu` VALUES ('30', '部门管理', '2', 'admin', '', '', '', '0', '2', '98', 'icon-list');
INSERT INTO `bs_menu` VALUES ('31', '部门列表', '2', 'admin', 'department', 'index', '', '30', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('32', '微信公众号', '2', 'admin', '', '', '', '0', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('33', '微信配置', '2', 'admin', 'weixin', 'index', '', '32', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('34', '自定义菜单', '2', 'admin', 'weixin', 'menu', '', '32', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('35', '会员管理', '1', 'admin', 'member', 'index', '', '29', '2', '99', '');
INSERT INTO `bs_menu` VALUES ('36', '用户列表', '1', null, null, null, '', '0', '1', '99', '');
INSERT INTO `bs_menu` VALUES ('37', '老干部信息', '1', 'admin', 'teacheruser', 'index', '', '36', '1', '99', '');
INSERT INTO `bs_menu` VALUES ('38', '学生信息', '1', 'admin', 'studentuser', 'index', '', '36', '1', '99', '');
INSERT INTO `bs_menu` VALUES ('39', '紧急心愿', '1', null, null, null, '', '0', '1', '99', '');
INSERT INTO `bs_menu` VALUES ('40', '紧急心愿', '1', 'admin', 'wish', 'index', '', '39', '1', '99', '');
INSERT INTO `bs_menu` VALUES ('41', '审核', '1', '', '', '', '', '0', '1', '99', '');
INSERT INTO `bs_menu` VALUES ('42', '审核学生', '1', 'admin', 'shenhestudent', 'index', '', '41', '1', '99', '');
INSERT INTO `bs_menu` VALUES ('43', '审核教师', '1', 'admin', 'shenheteacher', 'index', '', '41', '1', '99', '');

-- ----------------------------
-- Table structure for bs_node
-- ----------------------------
DROP TABLE IF EXISTS `bs_node`;
CREATE TABLE `bs_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL COMMENT '菜单id',
  `title` varchar(50) DEFAULT NULL COMMENT '节点名称',
  `name` varchar(100) DEFAULT NULL COMMENT '节点key（操作名称）',
  `icon` varchar(20) DEFAULT NULL COMMENT '节点图标',
  `groups` tinyint(1) DEFAULT '1' COMMENT '分组',
  `visible` tinyint(1) DEFAULT '0' COMMENT '状态（1显示，2隐藏）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '倒序排序',
  `event_type` enum('default','custom','view','script') DEFAULT NULL COMMENT '事件类型',
  `event_value` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '动作地址',
  `target` varchar(15) DEFAULT NULL COMMENT '链接打开方式',
  `access` int(1) DEFAULT '0' COMMENT '-1禁止访问，0默认，1公共（无权限控制）',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COMMENT='菜单权限节点表';

-- ----------------------------
-- Records of bs_node
-- ----------------------------
INSERT INTO `bs_node` VALUES ('6', '3', '查看', 'contact', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('7', '3', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('8', '3', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('9', '3', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('10', '3', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('21', '6', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('22', '6', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('23', '6', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('24', '6', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('25', '6', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('26', '7', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('27', '7', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('28', '7', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('29', '7', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('31', '8', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('32', '8', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('33', '8', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('34', '8', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('95', '21', '查看', 'dddd', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('96', '21', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('97', '21', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('98', '21', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('99', '21', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('100', '22', '查看', 'dddd', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('101', '22', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('102', '22', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('103', '22', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('104', '22', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('105', '23', '查看', 'dddd', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('106', '23', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('107', '23', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('108', '23', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('109', '23', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('110', '24', '查看', 'dddd', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('111', '24', '添加', 'add', 'icon-plus', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('112', '24', '编辑', 'edit', 'icon-edit', '1', '1', null, '99', 'view', null, 'modal', '0');
INSERT INTO `bs_node` VALUES ('113', '24', '删除', 'delete', 'icon-trash', '1', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('114', '24', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('192', '6', '角色', 'role', '', '1', '1', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('250', '7', '权限', 'access_menu', '', '1', '1', '', '0', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('251', '31', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('252', '31', '添加', 'add', 'icon-plus', '1', '1', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('253', '31', '编辑', 'edit', 'icon-edit', '1', '1', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('254', '31', '删除', 'delete', 'icon-trash', '1', '1', '', '99', 'default', '', '', '0');
INSERT INTO `bs_node` VALUES ('255', '31', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('256', '35', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('257', '35', '添加', 'add', 'icon-plus', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('258', '35', '编辑', 'edit', 'icon-edit', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('259', '35', '删除', 'delete', 'icon-trash', '1', '0', '', '99', 'default', '', '', '0');
INSERT INTO `bs_node` VALUES ('260', '35', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('261', '37', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('262', '37', '添加', 'add', 'icon-plus', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('263', '37', '编辑', 'edit', 'icon-edit', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('264', '37', '删除', 'delete', 'icon-trash', '1', '0', '', '99', 'default', '', '', '0');
INSERT INTO `bs_node` VALUES ('265', '37', '搜索', 'search', 'icon-search', '2', '0', '', '99', 'default', '', '', '0');
INSERT INTO `bs_node` VALUES ('266', '37', '导入信息', 'importfile', '', '1', '1', '', '0', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('267', '38', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('268', '38', '添加', 'add', 'icon-plus', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('269', '38', '编辑', 'edit', 'icon-edit', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('270', '38', '删除', 'delete', 'icon-trash', '1', '0', '', '99', 'default', '', '', '0');
INSERT INTO `bs_node` VALUES ('271', '38', '搜索', 'search', 'icon-search', '2', '1', null, '99', 'default', null, '', '0');
INSERT INTO `bs_node` VALUES ('272', '38', '导入学生信息', 'importfile', '', '1', '1', '', '0', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('273', '38', '导出学生志愿总时长', 'export', '', '1', '1', '', '0', 'view', '', 'self', '0');
INSERT INTO `bs_node` VALUES ('274', '40', '查看', 'index', '', '1', '0', null, '100', 'view', null, 'self', '0');
INSERT INTO `bs_node` VALUES ('275', '40', '添加', 'add', 'icon-plus', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('276', '40', '编辑', 'edit', 'icon-edit', '1', '0', '', '99', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('277', '40', '删除', 'delete', 'icon-trash', '1', '0', '', '99', 'default', '', '', '0');
INSERT INTO `bs_node` VALUES ('278', '40', '搜索', 'search', 'icon-search', '2', '0', '', '99', 'default', '', '', '0');
INSERT INTO `bs_node` VALUES ('279', '40', '导出心愿', 'export', '', '1', '1', '', '0', 'view', '', 'self', '0');
INSERT INTO `bs_node` VALUES ('280', '42', '查看', 'index', 'icon-off', '1', '0', '', '0', 'view', '', 'modal', '0');
INSERT INTO `bs_node` VALUES ('281', '43', '查看', 'index', '', '1', '0', '', '0', 'view', '', 'modal', '0');

-- ----------------------------
-- Table structure for bs_resource
-- ----------------------------
DROP TABLE IF EXISTS `bs_resource`;
CREATE TABLE `bs_resource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '文件URL路径',
  `type` varchar(15) DEFAULT NULL COMMENT '文件类型(img)',
  `original` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `ext` varchar(15) DEFAULT NULL COMMENT '文件扩展名',
  `title` varchar(100) DEFAULT NULL COMMENT '存储名称',
  `path` varchar(100) DEFAULT NULL COMMENT '存储路径',
  `width` int(10) unsigned DEFAULT NULL COMMENT '图片宽度',
  `height` int(10) unsigned DEFAULT NULL COMMENT '图片高度',
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8mb4 COMMENT='文件上传记录';

-- ----------------------------
-- Records of bs_resource
-- ----------------------------
INSERT INTO `bs_resource` VALUES ('348', 'http://www.volunteerservice.com/upload/file/20180911/1536637399196380.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('349', 'http://www.volunteerservice.com/upload/file/20180911/1536637474786590.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('350', 'http://www.volunteerservice.com/upload/file/20180911/1536637863486663.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('351', 'http://www.volunteerservice.com/upload/file/20180911/1536637901426940.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('352', 'http://www.volunteerservice.com/upload/file/20180911/1536637947874053.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('353', 'http://www.volunteerservice.com/upload/file/20180911/1536638165618743.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('354', 'http://www.volunteerservice.com/upload/file/20180911/1536638307282287.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('355', 'http://www.volunteerservice.com/upload/file/20180911/1536638395209838.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('356', 'http://www.volunteerservice.com/upload/file/20180911/1536642194533691.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('357', 'http://www.volunteerservice.com/upload/file/20180911/1536642228920074.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('358', 'http://www.volunteerservice.com/upload/file/20180911/1536642445600769.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('359', 'http://www.volunteerservice.com/upload/file/20180911/1536643689256683.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('360', 'http://www.volunteerservice.com/upload/file/20180911/1536643757379211.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('361', 'http://www.volunteerservice.com/upload/file/20180911/1536643915216461.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('362', 'http://www.volunteerservice.com/upload/file/20180911/1536643975430267.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('363', 'http://www.volunteerservice.com/upload/file/20180911/1536643992571289.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('364', 'http://www.volunteerservice.com/upload/file/20180911/1536645025791809.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('365', 'http://www.volunteerservice.com/upload/file/20180911/1536645118387023.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('366', 'http://www.volunteerservice.com/upload/file/20180911/1536645240907165.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('367', 'http://www.volunteerservice.com/upload/file/20180911/1536645408326721.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('368', 'http://www.volunteerservice.com/upload/file/20180911/1536645422131805.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('369', 'http://www.volunteerservice.com/upload/file/20180911/1536645443500030.xls', 'file', '导入老干部信息表.xls', '19456', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('370', 'http://www.volunteerservice.com/upload/file/20180911/1536646735752410.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('371', 'http://www.volunteerservice.com/upload/file/20180911/1536646809955627.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('372', 'http://www.volunteerservice.com/upload/file/20180911/1536646848447509.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('373', 'http://www.volunteerservice.com/upload/file/20180911/1536646879986816.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('374', 'http://www.volunteerservice.com/upload/file/20180911/1536646919150756.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('375', 'http://www.volunteerservice.com/upload/file/20180911/1536646934127441.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('376', 'http://www.volunteerservice.com/upload/file/20180911/1536651119980010.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('377', 'http://www.volunteerservice.com/upload/file/20180911/1536651129836029.xls', 'file', '导入学生信息表 .xls', '19456', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('378', 'http://volunteer.xingyebao.com/upload/file/20180913/1536830486849404.xls', 'file', '导入老干部信息表.xls', '20480', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('379', 'http://volunteer.xingyebao.com/upload/file/20180913/1536830562127503.xls', 'file', '导入老干部信息表.xls', '20480', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('380', 'http://volunteer.xingyebao.com/upload/file/20180913/1536831230112678.xls', 'file', '导入老干部信息表.xls', '20480', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('381', 'http://volunteer.xingyebao.com/upload/file/20180913/1536831281480449.xls', 'file', '导入老干部信息表.xls', '20480', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('382', 'http://volunteer.xingyebao.com/upload/file/20180913/1536831421751463.xls', 'file', '导入学生信息表 .xls', '20480', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('383', 'http://volunteer.xingyebao.com/upload/file/20180913/1536840793127765.xls', 'file', '导入学生信息表 .xls', '20480', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('384', 'http://volunteer.xingyebao.com/upload/file/20180914/1536886166704258.xls', 'file', '导入老干部信息表.xls', '18944', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('385', 'http://volunteer.xingyebao.com/upload/file/20180914/1536887530816872.xls', 'file', '导入学生信息表 .xls', '18944', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('386', 'http://volunteer.xingyebao.com/upload/file/20180914/1536915557292616.xls', 'file', '导入学生信息表 .xls', '18944', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('387', 'http://volunteer.xingyebao.com/upload/file/20180914/1536915597705807.xls', 'file', '导入学生信息表 .xls', '18944', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('388', 'http://volunteer.xingyebao.com/upload/file/20180914/1536915614124374.xls', 'file', '导入学生信息表 .xls', '18944', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('389', 'http://volunteer.xingyebao.com/upload/file/20180915/1536997269368438.xls', 'file', '导入学生信息表 .xls', '20480', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('390', 'http://volunteer.xingyebao.com/upload/file/20180915/1536997533113926.xls', 'file', '导入老干部信息表.xls', '20480', '.xls', '导入老干部信息表', null, null, null);
INSERT INTO `bs_resource` VALUES ('391', 'http://volunteer.xingyebao.com/upload/file/20181214/1544768132135115.xls', 'file', '导入老干部信息表 (1).xls', '20480', '.xls', '导入老干部信息表 (1)', null, null, null);
INSERT INTO `bs_resource` VALUES ('392', 'http://volunteer.xingyebao.com/upload/file/20181214/1544771441447960.xls', 'file', '导入学生信息表 .xls', '18944', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('393', 'http://volunteer.xingyebao.com/upload/file/20181219/1545182904131130.xls', 'file', '导入学生信息表 .xls', '20480', '.xls', '导入学生信息表 ', null, null, null);
INSERT INTO `bs_resource` VALUES ('394', 'http://volunteer.xingyebao.com/upload/file/20181220/1545283427922041.xls', 'file', '导入学生信息表  (1).xls', '18944', '.xls', '导入学生信息表  (1)', null, null, null);

-- ----------------------------
-- Table structure for bs_role
-- ----------------------------
DROP TABLE IF EXISTS `bs_role`;
CREATE TABLE `bs_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) DEFAULT NULL COMMENT '角色名称',
  `menu_id` varchar(500) DEFAULT NULL,
  `node_id` varchar(500) DEFAULT NULL COMMENT '权限节点（node表id集合）',
  `dept_id` varchar(255) DEFAULT NULL COMMENT '部门权限（dept表id集合）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0禁用，1启用）',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of bs_role
-- ----------------------------
INSERT INTO `bs_role` VALUES ('1', '系统管理员', null, null, null, '1', '');
INSERT INTO `bs_role` VALUES ('3', '老干部', '37', '', null, '1', '');
INSERT INTO `bs_role` VALUES ('4', '学生', '38', '', null, '1', '');

-- ----------------------------
-- Table structure for bs_role_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_role_user`;
CREATE TABLE `bs_role_user` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

-- ----------------------------
-- Records of bs_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `initial` varchar(8) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '1省份 2城市 3区县',
  `short_name` varchar(25) DEFAULT NULL,
  `name2` varchar(25) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `pcode` varchar(15) DEFAULT NULL,
  `pinyin` varchar(25) DEFAULT NULL COMMENT '拼音',
  `lng` varchar(20) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省市区(数据来源于淘宝)';

-- ----------------------------
-- Records of city
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0' COMMENT '上级id',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `level` int(1) DEFAULT '0' COMMENT '层级',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(10) DEFAULT '0' COMMENT '推荐人id',
  `nickname` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '昵称',
  `is_employee` int(1) DEFAULT '0' COMMENT '是否为公司员工（1是）',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '钱包余额（包含不可提现金额）',
  `no_balance` decimal(10,2) DEFAULT '0.00' COMMENT '不可提现金额',
  `agent_level` int(1) DEFAULT '0' COMMENT '代理级别',
  `score` int(10) DEFAULT '0' COMMENT '会员积分',
  `sex` int(1) DEFAULT '0' COMMENT '性别',
  `mobile` varchar(11) DEFAULT NULL COMMENT '绑定手机号',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `head_img` varchar(500) DEFAULT NULL COMMENT '头像',
  `reg_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '省份id',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '城市id',
  `county_id` int(10) unsigned DEFAULT NULL COMMENT '区县id',
  `address` varchar(120) DEFAULT NULL COMMENT '详细地址',
  `first_from` varchar(100) DEFAULT NULL COMMENT '第一次注册来源',
  `from` varchar(100) DEFAULT NULL COMMENT '用户来源',
  `total_score` int(11) unsigned DEFAULT '0' COMMENT '累计积分',
  `password` varchar(32) DEFAULT '' COMMENT '登陆密码',
  `wxid` varchar(32) DEFAULT '' COMMENT '微信开放平台openid',
  PRIMARY KEY (`id`),
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `agent_level` (`agent_level`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025744 DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1025740', '0', '✎﹏ℳ๓₯㎕', '0', '0.00', '0.00', '0', '0', '1', null, null, 'http://thirdwx.qlogo.cn/mmopen/o2yiacl5XFuU1szVw6OWgpuGObCXf3iaYAZ7dTbOK0Wr1EQ4IctiaYOBaCic4rQbntL47esr8AwEk9d9BIKZFT6LaKICatdDpdq8/132', '1545285487', null, null, null, null, 'wx', 'wx', '0', '', '');
INSERT INTO `member` VALUES ('1025742', '0', '游天&侠客', '0', '0.00', '0.00', '0', '0', '1', null, null, 'http://thirdwx.qlogo.cn/mmopen/0PMWFB4k9tTvzNQibOM74PSqED4ZEH4lxPQ2qkwxTdrAFn5icia788avmqkHCAyFen3ibEeNIX4zm6SBkjicaOt2VP8dbpJVHdicFQ/132', '1545286056', null, null, null, null, 'wx', 'wx', '0', '', '');
INSERT INTO `member` VALUES ('1025743', '0', '冷了一半', '0', '0.00', '0.00', '0', '0', '1', null, null, 'http://thirdwx.qlogo.cn/mmopen/9M0PhLTmTIej9cCeUwolicCwibLEBEgBC67XB7sWKm5MSnNW0laGEFsLP4JMIot4sAXZrNOWOl9utbTtfYSbVgiaOwgwxMd32Ep/132', '1545286874', null, null, null, null, 'h5/teacher/index', 'h5/teacher/index', '0', '', '');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL COMMENT '名称',
  `type` int(1) DEFAULT '0' COMMENT '店铺类型',
  `wx_appid` varchar(32) DEFAULT NULL COMMENT '微信公众号',
  `code` varchar(25) DEFAULT NULL COMMENT '程序索引',
  `host` varchar(50) DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL COMMENT '主营类目',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `logo` varchar(500) DEFAULT NULL COMMENT '店铺logo',
  `desc` varchar(300) DEFAULT NULL COMMENT '店铺简介',
  `contacts` varchar(25) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `hotline` varchar(15) DEFAULT NULL COMMENT '客服电话',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ号',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '所在省份',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '所在城市',
  `county_id` int(10) unsigned DEFAULT NULL COMMENT '所在区/县',
  `address` varchar(120) DEFAULT NULL COMMENT '详细地址',
  `lon` varchar(20) DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) DEFAULT NULL COMMENT '纬度',
  `pic` text COMMENT '门店照片',
  `business_hours` varchar(80) DEFAULT NULL COMMENT '营业时间',
  `description` varchar(200) DEFAULT NULL COMMENT '商家推荐',
  `state` int(1) unsigned DEFAULT '1' COMMENT '状态。0禁用',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否被删除，1被删(不可查找此数据)',
  `pv` int(10) unsigned DEFAULT '0',
  `uv` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商家/店铺';

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '相益志愿者服务系统', '0', '', '', '', null, null, '', '', '', '', '', '', null, null, null, '', null, null, null, '', null, '1', '0', '0', '0');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '绑定微信id',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `school_number` varchar(50) DEFAULT NULL COMMENT '学号',
  `sex` int(3) DEFAULT NULL COMMENT '性别：1、男 2、女',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `academic_id` int(11) DEFAULT NULL COMMENT '学院id',
  `mutual_aid_time` varchar(255) DEFAULT NULL COMMENT '志愿总时间（存分钟）',
  `val` int(11) DEFAULT NULL COMMENT '接取任务个数',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('5', null, '小明', '10001', '1', '13312345678', '1', '570', null, '2018-09-11 14:22:15');
INSERT INTO `student` VALUES ('6', null, '小陈', '10002', '1', '13312345671', '1', '55.2', null, '2018-09-11 14:22:15');
INSERT INTO `student` VALUES ('7', null, '小赵', '10003', '1', '13312345672', '1', '0', null, '2018-09-11 14:22:15');
INSERT INTO `student` VALUES ('8', null, '小付', '10004', '1', '13312345673', '2', '123', null, '2018-09-11 14:22:15');
INSERT INTO `student` VALUES ('17', null, '小明', '20090101', '1', '18312345678', '1', '0', null, '2018-09-13 17:37:02');
INSERT INTO `student` VALUES ('18', null, '小李', '20090102', '2', '18245666666', '4', '0', null, '2018-09-13 17:37:03');
INSERT INTO `student` VALUES ('19', null, '小马', '20090103', '2', '18133434554', '2', '0', null, '2018-09-13 17:37:03');
INSERT INTO `student` VALUES ('20', null, '小美', '20090104', '2', '15124686096', '3', '4106', null, '2018-09-13 20:13:15');
INSERT INTO `student` VALUES ('21', null, '小苍一号', '1006', '1', '18245022144', '2', '-6.5555855555939E+14', null, '2018-09-14 09:12:11');
INSERT INTO `student` VALUES ('22', null, '小丑一号', '2048', '1', '182450221444', '3', '0', null, '2018-09-14 17:00:15');
INSERT INTO `student` VALUES ('23', null, '小楠', '20090105', '2', '18714613621', '1', '70', null, '2018-09-15 15:41:13');
INSERT INTO `student` VALUES ('24', null, '小明', '2016214235', '1', '17712345678', '5', '0', null, '2018-12-14 15:10:42');
INSERT INTO `student` VALUES ('25', null, '赵云', '20160101', '1', '18800460101', '13', '0', null, '2018-12-19 09:28:27');
INSERT INTO `student` VALUES ('26', null, '韩伟华', '2016210686', '1', '18800462819', '5', '301', null, '2018-12-20 13:23:50');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '绑定微信id',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `job_number` varchar(50) DEFAULT NULL COMMENT '工号',
  `sex` int(3) DEFAULT NULL COMMENT '性别：1、男 2、女',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `academic_id` int(11) DEFAULT NULL COMMENT '学院id',
  `mutual_aid_time` varchar(255) DEFAULT NULL COMMENT '互助剩余时间（存分钟）',
  `val` int(11) DEFAULT NULL COMMENT '发布任务个数',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='老干部信息表';

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('13', null, '赵鹏', '1001', '1', '14565467756', '1', '3000', null, '2018-09-13 17:23:29');
INSERT INTO `teacher` VALUES ('14', '1025721', '玛丽', '1002', '2', '18246556255', '3', '3118', null, '2018-09-13 17:23:29');
INSERT INTO `teacher` VALUES ('15', null, '赵悦', '1003', '1', '15565467756', '1', '3000', null, '2018-09-13 17:34:44');
INSERT INTO `teacher` VALUES ('16', '1025724', '李丽', '1004', '2', '18446556255', '3', '3600', null, '2018-09-13 17:34:44');
INSERT INTO `teacher` VALUES ('17', '1025723', '小苍', '1005', '1', '182450221144', '2', '3600', null, '2018-09-14 08:49:28');
INSERT INTO `teacher` VALUES ('18', '1025726', '欧阳', '1006', '1', '18265467756', '1', '2930', null, '2018-09-15 15:45:36');
INSERT INTO `teacher` VALUES ('23', null, '小李', '5', '1', '17312345674', '8', '3000', null, '2018-12-14 14:15:33');
INSERT INTO `teacher` VALUES ('24', null, '小陈', '6', '2', '17312345673', '9', '3000', null, '2018-12-14 14:15:33');
INSERT INTO `teacher` VALUES ('25', '1025736', '小敏', '7', '1', '17312345672', '10', '3000', null, '2018-12-14 14:15:34');
INSERT INTO `teacher` VALUES ('26', null, '小贺', '8', '2', '17312345671', '11', '3000', null, '2018-12-14 14:15:34');
INSERT INTO `teacher` VALUES ('27', null, '小林', '9', '1', '17312345670', '12', '3000', null, '2018-12-14 14:15:34');
INSERT INTO `teacher` VALUES ('28', null, '李逵', '10', '2', '17312341234', '8', '3000', null, '2018-12-14 14:15:34');
INSERT INTO `teacher` VALUES ('29', null, '安卓', '11', '1', '17312341233', '9', '3000', null, '2018-12-14 14:15:34');
INSERT INTO `teacher` VALUES ('30', null, '民拜仁', '12', '2', '17312341232', '10', '3000', null, '2018-12-14 14:15:34');
INSERT INTO `teacher` VALUES ('31', null, '韩信', '13', '1', '17312341231', '12', '3000', null, '2018-12-14 14:15:34');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(15) DEFAULT NULL COMMENT '姓名',
  `shop_id` int(10) unsigned DEFAULT '1' COMMENT '店铺id',
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0未启用，1启用，[2被冻结]',
  `administrator` tinyint(1) DEFAULT '0' COMMENT '1超级管理员',
  `association_id` varchar(128) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台-用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '超级管理员', '1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', null, null);
INSERT INTO `users` VALUES ('2', '测试账号', '1', 'test', 'c4ca4238a0b923820dcc509a6f75849b', '1', '0', null, null);

-- ----------------------------
-- Table structure for users_auto_login
-- ----------------------------
DROP TABLE IF EXISTS `users_auto_login`;
CREATE TABLE `users_auto_login` (
  `username` varchar(25) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `last_time` int(10) DEFAULT NULL COMMENT '上次设定自动登录时间',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户自动登录';

-- ----------------------------
-- Records of users_auto_login
-- ----------------------------

-- ----------------------------
-- Table structure for wish
-- ----------------------------
DROP TABLE IF EXISTS `wish`;
CREATE TABLE `wish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL COMMENT '心愿类型 1、购物 2、取快递 3、校园出行 4、上门陪伴 5、整理资料 6、辅导手机应用 7、读报',
  `content` varchar(255) DEFAULT NULL COMMENT '心愿内容',
  `end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `finsh_time` datetime DEFAULT NULL COMMENT '心愿完成时间',
  `t_id` int(11) DEFAULT NULL COMMENT '发布心愿人id',
  `s_id` int(11) DEFAULT NULL COMMENT '接取心愿人id',
  `evaluate` int(11) DEFAULT NULL COMMENT '评价星级',
  `duration` varchar(50) DEFAULT NULL COMMENT '心愿完成时长',
  `status` int(11) DEFAULT NULL COMMENT '状态：1、待接取 2、已接取 3、待评价 4、已完成',
  `status_p` int(11) DEFAULT NULL COMMENT '求助人类型： 1、学生2、老师',
  `academic_id` int(11) DEFAULT NULL COMMENT '归属学院id',
  `add_time` datetime DEFAULT NULL COMMENT '心愿添加时间',
  `shenhe` int(4) DEFAULT '0' COMMENT '初始是0，通过是1，没通过是2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COMMENT='心愿信息表';

-- ----------------------------
-- Records of wish
-- ----------------------------
INSERT INTO `wish` VALUES ('2', '3', '啦啦啦', '2018-09-12 10:14:00', null, '9', null, null, null, '2', '1', '1', '2018-09-12 10:20:33', '0');
INSERT INTO `wish` VALUES ('3', '3', '啦啦啦', '2018-09-14 10:14:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 10:20:58', '0');
INSERT INTO `wish` VALUES ('4', '1', '啦啦啦啦', '2018-09-12 16:30:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 10:21:24', '0');
INSERT INTO `wish` VALUES ('5', '4', '啦啦啦啦', '2018-09-12 16:14:00', null, '9', '17', null, null, '2', '1', '1', '2018-09-12 16:14:49', '0');
INSERT INTO `wish` VALUES ('6', '5', '啦啦', '2018-09-12 16:14:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:07', '0');
INSERT INTO `wish` VALUES ('7', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:46', '0');
INSERT INTO `wish` VALUES ('8', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:46', '0');
INSERT INTO `wish` VALUES ('9', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:47', '0');
INSERT INTO `wish` VALUES ('10', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:47', '0');
INSERT INTO `wish` VALUES ('11', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:47', '0');
INSERT INTO `wish` VALUES ('12', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:47', '0');
INSERT INTO `wish` VALUES ('13', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:47', '0');
INSERT INTO `wish` VALUES ('14', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:47', '0');
INSERT INTO `wish` VALUES ('15', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:47', '0');
INSERT INTO `wish` VALUES ('16', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:48', '0');
INSERT INTO `wish` VALUES ('17', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:48', '0');
INSERT INTO `wish` VALUES ('18', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:48', '0');
INSERT INTO `wish` VALUES ('19', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:48', '0');
INSERT INTO `wish` VALUES ('20', '7', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:48', '0');
INSERT INTO `wish` VALUES ('21', '5', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:51', '0');
INSERT INTO `wish` VALUES ('22', '5', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:51', '0');
INSERT INTO `wish` VALUES ('23', '5', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:51', '0');
INSERT INTO `wish` VALUES ('24', '5', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:51', '0');
INSERT INTO `wish` VALUES ('25', '4', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:53', '0');
INSERT INTO `wish` VALUES ('26', '4', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:54', '0');
INSERT INTO `wish` VALUES ('27', '4', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:54', '0');
INSERT INTO `wish` VALUES ('28', '4', '啦啦啦阿拉', '2018-09-12 16:15:00', null, '9', null, null, null, '1', '1', '1', '2018-09-12 16:15:54', '0');
INSERT INTO `wish` VALUES ('29', '1', '买白菜20斤', '2018-09-13 20:55:00', '2018-09-19 10:37:47', '14', '20', '1', '180', '4', '1', '3', '2018-09-13 19:58:11', '0');
INSERT INTO `wish` VALUES ('30', '2', '去五福路取快递', '2018-09-13 20:59:00', '2018-09-19 10:37:46', '14', '20', '2', '160', '4', '1', '3', '2018-09-13 19:59:47', '0');
INSERT INTO `wish` VALUES ('31', '3', '去公园', '2018-09-13 21:00:00', '2018-09-19 10:37:44', '14', '20', '3', '60', '4', '1', '3', '2018-09-13 20:00:39', '0');
INSERT INTO `wish` VALUES ('32', '4', '陪聊天', '2018-09-13 21:00:00', '2018-09-14 17:52:50', '14', '20', '1', '123', '4', '1', '3', '2018-09-13 20:01:02', '0');
INSERT INTO `wish` VALUES ('33', '5', '资料整理', '2018-09-13 21:01:00', '2018-09-13 20:15:58', '14', '20', '2', '90', '4', '1', '3', '2018-09-13 20:01:29', '0');
INSERT INTO `wish` VALUES ('34', '6', '手机辅导', '2018-09-13 21:01:00', '2018-09-14 16:57:55', '14', '20', '1', '129', '4', '1', '3', '2018-09-13 20:01:50', '0');
INSERT INTO `wish` VALUES ('36', '2', '二号楼取快递', '2018-09-13 21:03:00', '2018-09-13 20:15:56', '14', '20', '4', '140', '4', '1', '3', '2018-09-13 20:03:37', '0');
INSERT INTO `wish` VALUES ('37', '1', '冰糖雪梨', '2018-09-14 08:50:00', null, '17', '21', null, null, '2', '1', '2', '2018-09-14 08:51:21', '0');
INSERT INTO `wish` VALUES ('38', '2', '取工服去318', '2018-09-14 08:51:00', '2018-09-14 09:58:49', '17', '21', null, null, '3', '1', '2', '2018-09-14 08:52:05', '0');
INSERT INTO `wish` VALUES ('39', '3', '滴滴一下也可以哒哒一下', '2018-11-16 10:54:00', '2018-09-14 09:58:48', '17', '21', null, null, '3', '1', '2', '2018-09-14 08:52:38', '0');
INSERT INTO `wish` VALUES ('40', '4', '还有这选项', '2020-09-14 11:54:00', '2018-09-14 09:58:48', '17', '21', null, null, '3', '1', '2', '2018-09-14 08:53:02', '0');
INSERT INTO `wish` VALUES ('41', '5', '干部资料。人员资料。以及更多资料', '2020-12-20 11:57:00', '2018-09-14 09:19:31', '17', '21', '0', '61', '4', '1', '2', '2018-09-14 08:54:20', '0');
INSERT INTO `wish` VALUES ('42', '6', '手机怎么开机', '2018-09-14 09:54:00', '2018-09-14 09:16:36', '17', '21', '0', '122', '4', '1', '2', '2018-09-14 08:54:57', '0');
INSERT INTO `wish` VALUES ('43', '7', '一分人民日报一份新闻日报。一份天气预报。', '2018-09-18 11:55:00', '2018-09-14 09:16:34', '17', '21', '0', '61', '4', '1', '2', '2018-09-14 08:56:16', '0');
INSERT INTO `wish` VALUES ('44', '1', '一斤土豆。200斤大米。3炖白菜。4车豆角。一颗葱。2鸡蛋。3纸袋。4桶水。5个椅子。6件衣服。7盆花。80双鞋子。900粒盐。', '2018-09-08 08:57:00', '2018-09-14 09:14:31', '17', '21', '4', '61', '4', '1', '2', '2018-09-14 09:01:40', '0');
INSERT INTO `wish` VALUES ('45', '2', '学府路251号。', '2018-09-14 09:00:00', '2018-09-14 09:16:33', '17', '21', '0', '21', '4', '1', '2', '2018-09-14 09:02:56', '0');
INSERT INTO `wish` VALUES ('46', '6', '怎么发布心愿。怎么开机。怎么关机。怎么打开', '2013-09-14 09:03:00', '2018-09-14 09:16:33', '17', '21', '0', '655555555555556', '4', '1', '2', '2018-09-14 09:03:50', '0');
INSERT INTO `wish` VALUES ('47', '5', '10新闻日报。20份新闻晚报。30中央日报。40人民日报', '2018-12-16 13:03:00', '2018-09-14 09:16:32', '17', '21', '0', '3000000050', '4', '1', '2', '2018-09-14 09:04:48', '0');
INSERT INTO `wish` VALUES ('48', '1', '为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字为了更为了更多的字为了更多的字为了更多的字为了更多的字为了更多的字多的字为了更多的字为了更多的字为了更', '2018-09-16 09:04:00', '2018-09-14 09:14:27', '17', '21', '4', '62', '4', '1', '2', '2018-09-14 09:05:47', '0');
INSERT INTO `wish` VALUES ('49', '3', '围地球转一圈', '2030-09-14 09:06:00', '2018-09-14 09:16:31', '17', '21', '1', '3050', '4', '1', '2', '2018-09-14 09:06:35', '0');
INSERT INTO `wish` VALUES ('50', '4', '早中晚三遍饭', '2018-11-14 09:06:00', '2018-09-14 09:14:23', '17', '21', '3', '350', '4', '1', '2', '2018-09-14 09:07:19', '0');
INSERT INTO `wish` VALUES ('53', '1', '广告广告', '1950-09-14 09:21:00', null, '17', '21', null, null, '2', '1', '2', '2018-09-14 09:21:24', '0');
INSERT INTO `wish` VALUES ('54', '2', '刚刚才吃吃吃GG', '1950-09-14 09:21:00', '2018-09-17 13:53:10', '17', '23', null, null, '3', '1', '2', '2018-09-14 09:21:53', '0');
INSERT INTO `wish` VALUES ('55', '1', '图图他', '2018-09-14 09:25:00', null, '17', '19', null, null, '2', '1', '2', '2018-09-14 09:24:56', '0');
INSERT INTO `wish` VALUES ('56', '1', '滚滚滚还好还好距u发疯的让人人多的续保就看看i哈哈哈刚发的土鸡韩国国会滚滚滚滚滚滚哈哈哈哈哈刚发的电饭锅胡也得有哈哈哈皇冠夫妇i好好干与就好好刚刚回家黄河鬼棺哈哈哈v陈芳故居空调房唱歌韩国热水洗查户口冯额打印机基本不吃的ii功夫兔交话费瑞还挺贵i也发个好尴尬i火锅后悔吧凡人坏家伙v话剧院发广告', '2018-09-14 15:25:00', '2018-09-14 09:58:45', '17', '21', '1', '2940', '4', '1', '2', '2018-09-14 09:26:39', '0');
INSERT INTO `wish` VALUES ('58', '1', '1', '2018-09-14 09:32:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:33:01', '0');
INSERT INTO `wish` VALUES ('59', '1', '额', '2018-09-14 09:33:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:33:21', '0');
INSERT INTO `wish` VALUES ('60', '1', '的', '2018-09-14 09:33:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:33:31', '0');
INSERT INTO `wish` VALUES ('61', '1', '的', '2018-09-14 09:33:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:33:40', '0');
INSERT INTO `wish` VALUES ('62', '1', '干活', '2018-09-14 09:33:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:33:51', '0');
INSERT INTO `wish` VALUES ('63', '1', '地打底裤', '2018-09-14 09:35:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:35:52', '0');
INSERT INTO `wish` VALUES ('64', '1', '记得记得就', '2018-09-14 09:35:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:36:02', '0');
INSERT INTO `wish` VALUES ('65', '1', '哦弟弟', '2018-09-14 09:36:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:36:10', '0');
INSERT INTO `wish` VALUES ('66', '1', '还多久到家', '2018-09-14 09:36:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:36:19', '0');
INSERT INTO `wish` VALUES ('68', '1', '继续看上课', '2018-09-14 09:36:00', null, '17', null, null, null, '1', '1', '2', '2018-09-14 09:37:15', '0');
INSERT INTO `wish` VALUES ('69', '1', '来看看', '2018-09-14 09:37:00', null, '17', '19', null, null, '2', '1', '2', '2018-09-14 09:37:27', '0');
INSERT INTO `wish` VALUES ('81', '3', '制作', '2018-09-14 11:57:00', null, '17', '19', null, null, '2', '1', '2', '2018-09-14 11:55:05', '0');
INSERT INTO `wish` VALUES ('83', '1', '帮我买盒阿莫西林', '2018-09-17 11:38:00', '2018-09-17 14:23:18', '18', '5', null, null, '3', '1', '1', '2018-09-17 13:43:42', '0');
INSERT INTO `wish` VALUES ('84', '1', '买苹果一斤', '2018-09-16 12:44:00', '2018-09-17 13:48:33', '18', '23', '4', '70', '4', '1', '1', '2018-09-17 13:44:55', '0');
INSERT INTO `wish` VALUES ('85', '1', '在政治', '2018-09-17 13:58:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 13:58:29', '0');
INSERT INTO `wish` VALUES ('86', '1', '发发发', '2018-09-17 13:57:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 13:59:01', '0');
INSERT INTO `wish` VALUES ('87', '1', '京津冀', '2018-09-17 14:00:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:00:23', '0');
INSERT INTO `wish` VALUES ('88', '1', '胖胖胖', '2018-09-17 14:00:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:01:47', '0');
INSERT INTO `wish` VALUES ('89', '1', '胖胖胖斤斤计较', '2018-09-17 14:01:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:04:17', '0');
INSERT INTO `wish` VALUES ('90', '1', '是啥', '2018-09-17 14:04:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:04:57', '0');
INSERT INTO `wish` VALUES ('91', '1', '平平淡淡的', '2018-09-17 14:05:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:15:13', '0');
INSERT INTO `wish` VALUES ('92', '1', '时间', '2018-09-17 14:15:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:15:46', '0');
INSERT INTO `wish` VALUES ('93', '1', '时间', '2018-09-17 14:15:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:16:11', '0');
INSERT INTO `wish` VALUES ('94', '1', '重中之重', '2018-09-17 14:16:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:16:49', '0');
INSERT INTO `wish` VALUES ('95', '1', '哦哦哦哦', '2018-09-17 14:16:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:17:09', '0');
INSERT INTO `wish` VALUES ('96', '3', '乒乒乓乓乒乒乓乓', '2018-09-17 14:17:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:17:55', '0');
INSERT INTO `wish` VALUES ('98', '1', '是啥啊', '2018-09-17 14:17:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:18:53', '0');
INSERT INTO `wish` VALUES ('99', '1', '依旧', '2018-09-17 14:18:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:19:06', '0');
INSERT INTO `wish` VALUES ('100', '3', '散步', '2018-09-17 17:22:00', '2018-09-17 14:23:05', '10', '5', '4', '120', '4', '1', '1', '2018-09-17 14:19:10', '0');
INSERT INTO `wish` VALUES ('101', '1', '呃呃呃', '2018-09-17 14:19:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:19:19', '0');
INSERT INTO `wish` VALUES ('102', '3', '散步', '2018-09-17 23:19:00', '2018-09-17 14:23:00', '10', '5', '4', '90', '4', '1', '1', '2018-09-17 14:19:56', '0');
INSERT INTO `wish` VALUES ('103', '1', '我完全', '2018-09-17 14:22:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:22:57', '0');
INSERT INTO `wish` VALUES ('104', '1', '哦哦哦', '2018-09-17 14:24:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:25:28', '0');
INSERT INTO `wish` VALUES ('105', '1', '一', '2018-09-17 14:25:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:26:04', '0');
INSERT INTO `wish` VALUES ('106', '1', 'QQ', '2018-09-17 14:26:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:29:49', '0');
INSERT INTO `wish` VALUES ('107', '1', '会', '2018-09-17 14:35:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:38:23', '0');
INSERT INTO `wish` VALUES ('108', '1', '一u', '2018-09-17 14:38:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:39:17', '0');
INSERT INTO `wish` VALUES ('109', '1', '积极', '2018-09-17 14:39:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:40:01', '0');
INSERT INTO `wish` VALUES ('110', '1', '奇偶', '2018-09-17 14:40:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:40:13', '0');
INSERT INTO `wish` VALUES ('112', '2', '申通', '2018-09-17 19:40:00', '2018-09-17 15:03:10', '10', '5', '2', '120', '4', '1', '1', '2018-09-17 14:40:59', '0');
INSERT INTO `wish` VALUES ('113', '1', '急救', '2018-09-17 14:40:00', null, '17', null, null, null, '1', '1', '2', '2018-09-17 14:41:41', '0');
INSERT INTO `wish` VALUES ('114', '1', '舅舅', '2018-09-17 14:42:00', '2018-09-20 19:28:53', '17', '5', null, null, '3', '1', '2', '2018-09-17 14:41:58', '0');
INSERT INTO `wish` VALUES ('115', '4', '聊天', '2018-09-20 15:05:00', null, '10', null, null, null, '1', '1', '1', '2018-09-17 15:04:06', '0');
INSERT INTO `wish` VALUES ('118', '3', '散步? ', '2018-09-17 16:00:00', '2018-09-17 20:19:56', '10', '5', '4', '120', '4', '1', '1', '2018-09-17 15:16:56', '0');
INSERT INTO `wish` VALUES ('129', '1', '购买书籍羊皮卷', '2018-09-20 12:31:00', null, '15', null, null, null, '1', '1', '1', '2018-09-19 10:32:36', '0');
INSERT INTO `wish` VALUES ('130', '1', '买笔记本20个', '2018-09-20 10:28:00', '2018-09-19 10:37:38', '14', '20', '4', '130', '4', '1', '3', '2018-09-19 10:35:29', '0');
INSERT INTO `wish` VALUES ('131', '2', '2号楼取快递', '2018-09-24 13:37:00', null, '14', null, null, null, '1', '1', '3', '2018-09-19 10:38:27', '0');
INSERT INTO `wish` VALUES ('132', '3', '去公园', '2018-09-21 10:38:00', null, '14', '20', null, null, '2', '1', '3', '2018-09-19 10:38:49', '0');
INSERT INTO `wish` VALUES ('133', '2', '取快递饿', '2018-09-23 13:55:00', '2018-09-20 13:58:01', '14', '20', '3', '140', '4', '1', '3', '2018-09-20 13:56:25', '0');
INSERT INTO `wish` VALUES ('134', '3', '去学校', '2018-09-25 13:56:00', '2018-09-20 13:57:59', '14', '20', '2', '120', '4', '1', '3', '2018-09-20 13:56:50', '0');
INSERT INTO `wish` VALUES ('135', '3', '溜达溜达', '2018-09-20 22:29:00', '2018-09-20 19:29:14', '10', '5', '4', '120', '4', '1', '1', '2018-09-20 19:27:40', '0');
INSERT INTO `wish` VALUES ('136', '4', '溜达溜达唠唠嗑', '2018-09-20 22:29:00', null, '10', null, null, null, '1', '1', '1', '2018-09-20 19:28:17', '0');
INSERT INTO `wish` VALUES ('139', '1', '中民魔攻明敏', '2018-09-26 13:17:00', '2018-09-24 10:51:22', '12', '8', '4', '123', '4', '1', '2', '2018-09-23 13:17:12', '0');
INSERT INTO `wish` VALUES ('141', '5', 'xinminjjizyixyiyiwyiwsyyrzrzwutuyyonmeeeeeennededede我以为', '2018-12-29 13:17:00', '2018-09-25 19:48:52', '12', '8', null, null, '3', '1', '2', '2018-09-23 13:17:55', '0');
INSERT INTO `wish` VALUES ('143', '1', '积极', '2018-09-24 15:56:00', null, '12', null, null, null, '1', '1', '2', '2018-09-24 10:56:44', '0');
INSERT INTO `wish` VALUES ('144', '1', '哈哈啊哈哈', '2018-09-25 22:49:00', null, '12', null, null, null, '1', '1', '2', '2018-09-25 19:49:38', '0');
INSERT INTO `wish` VALUES ('145', '1', '知我者谓我心忧知我者谓我心忧无事献殷勤实验室学习润物细无声起', '2018-09-25 23:11:00', null, '12', null, null, null, '1', '1', '2', '2018-09-25 21:08:48', '0');
INSERT INTO `wish` VALUES ('150', '1', '知我者谓我心忧知我者谓我心忧知我者谓我心忧写作业', '2018-09-29 09:41:00', '2018-09-29 09:35:27', '12', '6', '3', '69', '4', '1', '2', '2018-09-29 09:34:11', '0');
INSERT INTO `wish` VALUES ('151', '1', 'jsjsjjes', '2018-09-29 10:21:00', '2018-10-15 10:38:22', '12', '8', null, null, '3', '1', '2', '2018-09-29 10:16:05', '0');
INSERT INTO `wish` VALUES ('152', '1', '2222', '2018-10-01 20:32:00', null, '12', null, null, null, '1', '1', '2', '2018-10-01 20:27:07', '0');
INSERT INTO `wish` VALUES ('153', '1', '菜', '2018-10-02 12:58:00', null, '10', null, null, null, '1', '1', '1', '2018-10-02 10:50:46', '0');
INSERT INTO `wish` VALUES ('154', '2', '申通', '2018-10-02 15:31:00', null, '10', null, null, null, '1', '1', '1', '2018-10-02 14:30:06', '0');
INSERT INTO `wish` VALUES ('155', '3', '溜达', '2018-10-12 10:53:00', null, '10', null, null, null, '1', '1', '1', '2018-10-12 07:49:35', '0');
INSERT INTO `wish` VALUES ('156', '1', '测试1', '2018-10-15 14:40:00', null, '12', null, null, null, '1', '1', '2', '2018-10-15 10:41:05', '0');
INSERT INTO `wish` VALUES ('157', '8', '测试2其他', '2018-10-15 15:41:00', null, '12', null, null, null, '1', '1', '2', '2018-10-15 10:41:52', '0');
INSERT INTO `wish` VALUES ('158', '2', '去24栋', '2018-12-18 09:16:00', null, '31', null, null, null, '1', '1', '12', '2018-12-17 09:17:20', '0');
INSERT INTO `wish` VALUES ('159', '1', '111', '2018-12-31 09:19:00', null, '30', null, null, null, '1', '1', '10', '2018-12-17 09:19:14', '0');
INSERT INTO `wish` VALUES ('160', '2', '哈哈哈', '2018-12-18 09:19:00', null, '31', null, null, null, '1', '2', '12', '2018-12-17 09:19:38', '0');
INSERT INTO `wish` VALUES ('161', '1', '2222', '2018-12-21 09:20:00', null, '30', null, null, null, '1', '1', '10', '2018-12-17 09:20:30', '0');
INSERT INTO `wish` VALUES ('162', '8', '其他', '2018-12-18 09:20:00', null, '31', null, null, null, '1', '1', '12', '2018-12-17 09:20:35', '0');
INSERT INTO `wish` VALUES ('163', '2', '考虑考虑考虑考虑', '2018-12-17 16:35:00', null, '25', null, null, null, '1', '1', '10', '2018-12-17 13:31:10', '0');
INSERT INTO `wish` VALUES ('166', '8', 'hello', '2018-12-21 13:15:00', null, '31', null, null, null, '1', '1', '12', '2018-12-20 13:15:44', '1');
INSERT INTO `wish` VALUES ('167', '2', '额哈哈哈(ಡωಡ)hiahiahia', '2018-12-21 13:41:00', null, '31', null, null, null, '1', '1', '12', '2018-12-20 13:41:25', '0');
INSERT INTO `wish` VALUES ('168', '7', '读新华日报', '2018-12-20 15:14:00', null, '31', null, null, null, '1', '1', '12', '2018-12-20 14:15:15', '0');
INSERT INTO `wish` VALUES ('169', '8', '其他1', '2018-12-20 18:19:00', null, '31', null, null, null, '1', '1', '12', '2018-12-20 14:20:03', '1');
INSERT INTO `wish` VALUES ('170', '3', '灯火辉煌', '2018-12-22 14:25:00', null, '31', null, null, null, '1', '1', '12', '2018-12-20 14:25:38', '0');
INSERT INTO `wish` VALUES ('171', '2', '圆通快递', '2018-12-20 15:28:00', null, '29', null, null, null, '1', '1', '9', '2018-12-20 15:01:26', '0');
INSERT INTO `wish` VALUES ('172', '1', '18800462819', '2018-12-20 15:08:00', null, '29', null, null, null, '1', '1', '9', '2018-12-20 15:02:49', '0');
INSERT INTO `wish` VALUES ('173', '2', 'jiaoshi1', '2018-12-21 16:04:00', '2018-12-20 16:08:49', '29', '26', '4', '301', '4', '1', '9', '2018-12-20 16:04:39', '0');
INSERT INTO `wish` VALUES ('174', '2', 'laosji2', '2018-12-21 16:21:00', '2018-12-20 16:40:18', '29', '26', null, null, '3', '1', '9', '2018-12-20 16:21:45', '0');
INSERT INTO `wish` VALUES ('175', '8', 'jiaoshiqita', '2018-12-21 18:02:00', null, '29', null, null, null, '1', '1', '9', '2018-12-20 18:02:21', '1');
INSERT INTO `wish` VALUES ('176', '8', 'halou', '2018-12-21 19:45:00', null, '29', null, null, null, '1', '1', '9', '2018-12-20 19:45:30', '1');
INSERT INTO `wish` VALUES ('177', '1', 'gouwu', '2018-12-26 19:58:00', null, '29', null, null, null, '1', '2', '9', '2018-12-20 19:59:10', '0');
INSERT INTO `wish` VALUES ('178', '8', 'dsgdfgdfgg', '2018-12-22 13:11:00', null, '29', null, null, null, '1', '1', '9', '2018-12-21 13:11:35', '0');
INSERT INTO `wish` VALUES ('179', '8', 'teset', '2018-12-25 16:26:00', null, '29', null, null, null, '1', '1', '9', '2018-12-24 16:26:21', '1');

-- ----------------------------
-- Table structure for wish2
-- ----------------------------
DROP TABLE IF EXISTS `wish2`;
CREATE TABLE `wish2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL COMMENT '心愿类型 1、购物 2、取快递 3、校园出行 4、上门陪伴 5、整理资料 6、辅导手机应用 7、读报 8、其他9、学生发布',
  `content` varchar(255) DEFAULT NULL COMMENT '心愿内容',
  `end_time` datetime DEFAULT NULL COMMENT '截止日期',
  `finish_tim` datetime DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL COMMENT '发布心愿人id',
  `s_id` int(11) DEFAULT NULL COMMENT '接收心愿人id',
  `evaluate` int(11) DEFAULT NULL COMMENT '评价星级',
  `duration` varchar(50) DEFAULT NULL COMMENT '心愿完成时长',
  `status` int(11) DEFAULT NULL COMMENT '状态：1、待接取 2、已接取 3、待评价 4、已完成',
  `academic_id` int(11) DEFAULT NULL COMMENT '归属学院id',
  `add_time` datetime DEFAULT NULL COMMENT '心愿添加时间',
  `shenhe` int(3) NOT NULL DEFAULT '0' COMMENT '初始是0审核通过是1，未通过是2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wish2
-- ----------------------------
INSERT INTO `wish2` VALUES ('20', '9', '多喝点方法', '2018-12-15 15:12:00', null, '22', null, null, null, '1', '3', '2018-12-14 15:13:27', '1');
INSERT INTO `wish2` VALUES ('21', '9', '111', '2018-12-19 09:17:00', null, '24', null, null, null, '1', '5', '2018-12-17 09:18:05', '1');
INSERT INTO `wish2` VALUES ('22', '9', '11', '2018-12-19 09:21:00', null, '24', null, null, null, '1', '5', '2018-12-17 09:21:44', '1');
INSERT INTO `wish2` VALUES ('23', '9', '好了\n', '2018-12-17 17:17:00', null, '18', null, null, null, '1', '4', '2018-12-17 13:18:23', '1');
INSERT INTO `wish2` VALUES ('24', '9', '111', '2018-12-22 15:36:00', null, '24', null, null, null, '1', '5', '2018-12-20 14:36:18', '1');
INSERT INTO `wish2` VALUES ('25', '9', 'hello', '2018-12-20 16:36:00', null, '26', '29', null, null, '2', '5', '2018-12-20 15:37:03', '1');
INSERT INTO `wish2` VALUES ('26', '9', 'xueshegn1', '2018-12-21 16:37:00', null, '26', '29', null, null, '4', '5', '2018-12-20 16:37:19', '1');
INSERT INTO `wish2` VALUES ('27', '9', 'hellllll', '2018-12-21 19:43:00', null, '26', null, null, null, '1', '5', '2018-12-20 19:43:13', '1');
INSERT INTO `wish2` VALUES ('28', '9', 'heliidfsf', '2018-12-22 13:10:00', null, '26', null, null, null, '1', '5', '2018-12-21 13:10:13', '1');

-- ----------------------------
-- Table structure for wx_config
-- ----------------------------
DROP TABLE IF EXISTS `wx_config`;
CREATE TABLE `wx_config` (
  `appid` varchar(25) NOT NULL COMMENT '应用ID',
  `name` varchar(32) DEFAULT NULL COMMENT '微信名称',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信号',
  `login_email` varchar(64) DEFAULT NULL COMMENT '登录邮箱',
  `login_pwd` varchar(32) DEFAULT NULL COMMENT '登陆密码',
  `qrcode` varchar(218) DEFAULT NULL COMMENT '关注二维码',
  `server_url` varchar(218) DEFAULT NULL COMMENT '服务器地址',
  `original_id` varchar(16) DEFAULT NULL COMMENT '原始id',
  `secret` varchar(32) DEFAULT NULL COMMENT '应用密钥',
  `token` varchar(32) DEFAULT NULL COMMENT '令牌',
  `encoding_aes_key` varchar(64) DEFAULT NULL COMMENT '消息加解密密钥',
  `mchAccess` varchar(32) DEFAULT NULL COMMENT '商户平台账号',
  `mchPwd` varchar(32) DEFAULT NULL COMMENT '商户平台密码',
  `mch_id` varchar(32) DEFAULT NULL COMMENT '商户号',
  `sub_mch_id` varchar(32) DEFAULT NULL COMMENT '子商户号',
  `mch_key` varchar(32) DEFAULT NULL COMMENT '商户开发密钥',
  `mch_name` varchar(32) DEFAULT NULL COMMENT '商户名称',
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信配置文件';

-- ----------------------------
-- Records of wx_config
-- ----------------------------

-- ----------------------------
-- Table structure for wx_info
-- ----------------------------
DROP TABLE IF EXISTS `wx_info`;
CREATE TABLE `wx_info` (
  `id` int(10) NOT NULL,
  `mid` int(10) DEFAULT NULL COMMENT '会员id',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `wx_no` varchar(30) DEFAULT NULL COMMENT '微信号',
  `wx_qrcode` text COMMENT '微信二维码',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mid` (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信信息表';

-- ----------------------------
-- Records of wx_info
-- ----------------------------

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) DEFAULT '' COMMENT '微信appid',
  `button` text,
  `is_matchrule` int(1) DEFAULT '0' COMMENT '1是个性化',
  `matchrule` text COMMENT '个性化菜单',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新日期',
  `group_id` int(10) unsigned DEFAULT NULL,
  `sex` int(1) unsigned DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `language` varchar(16) CHARACTER SET utf32 DEFAULT NULL,
  `client_platform_type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='微信自定义菜单';

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
INSERT INTO `wx_menu` VALUES ('1', 'wx3b93333cb8e8492e', '[{\"type\":\"view\",\"name\":\"教师\",\"content\":\"http:\\/\\/volunteer.xingyebao.com\\/h5\\/teacher\\/index\"},{\"type\":\"view\",\"name\":\"学生\",\"content\":\"http:\\/\\/volunteer.xingyebao.com\\/h5\\/student\\/index\"}]', '0', '', '2018-12-20 14:12:55', null, null, null, null, null, null, null);
INSERT INTO `wx_menu` VALUES ('2', 'wx3b93333cb8e8492e', '[{\"type\":\"view\",\"name\":\"教师\",\"content\":\"http:\\/\\/volunteer.xingyebao.com\\/h5\\/teacher\\/index\"},{\"type\":\"view\",\"name\":\"学生\",\"content\":\"http:\\/\\/volunteer.xingyebao.com\\/h5\\/student\\/index\"}]', '0', '', '2018-12-20 14:12:59', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for wx_menu_event
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu_event`;
CREATE TABLE `wx_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL COMMENT '表wx_menu id',
  `type` varchar(16) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4,
  `event_key` varchar(16) DEFAULT NULL COMMENT '点击菜单的key值',
  PRIMARY KEY (`id`),
  KEY `key` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信-菜单事件';

-- ----------------------------
-- Records of wx_menu_event
-- ----------------------------

-- ----------------------------
-- Table structure for wx_order
-- ----------------------------
DROP TABLE IF EXISTS `wx_order`;
CREATE TABLE `wx_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) DEFAULT NULL,
  `device_info` varchar(32) DEFAULT NULL,
  `mch_id` varchar(32) DEFAULT NULL,
  `nonce_str` varchar(32) DEFAULT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `body` varchar(128) DEFAULT NULL,
  `detail` varchar(8192) DEFAULT NULL,
  `attach` varchar(127) DEFAULT NULL,
  `out_trade_no` varchar(32) DEFAULT NULL,
  `fee_type` varchar(16) DEFAULT NULL,
  `total_fee` int(10) DEFAULT NULL,
  `spbill_create_ip` varchar(16) DEFAULT NULL,
  `time_start` varchar(14) DEFAULT NULL,
  `time_expire` varchar(14) DEFAULT NULL,
  `goods_tag` varchar(32) DEFAULT NULL,
  `notify_url` varchar(256) DEFAULT NULL,
  `trade_type` varchar(16) DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `limit_pay` varchar(32) DEFAULT NULL,
  `openid` varchar(128) DEFAULT NULL,
  `return_code` varchar(16) DEFAULT NULL,
  `result_code` varchar(16) DEFAULT NULL,
  `return_msg` varchar(128) DEFAULT NULL,
  `prepay_id` varchar(64) DEFAULT NULL,
  `err_code` varchar(16) DEFAULT NULL,
  `err_code_des` varchar(128) DEFAULT NULL,
  `code_url` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信支付记录';

-- ----------------------------
-- Records of wx_order
-- ----------------------------

-- ----------------------------
-- Table structure for wx_pay_notify
-- ----------------------------
DROP TABLE IF EXISTS `wx_pay_notify`;
CREATE TABLE `wx_pay_notify` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) DEFAULT NULL,
  `return_code` varchar(16) DEFAULT NULL COMMENT 'SUCCESS/FAIL\nSUCCESS/FAIL此字段是通信标识，非交易标识，交易是否成功需要查看result_code来判断',
  `return_msg` varchar(128) DEFAULT NULL COMMENT '返回信息，如非空，为错误原因',
  `mch_id` varchar(32) DEFAULT NULL,
  `device_info` varchar(32) DEFAULT NULL,
  `nonce_str` varchar(32) DEFAULT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `result_code` varchar(16) DEFAULT NULL,
  `err_code` varchar(32) DEFAULT NULL,
  `err_code_des` varchar(128) DEFAULT NULL,
  `openid` varchar(128) DEFAULT NULL,
  `is_subscribe` varchar(1) DEFAULT NULL,
  `trade_type` varchar(16) DEFAULT NULL,
  `bank_type` varchar(16) DEFAULT NULL,
  `total_fee` int(11) DEFAULT NULL,
  `fee_type` varchar(8) DEFAULT NULL,
  `cash_fee` int(11) DEFAULT NULL,
  `cash_fee_type` varchar(16) DEFAULT NULL,
  `coupon_fee` int(11) DEFAULT NULL,
  `coupon_count` int(11) DEFAULT NULL,
  `coupon_id_$n` varchar(20) DEFAULT NULL,
  `coupon_fee_$n` int(11) DEFAULT NULL,
  `transaction_id` varchar(32) DEFAULT NULL,
  `out_trade_no` varchar(32) DEFAULT NULL,
  `attach` varchar(128) DEFAULT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信支付通知记录';

-- ----------------------------
-- Records of wx_pay_notify
-- ----------------------------

-- ----------------------------
-- Table structure for wx_token
-- ----------------------------
DROP TABLE IF EXISTS `wx_token`;
CREATE TABLE `wx_token` (
  `appid` varchar(25) CHARACTER SET utf8mb4 NOT NULL COMMENT '微信appid',
  `val` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL,
  `exp` int(10) unsigned DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信token';

-- ----------------------------
-- Records of wx_token
-- ----------------------------
INSERT INTO `wx_token` VALUES ('wx3b93333cb8e8492e_1', '16_hdqY3oYJgHN6Mag09SN3HwYRJ2YD2Ll3JvJy59nODt3_FdDQrXCoyKTpL0jxoBFElH_rcYNvvGdG8fhFW_MmzLopYDw1mVOtV5DUhuwsco7f0bZAHXHAUbI8DeFuNEoB_Wrvgi8Z5iXE_sLsOLFhABAGDX', '1545292547');

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `mid` int(10) NOT NULL DEFAULT '0',
  `openid` varchar(32) NOT NULL,
  `nickname` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sex` int(1) DEFAULT '0' COMMENT '0保密，1男，2女',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '头像',
  `province` varchar(15) DEFAULT NULL COMMENT '省份',
  `city` varchar(15) DEFAULT NULL COMMENT '城市',
  `country` varchar(15) DEFAULT NULL COMMENT '国家',
  `created` int(11) DEFAULT NULL COMMENT '创建时间',
  `subscribe_time` int(11) DEFAULT NULL COMMENT '最后关注时间',
  `subscribe` tinyint(1) unsigned DEFAULT '0' COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。',
  `appid` varchar(25) NOT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `groupid` int(10) DEFAULT '0' COMMENT '分组',
  `unsubscribe_time` int(11) DEFAULT NULL COMMENT '取消关注时间',
  `unionid` varchar(50) DEFAULT NULL,
  `wxno` varchar(20) DEFAULT '' COMMENT '微信号',
  `last_login` int(10) DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`openid`),
  KEY `mid` (`mid`) USING BTREE,
  KEY `appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注微信用户';

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES ('1025740', 'o9L9G05lNmA5QewKIIW1mZ2TYQ4s', '✎﹏ℳ๓₯㎕', '1', 'http://thirdwx.qlogo.cn/mmopen/o2yiacl5XFuU1szVw6OWgpuGObCXf3iaYAZ7dTbOK0Wr1EQ4IctiaYOBaCic4rQbntL47esr8AwEk9d9BIKZFT6LaKICatdDpdq8/132', '黑龙江', '佳木斯', '中国', '1545285487', '1545285485', '0', 'wx3b93333cb8e8492e', '', '0', '1545285541', null, '', '1545285487');
INSERT INTO `wx_user` VALUES ('1025743', 'o9L9G08f7JhHmSioGLmmzRfpQ1WQ', '冷了一半', '1', 'http://thirdwx.qlogo.cn/mmopen/9M0PhLTmTIej9cCeUwolicCwibLEBEgBC67XB7sWKm5MSnNW0laGEFsLP4JMIot4sAXZrNOWOl9utbTtfYSbVgiaOwgwxMd32Ep/132', '广西', '柳州', '中国', '1545286874', '1544770063', '1', 'wx3b93333cb8e8492e', '', '0', null, null, '', '1545286874');
INSERT INTO `wx_user` VALUES ('1025742', 'o9L9G0xYs07FDU5sQA37wPsdJ-C8', '游天&侠客', '1', 'http://thirdwx.qlogo.cn/mmopen/0PMWFB4k9tTvzNQibOM74PSqED4ZEH4lxPQ2qkwxTdrAFn5icia788avmqkHCAyFen3ibEeNIX4zm6SBkjicaOt2VP8dbpJVHdicFQ/132', '', '', '', '1545286056', '1545287416', '1', 'wx3b93333cb8e8492e', '', '0', '1545286392', null, '', '1545288941');
