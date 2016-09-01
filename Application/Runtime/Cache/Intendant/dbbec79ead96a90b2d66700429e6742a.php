<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台首页</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
    <link href="/public/common/js/poshytip/src/tip-darkgray/tip-darkgray.css" rel="stylesheet">
    <style>
        tr{border-left: none;}
        td{border-right: none;}
    </style>
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;后台首页
</div>
<div id="frame-content" style="margin-top:32px;">
    <table width="100%" border="0" cellspacing="10" cellpadding="0" class="indexBoxTwo">
        <tbody>
            <tr>
                <td width="49%" border="0" cellspacing="0" cellpadding="0" class="home">
                    <div class="frame-table-list">
                        <table width="100%">
                            <thead>
                            <div class="title">用户信息</div>
                            </thead>
                            <tbody>
                            <tr>
                                <td width="120" align="right">您好&nbsp;：</td>
                                <td><?php echo ($username); ?></td>
                            </tr>
                            <tr>
                                <td width="120" align="right">所属角色&nbsp;：</td>
                                <td><?php echo ($groupname); ?></td>
                            </tr>
                            <!--{% for key,val in loginlog if key < 1 %}-->
                            <tr>
                                <td width="120" align="right">项目开发者&nbsp;：</td>
                                <td>河马叔叔[<a style="color: #4169E1">8192332@qq.com</a>]</td>
                            </tr>
                            <tr>
                                <td width="120" align="right">github地址&nbsp;：</td>
                                <td>https://github.com/iteny</td>
                            </tr>
                            <tr>
                                <td width="120" align="right">二次开发手册&nbsp;：</td>
                                <td><a style="color: #4169E1" href="">http://www.hemacms.com/docs</a></td>
                            </tr>
                            <!--{% endfor %}-->
                            <tr>
                                <td width="120" align="right">产品名称&nbsp;：</td>
                                <td>河马CMS[<a style="color: #4169E1" href="#">访问官网</a>]</td>
                            </tr>
                            <tr>
                                <td width="120" align="right">用户类型&nbsp;：</td>
                                <td>开源使用</td>
                            </tr>
                            <tr>
                                <td width="120" align="right">产品版本&nbsp;：</td>
                                <td>0.1</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </td>

            </tr>
            <tr>
                <td height="200" width="48%" border="0" cellspacing="0" cellpadding="0">
                    <div class="frame-table-list">
                        <table width="100%">
                            <thead>
                            <div class="title">系统信息</div>
                            </thead>
                            <tbody>
                                <?php if(is_array($systeminfo)): $k = 0; $__LIST__ = $systeminfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k; if($k%2==1) echo "<tr>"; ?>
                                <td width="170" align="right"><?php echo ($key); ?>：</td>
                                <td><?php echo ($vo); ?></td>
                                <?php if($k%2==0) echo "</tr>"; endforeach; endif; else: echo "" ;endif; ?>


                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            
            <tr>
                <td width="49%" border="0" cellspacing="0" cellpadding="0" class="home">
                    <div class="frame-table-list">
                        <table width="100%">
                            <thead>
                            <div class="title">近期登录</div>
                            </thead>
                            <tbody>
                                <?php if(is_array($loginlog)): $i = 0; $__LIST__ = $loginlog;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$log): $mod = ($i % 2 );++$i;?><tr>
                                    <td width="90" align="right">登录时间&nbsp;：</td>
                                    <td><?php echo (date("Y年m月d日 H点i分s秒",$log["logintime"])); ?></td>
                                    <td width="90" align="right">登录IP&nbsp;：</td>
                                    <td><?php echo ($log["loginip"]); ?></td>
                                    <td width="90" align="right">登录地点&nbsp;：</td>
                                    <td><?php echo ($log["country"]); ?></td>
                                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td width="49%" border="0" cellspacing="0" cellpadding="0" class="home">
                    <div class="frame-table-list">
                        <table width="100%">
                            <thead>
                            <div class="title" style="float:left;">开发日志<a style="float:right;height:24px;line-height: 24px;" class="blue" href="/Intendant/Index/showVersion" style="cursor:pointer"><i class="iconfont" style="color:white;font-size: 12px;">&#xe60f;&nbsp;</i>查看更多&nbsp;</a></div>
                            
                            </thead>
                            <tbody>
                            <?php if(is_array($versionlog)): $i = 0; $__LIST__ = $versionlog;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ver): $mod = ($i % 2 );++$i;?><tr>
                                <td width="140" align="right"><?php echo (date("Y-m-d",$ver["time"])); ?>&nbsp;：</td>
                                <td><a class="bsn blue" title="<?php echo ($ver["remark"]); ?>" style="cursor:pointer">查看更新内容</a></td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>

        </tbody>
    </table>
</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/poshytip/src/jquery.poshytip.min.js"></script>
<script type="text/javascript">
$('.bsn').poshytip({
    className: 'tip-darkgray',
    alignTo: 'target',
    alignX: 'right',
    alignY: 'center',
    offsetX: 5,
    showTimeout: 1100
});
</script>
</html>