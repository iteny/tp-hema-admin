<?php
return array(
	//后台登录帐号锁定
	'USER_STATE_LOCK' => 1,
	//后台登录帐号密码错误几次锁定
	'USER_LOCK_CNT' => 3,
	//密码错误锁定时间
	'USER_LOCK_TIME' => 1800,
	//超级管理员的ID组
	'AUTH_SUPERADMIN' => 2,3,
	//后台菜单ID缓存时间
	'RULE_ID_TIME' => 100,
	//后台菜单缓存时间
	'RULE_MENU_TIME' => 1000,
	//是否开启操作日志true开启，false关闭
	'OPERATE_LOG' => true,
	//后台用户管理缓存时间
	'ADMIN_USER_MANAGE_TIME' => 1000,
	//后台角色管理列表缓存时间
	'ADMIN_ROLE_MANAGE_TIME' => 1000,
	//后台角色授权列表缓存时间
	'ADMIN_ROLE_AUTH_TIME' => 1000,
	//后台数据分页数量
	'ADMIN_PAGE_NUM' => 15,
	//开发日志管理缓存时间
	'ADMIN_VERSION_MANAGE_TIME' => 1000,
	//登录日志管理缓存时间
	'ADMIN_LOGIN_MANAGE_TIME' => 1000,
	//后台缓存配置
	'AUTH_MENU_TIME' => 1, //后台规则菜单缓存时间
	'DATA_CACHE_TYPE' => 'Redis',
    'MEMCACHE_HOST' => '127.0.0.1',
    'MEMBACHE_PORT' => 6379,
    // 'DATA_CACHE_PREFIX' =>  'xfnmc',     // 缓存前缀

);