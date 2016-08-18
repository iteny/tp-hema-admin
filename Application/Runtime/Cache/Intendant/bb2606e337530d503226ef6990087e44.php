<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登录</title>
   <link rel="stylesheet" href="/public/admin/css/login.css">

</head>
<body onkeydown="keyLogin();">
<div id="container">
    <div id="login-logo">
        <h1 class="login-logo-image">后台登录</h1>   
           
</form>
    </div>
    <form method="post" action="/intendant/login/index" id="form-login" >
        <ul class="inputs black-input large">
            <!-- The autocomplete="off" attributes is the only way to prevent webkit browsers from filling the inputs with yellow -->
            
            <li id="userli"><i class="iconfont" style="color:white;font-size: 18px;margin-right: 10px;">&#xe600;</i><input type="text" name="username" id="username" value="" class="input-unstyled" placeholder="用户名" autocomplete="off" disabled></li>
            <li id="passli"><i class="iconfont" style="color:white;font-size: 18px;margin-right: 10px;">&#xe601;</i><input type="password" name="password" id="password" value="" class="input-unstyled" placeholder="密码" autocomplete="off" disabled></li>
            <li id="verifyli"><i class="iconfont" style="color:white;font-size: 18px;margin-right: 10px;">&#xe602;</i><input style="width:120px" type="text" name="verify" id="verify" value="" class="input-unstyled" placeholder="验证码" autocomplete="off">
                <div class="yanzhengma_box" id="verifyshow"><img class="yanzheng_img" id="code_img" src="<?php echo U('Login/verify');?>"  width="130" height="58" onclick="refreshs()"></div>
            </li>
        </ul>

        <button type="submit" class="button glossy full-width huge" id="loginsubmit">登录</button>
    </form>
</div>
</body>
<script>
 var verifycode = "<?php echo U('Login/verify');?>";
 var link = "<?php echo U('Login/index');?>";
 var redirect= "<?php echo U('Index/index');?>";
</script>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/login.js"></script>
<style>
    .layui-layer-tips .layui-layer-content{
        font-family: "Microsoft YaHei",SimSun,'\5b8b\4f53',sans-serif;
        padding: 20px 5px;
        line-height: 24px;
        font-size: 24px;
        font-weight:bold;
    }
    #verifyli{position: relative;}
    #verifyli .yanzhengma_box{position: absolute;top:2px;right: 2px;}
</style>
</html>