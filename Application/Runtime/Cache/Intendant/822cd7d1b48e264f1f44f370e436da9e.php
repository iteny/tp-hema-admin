<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>系统配置</title>
	<link href="/public/admin/css/frame.css" rel="stylesheet">
	
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;站长设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;系统配置
</div>	
<div id="frame-toolbar">
    <ul class="idTabs">
    	<li><a href="#website"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;站长设置</a></li>
        <li><a href="#admin-cache"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;后台缓存设置</a></li>
        <li><a href="#backup"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;数据备份设置</a></li>
        <li><a href="#email"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;邮箱设置</a></li>
    </ul>
</div>
<div id="frame-content">
	<form name="setconfig" method="post" class="ajax-form" action="/Intendant/Site/setConfig">
        <input type="hidden" name="setconfig" value="setconfig">
        <div class="frame-table-list">
        	<div id="website">
	            <div class="input-title">站长设置</div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>
	                <tr>
	                    <td width="240">后台登录帐号锁定:</td>
	                    <td>
	                    <input type="radio" name="USER_STATE_LOCK" value="1" data-labelauty="开启" <?php if(C("USER_STATE_LOCK")== 1): ?>checked<?php endif; ?> />
	                    <input type="radio" name="USER_STATE_LOCK" value="0" data-labelauty="关闭" <?php if(C("USER_STATE_LOCK")== 0): ?>checked<?php endif; ?> /></td>    
	                </tr>  
	                <tr>
	                    <td width="240">后台登录帐号密码错误几次锁定:</td>
	                    <td>
	                    <select name="USER_LOCK_CNT" class="length_3">              	
	                    	<option value="3" <?php if(C("USER_LOCK_CNT")== 3): ?>selected<?php endif; ?>>3次</option>
	                    	<option value="6" <?php if(C("USER_LOCK_CNT")== 6): ?>selected<?php endif; ?>>6次</option>
	                    	<option value="10" <?php if(C("USER_LOCK_CNT")== 10): ?>selected<?php endif; ?>>10次</option>
	                    	<option value="20" <?php if(C("USER_LOCK_CNT")== 20): ?>selected<?php endif; ?>>20次</option>      	
	                    </select>
	                    </td>	                    
	                </tr>  
	                <tr>
	                    <td width="240">密码错误锁定时间:</td>
	                    <td>
	                    <select name="USER_LOCK_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("USER_LOCK_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("USER_LOCK_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("USER_LOCK_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("USER_LOCK_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("USER_LOCK_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("USER_LOCK_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("USER_LOCK_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("USER_LOCK_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>
	                </tr> 
	                <tr>
	                    <td width="240">开启操作日志:</td>
	                    <td>
	                    <input type="radio" name="OPERATE_LOG" value="true" data-labelauty="开启" <?php if(C("OPERATE_LOG")== 'true'): ?>checked<?php endif; ?> />
	                    <input type="radio" name="OPERATE_LOG" value="false" data-labelauty="关闭" <?php if(C("OPERATE_LOG")== 'false'): ?>checked<?php endif; ?> /></td>    
	                </tr>               
	                <tr>
	                    <td>超级管理员的ID组:</td>
	                    <td><input type="text" class="input length_5" name="AUTH_SUPERADMIN" value="<?php echo (C("AUTH_SUPERADMIN")); ?>" id="user_ids" readonly="readonly" style="background: #999;border: 1px solid #ededed;" />
	                    <a class="btn" style="padding:5px 12px;height: 32px;" onclick="Admin_User_Ids()">选择用户为超管</a>
	                    </td>
	                </tr>                
	                </tbody>
	            </table>
            </div>
        	<div id="admin-cache">
	            <div class="input-title">后台缓存设置</div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody> 
	                <tr>
	                    <td width="240">后台数据分页数量:</td>
	                    <td>
	                    <select name="ADMIN_PAGE_NUM" class="length_3">              	
	                    	<option value="5" <?php if(C("ADMIN_PAGE_NUM")== 5): ?>selected<?php endif; ?>>5条</option>
	                    	<option value="10" <?php if(C("ADMIN_PAGE_NUM")== 10): ?>selected<?php endif; ?>>10条</option>
	                    	<option value="15" <?php if(C("ADMIN_PAGE_NUM")== 15): ?>selected<?php endif; ?>>15条</option>
	                    	<option value="20" <?php if(C("ADMIN_PAGE_NUM")== 20): ?>selected<?php endif; ?>>20条</option>
	                    	<option value="30" <?php if(C("ADMIN_PAGE_NUM")== 30): ?>selected<?php endif; ?>>30条</option>
	                    	<option value="50" <?php if(C("ADMIN_PAGE_NUM")== 50): ?>selected<?php endif; ?>>50条</option>
	                    	<option value="100" <?php if(C("ADMIN_PAGE_NUM")== 100): ?>selected<?php endif; ?>>100条</option>
	                    	<option value="1000" <?php if(C("ADMIN_PAGE_NUM")== 1000): ?>selected<?php endif; ?>>1000条</option>
	                    </select>
	                    </td>	                    
	                </tr>               
	                <tr>
	                    <td width="240">后台菜单ID缓存时间:</td>
	                    <td>
	                    <select name="RULE_ID_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("RULE_ID_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("RULE_ID_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("RULE_ID_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("RULE_ID_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("RULE_ID_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("RULE_ID_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("RULE_ID_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("RULE_ID_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>
	                </tr> 
	                <tr>
	                    <td width="240">后台菜单缓存时间:</td>
	                    <td>
	                    <select name="RULE_MENU_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("RULE_MENU_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("RULE_MENU_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("RULE_MENU_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("RULE_MENU_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("RULE_MENU_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("RULE_MENU_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("RULE_MENU_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("RULE_MENU_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr>
	                <tr>
	                    <td width="240">后台用户管理缓存时间:</td>
	                    <td>
	                    <select name="ADMIN_USER_MANAGE_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("ADMIN_USER_MANAGE_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("ADMIN_USER_MANAGE_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("ADMIN_USER_MANAGE_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("ADMIN_USER_MANAGE_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("ADMIN_USER_MANAGE_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_USER_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_USER_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("ADMIN_USER_MANAGE_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr>
	                <tr>
	                    <td width="240">后台角色管理列表缓存时间:</td>
	                    <td>
	                    <select name="ADMIN_ROLE_MANAGE_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("ADMIN_ROLE_MANAGE_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr>  
	                <tr>
	                    <td width="240">后台角色授权列表缓存时间:</td>
	                    <td>
	                    <select name="ADMIN_ROLE_AUTH_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("ADMIN_ROLE_AUTH_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr>  
	                <tr>
	                    <td width="240">开发日志管理缓存时间:</td>
	                    <td>
	                    <select name="ADMIN_VERSION_MANAGE_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("ADMIN_VERSION_MANAGE_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr> 
	                <tr>
	                    <td width="240">登录日志管理缓存时间:</td>
	                    <td>
	                    <select name="ADMIN_LOGIN_MANAGE_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("ADMIN_LOGIN_MANAGE_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr>  
	                <tr>
	                    <td width="240">操作日志管理缓存时间:</td>
	                    <td>
	                    <select name="ADMIN_OPERATE_MANAGE_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("ADMIN_OPERATE_MANAGE_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr> 
	                <tr>
	                    <td width="240">后台规则菜单缓存时间:</td>
	                    <td>
	                    <select name="AUTH_MENU_TIME" class="length_3">                	
	                    	<option value="300" <?php if(C("AUTH_MENU_TIME")== 300): ?>selected<?php endif; ?>>5分钟</option>
	                    	<option value="1800" <?php if(C("AUTH_MENU_TIME")== 1800): ?>selected<?php endif; ?>>半小时</option>
	                    	<option value="3600" <?php if(C("AUTH_MENU_TIME")== 3600): ?>selected<?php endif; ?>>1小时</option>
	                    	<option value="10800" <?php if(C("AUTH_MENU_TIME")== 10800): ?>selected<?php endif; ?>>3小时</option>
	                    	<option value="21600" <?php if(C("AUTH_MENU_TIME")== 21600): ?>selected<?php endif; ?>>6小时</option>
	                    	<option value="43200" <?php if(C("AUTH_MENU_TIME")== 43200): ?>selected<?php endif; ?>>12小时</option>
	                    	<option value="43200" <?php if(C("AUTH_MENU_TIME")== 43200): ?>selected<?php endif; ?>>1天</option>
	                    	<option value="0" <?php if(C("AUTH_MENU_TIME")== 0): ?>selected<?php endif; ?>>不过期</option>
	                    </select>
	                    </td>	                    
	                </tr>            
	                </tbody>
	            </table>
            </div>
            <div id="email">
	            <div class="input-title">邮箱设置</div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>                
	                <tr>
	                    <td width="240">使用那家的邮箱:</td>
	                    <td>
	                    <select name="YOUR_EMAIL_SMTP" class="length_3">               	
	                    	<option value="qq.com" <?php if(C("YOUR_EMAIL_SMTP")== "qq.com"): ?>selected<?php endif; ?>>qq邮箱</option>
	                    	<option value="163.com" <?php if(C("YOUR_EMAIL_SMTP")== "163.com"): ?>selected<?php endif; ?>>163邮箱</option>
	                    	<option value="126.com" <?php if(C("YOUR_EMAIL_SMTP")== "126.com"): ?>selected<?php endif; ?>>126邮箱</option>
	                    	<option value="msn.com" <?php if(C("YOUR_EMAIL_SMTP")== "msn.com"): ?>selected<?php endif; ?>>msn邮箱</option>
	                    	<option value="hotmail.com" <?php if(C("YOUR_EMAIL_SMTP")== "hotmail.com"): ?>selected<?php endif; ?>>hotmail邮箱</option>
	                    </select>
	                    </td>
	                </tr>
	                <tr>
	                    <td width="240">邮箱端口:</td>
	                    <td>
	                    <select name="YOUR_EMAIL_PORT" class="length_3">               	
	                    	<option value="25" <?php if(C("YOUR_EMAIL_PORT")== 25): ?>selected<?php endif; ?>>25</option>
	                    </select>
	                    </td>
	                </tr>
	                <tr>
	                    <td width="240">邮箱地址:</td>
	                    <td><input type="text" class="input length_4" name="YOUR_EMAIL" value="<?php echo (C("YOUR_EMAIL")); ?>" id="YOUR_EMAIL">&nbsp;&nbsp;&nbsp;只需要填写邮箱帐号,@163.com这部分不需要填写</td>
	                </tr>   
	                <tr>
	                    <td width="240">邮箱密码:</td>
	                    <td><input type="password" class="input length_4" name="YOUR_EMAIL_PWD" value="<?php echo (C("YOUR_EMAIL_PWD")); ?>" id="YOUR_EMAIL_PWD"></td>
	                </tr>                 
	                </tbody>
	            </table>
            </div>
            <div id="backup">
	            <div class="input-title">数据备份设置</div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>
	                <tr>
	                    <td width="240">是否启用数据压缩:</td>
	                    <td>
	                    <input type="radio" name="DATA_BACKUP_COMPRESS" value="1" data-labelauty="启用压缩" <?php if(C("DATA_BACKUP_COMPRESS")== 1): ?>checked<?php endif; ?> />
	                    <input type="radio" name="DATA_BACKUP_COMPRESS" value="0" data-labelauty="不压缩" <?php if(C("DATA_BACKUP_COMPRESS")== 0): ?>checked<?php endif; ?> />&nbsp;&nbsp;&nbsp;0:不压缩1:启用压缩</td>    
	                </tr>                
	                <tr>
	                    <td>数据库备份卷大小:</td>
	                    <td>
	                    <select name="DATA_BACKUP_PART_SIZE" class="length_3">                	
	                    	<option value="20971520" <?php if(C("DATA_BACKUP_PART_SIZE")== 20971520): ?>selected<?php endif; ?>>20MB</option>
	                    	<option value="52428800" <?php if(C("DATA_BACKUP_PART_SIZE")== 52428800): ?>selected<?php endif; ?>>50MB</option>
	                    	<option value="104857600" <?php if(C("DATA_BACKUP_PART_SIZE")== 104857600): ?>selected<?php endif; ?>>100MB</option>                    	
	                    </select>&nbsp;&nbsp;&nbsp;该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M
	                    </td>	
	                </tr> 
	                <tr>
	                    <td width="240">备份文件压缩级别:</td>
	                    <td>
	                    <select name="DATA_BACKUP_COMPRESS_LEVEL" class="length_3">                	
	                    	<option value="9" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 9): ?>selected<?php endif; ?>>9级</option>
	                    	<option value="8" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 8): ?>selected<?php endif; ?>>8级</option>
	                    	<option value="7" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 7): ?>selected<?php endif; ?>>7级</option>
	                    	<option value="6" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 6): ?>selected<?php endif; ?>>6级</option>
	                    	<option value="5" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 5): ?>selected<?php endif; ?>>5级</option>
	                    	<option value="4" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 4): ?>selected<?php endif; ?>>4级</option>
	                    	<option value="3" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 3): ?>selected<?php endif; ?>>3级</option>
	                    	<option value="2" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 2): ?>selected<?php endif; ?>>2级</option>
	                    	<option value="1" <?php if(C("DATA_BACKUP_COMPRESS_LEVEL")== 1): ?>selected<?php endif; ?>>1级</option>
	                    </select>
	                    </td>	                    
	                </tr>                
	                </tbody>
	            </table>
            </div>
        </div>
        <div class="frame-table-btn">
            <button class="btn ajax-add" type="submit">修改配置</button>
        </div>
    </form>
</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/jquery.validate.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/common.ajax.js"></script>
<script src="/public/common/js/poshytip/src/jquery.poshytip.min.js"></script>
<script src="/public/common/js/jquery.idTabs.min.js"></script>
<script src="/public/common/js/radio/source/jquery-labelauty.js"></script>
<link href="/public/common/js/radio/source/jquery-labelauty.css" rel="stylesheet"></link>
<script type="text/javascript">
var configmanage = '/Intendant/Site/config';
//添加超管ID组
	function Admin_User_Ids(){
		// e.preventDefault();
		//添加相关文章
		layer.open({
		  title:'选择用户为超管',
		  type: 2,
		  offset: 'rb',
		  area: ['700px', '100%'],
		  fix: false, //不固定
		  maxmin: true,
		  btn: '关闭',
		  content: '/Intendant/SiteCom/userIds',
		});
	}
$(function(){
	$(":radio").labelauty();
	
    jQuery.validator.addMethod("chinaese", function(value, element) {
        var chinaese = /^[\u4e00-\u9fa5]+$/;
        return this.optional(element) || (chinaese.test(value));
    }, "请输入中文");
    jQuery.validator.addMethod("english", function(value, element) {
        var english = /^[A-Za-z]+$/;
        return this.optional(element) || (english.test(value));
    }, "请输入英文字符串");
    $('form[name=setconfig]').validate({
        errorElement : 'span',
        validClass: "success",	//非常重要
        success : function (label) {
            label.addClass('success');
        },
        rules : {
            // title : {
            //     required : true,
            //     chinaese : true,
            //     remote : {
            //         url : checkAddMTit,
            //         type : 'post',
            //         dataType : 'json',
            //         data : {
            //             name : function(){
            //                 return $('#title').val();
            //             }
            //         }
            //     }
            // },
            // name : {
            //     required : true,
            //     remote : {
            //      url : checkAddMname,
            //      type : 'post',
            //      dataType : 'json',
            //      data : {
            //        name : function(){
            //          return $('#name').val();
            //        }
            //      }
            //     }
            // },
            // pid : {
            //     required : true,
            //     digits : true
            // },
            // sort : {
            //     required : true,
            //     digits : true
            // }
        },
        messages : {
            // title : {
            //     required : "请输入菜单名称",
            //     remote : '菜单名称已存在'
            // },
            // name : {
            //     required : "请输入控制器/方法",
            //     remote : '控制器/方法已存在'
            // },
            // pid : {
            //     required : "请输入父ID",
            //     digits : '请输入整数'
            // },
            // sort : {
            //     required : "请输入排序号",
            //     digits : '请输入整数'
            // }
        },
        submitHandler: function(form)
        {
            if($('button.btn').attr("disabledSubmit")){
                $('button.btn').text('请勿重复提交...').prop('disabled', true).addClass('disabled');
                return false;
            }
            $('button.btn').attr("disabledSubmit",true);
            var param = $('form[name=setconfig]').serialize();
            $.ajax({
                url: $('form[name=setconfig]').attr('action'),
                dataType:'json',
                type:'POST',
                data:param,
                beforeSend: function(){
                    myload = layer.load(0,{time:3*1000});
                },
                success: function(data) {
                    layer.close(layer.load(1));
                    if (data.status == true) {
                    	admin.countdown(3);
                        admin.alert('操作提示', data.info+'<div>程序将在<b style="color:red;" id="second_show">03秒</b>后为你跳转！</div>', 1, '3000');
                        setTimeout(function () {
                            window.location.href = configmanage;
                        }, 3000);                            
                    }else{
                        admin.alert('操作提示',''+data.info,2,'8000');
                        $('button.btn').text('添加').removeProp('disabled').removeClass('disabled');
                        $('button.btn').attr("disabledSubmit",'');
                    }
                },
                error: function(data){
                    layer.close(layer.load(1));
                    admin.alert('提示信息',data.responseText,1,'3000');
                }
            });
        }
    });
});
</script>
</html>