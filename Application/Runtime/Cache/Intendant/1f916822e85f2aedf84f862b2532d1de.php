<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改菜单</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;站长设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;菜单设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;修改菜单(<?php echo ($rule["title"]); ?>)
</div>
<div id="frame-toolbar">
    <ul>
        <li><a href="/intendant/Site/menu"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;菜单设置</a></li>
        <li><a href="/intendant/Site/addEditMenu"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;添加菜单</a></li>
    </ul>
</div>
<div id="frame-content">
    <form name="editMenu" method="post" class="J_ajaxForm" action="/intendant/Site/addEditMenu" novalidate="novalidate">
        <input type="hidden" name="addEditMenu" value="addEditMenu">
        <input type="hidden" name="id" value="<?php echo ($rule["id"]); ?>">
        <div class="frame-table-list">
            <div class="input-title">修改菜单</div>
            <table cellpadding="0" cellspacing="0" class="table_form" width="100%">
                <tbody>
                <tr>
                    <td width="140">上级菜单:</td>
                    <td>
                        <select name="pid" class="length_5">
                        <option value="0" <?php if($parentid == 0): ?>selected<?php endif; ?>>顶级菜单</option>
	                  <?php if(is_array($selectMenu)): $i = 0; $__LIST__ = $selectMenu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>" <?php if($vo["id"] == $rule["pid"]): ?>selected<?php endif; ?>><?php echo str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;',$vo['level']); if($vo["level"] > 0): ?>├─<?php endif; echo ($vo["html"]); echo ($vo["title"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </td>
                </tr>
                <tr>
                    <td>菜单名称:</td>
                    <td><input type="text" class="input length_5" name="title" value="<?php echo ($rule["title"]); ?>" id="title"></td>
                </tr>
                <tr>
                    <td>控制器/方法:</td>
                    <td><input type="text" class="input length_5" name="name" id="name" value="<?php echo ($rule["name"]); ?>"></td>
                </tr>
                <tr>
                    <td>条件:</td>
                    <td><input type="text" class="input length_5" name="condition" id="condition" value="<?php echo ($rule["condition"]); ?>"></td>
                </tr>
                <tr>
                    <td>菜单排序:</td>
                    <td><input type="text" class="input length_5" name="sort" id="sort" value="<?php echo ($rule["sort"]); ?>"></td>
                </tr>
                <tr>
                    <td>菜单图标：</td>
                    <td>
                        <input id="System_Menu_icons_input" name="icon" type="hidden" value="<?php echo ($rule["icon"]); ?>">
                        <strong id="System_Menu_icons" style="margin-right: 10px;"><i style='color: #666;font-size: 16px;' class='iconfont'><?php echo ($rule["icon"]); ?></i></span></strong>
                        <a class="btn" onclick="Show_System_Menu_icons()">选择图标</a>
                    </td>
                </tr>
                <tr>
                    <td>是否显示:</td>
                    <td><select name="isshow" class="input length_2">
                        <option value="1" <?php if($rule['isshow'] == 1): ?>select<?php endif; ?>>显示</option>
                        <option value="0" <?php if($rule['isshow'] == 0): ?>select<?php endif; ?>>不显示</option>
                    </select>&nbsp;&nbsp;&nbsp;是否显示菜单在后台管理页面上</td>
                </tr>
				<tr>
                    <td>类型:</td>
                    <td><select name="type" class="input length_2">
                        <option value="1" <?php if($rule['type'] == 1): ?>select<?php endif; ?>>开启</option>
                        <option value="0" <?php if($rule['type'] == 0): ?>select<?php endif; ?>>关闭</option>
                    </select>&nbsp;&nbsp;&nbsp;
                    如果状态开启， 条件字段就可以定义规则表达式。 如定义{score}>5  and {score}<100  表示用户的分数在5-100之间时这条规则才会通过。</td>
                </tr>
                <tr>
                    <td>状态:</td>
                    <td><select name="status" class="input length_2">
                        <option value="1" <?php if($rule['status'] == 1): ?>select<?php endif; ?>>开启</option>
                        <option value="0" <?php if($rule['status'] == 0): ?>select<?php endif; ?>>关闭</option>
                    </select>&nbsp;&nbsp;&nbsp;条件表达式，关闭表示存在就验证，开启表示按照条件验证</td>
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
<script type="text/javascript">
    var menumanage = '/intendant/Site/menu';
    var iconPach = '/intendant/SiteCom/iconsCls';
    var checkEditMTit = '/intendant/SiteCom/checkEditMTit/?id=<?php echo ($rule["id"]); ?>';
    var checkEditMname = '/intendant/SiteCom/checkEditMname/?id=<?php echo ($rule["id"]); ?>';
</script>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/jquery.validate.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script>
    function Select_System_Menu_icons(icon){
        $("#System_Menu_icons").html('<i class="iconfont">'+icon+'</i>');
        $("#System_Menu_icons_input").val(icon);
        layer.closeAll();
    }
    function Show_System_Menu_icons(){
        layer.open({
            type: 1,
            title: '请选择菜单图标',
            shadeClose: true,
            shade: 0.8,
            offset: '100px',
            area: ['480px', '500px'],
            content: '正在加载图标中...' //iframe的url
        });
        $.post(iconPach,"",function(data){
            if(typeof data == 'object'){
                var content = [];
                for(x in data){
                    content[x] = "<a style='color: #666;font-size: 16px;cursor: pointer' class='iconfont' onclick=\"Select_System_Menu_icons('"+data[x]+"')\" style='cursor:pointer;'>"+data[x]+"</a>";
                }
                var ss = '<div style="padding:10px">';
                ss += content;
                ss += '</div>';
                $('.layui-layer-content').html("<div style='padding:10px;'>"+content.join(" ")+"</div>");
            } else {
                $('.layui-layer-content').html("<div style='padding:10px;color: #FFD700;'>图标加载失败，请联系管理员！</div>");
            }
        },'json').error(function(){
            $('.layui-layer-content').html("<div style='padding:10px;color: #FFD700;'>图标加载失败，请联系管理员！3秒后自动关闭...</div>");
        });

    }
    $(function(){
        jQuery.validator.addMethod("chinaese", function(value, element) {
            var chinaese = /^[\u4e00-\u9fa5]+$/;
            return this.optional(element) || (chinaese.test(value));
        }, "请输入中文");
        jQuery.validator.addMethod("english", function(value, element) {
            var english = /^[A-Za-z]+$/;
            return this.optional(element) || (english.test(value));
        }, "请输入英文字符串");
        $('form[name=editMenu]').validate({
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
                        url : checkEditMTit,
                        type : 'post',
                        dataType : 'json',
                        data : {
                            name : function(){
                                return $('#title').val();
                            }
                        }
                    }
                },
                name : {
                    required : true,
                    remote : {
                     url : checkEditMname,
                     type : 'post',
                     dataType : 'json',
                     data : {
                       name : function(){
                         return $('#name').val();
                       }
                     }
                    }
                },
                pid : {
                    required : true,
                    digits : true
                },
                sort : {
                    required : true,
                    digits : true
                }
            },
            messages : {
                title : {
                    required : "请输入菜单名称",
                    remote : '菜单名称已存在'
                },
                name : {
                    required : "请输入控制器/方法",
                    remote : '控制器/方法已存在'
                },
                pid : {
                    required : "请输入父ID",
                    digits : '请输入整数'
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
                var param = $('form[name=editMenu]').serialize();
                $.ajax({
                    url: $('form[name=editMenu]').attr('action'),
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
                                window.location.href = menumanage;
                            }, 3000);                            
                        }else{
                            admin.alert('操作提示',''+data.info,2,'8000');
                            $('button.btn').text('修改').removeProp('disabled').removeClass('disabled');
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