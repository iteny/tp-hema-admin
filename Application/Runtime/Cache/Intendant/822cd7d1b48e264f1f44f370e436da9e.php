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
	                    <td>超级管理员的ID组:</td>
	                    <td><input type="text" class="input length_5" name="AUTH_SUPERADMIN" value="<?php echo (C("AUTH_SUPERADMIN")); ?>" id="AUTH_SUPERADMIN"></td>
	                </tr>                
	                </tbody>
	            </table>
            </div>
        	<div id="admin-cache">
	            <div class="input-title">后台缓存设置</div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>                
	                <tr>
	                    <td>后台菜单ID缓存时间:</td>
	                    <td><input type="text" class="input length_5" name="RULE_ID_TIME" value="<?php echo (C("RULE_ID_TIME")); ?>" id="RULE_ID_TIME"></td>
	                </tr> 
	                <tr>
	                    <td>后台菜单缓存时间:</td>
	                    <td><input type="text" class="input length_5" name="RULE_MENU_TIME" value="<?php echo (C("RULE_MENU_TIME")); ?>" id="RULE_MENU_TIME"></td>
	                </tr>
	                <tr>
	                    <td>开启操作日志:</td>
	                    <td>
	                    <input type="radio" name="OPERATE_LOG" value="true" data-labelauty="开启" <?php if(C("OPERATE_LOG")== 'true'): ?>checked<?php endif; ?> />
	                    <input type="radio" name="OPERATE_LOG" value="false" data-labelauty="关闭" <?php if(C("OPERATE_LOG")== 'false'): ?>checked<?php endif; ?> /></td>	                    
	                </tr>                
	                </tbody>
	            </table>
            </div>
            <div id="email">
	            <div class="input-title">邮箱设置</div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>                
	                <tr>
	                    <td>菜单名称:</td>
	                    <!-- <td><input type="text" class="input length_5" name="title" value="" id="title"></td> -->
	                </tr>                
	                </tbody>
	            </table>
            </div>
            <div id="backup">
	            <div class="input-title">数据备份设置</div>
	            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
	                <tbody>                
	                <tr>
	                    <td>菜单名称:</td>
	                    <!-- <td><input type="text" class="input length_5" name="title" value="" id="title"></td> -->
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