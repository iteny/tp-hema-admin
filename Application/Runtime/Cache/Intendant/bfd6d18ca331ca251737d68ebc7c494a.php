<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>开发日志管理</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
    <link href="/public/common/js/poshytip/src/tip-darkgray/tip-darkgray.css" rel="stylesheet">
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;站长设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;开发日志管理
</div>
<div id="frame-toolbar">
    <ul>
        <li><a class="active" href="/Intendant/Site/version"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;开发日志管理</a></li>
        <li><a href="/Intendant/Site/addEditVersion"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;添加日志</a></li>
    </ul>
</div>
<div id="frame-content">
    <form name="ids" class="ajax-form" action="" method="post">
        <div class="frame-table-list">
            <table width="100%">
                <colgroup>
                    <col width="10">
                    <col width="40">
                    <col width="40">
                    <col width="80">
                    <col width="100">
                    <col width="80">                   
                </colgroup>
                <thead>
                <tr>
                    <td align="center"><label><input type="checkbox" class="check-all"></label></td>
                    <td align="center">ID</td>
                    <td align="center">版本号</td>
                    <td align="center">日志时间</td>               
                    <td align="center">更新内容</td>
                    <td align="center">操作管理</td>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($versionlist)): $i = 0; $__LIST__ = $versionlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                    <td align="center"><label><input type="checkbox" class="ids chk-none" name="ids[]" value="<?php echo ($vo["id"]); ?>"></label></td>
                    <td align="center"><?php echo ($vo["id"]); ?></td> 
                    <td align="center"><?php echo ($vo["version"]); ?></td> 
                    <td align="center"><?php echo (date("Y-m-d",$vo["time"])); ?></td>             
                    <td align="center"><a class="bsn blue" title="<?php echo ($vo["remark"]); ?>" style="cursor:pointer">鼠标悬停</a></td>                    
                    <td align="center">                        
                        <a class="ajax-edit blue" href="/Intendant/Site/addEditVersion/?id=<?php echo ($vo["id"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe615;</i>&nbsp;&nbsp;修改</a>&nbsp;&nbsp;&nbsp;<a class="ajax-del red" data-title="<?php echo (date("Y-m-d",$vo["time"])); ?>" data-type="开发日志" href="/Intendant/Site/batchDelVersion" data-id="<?php echo ($vo["id"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe614;</i>&nbsp;&nbsp;删除</a>
                    </td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <div id="page10">
                <div class="pages"><?php echo ($page); ?></div>
            </div>
        </div>
        <div class="frame-table-btn">
            <button class="btn ajax-batch-del" href="/Intendant/Site/batchDelVersion" data-type="用户" type="submit">批量删除</button>
        </div>
    </form>
</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/common.ajax.js"></script>
<script src="/public/common/js/poshytip/src/jquery.poshytip.min.js"></script>
</html>