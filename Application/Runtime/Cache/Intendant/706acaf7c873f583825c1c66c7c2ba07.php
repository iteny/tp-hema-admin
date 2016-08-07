<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>角色管理</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
    <link href="/public/common/js/poshytip/src/tip-darkgray/tip-darkgray.css" rel="stylesheet">
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;用户设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;角色管理
</div>
<div id="frame-toolbar">
    <ul>
        <li><a class="active" href="/Intendant/Site/role"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;角色管理</a></li>
        <li><a href="/Intendant/Site/addEditRole"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;添加角色</a></li>
    </ul>
</div>
<div id="frame-content">
    <form name="commonSort" class="ajax-form" action="/Intendant/Site/sortRole" method="post">
        <div class="frame-table-list">
            <table width="100%">
                <colgroup>
                    <col width="10">
                    <col width="40">
                    <col width="200">
                    <col width="40">
                    <col width="40">
                    <col width="80">
                </colgroup>
                <thead>
                <tr>
                    <td align="center">排序</td>
                    <td align="center">ID</td>
                    <td align="left">角色名称</td>
                    <td align="center">状态</td>
                    <td align="center">备注</td>
                    <td align="center">操作管理</td>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($rolelist)): $i = 0; $__LIST__ = $rolelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                    <td align="center"><input style="text-align: center" name="sort[<?php echo ($vo['id']); ?>]" type="text" size="3" value="<?php echo ($vo['sort']); ?>" class="input"></td>
                    <td align="center"><?php echo ($vo["id"]); ?></td>
                    <td align="left"><?php echo ($vo["title"]); ?></td>
                    <td align="center"><?php if($vo['status'] == 1): ?><i class="iconfont" style="color:green;font-size: 16px;">&#xe60c;</i><?php else: ?><i class="iconfont" style="color:red;font-size: 16px;">&#xe60a;</i><?php endif; ?></td>
                    <td align="center"><a class="bsn blue" title="<?php echo ($vo["remark"]); ?>" style="cursor:pointer">鼠标悬停</a></td>
                    <td align="center">
                        <?php if($vo['id'] == 1): ?><a class="ajax-add blue" style="background: #666;border-color:#666"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;权限设置</a>&nbsp;&nbsp;
                        <a class="ajax-edit blue" style="background: #666;border-color:#666"><i class="iconfont" style="color:white;font-size: 16px;">&#xe615;</i>&nbsp;&nbsp;修改</a>&nbsp;&nbsp;
                        <a class="ajax-edit red" style="background: #666;border-color:#666"><i class="iconfont" style="color:white;font-size: 16px;">&#xe614;</i>&nbsp;&nbsp;删除</a>
                        <?php else: ?>
                        <a class="ajax-add blue" href="/Intendant/Site/setRole/?id=<?php echo ($vo["id"]); ?>&title=<?php echo ($vo["title"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;权限设置</a>&nbsp;&nbsp;&nbsp;<a class="ajax-edit blue" href="/Intendant/Site/addEditRole/?id=<?php echo ($vo["id"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe615;</i>&nbsp;&nbsp;修改</a>&nbsp;&nbsp;&nbsp;<a class="ajax-del red" data-title="<?php echo ($vo["title"]); ?>" data-type="角色" href="/Intendant/Site/delRole" data-id="<?php echo ($vo["id"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe614;</i>&nbsp;&nbsp;删除</a><?php endif; ?>
                    </td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <div id="page10">
                <div class="pages"><?php echo ($page); ?></div>
            </div>
        </div>
        <div class="frame-table-btn">
            <button class="btn ajax-sort" href="/Intendant/Site/sortRole" data-type="角色" type="submit">排序</button>
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