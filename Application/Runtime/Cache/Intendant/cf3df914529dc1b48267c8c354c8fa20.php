<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title><?php echo ($meta_title); ?>-<?php echo C('WEB_SITE_TITLE');?>后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta name="author" content="<?php echo C('WEB_SITE_TITLE');?>">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="generator" content="HemaCms">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-title" content="<?php echo C('WEB_SITE_TITLE');?>">
    <meta name="format-detection" content="telephone=no,email=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="apple-touch-icon" type="image/x-icon" href="/favicon.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/logo.png">
    <link rel="stylesheet" type="text/css" href="/public/admin/css/frame.css">
    <link rel="stylesheet" type="text/css" href="/public/common/js/poshytip/src/tip-darkgray/tip-darkgray.css">
    <style type="text/css">
    .tip-darkgray{z-index: 99999;}
    </style>
    
    <!-- <link rel="stylesheet" type="text/css" href="__CUI__/css/cui.extend.min.css"> -->
    

    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<?php if(!empty($parent_menu)): ?><div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;<?php if(is_array($parent_menu)): $i = 0; $__LIST__ = $parent_menu;if( count($__LIST__)==0 ) : echo "父菜单获取失败" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i; echo ($menu["title"]); if($i != count($parent_menu)): ?>&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;<?php endif; endforeach; endif; else: echo "父菜单获取失败" ;endif; ?>
</div><?php endif; ?>

<?php if(!empty($tab_nav)): ?><div id="frame-toolbar">
    <ul class="idTabs">
    	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$title): $mod = ($i % 2 );++$i;?><li><a href="#tab<?php echo ($title["id"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;<?php echo ($title["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

        <!-- <li><a href="#admin-cache"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;后台缓存设置</a></li>
        <li><a href="#backup"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;数据备份设置</a></li>
        <li><a href="#email"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;邮箱设置</a></li> -->
    </ul>
</div><?php endif; ?>

<div id="frame-content" style="margin-top:<?php echo ($margin); ?>">
	<?php if(!empty($search)): ?><div class="frame-table-list">
        <div class="input-title">搜索</div>
        <form method="get" action="<?php echo ($search["href"]); ?>">
            <!--<input type="hidden" name="search" value="ok">-->
            <div class="search-content">
            	<?php if($search['status'] == 1): ?>搜索类型：
		            <select class="select_2" name="status" style="width:100px;">
		                <option value='' <?php if($_GET['status'] == ''): ?>selected<?php endif; ?>>不限</option>
		                <option style="color:green" value="1" <?php if($_GET['status'] == '1'): ?>selected<?php endif; ?>>成功</option>
		                <option style="color:red" value="0" <?php if($_GET['status'] == '0'): ?>selected<?php endif; ?>>失败</option>
		            </select><?php endif; ?>
	            <?php if($search['username'] == 1): ?>用户名：<input type="text" class="input length_2" name="username" size='10' value="<?php echo ($_GET["username"]); ?>" placeholder="用户名"><?php endif; ?>
                <?php if($search['ip'] == 1): ?>IP：<input type="text" class="input length_2" name="ip" size='20' value="<?php echo ($_GET["ip"]); ?>" placeholder="IP"><?php endif; ?>
                <?php if($search['time'] == 1): ?>时间：
	                <input type="text" name="start_time" class="input length_2 my-date" value="<?php echo ($_GET["start_time"]); ?>" style="width:140px;">
	                -
	                <input type="text" class="input length_2 my-date" name="end_time" value="<?php echo ($_GET["end_time"]); ?>" style="width:140px;"><?php endif; ?>
                <button class="btn" style="height: 30px;line-height: 30px;padding-bottom: 31px;"><i class="iconfont iconfont_btn">&#xe612;</i>&nbsp;搜索</button>
            </div>
        </form>
    </div><?php endif; ?>
    
    <form name="addEdit" method="post" class="ajax-form" action="<?php echo ($post_url); ?>">
    <input type="hidden" name="<?php echo CONTROLLER_NAME;?>_<?php echo ACTION_NAME;?>" value="1">
    <div class="frame-table-list">
    	<?php if(!empty($tab_nav)): if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div id="tab<?php echo ($vo["id"]); ?>">
	            <div class="input-title"><?php echo ($vo["title"]); ?></div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>
	                <?php if(is_array($vo['me'])): $i = 0; $__LIST__ = $vo['me'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$me): $mod = ($i % 2 );++$i; switch($me["type"]): case "radio": ?><tr>
        <td width="240"><?php echo ($me["title"]); ?>:</td>
        <td>
        <input type="radio" name="<?php echo ($me["key"]); ?>" value="1" data-labelauty="开启" <?php if($me["value"] == 1): ?>checked<?php endif; ?> />
        <input type="radio" name="<?php echo ($me["key"]); ?>" value="0" data-labelauty="关闭" <?php if($me["value"] == 0): ?>checked<?php endif; ?> />&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?></td>    
    </tr><?php break;?>
                            
                            <?php case "select_cnt": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td>
	    <select name="<?php echo ($me["key"]); ?>" class="length_3">              	
	    	<option value="3" <?php if($me["value"] == 3): ?>selected<?php endif; ?>>3次</option>
        	<option value="6" <?php if($me["value"] == 6): ?>selected<?php endif; ?>>6次</option>
        	<option value="10" <?php if($me["value"] == 10): ?>selected<?php endif; ?>>10次</option>
        	<option value="20" <?php if($me["value"] == 20): ?>selected<?php endif; ?>>20次</option>
	    </select>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "select_time": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td>
	    <select name="<?php echo ($me["key"]); ?>" class="length_3">              	
	    	<option value="300" <?php if($me["value"] == 300): ?>selected<?php endif; ?>>5分钟</option>
        	<option value="1800" <?php if($me["value"] == 1800): ?>selected<?php endif; ?>>半小时</option>
        	<option value="3600" <?php if($me["value"] == 3600): ?>selected<?php endif; ?>>1小时</option>
        	<option value="10800" <?php if($me["value"] == 10800): ?>selected<?php endif; ?>>3小时</option>
        	<option value="21600" <?php if($me["value"] == 21600): ?>selected<?php endif; ?>>6小时</option>
        	<option value="43200" <?php if($me["value"] == 43200): ?>selected<?php endif; ?>>12小时</option>
        	<option value="86400" <?php if($me["value"] == 86400): ?>selected<?php endif; ?>>1天</option>
        	<option value="0" <?php if($me["value"] == 0): ?>selected<?php endif; ?>>不过期</option>
	    </select>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "select_page": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td>
	    <select name="<?php echo ($me["key"]); ?>" class="length_3">              	
	    	<option value="5" <?php if($me["value"] == 5): ?>selected<?php endif; ?>>5条</option>
        	<option value="10" <?php if($me["value"] == 10): ?>selected<?php endif; ?>>10条</option>
        	<option value="15" <?php if($me["value"] == 15): ?>selected<?php endif; ?>>15条</option>
        	<option value="20" <?php if($me["value"] == 20): ?>selected<?php endif; ?>>20条</option>
        	<option value="30" <?php if($me["value"] == 30): ?>selected<?php endif; ?>>30条</option>
        	<option value="50" <?php if($me["value"] == 50): ?>selected<?php endif; ?>>50条</option>
        	<option value="100" <?php if($me["value"] == 100): ?>selected<?php endif; ?>>100条</option>
        	<option value="1000" <?php if($me["value"] == 1000): ?>selected<?php endif; ?>>1000条</option>
	    </select>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "select_size": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td>
	    <select name="<?php echo ($me["key"]); ?>" class="length_3">              	
	    	<option value="20971520" <?php if($me["value"] == 20971520): ?>selected<?php endif; ?>>20MB</option>
        	<option value="52428800" <?php if($me["value"] == 52428800): ?>selected<?php endif; ?>>50MB</option>
        	<option value="104857600" <?php if($me["value"] == 104857600): ?>selected<?php endif; ?>>100MB</option> 
	    </select>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "select_level": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td>
	    <select name="<?php echo ($me["key"]); ?>" class="length_3">              	
	    	<option value="9" <?php if($me["value"] == 9): ?>selected<?php endif; ?>>9级</option>
        	<option value="8" <?php if($me["value"] == 8): ?>selected<?php endif; ?>>8级</option>
        	<option value="7" <?php if($me["value"] == 7): ?>selected<?php endif; ?>>7级</option>
        	<option value="6" <?php if($me["value"] == 6): ?>selected<?php endif; ?>>6级</option>
        	<option value="5" <?php if($me["value"] == 5): ?>selected<?php endif; ?>>5级</option>
        	<option value="4" <?php if($me["value"] == 4): ?>selected<?php endif; ?>>4级</option>
        	<option value="3" <?php if($me["value"] == 3): ?>selected<?php endif; ?>>3级</option>
        	<option value="2" <?php if($me["value"] == 2): ?>selected<?php endif; ?>>2级</option>
        	<option value="1" <?php if($me["value"] == 1): ?>selected<?php endif; ?>>1级</option>
	    </select>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "email_smtp": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td>
	    <select name="<?php echo ($me["key"]); ?>" class="length_3">              	
	    	<option value="qq.com" <?php if($me["value"] == "qq.com"): ?>selected<?php endif; ?>>qq邮箱</option>
        	<option value="163.com" <?php if($me["value"] == "163.com"): ?>selected<?php endif; ?>>163邮箱</option>
        	<option value="126.com" <?php if($me["value"] == "126.com"): ?>selected<?php endif; ?>>126邮箱</option>
        	<option value="msn.com" <?php if($me["value"] == "msn.com"): ?>selected<?php endif; ?>>msn邮箱</option>
        	<option value="hotmail.com" <?php if($me["value"] == "hotmail.com"): ?>selected<?php endif; ?>>hotmail邮箱</option>
	    </select>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "email_port": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td>
	    <select name="<?php echo ($me["key"]); ?>" class="length_3">              	
	    	<option value="25" <?php if($me["value"] == 25): ?>selected<?php endif; ?>>25</option>
	    </select>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "text": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td><input type="text" class="input length_4" name="<?php echo ($me["key"]); ?>" value="<?php echo ($me["value"]); ?>" id="<?php echo ($me["key"]); ?>">&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?></td>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "password": ?><tr>
	    <td width="240"><?php echo ($me["title"]); ?>:</td>
	    <td><input type="password" class="input length_4" name="<?php echo ($me["key"]); ?>" value="<?php echo ($me["value"]); ?>" id="<?php echo ($me["key"]); ?>">&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?></td>
	    </td>	                    
	</tr><?php break;?>
                            
                            <?php case "text_btn": ?><tr>
	    <td><?php echo ($me["title"]); ?>:</td>
	    <td><input type="text" class="input length_5" name="<?php echo ($me["key"]); ?>" value="<?php echo ($me["value"]); ?>" id="<?php echo ($me["onclick"]); ?>" readonly="readonly" style="background: #999;border: 1px solid #ededed;" />
	    <a class="btn" style="padding:5px 12px;height: 32px;" onclick="<?php echo ($me["onclick"]); ?>()">选择</a>&nbsp;&nbsp;&nbsp;<?php echo ($me["tip"]); ?>
	    </td>
	</tr><?php break;?>
                            
                            <?php default: endswitch; endforeach; endif; else: echo "" ;endif; ?>
	                </tbody>
	            </table>
            </div><?php endforeach; endif; else: echo "" ;endif; endif; ?>
        <?php if(empty($tab_nav)): ?><div class="input-title"><?php echo ($meta_title); ?></div>
            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
                <tbody>
                    <?php if(is_array($form_tag)): $i = 0; $__LIST__ = $form_tag;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): $mod = ($i % 2 );++$i; switch($tag["type"]): case "text": ?><tr>
	    <td width="140"><?php echo ($tag["title"]); ?>:</td>
	    <td><input type="text" class="input length_4" name="<?php echo ($tag["name"]); ?>" value="<?php echo ($tag["value"]); ?>" id="<?php echo ($tag["name"]); ?>">&nbsp;&nbsp;&nbsp;<?php echo ($tag["tip"]); ?></td>
	</tr><?php break;?>
                        
                        <?php case "textarea": ?><tr>
	    <td width="140"><?php echo ($tag["title"]); ?>:</td>
	    <td><textarea name="<?php echo ($tag["name"]); ?>" rows="2" cols="20" id="<?php echo ($tag["name"]); ?>" class="inputtext" style="height:100px;width:300px;"><?php echo ($tag["value"]); ?></textarea>&nbsp;&nbsp;&nbsp;<?php echo ($tag["tip"]); ?></td>                   
	</tr><?php break;?>
                        
                        <?php case "password": ?><tr>
	    <td width="140"><?php echo ($tag["title"]); ?>:</td>
	    <td><input type="password" class="input length_4" name="<?php echo ($tag["name"]); ?>" value="<?php echo ($tag["value"]); ?>" id="<?php echo ($tag["name"]); ?>">&nbsp;&nbsp;&nbsp;<?php echo ($tag["tip"]); ?></td>
	</tr><?php break;?>
                        
                        <?php case "radio": ?><tr>
        <td width="140"><?php echo ($tag["title"]); ?>:</td>
        <td>
        <?php if($tag["option"] == 'add'): ?><input type="radio" name="<?php echo ($tag["name"]); ?>" value="1" data-labelauty="开启" checked />
	        <input type="radio" name="<?php echo ($tag["name"]); ?>" value="0" data-labelauty="关闭" />&nbsp;&nbsp;&nbsp;<?php echo ($tag["tip"]); ?></td>  
        <?php else: ?>
        	<input type="radio" name="<?php echo ($tag["name"]); ?>" value="1" data-labelauty="开启" <?php if($tag["value"] == 1): ?>checked<?php endif; ?> />
        	<input type="radio" name="<?php echo ($tag["name"]); ?>" value="0" data-labelauty="关闭" <?php if($tag["value"] == 0): ?>checked<?php endif; ?> />&nbsp;&nbsp;&nbsp;<?php echo ($tag["tip"]); ?></td><?php endif; ?>  
    </tr><?php break;?>
                        
                        <?php case "select": ?><tr>
	    <td><?php echo ($tag["title"]); ?>:</td>
	    <td>
	        <select name="<?php echo ($tag["name"]); ?>">
	        	<?php p($tag['option']); ?>
	            <?php if(is_array($tag['option'])): $i = 0; $__LIST__ = $tag['option'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$option): $mod = ($i % 2 );++$i; if($option['id'] != null): ?><option value="<?php echo ($option["id"]); ?>" <?php if($option['id'] == $tag['option']['selectid']): ?>selected<?php endif; ?>><?php echo ($option["title"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
	        </select>
	    </td>
	</tr><?php break;?>
                        
                        <?php default: endswitch; endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table><?php endif; ?>
    </div>
    <div class="frame-table-btn">
        <button class="btn ajax-add" type="submit">确定</button>
        <button class="btn" type="submit" onclick="javascript:history.back(-1);">返回</button>
    </div>
</form>


</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/common.ajax.js"></script>
<script src="/public/common/js/poshytip/src/jquery.poshytip.min.js"></script>

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
// $('#frame-content').style('margin-top','')
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