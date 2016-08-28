/*
Navicat MySQL Data Transfer

Source Server         : php
Source Server Version : 50711
Source Host           : 192.168.0.111:3306
Source Database       : hmadmin

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-08-28 23:35:47
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of hm_auth_group
-- ----------------------------
INSERT INTO `hm_auth_group` VALUES ('1', '超级管理员', '1', '2,8,9,70,71,72,10,32,33,34,35,36,37,45,48,49,50,51,46,59,60,61,69,11,47,52,53,54,55,56,57,58,12,13,27,28,29,30,31,14,38,39,40,41,42,15,16,43,17,44,3,25,26,63,64,65,66,67,68', '1', '东风公司打工');
INSERT INTO `hm_auth_group` VALUES ('2', '网络管理', '1', '1,4,2,8,9,70,10,32,34,35,36,37,69,52,53,54,55,56,57,58,46,59,60,61,45,48,49,50,51,12,13,27,29,30,31,14,38,40,41,42,15,16,43,17,44,3,25,26,104,105,63', '3', '');
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
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='规则表';

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
INSERT INTO `hm_auth_rule` VALUES ('45', 'Site/version', '开发日志管理', '1', '1', '', '8', '1', '6', '');
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
INSERT INTO `hm_auth_rule` VALUES ('121', 'Index/home', '后台首页', '1', '1', '', '4', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('125', 'Inc', '企业', '1', '1', '', '0', '1', '3', '');
INSERT INTO `hm_auth_rule` VALUES ('126', 'sdfasdf', '撒旦法的', '1', '1', '', '125', '1', '1', '');
INSERT INTO `hm_auth_rule` VALUES ('127', 'Test/index', '测试', '1', '1', '', '126', '1', '1', '');

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
-- Table structure for hm_config
-- ----------------------------
DROP TABLE IF EXISTS `hm_config`;
CREATE TABLE `hm_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '配置键名',
  `value` text NOT NULL COMMENT '配置键值',
  `pid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(18) NOT NULL DEFAULT '' COMMENT '配置类型',
  `tip` varchar(110) NOT NULL DEFAULT '' COMMENT '配置注释',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `onclick` varchar(32) DEFAULT '' COMMENT '专为text_btn类型设定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hm_config
-- ----------------------------
INSERT INTO `hm_config` VALUES ('1', '站长设置', '', '11', '0', '', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('2', '后台缓存设置', '', '22', '0', '', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('3', '数据备份设置', '', '33', '0', '', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('4', '邮箱设置', '', '44', '0', '', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('5', '后台登录帐号锁定', 'USER_STATE_LOCK', '1', '1', 'radio', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('6', '后台登录帐号密码错误几次锁定', 'USER_LOCK_CNT', '6', '1', 'select_cnt', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('7', '密码错误锁定时间', 'USER_LOCK_TIME', '3600', '1', 'select_time', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('8', '开启操作日志', 'OPERATE_LOG', '1', '1', 'radio', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('9', '超级管理员的ID组', 'AUTH_SUPERADMIN', '1,14', '1', 'text_btn', '', '0', '1', 'nihao');
INSERT INTO `hm_config` VALUES ('10', '后台数据分页数量', 'ADMIN_PAGE_NUM', '15', '2', 'select_page', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('11', '后台菜单ID缓存时间', 'RULE_ID_TIME', '1800', '2', 'select_time', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('12', '后台菜单缓存时间', 'RULE_MENU_TIME', '1800', '2', 'select_time', '', '0', '1', null);
INSERT INTO `hm_config` VALUES ('13', '后台用户管理缓存时间', 'ADMIN_USER_MANAGE_TIME', '1800', '2', 'select_time', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('14', '后台角色管理列表缓存时间', 'ADMIN_ROLE_MANAGE_TIME', '3600', '2', 'select_time', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('15', '后台角色授权列表缓存时间', 'ADMIN_ROLE_AUTH_TIME', '3600', '2', 'select_time', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('16', '开发日志管理缓存时间', 'ADMIN_VERSION_MANAGE_TIME', '3600', '2', 'select_time', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('17', '登录日志管理缓存时间', 'ADMIN_LOGIN_MANAGE_TIME', '3600', '2', 'select_time', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('18', '操作日志管理缓存时间', 'ADMIN_OPERATE_MANAGE_TIME', '3600', '2', 'select_time', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('19', '后台规则菜单缓存时间', 'AUTH_MENU_TIME', '3600', '2', 'select_time', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('20', '是否启用数据压缩', 'DATA_BACKUP_COMPRESS', '1', '3', 'radio', '0:不压缩1:启用压缩', '0', '1', '');
INSERT INTO `hm_config` VALUES ('21', '数据库备份卷大小', 'DATA_BACKUP_PART_SIZE', '20971520', '3', 'select_size', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '0', '1', '');
INSERT INTO `hm_config` VALUES ('22', '备份文件压缩级别', 'DATA_BACKUP_COMPRESS_LEVEL', '9', '3', 'select_level', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('23', '使用那家的邮箱', 'YOUR_EMAIL_SMTP', '163.com', '4', 'email_smtp', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('24', '邮箱端口', 'YOUR_EMAIL_PORT', '25', '4', 'email_port', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('25', '邮箱地址', 'YOUR_EMAIL', 'hmtest520', '4', 'text', '只需要填写邮箱帐号,@163.com这部分不需要填写', '0', '1', '');
INSERT INTO `hm_config` VALUES ('26', '邮箱密码', 'YOUR_EMAIL_PWD', 'a123456', '4', 'password', '', '0', '1', '');
INSERT INTO `hm_config` VALUES ('27', '备份文件发送的目标地址', 'BACKUP_TO_EMAIL', '8192332@qq.com', '4', 'text', '备份文件发送的目标地址,注意这里需要加上@163.com', '0', '1', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COMMENT='后台登陆日志表';

-- ----------------------------
-- Records of hm_login_log
-- ----------------------------
INSERT INTO `hm_login_log` VALUES ('293', 'iteny', '1469538237', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('353', 'admin', '1472371470', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('351', 'admin', '1472104170', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('352', 'admin', '1472207356', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('350', 'admin', '1471933618', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('349', 'admin', '1471759458', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('348', 'admin', '1471759450', '192.168.0.185', '0', '格式错误', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('347', 'admin', '1471684940', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('345', 'admin', '1471509857', '192.168.0.185', '0', '格式错误', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('346', 'admin', '1471509864', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('278', 'iteny', '1468768238', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('279', 'iteny', '1468904938', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('280', 'iteny', '1468904946', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('281', 'hematest', '1468930415', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('282', 'hematest', '1468930418', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('283', 'iteny', '1468930458', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('284', 'hematest', '1468930588', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('285', 'iteny', '1468930649', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('286', 'hematest', '1468930704', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('287', 'iteny', '1468935506', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('288', 'iteny', '1469079272', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('289', 'iteny', '1469090092', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('290', 'iteny', '1469090153', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('291', 'iteny', '1469090212', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('292', 'iteny', '1469508546', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('294', 'iteny', '1469705678', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('295', 'iteny', '1469867306', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('296', 'iteny', '1469867786', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('297', 'iteny', '1469870465', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('298', 'iteny', '1469887472', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('299', 'iteny', '1469887475', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('300', 'iteny', '1469954537', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('301', 'iteny', '1470119491', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/51.0.2704.106 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('302', 'iteny', '1470485609', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('303', 'iteny', '1470545155', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('304', 'iteny', '1470545196', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('305', 'iteny', '1470545310', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('306', 'iteny', '1470545343', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('307', 'iteny', '1470545528', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('308', 'iteny', '1470545595', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('309', 'iteny', '1470545827', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('310', 'iteny', '1470546867', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('311', 'iteny', '1470546894', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.82 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('312', 'iteny', '1470546948', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240');
INSERT INTO `hm_login_log` VALUES ('313', 'iteny', '1470547183', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/52.0.2743.116 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('314', 'iteny', '1470547340', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/54.0.2816.0 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('315', 'iteny', '1470548458', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/54.0.2816.0 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('316', 'iteny', '1470548535', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/54.0.2816.0 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('317', 'iteny', '1470548663', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('318', 'iteny', '1470550855', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('319', 'iteny', '1470555218', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('320', 'iteny', '1470555412', '192.168.0.185', '0', '验证码错误', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('321', 'iteny', '1470555415', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('322', 'iteny', '1470558696', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('323', 'iteny', '1470559946', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('324', 'iteny', '1470560791', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('325', 'iteny', '1470561404', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('326', 'iteny', '1470561483', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('327', 'iteny', '1470561582', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('328', 'iteny', '1470561627', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('329', 'iteny', '1470561646', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('330', 'iteny', '1470561859', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('331', 'iteny', '1470566327', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('332', 'iteny', '1470566997', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('333', 'iteny', '1470568999', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('334', 'iteny', '1470569045', '192.168.0.185', '0', '帐号密码错误', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('335', 'iteny', '1470569053', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('336', 'iteny', '1470569071', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('337', 'iteny', '1470569111', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('338', 'admin', '1470569277', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('339', 'admin', '1470569316', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('340', 'admin', '1470731534', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('341', 'admin', '1470913161', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('342', 'admin', '1471071479', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('343', 'admin', '1471162098', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');
INSERT INTO `hm_login_log` VALUES ('344', 'admin', '1471322945', '192.168.0.185', '1', '密码保密', '对方和您在同一内部网', '局域网', 'Chrome/45.0.2454.101 Safari/537.36');

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
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hm_operate_log
-- ----------------------------
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
INSERT INTO `hm_operate_log` VALUES ('222', 'iteny', '192.168.0.185', '1469080172', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=121', '1');
INSERT INTO `hm_operate_log` VALUES ('223', 'iteny', '192.168.0.185', '1469083941', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=45', '1');
INSERT INTO `hm_operate_log` VALUES ('224', 'iteny', '192.168.0.185', '1469099814', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志用户成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('225', 'iteny', '192.168.0.185', '1469099837', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志用户成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('226', 'iteny', '192.168.0.185', '1469099937', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('227', 'iteny', '192.168.0.185', '1469100033', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('228', 'iteny', '192.168.0.185', '1469100162', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('229', 'iteny', '192.168.0.185', '1469100510', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志修改成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion/?id=1', '1');
INSERT INTO `hm_operate_log` VALUES ('230', 'iteny', '192.168.0.185', '1469100541', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志修改成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion/?id=1', '1');
INSERT INTO `hm_operate_log` VALUES ('231', 'iteny', '192.168.0.185', '1469100989', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除开发日志成功<br/>模块：Intendant,控制器：Site,方法：batchDelVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/version', '1');
INSERT INTO `hm_operate_log` VALUES ('232', 'iteny', '192.168.0.185', '1469101001', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('233', 'iteny', '192.168.0.185', '1469101118', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('234', 'iteny', '192.168.0.185', '1469101124', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('235', 'iteny', '192.168.0.185', '1469101131', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除开发日志成功<br/>模块：Intendant,控制器：Site,方法：batchDelVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/version', '1');
INSERT INTO `hm_operate_log` VALUES ('236', 'iteny', '192.168.0.185', '1469101139', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：删除开发日志成功<br/>模块：Intendant,控制器：Site,方法：batchDelVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/version', '1');
INSERT INTO `hm_operate_log` VALUES ('237', 'iteny', '192.168.0.185', '1469102199', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('238', 'iteny', '192.168.0.185', '1469102225', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('239', 'iteny', '192.168.0.185', '1469105526', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('240', 'iteny', '192.168.0.185', '1469106387', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志添加成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion', '1');
INSERT INTO `hm_operate_log` VALUES ('241', 'iteny', '192.168.0.185', '1469106398', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志修改成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion/?id=9', '1');
INSERT INTO `hm_operate_log` VALUES ('242', 'iteny', '192.168.0.185', '1469106408', '局域网', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '提示语：开发日志修改成功<br/>模块：Intendant,控制器：Site,方法：addEditVersion<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditVersion/?id=9', '1');
INSERT INTO `hm_operate_log` VALUES ('243', 'iteny', '192.168.0.185', '1469515449', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('244', 'iteny', '192.168.0.185', '1469527843', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('245', 'iteny', '192.168.0.185', '1469527884', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：菜单排序成功<br/>模块：Intendant,控制器：Site,方法：sortMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/menu', '1');
INSERT INTO `hm_operate_log` VALUES ('246', 'iteny', '192.168.0.185', '1469533136', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('247', 'iteny', '192.168.0.185', '1469533220', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('248', 'iteny', '192.168.0.185', '1469533228', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('249', 'iteny', '192.168.0.185', '1469533280', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('250', 'iteny', '192.168.0.185', '1469533336', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('251', 'iteny', '192.168.0.185', '1469533385', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/loginLog', '1');
INSERT INTO `hm_operate_log` VALUES ('252', 'iteny', '192.168.0.185', '1469536320', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：删除操作日志成功！<br/>模块：Intendant,控制器：Site,方法：delOperateLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/operateLog', '1');
INSERT INTO `hm_operate_log` VALUES ('253', 'iteny', '192.168.0.185', '1469886958', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：POST', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('254', 'iteny', '192.168.0.185', '1469887281', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：POST', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('255', 'iteny', '192.168.0.185', '1469887542', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('256', 'iteny', '192.168.0.185', '1469887617', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('257', 'iteny', '192.168.0.185', '1469887657', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('258', 'iteny', '192.168.0.185', '1469887876', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('259', 'iteny', '192.168.0.185', '1469887897', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('260', 'iteny', '192.168.0.185', '1469888003', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('261', 'iteny', '192.168.0.185', '1469888031', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('262', 'iteny', '192.168.0.185', '1469888094', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('263', 'iteny', '192.168.0.185', '1469888132', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('264', 'iteny', '192.168.0.185', '1469888258', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('265', 'iteny', '192.168.0.185', '1469888263', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('266', 'iteny', '192.168.0.185', '1469888328', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('267', 'iteny', '192.168.0.185', '1469888343', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('268', 'iteny', '192.168.0.185', '1469888523', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('269', 'iteny', '192.168.0.185', '1469888657', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('270', 'iteny', '192.168.0.185', '1469888690', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('271', 'iteny', '192.168.0.185', '1469891098', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('272', 'iteny', '192.168.0.185', '1469891116', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('273', 'iteny', '192.168.0.185', '1469891171', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('274', 'iteny', '192.168.0.185', '1469967745', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('275', 'iteny', '192.168.0.185', '1469967759', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('276', 'iteny', '192.168.0.185', '1469968577', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('277', 'iteny', '192.168.0.185', '1469968636', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('278', 'iteny', '192.168.0.185', '1469969012', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('279', 'iteny', '192.168.0.185', '1470120765', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('280', 'iteny', '192.168.0.185', '1470120773', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('281', 'iteny', '192.168.0.185', '1470121384', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('282', 'iteny', '192.168.0.185', '1470121684', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('283', 'iteny', '192.168.0.185', '1470121999', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('284', 'iteny', '192.168.0.185', '1470122299', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('285', 'iteny', '192.168.0.185', '1470122928', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('286', 'iteny', '192.168.0.185', '1470125104', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('287', 'iteny', '192.168.0.185', '1470125116', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('288', 'iteny', '192.168.0.185', '1470125124', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('289', 'iteny', '192.168.0.185', '1470125131', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('290', 'iteny', '192.168.0.185', '1470125168', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('291', 'iteny', '192.168.0.185', '1470125581', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('292', 'iteny', '192.168.0.185', '1470125665', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('293', 'iteny', '192.168.0.185', '1470129652', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('294', 'iteny', '192.168.0.185', '1470142921', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('295', 'iteny', '192.168.0.185', '1470143564', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('296', 'iteny', '192.168.0.185', '1470143656', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('297', 'iteny', '192.168.0.185', '1470144260', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('298', 'iteny', '192.168.0.185', '1470147203', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('299', 'iteny', '192.168.0.185', '1470147219', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('300', 'iteny', '192.168.0.185', '1470147247', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('301', 'iteny', '192.168.0.185', '1470147316', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('302', 'iteny', '192.168.0.185', '1470147344', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('303', 'iteny', '192.168.0.185', '1470147392', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('304', 'iteny', '192.168.0.185', '1470147425', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('305', 'iteny', '192.168.0.185', '1470147651', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('306', 'iteny', '192.168.0.185', '1470147738', '局域网', 'Chrome/51.0.2704.106 Safari/537.36', '提示语：发送成功20160730-180120.zip<br/>模块：Intendant,控制器：Site,方法：sendFileZip<br/>请求方式：GET', 'http://sina.com/intendant/Site/fileBackup', '1');
INSERT INTO `hm_operate_log` VALUES ('307', 'iteny', '192.168.0.185', '1470485877', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('308', 'iteny', '192.168.0.185', '1470485969', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：授权权限成功<br/>模块：Intendant,控制器：Site,方法：setRole<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/setRole/?id=2&title=%E7%BD%91%E7%BB%9C%E7%AE%A1%E7%90%86', '1');
INSERT INTO `hm_operate_log` VALUES ('309', 'iteny', '192.168.0.185', '1470550292', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：菜单添加成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/addEditMenu', '1');
INSERT INTO `hm_operate_log` VALUES ('310', 'iteny', '192.168.0.185', '1470550801', '局域网', 'Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240', '提示语：修改配置成功<br/>模块：Intendant,控制器：Site,方法：setConfig<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/config', '1');
INSERT INTO `hm_operate_log` VALUES ('311', 'iteny', '192.168.0.185', '1470551440', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：菜单添加成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?pid=125', '1');
INSERT INTO `hm_operate_log` VALUES ('312', 'iteny', '192.168.0.185', '1470560356', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：菜单添加成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?pid=125', '1');
INSERT INTO `hm_operate_log` VALUES ('313', 'iteny', '192.168.0.185', '1470560501', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：密码修改成功,请重新登录<br/>模块：Intendant,控制器：Index,方法：userPass<br/>请求方式：Ajax', 'http://sina.com/intendant/Index/userPass', '1');
INSERT INTO `hm_operate_log` VALUES ('314', 'iteny', '192.168.0.185', '1470560577', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：密码修改成功,请重新登录<br/>模块：Intendant,控制器：Index,方法：userPass<br/>请求方式：Ajax', 'http://sina.com/intendant/Index/userPass', '1');
INSERT INTO `hm_operate_log` VALUES ('315', 'iteny', '192.168.0.185', '1470560691', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：密码修改成功,请重新登录<br/>模块：Intendant,控制器：Index,方法：userPass<br/>请求方式：Ajax', 'http://sina.com/intendant/Index/userPass', '1');
INSERT INTO `hm_operate_log` VALUES ('316', 'iteny', '192.168.0.185', '1470560806', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：密码修改成功,请重新登录<br/>模块：Intendant,控制器：Index,方法：userPass<br/>请求方式：Ajax', 'http://sina.com/intendant/Index/userPass', '1');
INSERT INTO `hm_operate_log` VALUES ('317', 'admin', '192.168.0.185', '1470569306', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：密码修改成功,请重新登录<br/>模块：Intendant,控制器：Index,方法：userPass<br/>请求方式：Ajax', 'http://sina.com/intendant/Index/userPass', '1');
INSERT INTO `hm_operate_log` VALUES ('318', 'admin', '192.168.0.185', '1471184438', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：菜单修改成功<br/>模块：Intendant,控制器：Site,方法：addEditMenu<br/>请求方式：Ajax', 'http://sina.com/Intendant/Site/addEditMenu/?id=127', '1');
INSERT INTO `hm_operate_log` VALUES ('319', 'admin', '192.168.0.185', '1471357450', '局域网', 'Chrome/45.0.2454.101 Safari/537.36', '提示语：删除登录日志成功！<br/>模块：Intendant,控制器：Site,方法：delLoginLog<br/>请求方式：Ajax', 'http://sina.com/intendant/Site/loginLog', '1');

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
INSERT INTO `hm_user` VALUES ('1', 'admin', '阿斯蒂芬', '6a039c29cedd8fe543c4ae8ad73cad01b8ae6c81', 'asdfas@asdf.com', '', '1451132711', '0', '1');
INSERT INTO `hm_user` VALUES ('14', 'hematest', '阿萨德房价', '6f202abf8fa897df414aa16a24d3e8a0da7d89f4', 'sdfas@qq.com', '测试帐号', '1468930375', '192168', '1');

-- ----------------------------
-- Table structure for hm_version
-- ----------------------------
DROP TABLE IF EXISTS `hm_version`;
CREATE TABLE `hm_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开发时间',
  `remark` text NOT NULL,
  `version` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hm_version
-- ----------------------------
INSERT INTO `hm_version` VALUES ('8', '1469105526', '&lt;p&gt;阿萨德发射点发&lt;/p&gt;', '0.0.1');
INSERT INTO `hm_version` VALUES ('7', '1469102225', '&lt;p&gt;* 增加登录日志&lt;/p&gt;&lt;p&gt;* 增加操作日志&lt;/p&gt;', '0.0.2');
INSERT INTO `hm_version` VALUES ('6', '1469102199', '&lt;p&gt;* 增加开发日志&lt;/p&gt;&lt;p&gt;* 增加权限认证&lt;/p&gt;', '0.0.3');
INSERT INTO `hm_version` VALUES ('9', '1469106387', '&lt;p&gt;asdfasdf&amp;nbsp;&lt;/p&gt;', '0.0.4');
SET FOREIGN_KEY_CHECKS=1;
