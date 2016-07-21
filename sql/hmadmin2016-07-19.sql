/*
Navicat MariaDB Data Transfer

Source Server         : 192.168.0.111_3306
Source Server Version : 100017
Source Host           : 192.168.0.111:3306
Source Database       : hmadmin

Target Server Type    : MariaDB
Target Server Version : 100017
File Encoding         : 65001

Date: 2016-07-19 20:28:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hm_article
-- ----------------------------
DROP TABLE IF EXISTS `hm_article`;
CREATE TABLE `hm_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) unsigned NOT NULL,
  `title` varchar(160) NOT NULL DEFAULT '' COMMENT '文章标题',
  `titlew` char(8) NOT NULL DEFAULT '' COMMENT '标题字体粗体',
  `titlecolor` char(24) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '文章封面图片',
  `keywords` varchar(40) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` text NOT NULL COMMENT '摘要',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `isreview` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许评论',
  `relation` varchar(255) NOT NULL DEFAULT '' COMMENT '相关文章',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '账户名',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建文章时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改文章时间',
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT 'tags',
  `copyfrom` varchar(255) NOT NULL DEFAULT '' COMMENT '信息来源',
  `visitors` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `content` text NOT NULL COMMENT '文章内容',
  `rvnum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `template` char(50) NOT NULL DEFAULT '' COMMENT '模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hm_article
-- ----------------------------
INSERT INTO `hm_article` VALUES ('1', '2', 'asdfasdf', '', '', '', '', '', '0', '1', '1', '', '', '0', '0', '', '', '0', '&lt;p&gt;asdfasdfasd&lt;/p&gt;', '0', '');
INSERT INTO `hm_article` VALUES ('2', '2', 'adfasdfa', '', '', '', '', '', '0', '1', '1', '', 'iteny', '1458809239', '0', '', '', '0', '&lt;p&gt;asdfasdfasf&lt;/p&gt;', '0', '');
INSERT INTO `hm_article` VALUES ('3', '2', 'asdfasdfasdf', '', '', '', '', '', '0', '1', '1', '', 'iteny', '1458812287', '0', '', '', '0', '&lt;p&gt;asdfasfasf&lt;/p&gt;', '0', '');
INSERT INTO `hm_article` VALUES ('4', '2', '阿萨德发射反', '', '', '', '', '', '0', '1', '1', '', 'iteny', '1458812388', '0', '', '', '0', '&lt;p&gt;阿萨德发生的&lt;/p&gt;', '0', '');
INSERT INTO `hm_article` VALUES ('5', '2', '阿斯蒂芬的萨芬', '', '', '', '', '', '0', '1', '1', '', 'iteny', '1458812436', '0', '', '', '0', '&lt;p&gt;阿萨德法师法师打发&lt;/p&gt;', '0', '');
INSERT INTO `hm_article` VALUES ('6', '2', '阿萨德发射点发', '', '', '', '', '', '1', '1', '1', '', 'iteny', '1458812726', '0', '', '', '0', '&lt;p&gt;阿萨德发射点发&lt;/p&gt;', '0', '');
INSERT INTO `hm_article` VALUES ('7', '2', '撒旦发射点发撒旦发射', '', '', '', 'asdfasfas', 'asdfasdf', '2', '1', '1', '', 'iteny', '1458823754', '0', 'asdf', 'asdfasdfasdf', '0', '&lt;p&gt;								&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;asdfasdfasdff&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;							&lt;/p&gt;', '0', '');

-- ----------------------------
-- Table structure for hm_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `hm_auth_group`;
CREATE TABLE `hm_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of hm_auth_group
-- ----------------------------
INSERT INTO `hm_auth_group` VALUES ('1', '超级管理员', '1', '2,8,9,70,71,72,10,32,33,34,35,36,37,45,48,49,50,51,46,59,60,61,69,11,47,52,53,54,55,56,57,58,12,13,27,28,29,30,31,14,38,39,40,41,42,15,16,43,17,44,3,25,26,63,64,65,66,67,68', '1', '');
INSERT INTO `hm_auth_group` VALUES ('2', '网络管理', '1', '1,4,5,6,7,96,2,8,9,70,71,72,10,32,33,34,35,36,37,45,48,49,50,51,46,59,60,61,69,11,47,52,53,54,55,56,57,58,12,13,27,28,29,30,31,14,38,39,40,41,42,15,16,43,17,44,3,25,26,63,64,65,66,67,68', '3', '');
INSERT INTO `hm_auth_group` VALUES ('3', '网站编辑', '1', '1,4,101,2,8,9,70,10,32,34,35,36,37,69,52,53,54,55,56,100,57,58,46,59,60,61,45,48,49,50,51,12,13,27,29,30,31,14,38,39,40,41,42,15,16,43,17,44', '2', '');
INSERT INTO `hm_auth_group` VALUES ('9', '新建角色', '1', '1,4,121,101,2,8,9,70,10,32,34,35,36,37,69,52,53,54,55,56,100,57,58,46,59,60,61,45,48,49,50,51,12,13,27,31,14,38,40,41,42,3,25,26,105,104,103,102,63,107,106,108,109,110,111,114,113,112', '5', '');

-- ----------------------------
-- Table structure for hm_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `hm_auth_group_access`;
CREATE TABLE `hm_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
-- Records of hm_auth_group_access
-- ----------------------------
INSERT INTO `hm_auth_group_access` VALUES ('1', '1');
INSERT INTO `hm_auth_group_access` VALUES ('14', '9');

-- ----------------------------
-- Table structure for hm_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `hm_auth_rule`;
CREATE TABLE `hm_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示菜单',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of hm_auth_rule
-- ----------------------------
INSERT INTO `hm_auth_rule` VALUES ('1', 'Index', '用户中心', '1', '1', '', '0', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('2', '设置', '设置', '1', '1', '', '0', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('3', 'Content', '内容', '1', '1', '', '0', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('4', 'Index/userOperate11', '用户操作', '1', '1', '', '1', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('103', 'Content/editCate', '修改栏目', '1', '1', '', '26', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('101', 'Index/userPass', '修改密码', '1', '1', '', '4', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('8', 'System/zhanzhang', '站长设置', '1', '1', '', '2', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('9', 'Site/config', '系统配置', '1', '1', '', '8', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('10', 'Site/menu', '菜单设置', '1', '1', '', '8', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('104', 'Content/delCate', '删除栏目', '1', '1', '', '26', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('12', 'Site/intendant', '用户设置', '1', '1', '', '2', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('13', 'Site/user', '用户管理', '1', '1', '', '12', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('14', 'Site/role', '角色管理', '1', '1', '', '12', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('15', 'Site/rizhi', '日志设置', '1', '1', '', '2', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('16', 'Site/loginLog', '登录日志管理', '1', '1', '', '15', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('17', 'Site/operateLog', '操作日志管理', '1', '1', '', '15', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('25', 'Content/Manage', '内容管理', '1', '1', '', '3', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('26', 'Content/category', '栏目列表', '1', '1', '', '25', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('27', 'Site/addEditUser', '添加或修改用户', '1', '1', '', '13', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('29', 'Site/delUser', '删除单个用户', '1', '1', '', '13', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('30', 'Site/batchDelUser', '批量删除用户', '1', '1', '', '13', '1', '4', '');
INSERT INTO `hm_auth_rule` VALUES ('31', 'Site/setRole', '查看权限', '1', '1', '', '13', '1', '5', '');
INSERT INTO `hm_auth_rule` VALUES ('32', 'Site/addEditMenu', '添加或修改菜单', '1', '1', '', '10', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('34', 'Site/delMenu', '删除菜单', '1', '1', '', '10', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('35', 'Site/sortMenu', '菜单排序', '1', '1', '', '10', '1', '4', '');
INSERT INTO `hm_auth_rule` VALUES ('36', 'System/exportMenu', '导出菜单', '1', '1', '', '10', '1', '5', '');
INSERT INTO `hm_auth_rule` VALUES ('37', 'System/importMenu', '导入菜单', '1', '1', '', '10', '1', '6', '');
INSERT INTO `hm_auth_rule` VALUES ('38', 'Site/addEditRole', '添加或修改角色', '1', '1', '', '14', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('40', 'Site/delRole', '删除角色', '1', '1', '', '14', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('41', 'Site/sortRole', '角色排序', '1', '1', '', '14', '1', '4', '');
INSERT INTO `hm_auth_rule` VALUES ('42', 'Site/setRole.html', '角色配置权限', '1', '1', '', '14', '1', '5', '');
INSERT INTO `hm_auth_rule` VALUES ('43', 'Site/delLoginLog', '删除上月登录日志', '1', '1', '', '16', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('44', 'Site/delOperateLog', '删除上月操作日志', '1', '1', '', '17', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('45', 'System/websiteHome', '后台首页管理', '1', '1', '', '8', '1', '6', '');
INSERT INTO `hm_auth_rule` VALUES ('46', 'Site/fileBackup', '文件备份', '1', '1', '', '8', '1', '5', '');
INSERT INTO `hm_auth_rule` VALUES ('100', 'Site/import', '开始还原数据', '1', '1', '', '69', '1', '7', '');
INSERT INTO `hm_auth_rule` VALUES ('48', 'System/addWebsiteHome', '添加版块', '1', '1', '', '45', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('49', 'System/editWebsiteHome', '修改版块', '1', '1', '', '45', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('50', 'System/delWebsiteHome', '删除版块', '1', '1', '', '45', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('51', 'System/sortWebsiteHome', '版块排序', '1', '1', '', '45', '1', '4', '');
INSERT INTO `hm_auth_rule` VALUES ('52', 'Site/optimize', '优化数据表', '1', '1', '', '69', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('53', 'Site/repair', '修复数据表', '1', '1', '', '69', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('54', 'Site/export', '开始数据备份', '1', '1', '', '69', '1', '4', '');
INSERT INTO `hm_auth_rule` VALUES ('55', 'Site/delBackupLock', '清除执行任务', '1', '1', '', '69', '1', '5', '');
INSERT INTO `hm_auth_rule` VALUES ('56', 'Site/dataBase/type/import', '还原数据备份', '1', '1', '', '69', '1', '6', '');
INSERT INTO `hm_auth_rule` VALUES ('57', 'Site/sendEmail', '发送数据备份', '1', '1', '', '69', '1', '8', '');
INSERT INTO `hm_auth_rule` VALUES ('58', 'Site/delData', '删除数据备份', '1', '1', '', '69', '1', '9', '');
INSERT INTO `hm_auth_rule` VALUES ('59', 'Site/zipFileBackup', '开始文件备份', '1', '1', '', '46', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('60', 'Site/sendFileZip', '发送文件备份', '1', '1', '', '46', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('61', 'Site/delFileBackup', '删除文件备份', '1', '1', '', '46', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('63', 'Content/index', '管理内容', '1', '1', '', '25', '1', '2', '');
INSERT INTO `hm_auth_rule` VALUES ('69', 'Site/dataBase/type/export', '数据备份', '1', '1', '', '8', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('70', 'Site/setconfig', '更新配置', '1', '1', '', '9', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('102', 'Content/addCate', '添加栏目', '1', '1', '', '26', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('105', 'Content/sortCate', '栏目排序', '1', '1', '', '26', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('106', 'Content/publicCate', '显示文章列表左侧分类', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('107', 'Content/main', '显示文章列表', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('108', 'Content/sortArticle', '文章排序', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('109', 'Content/isArticle', '审核文章', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('110', 'Content/addArticle', '添加文章', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('111', 'Content/editArticle', '修改文章', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('112', 'Content/delArticle', '删除文章', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('113', 'Content/articleImg', '文章封面图片上传', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('114', 'Content/delArticleImg', '删除封面图片', '1', '1', '', '63', '1', '0', '');
INSERT INTO `hm_auth_rule` VALUES ('121', 'sdfsadfa', '阿萨德发射点发', '1', '1', '', '4', '1', '1', '');

-- ----------------------------
-- Table structure for hm_category
-- ----------------------------
DROP TABLE IF EXISTS `hm_category`;
CREATE TABLE `hm_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示栏目',
  `pid` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hm_category
-- ----------------------------
INSERT INTO `hm_category` VALUES ('1', '网页教程', '1', '0', '0', 'icons-car_cart_basket-basket_remove');
INSERT INTO `hm_category` VALUES ('2', 'HTML/XHTML', '1', '1', '1', 'icons-Date-date_add');
INSERT INTO `hm_category` VALUES ('3', 'Dreamweaver', '1', '1', '2', 'icons-chart-chart_curve_edit');
INSERT INTO `hm_category` VALUES ('5', 'sadfasd', '1', '0', '1', 'icons-other-cog');
INSERT INTO `hm_category` VALUES ('6', '阿萨德发射反', '1', '5', '1', 'icons-other-cog');

-- ----------------------------
-- Table structure for hm_login_log
-- ----------------------------
DROP TABLE IF EXISTS `hm_login_log`;
CREATE TABLE `hm_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `username` char(30) NOT NULL DEFAULT '' COMMENT '登录帐号',
  `logintime` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间戳',
  `loginip` char(20) NOT NULL DEFAULT '' COMMENT '登录IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,1为登录成功，0为登录失败',
  `info` varchar(66) NOT NULL DEFAULT '' COMMENT '尝试错误密码',
  `area` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录网络',
  `country` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录地区',
  `useragent` text COMMENT '用户浏览器信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='后台登陆日志表';

-- ----------------------------
-- Records of hm_login_log
-- ----------------------------
INSERT INTO `hm_login_log` VALUES ('120', 'iteny', '1458042406', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Android; Mobile; rv:29.0) Gecko/29.0 Firefox/29.0');
INSERT INTO `hm_login_log` VALUES ('119', 'iteny', '1458042398', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Android; Mobile; rv:29.0) Gecko/29.0 Firefox/29.0');
INSERT INTO `hm_login_log` VALUES ('118', 'admin', '1458031010', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('117', 'iteny', '1458019952', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('116', 'iteny', '1457874798', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('115', 'iteny', '1457874708', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('114', 'admin', '1457870388', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('113', 'iteny', '1457864070', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('112', 'iteny', '1457784722', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('111', 'iteny', '1457783853', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('110', 'iteny', '1457780952', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('109', 'iteny', '1457780949', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('108', 'iteny', '1457773718', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)');
INSERT INTO `hm_login_log` VALUES ('107', 'iteny', '1457773425', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('106', 'iteny', '1457773421', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('105', 'iteny', '1457772270', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('104', 'iteny', '1457766422', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('103', 'iteny', '1457766321', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('102', 'iteny', '1457766208', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('101', 'iteny', '1457766090', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('100', 'iteny', '1457765895', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('99', 'iteny', '1457762309', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('98', 'iteny', '1457705054', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('97', 'iteny', '1457699542', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('96', 'iteny', '1457614303', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('94', 'iteny', '1457612913', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('95', 'iteny', '1457613267', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('121', 'iteny', '1458125331', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('122', 'iteny', '1458201701', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('123', 'iteny', '1458201718', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('124', 'iteny', '1458377000', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('125', 'iteny', '1458458019', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('126', 'iteny', '1458458025', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('127', 'iteny', '1458475896', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('128', 'iteny', '1458477202', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('129', 'iteny', '1458480646', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('130', 'iteny', '1458480649', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('131', 'iteny', '1458560363', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('132', 'iteny', '1458633912', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('133', 'iteny', '1458643846', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('134', 'iteny', '1458645975', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('135', 'iteny', '1458648926', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Android; Mobile; rv:29.0) Gecko/29.0 Firefox/29.0');
INSERT INTO `hm_login_log` VALUES ('136', 'iteny', '1458736798', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('137', 'iteny', '1458807326', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('138', 'iteny', '1458823197', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('139', 'iteny', '1458827180', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('140', 'iteny', '1458827635', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('141', 'iteny', '1458827654', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('142', 'iteny', '1458828778', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('143', 'iteny', '1458832028', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('144', 'sdfasdf', '1468315557', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('145', 'sdfasdf', '1468315569', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('146', 'sdfasdf', '1468315572', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('147', 'sdfasdf', '1468315576', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('148', 'iteny', '1468315586', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('149', 'asdfasf', '1468315668', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('150', 'asdfasf', '1468315671', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('151', 'iteny', '1468317154', '192.168.0.185', '0', '格式错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('152', 'iteny', '1468317167', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('153', 'iteny', '1468317179', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('154', 'iteny', '1468317182', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('155', 'iteny', '1468317186', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('156', 'iteny', '1468317188', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('157', 'iteny', '1468317192', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('158', 'iteny', '1468317196', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('159', 'iteny', '1468317199', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('160', 'iteny', '1468317201', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('161', 'iteny', '1468317204', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('162', 'iteny', '1468317207', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('163', 'iteny', '1468317225', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('164', 'iteny', '1468317262', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('165', 'iteny', '1468317266', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('166', 'iteny', '1468317270', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('167', 'iteny', '1468317277', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('168', 'iteny', '1468317331', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('169', 'iteny', '1468317336', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('170', 'iteny', '1468317380', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('171', 'iteny', '1468317385', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('172', 'iteny', '1468317403', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('173', 'iteny', '1468317406', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('174', 'iteny', '1468317409', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('175', 'iteny', '1468317412', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('176', 'iteny', '1468317416', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('177', 'iteny', '1468317420', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('178', 'iteny', '1468317422', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('179', 'iteny', '1468317425', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('180', 'iteny', '1468317428', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('181', 'iteny', '1468317456', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('182', 'iteny', '1468317459', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('183', 'iteny', '1468317462', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('184', 'iteny', '1468317465', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('185', 'iteny', '1468317468', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('186', 'iteny', '1468317470', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('187', 'iteny', '1468317473', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('188', 'iteny', '1468317477', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('189', 'iteny', '1468317481', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('190', 'iteny', '1468317486', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('191', 'iteny', '1468317540', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('192', 'iteny', '1468317543', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('193', 'iteny', '1468317546', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('194', 'iteny', '1468317550', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('195', 'iteny', '1468317552', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('196', 'iteny', '1468317555', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('197', 'iteny', '1468317559', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('198', 'iteny', '1468317562', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('199', 'iteny', '1468317564', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('200', 'iteny', '1468317658', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('201', 'iteny', '1468317660', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('202', 'iteny', '1468317664', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('203', 'iteny', '1468317667', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('204', 'iteny', '1468317669', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('205', 'iteny', '1468317671', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('206', 'iteny', '1468317674', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('207', 'iteny', '1468317677', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('208', 'iteny', '1468317679', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('209', 'iteny', '1468317682', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('210', 'iteny', '1468317688', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('211', 'iteny', '1468317692', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('212', 'iteny', '1468317694', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('213', 'iteny', '1468317698', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('214', 'iteny', '1468317701', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('215', 'iteny', '1468317706', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('216', 'iteny', '1468317994', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('217', 'iteny', '1468317998', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('218', 'iteny', '1468318000', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('219', 'iteny', '1468318003', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('220', 'iteny', '1468318006', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('221', 'iteny', '1468318008', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('222', 'iteny', '1468318011', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('223', 'iteny', '1468318014', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('224', 'iteny', '1468318019', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('225', 'iteny', '1468318021', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('226', 'iteny', '1468318023', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('227', 'iteny', '1468318147', '192.168.0.185', '0', '格式错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('228', 'iteny', '1468318153', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('229', 'iteny', '1468318158', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('230', 'iteny', '1468318196', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('231', 'iteny', '1468318979', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('232', 'iteny', '1468319018', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('233', 'iteny', '1468319022', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('234', 'iteny', '1468319024', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('235', 'iteny', '1468319027', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('236', 'iteny', '1468319032', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('237', 'iteny', '1468319035', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('238', 'iteny', '1468319038', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('239', 'iteny', '1468319345', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('240', 'iteny', '1468319348', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('241', 'iteny', '1468319350', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('242', 'iteny', '1468319353', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('243', 'iteny', '1468319356', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('244', 'iteny', '1468319358', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('245', 'iteny', '1468319361', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('246', 'iteny', '1468319364', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('247', 'iteny', '1468319368', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('248', 'iteny', '1468319385', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('249', 'iteny', '1468319415', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('250', 'iteny', '1468319417', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('251', 'iteny', '1468319420', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('252', 'iteny', '1468319423', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('253', 'iteny', '1468319425', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('254', 'iteny', '1468319428', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('255', 'iteny', '1468319430', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('256', 'iteny', '1468319493', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('257', 'iteny', '1468319496', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('258', 'iteny', '1468319499', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('259', 'iteny', '1468319502', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('260', 'iteny', '1468319568', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('261', 'iteny', '1468319579', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('262', 'iteny', '1468319606', '192.168.0.185', '0', '格式错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('263', 'iteny', '1468319614', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('264', 'iteny', '1468320571', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('265', 'iteny', '1468320845', '192.168.0.185', '0', '帐号已锁定', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('266', 'iteny', '1468320864', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('267', 'iteny', '1468326057', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('268', 'iteny', '1468327449', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('269', 'iteny', '1468328333', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('270', 'iteny', '1468471074', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('271', 'iteny', '1468479677', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('272', 'iteny', '1468485708', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('273', 'iteny', '1468500079', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Android; Mobile; rv:29.0) Gecko/29.0 Firefox/29.0');
INSERT INTO `hm_login_log` VALUES ('274', 'iteny', '1468502742', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('275', 'iteny', '1468503264', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Android; Mobile; rv:29.0) Gecko/29.0 Firefox/29.0');
INSERT INTO `hm_login_log` VALUES ('276', 'iteny', '1468659767', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('277', 'iteny', '1468759739', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('278', 'iteny', '1468768238', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('279', 'iteny', '1468904938', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('280', 'iteny', '1468904946', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('281', 'hematest', '1468930415', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('282', 'hematest', '1468930418', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('283', 'iteny', '1468930458', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('284', 'hematest', '1468930588', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('285', 'iteny', '1468930649', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('286', 'hematest', '1468930704', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');

-- ----------------------------
-- Table structure for hm_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `hm_operate_log`;
CREATE TABLE `hm_operate_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(30) NOT NULL DEFAULT '' COMMENT '账户名',
  `ip` char(20) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `time` int(10) unsigned NOT NULL COMMENT '时间',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT '所在地区',
  `useragent` text NOT NULL COMMENT '用户行为浏览器信息',
  `info` text NOT NULL COMMENT '用户操作信息',
  `get` varchar(255) NOT NULL DEFAULT '' COMMENT 'get数据',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态；0错误；1成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hm_operate_log
-- ----------------------------
INSERT INTO `hm_operate_log` VALUES ('1', 'iteny', '192.168.0.185', '1457606152', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除失败<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '0');
INSERT INTO `hm_operate_log` VALUES ('2', 'iteny', '192.168.0.185', '1457609255', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('3', 'iteny', '192.168.0.185', '1457611232', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除操作日志成功！<br/>模块：Intendant,控制器：Site,方法：delOperateLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/operateLog', '0');
INSERT INTO `hm_operate_log` VALUES ('4', 'iteny', '192.168.0.185', '1457611262', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除操作日志成功！<br/>模块：Intendant,控制器：Site,方法：delOperateLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/operateLog', '0');
INSERT INTO `hm_operate_log` VALUES ('5', 'iteny', '192.168.0.185', '1457613485', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/loginLog', '45');
INSERT INTO `hm_operate_log` VALUES ('6', 'iteny', '192.168.0.185', '1457613519', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/loginLog', '0');
INSERT INTO `hm_operate_log` VALUES ('7', 'iteny', '192.168.0.185', '1457613608', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('8', 'iteny', '192.168.0.185', '1457613785', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('9', 'iteny', '192.168.0.185', '1457614325', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('10', 'iteny', '192.168.0.185', '1457704338', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('11', 'iteny', '192.168.0.185', '1457707492', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('12', 'iteny', '192.168.0.185', '1457787229', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('13', 'iteny', '192.168.0.185', '1457788020', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('14', 'iteny', '192.168.0.185', '1457788057', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('15', 'iteny', '192.168.0.185', '1457788089', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('16', 'iteny', '192.168.0.185', '1457788099', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('17', 'iteny', '192.168.0.185', '1457788105', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('18', 'iteny', '192.168.0.185', '1457794576', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除用户成功<br/>模块：Intendant,控制器：Site,方法：delUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '1');
INSERT INTO `hm_operate_log` VALUES ('19', 'iteny', '192.168.0.185', '1457866200', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/2/data/%E7%BD%91%E7%BB%9C%E7%AE%A1%E7%90%86', '1');
INSERT INTO `hm_operate_log` VALUES ('20', 'iteny', '192.168.0.185', '1457866206', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/2/data/%E7%BD%91%E7%BB%9C%E7%AE%A1%E7%90%86', '1');
INSERT INTO `hm_operate_log` VALUES ('21', 'iteny', '192.168.0.185', '1457868025', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除角色成功<br/>模块：Intendant,控制器：Site,方法：delRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('22', 'iteny', '192.168.0.185', '1457868043', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除用户成功<br/>模块：Intendant,控制器：Site,方法：delUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '1');
INSERT INTO `hm_operate_log` VALUES ('23', 'iteny', '192.168.0.185', '1457868073', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/11/data/%E9%98%BF%E6%96%AF%E8%92%82%E8%8A%AC', '1');
INSERT INTO `hm_operate_log` VALUES ('24', 'iteny', '192.168.0.185', '1457869393', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('25', 'iteny', '192.168.0.185', '1457869398', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除操作日志成功！<br/>模块：Intendant,控制器：Site,方法：delOperateLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/operateLog', '1');
INSERT INTO `hm_operate_log` VALUES ('26', 'iteny', '192.168.0.185', '1457869406', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/2/data/%E7%BD%91%E7%BB%9C%E7%AE%A1%E7%90%86', '1');
INSERT INTO `hm_operate_log` VALUES ('27', 'iteny', '192.168.0.185', '1457870221', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('28', 'iteny', '192.168.0.185', '1457870229', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('29', 'iteny', '192.168.0.185', '1457870421', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('30', 'iteny', '192.168.0.185', '1457870508', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('31', 'iteny', '192.168.0.185', '1457873256', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('32', 'iteny', '192.168.0.185', '1457874097', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('33', 'iteny', '192.168.0.185', '1457874375', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除用户成功<br/>模块：Intendant,控制器：Site,方法：delUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '1');
INSERT INTO `hm_operate_log` VALUES ('34', 'iteny', '192.168.0.185', '1457874507', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除角色成功<br/>模块：Intendant,控制器：Site,方法：delRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('35', 'iteny', '192.168.0.185', '1457874593', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('36', 'iteny', '192.168.0.185', '1457874599', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除操作日志成功！<br/>模块：Intendant,控制器：Site,方法：delOperateLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/operateLog', '1');
INSERT INTO `hm_operate_log` VALUES ('37', 'iteny', '192.168.0.185', '1457874602', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('38', 'iteny', '192.168.0.185', '1458031158', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('39', 'iteny', '192.168.0.185', '1458031765', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('40', 'iteny', '192.168.0.185', '1458032027', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setconfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('41', 'iteny', '192.168.0.185', '1458032033', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setconfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('42', 'iteny', '192.168.0.185', '1458211546', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('43', 'iteny', '192.168.0.185', '1458211556', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('44', 'iteny', '192.168.0.185', '1458212200', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('45', 'iteny', '192.168.0.185', '1458217154', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('46', 'iteny', '192.168.0.185', '1458221492', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：栏目删除成功<br/>模块：Intendant,控制器：Content,方法：delCate<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/index', '1');
INSERT INTO `hm_operate_log` VALUES ('47', 'iteny', '192.168.0.185', '1458221686', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：栏目排序成功<br/>模块：Intendant,控制器：Content,方法：sortCate<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/index', '1');
INSERT INTO `hm_operate_log` VALUES ('48', 'iteny', '192.168.0.185', '1458221692', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '提示语：栏目排序成功<br/>模块：Intendant,控制器：Content,方法：sortCate<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/index', '1');
INSERT INTO `hm_operate_log` VALUES ('49', 'iteny', '192.168.0.185', '1458740643', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('50', 'iteny', '192.168.0.185', '1458740656', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：showRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/showRole/id/3/data/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91', '1');
INSERT INTO `hm_operate_log` VALUES ('51', 'iteny', '192.168.0.185', '1458814808', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Content,方法：sortArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('52', 'iteny', '192.168.0.185', '1458814871', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Content,方法：sortArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('53', 'iteny', '192.168.0.185', '1458815016', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('54', 'iteny', '192.168.0.185', '1458815378', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Content,方法：sortArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('55', 'iteny', '192.168.0.185', '1458815510', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Content,方法：sortArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('56', 'iteny', '192.168.0.185', '1458815531', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Content,方法：sortArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('57', 'iteny', '192.168.0.185', '1458815986', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章排序成功<br/>模块：Intendant,控制器：Content,方法：sortArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('58', 'iteny', '192.168.0.185', '1458816165', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('59', 'iteny', '192.168.0.185', '1458816193', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('60', 'iteny', '192.168.0.185', '1458816203', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('61', 'iteny', '192.168.0.185', '1458817295', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('62', 'iteny', '192.168.0.185', '1458817315', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('63', 'iteny', '192.168.0.185', '1458817352', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('64', 'iteny', '192.168.0.185', '1458817369', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('65', 'iteny', '192.168.0.185', '1458817436', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('66', 'iteny', '192.168.0.185', '1458817457', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('67', 'iteny', '192.168.0.185', '1458817533', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('68', 'iteny', '192.168.0.185', '1458817601', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('69', 'iteny', '192.168.0.185', '1458817611', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('70', 'iteny', '192.168.0.185', '1458817619', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('71', 'iteny', '192.168.0.185', '1458817626', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('72', 'iteny', '192.168.0.185', '1458817634', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章排序成功<br/>模块：Intendant,控制器：Content,方法：sortArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('73', 'iteny', '192.168.0.185', '1458817772', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章审核成功<br/>模块：Intendant,控制器：Content,方法：isArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/0', '1');
INSERT INTO `hm_operate_log` VALUES ('74', 'iteny', '192.168.0.185', '1458817781', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：文章删除成功<br/>模块：Intendant,控制器：Content,方法：delArticle<br/>请求方式：Ajax', 'http://sina.com/Intendant/Content/main/catid/2/isshow/1', '1');
INSERT INTO `hm_operate_log` VALUES ('75', 'iteny', '192.168.0.185', '1458830799', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('76', 'iteny', '192.168.0.185', '1458830887', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('77', 'iteny', '192.168.0.185', '1458830970', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('78', 'iteny', '192.168.0.185', '1458831036', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('79', 'iteny', '192.168.0.185', '1458831095', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('80', 'iteny', '192.168.0.185', '1458831107', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('81', 'iteny', '192.168.0.185', '1458831122', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('82', 'iteny', '192.168.0.185', '1458831199', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('83', 'iteny', '192.168.0.185', '1458831223', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('84', 'iteny', '192.168.0.185', '1458831231', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：清空缓存成功<br/>模块：Intendant,控制器：Index,方法：deleteCache<br/>请求方式：Ajax', 'http://sina.com/Intendant/Index/index', '1');
INSERT INTO `hm_operate_log` VALUES ('85', 'iteny', '192.168.0.185', '1458831293', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('86', 'iteny', '192.168.0.185', '1458831302', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('87', 'iteny', '192.168.0.185', '1458831849', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('88', 'iteny', '192.168.0.185', '1468489688', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=115', '1');
INSERT INTO `hm_operate_log` VALUES ('89', 'iteny', '192.168.0.185', '1468493465', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('90', 'iteny', '192.168.0.185', '1468493474', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('91', 'iteny', '192.168.0.185', '1468493481', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('92', 'iteny', '192.168.0.185', '1468494319', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('93', 'iteny', '192.168.0.185', '1468494333', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('94', 'iteny', '192.168.0.185', '1468496389', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('95', 'iteny', '192.168.0.185', '1468496396', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('96', 'iteny', '192.168.0.185', '1468496402', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('97', 'iteny', '192.168.0.185', '1468496408', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('98', 'iteny', '192.168.0.185', '1468496733', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=1', '1');
INSERT INTO `hm_operate_log` VALUES ('99', 'iteny', '192.168.0.185', '1468496743', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=4', '1');
INSERT INTO `hm_operate_log` VALUES ('100', 'iteny', '192.168.0.185', '1468496753', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=101', '1');
INSERT INTO `hm_operate_log` VALUES ('101', 'iteny', '192.168.0.185', '1468497097', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=3', '1');
INSERT INTO `hm_operate_log` VALUES ('102', 'iteny', '192.168.0.185', '1468497109', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=25', '1');
INSERT INTO `hm_operate_log` VALUES ('103', 'iteny', '192.168.0.185', '1468497118', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=26', '1');
INSERT INTO `hm_operate_log` VALUES ('104', 'iteny', '192.168.0.185', '1468497127', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=105', '1');
INSERT INTO `hm_operate_log` VALUES ('105', 'iteny', '192.168.0.185', '1468497165', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=104', '1');
INSERT INTO `hm_operate_log` VALUES ('106', 'iteny', '192.168.0.185', '1468497175', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=103', '1');
INSERT INTO `hm_operate_log` VALUES ('107', 'iteny', '192.168.0.185', '1468497185', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=102', '1');
INSERT INTO `hm_operate_log` VALUES ('108', 'iteny', '192.168.0.185', '1468497195', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=63', '1');
INSERT INTO `hm_operate_log` VALUES ('109', 'iteny', '192.168.0.185', '1468497205', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=112', '1');
INSERT INTO `hm_operate_log` VALUES ('110', 'iteny', '192.168.0.185', '1468497219', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=111', '1');
INSERT INTO `hm_operate_log` VALUES ('111', 'iteny', '192.168.0.185', '1468497229', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=110', '1');
INSERT INTO `hm_operate_log` VALUES ('112', 'iteny', '192.168.0.185', '1468497237', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=108', '1');
INSERT INTO `hm_operate_log` VALUES ('113', 'iteny', '192.168.0.185', '1468497248', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=107', '1');
INSERT INTO `hm_operate_log` VALUES ('114', 'iteny', '192.168.0.185', '1468497256', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=106', '1');
INSERT INTO `hm_operate_log` VALUES ('115', 'iteny', '192.168.0.185', '1468497266', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=109', '1');
INSERT INTO `hm_operate_log` VALUES ('116', 'iteny', '192.168.0.185', '1468497276', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=113', '1');
INSERT INTO `hm_operate_log` VALUES ('117', 'iteny', '192.168.0.185', '1468497286', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=114', '1');
INSERT INTO `hm_operate_log` VALUES ('118', 'iteny', '192.168.0.185', '1468497297', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=2', '1');
INSERT INTO `hm_operate_log` VALUES ('119', 'iteny', '192.168.0.185', '1468497309', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=8', '1');
INSERT INTO `hm_operate_log` VALUES ('120', 'iteny', '192.168.0.185', '1468497318', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=9', '1');
INSERT INTO `hm_operate_log` VALUES ('121', 'iteny', '192.168.0.185', '1468497329', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=70', '1');
INSERT INTO `hm_operate_log` VALUES ('122', 'iteny', '192.168.0.185', '1468497340', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=69', '1');
INSERT INTO `hm_operate_log` VALUES ('123', 'iteny', '192.168.0.185', '1468497349', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=52', '1');
INSERT INTO `hm_operate_log` VALUES ('124', 'iteny', '192.168.0.185', '1468497361', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=53', '1');
INSERT INTO `hm_operate_log` VALUES ('125', 'iteny', '192.168.0.185', '1468497370', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=54', '1');
INSERT INTO `hm_operate_log` VALUES ('126', 'iteny', '192.168.0.185', '1468497381', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=55', '1');
INSERT INTO `hm_operate_log` VALUES ('127', 'iteny', '192.168.0.185', '1468497390', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=56', '1');
INSERT INTO `hm_operate_log` VALUES ('128', 'iteny', '192.168.0.185', '1468497401', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=100', '1');
INSERT INTO `hm_operate_log` VALUES ('129', 'iteny', '192.168.0.185', '1468497410', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=57', '1');
INSERT INTO `hm_operate_log` VALUES ('130', 'iteny', '192.168.0.185', '1468497421', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=58', '1');
INSERT INTO `hm_operate_log` VALUES ('131', 'iteny', '192.168.0.185', '1468497431', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=10', '1');
INSERT INTO `hm_operate_log` VALUES ('132', 'iteny', '192.168.0.185', '1468497441', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=32', '1');
INSERT INTO `hm_operate_log` VALUES ('133', 'iteny', '192.168.0.185', '1468497453', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=33', '1');
INSERT INTO `hm_operate_log` VALUES ('134', 'iteny', '192.168.0.185', '1468497463', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=34', '1');
INSERT INTO `hm_operate_log` VALUES ('135', 'iteny', '192.168.0.185', '1468497474', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=35', '1');
INSERT INTO `hm_operate_log` VALUES ('136', 'iteny', '192.168.0.185', '1468497484', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=36', '1');
INSERT INTO `hm_operate_log` VALUES ('137', 'iteny', '192.168.0.185', '1468497494', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=37', '1');
INSERT INTO `hm_operate_log` VALUES ('138', 'iteny', '192.168.0.185', '1468497504', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=46', '1');
INSERT INTO `hm_operate_log` VALUES ('139', 'iteny', '192.168.0.185', '1468497518', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=59', '1');
INSERT INTO `hm_operate_log` VALUES ('140', 'iteny', '192.168.0.185', '1468497530', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=60', '1');
INSERT INTO `hm_operate_log` VALUES ('141', 'iteny', '192.168.0.185', '1468497541', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=61', '1');
INSERT INTO `hm_operate_log` VALUES ('142', 'iteny', '192.168.0.185', '1468497552', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=45', '1');
INSERT INTO `hm_operate_log` VALUES ('143', 'iteny', '192.168.0.185', '1468497562', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=48', '1');
INSERT INTO `hm_operate_log` VALUES ('144', 'iteny', '192.168.0.185', '1468497573', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=49', '1');
INSERT INTO `hm_operate_log` VALUES ('145', 'iteny', '192.168.0.185', '1468497583', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=50', '1');
INSERT INTO `hm_operate_log` VALUES ('146', 'iteny', '192.168.0.185', '1468497594', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=51', '1');
INSERT INTO `hm_operate_log` VALUES ('147', 'iteny', '192.168.0.185', '1468497604', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=12', '1');
INSERT INTO `hm_operate_log` VALUES ('148', 'iteny', '192.168.0.185', '1468497616', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=13', '1');
INSERT INTO `hm_operate_log` VALUES ('149', 'iteny', '192.168.0.185', '1468497629', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=27', '1');
INSERT INTO `hm_operate_log` VALUES ('150', 'iteny', '192.168.0.185', '1468497644', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=28', '1');
INSERT INTO `hm_operate_log` VALUES ('151', 'iteny', '192.168.0.185', '1468497656', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=29', '1');
INSERT INTO `hm_operate_log` VALUES ('152', 'iteny', '192.168.0.185', '1468497668', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=30', '1');
INSERT INTO `hm_operate_log` VALUES ('153', 'iteny', '192.168.0.185', '1468497679', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=31', '1');
INSERT INTO `hm_operate_log` VALUES ('154', 'iteny', '192.168.0.185', '1468497689', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=14', '1');
INSERT INTO `hm_operate_log` VALUES ('155', 'iteny', '192.168.0.185', '1468497704', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=38', '1');
INSERT INTO `hm_operate_log` VALUES ('156', 'iteny', '192.168.0.185', '1468497714', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=39', '1');
INSERT INTO `hm_operate_log` VALUES ('157', 'iteny', '192.168.0.185', '1468497727', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=40', '1');
INSERT INTO `hm_operate_log` VALUES ('158', 'iteny', '192.168.0.185', '1468497739', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=41', '1');
INSERT INTO `hm_operate_log` VALUES ('159', 'iteny', '192.168.0.185', '1468497752', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=42', '1');
INSERT INTO `hm_operate_log` VALUES ('160', 'iteny', '192.168.0.185', '1468497761', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=15', '1');
INSERT INTO `hm_operate_log` VALUES ('161', 'iteny', '192.168.0.185', '1468497772', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=16', '1');
INSERT INTO `hm_operate_log` VALUES ('162', 'iteny', '192.168.0.185', '1468497785', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=43', '1');
INSERT INTO `hm_operate_log` VALUES ('163', 'iteny', '192.168.0.185', '1468497795', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=17', '1');
INSERT INTO `hm_operate_log` VALUES ('164', 'iteny', '192.168.0.185', '1468497806', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=44', '1');
INSERT INTO `hm_operate_log` VALUES ('165', 'iteny', '192.168.0.185', '1468497890', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('166', 'iteny', '192.168.0.185', '1468497924', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('167', 'iteny', '192.168.0.185', '1468497982', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('168', 'iteny', '192.168.0.185', '1468498005', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=32', '1');
INSERT INTO `hm_operate_log` VALUES ('169', 'iteny', '192.168.0.185', '1468501886', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('170', 'iteny', '192.168.0.185', '1468502120', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('171', 'iteny', '192.168.0.185', '1468670095', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2693.2 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('172', 'iteny', '192.168.0.185', '1468680509', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：添加用户成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser', '1');
INSERT INTO `hm_operate_log` VALUES ('173', 'iteny', '192.168.0.185', '1468680773', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：添加用户成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser', '1');
INSERT INTO `hm_operate_log` VALUES ('174', 'iteny', '192.168.0.185', '1468681003', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：添加用户成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser', '1');
INSERT INTO `hm_operate_log` VALUES ('175', 'iteny', '192.168.0.185', '1468763183', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：添加用户成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser', '1');
INSERT INTO `hm_operate_log` VALUES ('176', 'iteny', '192.168.0.185', '1468763455', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：添加用户成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser', '1');
INSERT INTO `hm_operate_log` VALUES ('177', 'iteny', '192.168.0.185', '1468765405', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：用户修改成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser/?uid=12', '1');
INSERT INTO `hm_operate_log` VALUES ('178', 'iteny', '192.168.0.185', '1468765912', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：添加用户成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser', '1');
INSERT INTO `hm_operate_log` VALUES ('179', 'iteny', '192.168.0.185', '1468765925', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：用户修改成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser/?uid=13', '1');
INSERT INTO `hm_operate_log` VALUES ('180', 'iteny', '192.168.0.185', '1468765953', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：用户修改成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser/?uid=13', '1');
INSERT INTO `hm_operate_log` VALUES ('181', 'iteny', '192.168.0.185', '1468766863', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除用户成功<br/>模块：Intendant,控制器：Site,方法：delUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '1');
INSERT INTO `hm_operate_log` VALUES ('182', 'iteny', '192.168.0.185', '1468766922', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除用户成功<br/>模块：Intendant,控制器：Site,方法：delUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '1');
INSERT INTO `hm_operate_log` VALUES ('183', 'iteny', '192.168.0.185', '1468767212', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：不允许删除原始超级管理员<br/>模块：Intendant,控制器：Site,方法：batchDelUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '0');
INSERT INTO `hm_operate_log` VALUES ('184', 'iteny', '192.168.0.185', '1468767228', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：不允许删除原始超级管理员<br/>模块：Intendant,控制器：Site,方法：batchDelUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '0');
INSERT INTO `hm_operate_log` VALUES ('185', 'iteny', '192.168.0.185', '1468767271', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：不允许删除原始超级管理员<br/>模块：Intendant,控制器：Site,方法：batchDelUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '0');
INSERT INTO `hm_operate_log` VALUES ('186', 'iteny', '192.168.0.185', '1468767419', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除用户成功<br/>模块：Intendant,控制器：Site,方法：batchDelUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/user', '1');
INSERT INTO `hm_operate_log` VALUES ('187', 'iteny', '192.168.0.185', '1468904987', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：用户修改成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser/?uid=2', '1');
INSERT INTO `hm_operate_log` VALUES ('188', 'iteny', '192.168.0.185', '1468911506', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('189', 'iteny', '192.168.0.185', '1468911546', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=27', '1');
INSERT INTO `hm_operate_log` VALUES ('190', 'iteny', '192.168.0.185', '1468911651', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=29', '1');
INSERT INTO `hm_operate_log` VALUES ('191', 'iteny', '192.168.0.185', '1468911691', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=30', '1');
INSERT INTO `hm_operate_log` VALUES ('192', 'iteny', '192.168.0.185', '1468920033', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：角色用户成功<br/>模块：Intendant,控制器：Site,方法：addEditRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditRole', '1');
INSERT INTO `hm_operate_log` VALUES ('193', 'iteny', '192.168.0.185', '1468920344', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：角色用户成功<br/>模块：Intendant,控制器：Site,方法：addEditRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditRole', '1');
INSERT INTO `hm_operate_log` VALUES ('194', 'iteny', '192.168.0.185', '1468921542', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：角色修改成功<br/>模块：Intendant,控制器：Site,方法：addEditRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditRole/?id=14', '1');
INSERT INTO `hm_operate_log` VALUES ('195', 'iteny', '192.168.0.185', '1468921737', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除角色失败，请联系管理员<br/>模块：Intendant,控制器：Site,方法：delRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '0');
INSERT INTO `hm_operate_log` VALUES ('196', 'iteny', '192.168.0.185', '1468921751', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除角色成功<br/>模块：Intendant,控制器：Site,方法：delRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('197', 'iteny', '192.168.0.185', '1468921758', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除角色成功<br/>模块：Intendant,控制器：Site,方法：delRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('198', 'iteny', '192.168.0.185', '1468922215', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：角色排序成功<br/>模块：Intendant,控制器：Site,方法：sortRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('199', 'iteny', '192.168.0.185', '1468922294', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：角色排序成功<br/>模块：Intendant,控制器：Site,方法：sortRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('200', 'iteny', '192.168.0.185', '1468922325', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：角色排序成功<br/>模块：Intendant,控制器：Site,方法：sortRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('201', 'iteny', '192.168.0.185', '1468922380', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：角色排序成功<br/>模块：Intendant,控制器：Site,方法：sortRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/role', '1');
INSERT INTO `hm_operate_log` VALUES ('202', 'iteny', '192.168.0.185', '1468923218', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=31', '1');
INSERT INTO `hm_operate_log` VALUES ('203', 'iteny', '192.168.0.185', '1468923247', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=40', '1');
INSERT INTO `hm_operate_log` VALUES ('204', 'iteny', '192.168.0.185', '1468923269', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=41', '1');
INSERT INTO `hm_operate_log` VALUES ('205', 'iteny', '192.168.0.185', '1468923341', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=42', '1');
INSERT INTO `hm_operate_log` VALUES ('206', 'iteny', '192.168.0.185', '1468928166', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/?id=9&title=%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2', '1');
INSERT INTO `hm_operate_log` VALUES ('207', 'iteny', '192.168.0.185', '1468928445', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/?id=9&title=%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2', '1');
INSERT INTO `hm_operate_log` VALUES ('208', 'iteny', '192.168.0.185', '1468929178', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/?id=9&title=%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2', '1');
INSERT INTO `hm_operate_log` VALUES ('209', 'iteny', '192.168.0.185', '1468929616', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/3/title/%E7%BD%91%E7%AB%99%E7%BC%96%E8%BE%91.html', '1');
INSERT INTO `hm_operate_log` VALUES ('210', 'iteny', '192.168.0.185', '1468930375', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：添加用户成功<br/>模块：Intendant,控制器：Site,方法：addEditUser<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditUser', '1');
INSERT INTO `hm_operate_log` VALUES ('211', 'iteny', '192.168.0.185', '1468930400', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/9/title/%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2.html', '1');
INSERT INTO `hm_operate_log` VALUES ('212', 'iteny', '192.168.0.185', '1468930519', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/?id=9&title=%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2', '1');
INSERT INTO `hm_operate_log` VALUES ('213', 'iteny', '192.168.0.185', '1468930567', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/?id=9&title=%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2', '1');
INSERT INTO `hm_operate_log` VALUES ('214', 'hematest', '192.168.0.185', '1468930611', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('215', 'hematest', '192.168.0.185', '1468930622', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除用户成功<br/>模块：Intendant,控制器：Site,方法：delUser<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/user', '1');
INSERT INTO `hm_operate_log` VALUES ('216', 'iteny', '192.168.0.185', '1468930688', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/?id=9&title=%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2', '1');
INSERT INTO `hm_operate_log` VALUES ('217', 'hematest', '192.168.0.185', '1468931163', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单删除成功<br/>模块：Intendant,控制器：Site,方法：delMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('218', 'hematest', '192.168.0.185', '1468931192', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=38', '1');
INSERT INTO `hm_operate_log` VALUES ('219', 'hematest', '192.168.0.185', '1468931226', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/9/title/%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2.html', '1');
INSERT INTO `hm_operate_log` VALUES ('220', 'hematest', '192.168.0.185', '1468931245', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/9/title/%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2.html', '1');
INSERT INTO `hm_operate_log` VALUES ('221', 'hematest', '192.168.0.185', '1468931294', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/id/9/title/%E6%96%B0%E5%BB%BA%E8%A7%92%E8%89%B2.html', '1');

-- ----------------------------
-- Table structure for hm_user
-- ----------------------------
DROP TABLE IF EXISTS `hm_user`;
CREATE TABLE `hm_user` (
  `uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称/姓名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `account` (`username`),
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of hm_user
-- ----------------------------
INSERT INTO `hm_user` VALUES ('1', 'iteny', '阿斯蒂芬', 'ea42d19ad8d196fbbf861969dd92d5b3a02639ec', 'asdfas@asdf.com', '', '1451132711', '0', '1');
INSERT INTO `hm_user` VALUES ('14', 'hematest', '阿萨德房价', '6f202abf8fa897df414aa16a24d3e8a0da7d89f4', 'sdfas@qq.com', '测试帐号', '1468930375', '192168', '1');
