<?php
return array(
	// 'SHOW_PAGE_TRACE' => true,/*调试模式*/

	/*URL配置信息*/
	'URL_CASE_INSENSITIVE' => true,/*表示URL区分大小写 true则表示不区分大小写*/
	'DEFAULT_C_LAYER' => 'Controller',/*默认的控制器层名称*/
	'MODULE_ALLOW_LIST' => array('Home','Intendant','Wap','Phone'),/*配置你原来的分组列表*/
	'DEFAULT_MODULE' => 'Home',/*默认模块*/
	'MODULE_DENY_LIST' => array('Common','Runtime'),//禁止访问的模块列表
	'URL_MODEL' => 2,/*URL访问模式,可选参数0、1、2、3,代表以下四种模式*/
	// /*后台快捷目录*/
	// 'TMPL_PARSE_STRING' => array(
	// 	'__COMMON__'     => __ROOT__ . '/Public/common/js', //公共js
	// 	'__INTENDANT__' => __ROOT__ . '/Public/intendant', // 后台目录
	// 	'__HOME__' => __ROOT__ . '/Public/home', // 前台目录
	// ),/*设置快捷目录*/
	'DATA_CACHE_TYPE' => 'Redis',
	'MEMCACHE_HOST' => '127.0.0.1',
	'MEMBACHE_PORT' => 6379,
);