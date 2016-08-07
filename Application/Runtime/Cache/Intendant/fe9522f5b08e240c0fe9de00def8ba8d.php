<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改密码</title>
	<link href="/public/admin/css/frame.css" rel="stylesheet">
	<style>
	input:focus {background: none;}
	</style>	
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;用户中心&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;用户操作&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;修改密码
</div>	
<div id="frame-content" style="margin-top:32px;">
    <form name="userPass" method="post" class="J_ajaxForm" action="/Intendant/Index/userPass" novalidate="novalidate">
        <input type="hidden" name="userPass" value="userPass">
        <div class="frame-table-list">
            <div class="input-title">修改密码</div>
            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
                <tbody>
                <tr>
                    <td width="140">用户名:</td>
                    <td><?php echo (session('admin_user')); ?></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input type="password" class="input length_5" name="password" id="password" value=""></td>
                </tr>
                <tr>
                    <td>确认密码:</td>
                    <td><input type="password" class="input length_5" name="passworded" id="passworded" value=""></td>
                </tr>                
                </tbody>
            </table>
        </div>
        <div class="frame-table-btn">
            <button class="btn ajax-add" type="submit">修改</button>
        </div>
    </form>
</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/jquery.validate.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script>
var loginurl = '/Intendant/Login/index';
    $(function(){    	
        jQuery.validator.addMethod("chinaese", function(value, element) {
            var chinaese = /^[\u4e00-\u9fa5]+$/;
            return this.optional(element) || (chinaese.test(value));
        }, "请输入中文");
        jQuery.validator.addMethod("english", function(value, element) {
            var english = /^[A-Za-z]+$/;
            return this.optional(element) || (english.test(value));
        }, "请输入英文字符串");
        jQuery.validator.addMethod("username", function(value, element) {
            var tel = /^[a-zA-Z][\w]{4,16}$/;
            return this.optional(element) || (tel.test(value));
        }, "以字母开头,5-17 字母、数字、下划线'_'");
        jQuery.validator.addMethod("password", function(value, element) {
            var tel = /^[a-zA-Z][\w]{7,16}$/;
            return this.optional(element) || (tel.test(value));
        }, "以字母开头,8-17 字母、数字、下划线'_'");
        $('form[name=userPass]').validate({
            errorElement : 'span',
            validClass: "success",	//非常重要
            success : function (label) {
                label.addClass('success');
            },
            rules : {
                password : {
                   // required : true,
                   password : true
                },
                passworded : {
                   // required : true,
                   equalTo : "#password"
                },
            },
            messages : {
                password : {
                    // required : "请输入密码"
                },
                passworded : {
                    // required : '请确认密码',
                    equalTo : '两次密码不一致'
                },
            },
            submitHandler: function(form)
            {
                if($('button.btn').attr("disabledSubmit")){
                    $('button.btn').text('请勿重复提交...').prop('disabled', true).addClass('disabled');
                    return false;
                }
                $('button.btn').attr("disabledSubmit",true);
                var param = $('form[name=userPass]').serialize();
                $.ajax({
                    url: $('form[name=userPass]').attr('action'),
                    dataType:'json',
                    type:'POST',
                    data:param,
                    beforeSend: function(){
                        myload = layer.load(0,{time:3*1000});
                    },
                    success: function(data) {
                        layer.close(layer.load(1));
                        if (!data.status) {
                            admin.alert('操作提示',''+data.info,2,'8000');
                            $('button.btn').text('添加').removeProp('disabled').removeClass('disabled');
                            $('button.btn').attr("disabledSubmit",'');
                        }else{
                            admin.countdown(3);
                            admin.alert('操作提示', '修改密码成功!'+'<div>程序将在<b style="color:red;" id="second_show">03秒</b>后为你跳转！</div>', 1, '3000');
                            setTimeout(function () {
                                window.top.location.href = loginurl;
                            }, 3000);
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