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

<div id="frame-toolbar">
    <ul class="idTabs">
    	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$title): $mod = ($i % 2 );++$i;?><li><a href="#tab<?php echo ($title["id"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;<?php echo ($title["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

        <!-- <li><a href="#admin-cache"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;后台缓存设置</a></li>
        <li><a href="#backup"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;数据备份设置</a></li>
        <li><a href="#email"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;邮箱设置</a></li> -->
    </ul>
</div>

<div id="frame-content">
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
    
    <form name="setconfig" method="post" class="ajax-form" action="/Intendant/Site/setConfig">
    <input type="hidden" name="setconfig" value="setconfig">
    <div class="frame-table-list">
    	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div id="tab<?php echo ($vo["id"]); ?>">
	            <div class="input-title"><?php echo ($vo["title"]); ?></div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>
	                <?php if(is_array($vo['me'])): $i = 0; $__LIST__ = $vo['me'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$me): $mod = ($i % 2 );++$i;?><tr>
	                    <td width="240">后台登录帐号锁定:</td>
	                    <!-- <td> -->
	                    <!-- <input type="radio" name="USER_STATE_LOCK" value="1" data-labelauty="开启" <?php if(C("USER_STATE_LOCK")== 1): ?>checked<?php endif; ?> />
	                    <input type="radio" name="USER_STATE_LOCK" value="0" data-labelauty="关闭" <?php if(C("USER_STATE_LOCK")== 0): ?>checked<?php endif; ?> /></td>     -->
	                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
	                </tbody>
	            </table>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
    <div class="frame-table-btn">
        <button class="btn ajax-add" type="submit">修改配置</button>
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