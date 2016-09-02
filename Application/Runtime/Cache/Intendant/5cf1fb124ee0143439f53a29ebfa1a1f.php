<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加角色</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;用户设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;角色管理&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;添加角色
</div>
<div id="frame-toolbar">
    <ul>
        <li><a href="/Intendant/Site/role"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;角色管理</a></li>
        <li><a class="active" href="/Intendant/Site/addEditRole"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;添加角色</a></li>
    </ul>
</div>
<div id="frame-content">
    <form name="addRole" method="post" class="J_ajaxForm" action="/Intendant/Site/addEditRole" novalidate="novalidate">
        <input type="hidden" name="addEditRole" value="addEditRole">
        <div class="frame-table-list">
            <div class="input-title">添加角色</div>
            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
                <tbody>
                <tr>
                    <td width="140">角色名称:</td>
                    <td><input type="text" class="input length_5" name="title" value="" id="title"></td>
                </tr>
                <tr>
                    <td>角色排序:</td>
                    <td><input type="text" class="input length_5" name="sort" id="sort" value="1"></td>
                </tr>
                <tr>
                    <td>备注:</td>
                    <td><textarea name="remark" rows="2" cols="20" id="remark" class="inputtext" style="height:100px;width:300px;"></textarea></td>
                </tr>                
                <tr>
                    <td>是否启用:</td>
                    <td><input class="chk-none" type="radio" name="status" value="1" checked>启用<label>  &nbsp;&nbsp;&nbsp;&nbsp;<input class="chk-none" type="radio" name="status" value="0">禁止</label></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="frame-table-btn">
            <button class="btn ajax-add" type="submit">添加</button>
        </div>
    </form>
</div>
</body>
<script>
    var rolemanage = '/Intendant/Site/role';
    var checkAddRtitle = '/Intendant/SiteCom/checkAddRtitle';
</script>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/jquery.validate.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script>
    $(function(){
        jQuery.validator.addMethod("chinaese", function(value, element) {
            var chinaese = /^[\u4e00-\u9fa5]+$/;
            return this.optional(element) || (chinaese.test(value));
        }, "请输入中文");
        jQuery.validator.addMethod("english", function(value, element) {
            var english = /^[A-Za-z]+$/;
            return this.optional(element) || (english.test(value));
        }, "请输入英文字符串");
        $('form[name=addRole]').validate({
            errorElement : 'span',
            validClass: "success",	//非常重要
            success : function (label) {
                label.addClass('success');
            },
            rules : {
                title : {
                    required : true,
                    chinaese : true,
                    remote : {
                        url : checkAddRtitle,
                        type : 'post',
                        dataType : 'json',
                        data : {
                            name : function(){
                                return $('#title').val();
                            }
                        }
                    }
                },                
                sort : {
                    required : true,
                    digits : true
                }
            },
            messages : {
                title : {
                    required : "请输入角色名称",
                    remote : '角色名称已存在'
                },                
                sort : {
                    required : "请输入排序号",
                    digits : '请输入整数'
                }
            },
            submitHandler: function(form)
            {
                if($('button.btn').attr("disabledSubmit")){
                    $('button.btn').text('请勿重复提交...').prop('disabled', true).addClass('disabled');
                    return false;
                }
                $('button.btn').attr("disabledSubmit",true);
                var param = $('form[name=addRole]').serialize();
                $.ajax({
                    url: $('form[name=addRole]').attr('action'),
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
                            admin.alert('操作提示', '添加角色成功!'+'<div>程序将在<b style="color:red;" id="second_show">03秒</b>后为你跳转！</div>', 1, '3000');
                            setTimeout(function () {
                                window.location.href = rolemanage;
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