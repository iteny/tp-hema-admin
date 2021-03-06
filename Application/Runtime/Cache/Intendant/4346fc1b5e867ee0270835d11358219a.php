<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
    <link href="/public/common/js/poshytip/src/tip-darkgray/tip-darkgray.css" rel="stylesheet">
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;用户设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;用户管理
</div>
<div id="frame-toolbar">
    <ul>
        <li><a class="active" href="/Intendant/Site/user"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;用户管理</a></li>
        <li><a href="/Intendant/Site/addEditUser"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;添加用户</a></li>
    </ul>
</div>
<div id="frame-content">
    <form name="ids" class="ajax-form" action="" method="post">
        <div class="frame-table-list">
            <table width="100%">
                <colgroup>
                    <col width="10">
                    <col width="40">
                    <col width="80">
                    <col width="100">
                    <col width="80">
                    <col width="40">
                    <col width="80">
                    <col width="40">
                    <col width="40">
                    <col width="80">
                </colgroup>
                <thead>
                <tr>
                    <td align="center"><label><input type="checkbox" class="check-all"></label></td>
                    <td align="center">ID</td>
                    <td align="center">用户名</td>
                    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所属用户组</td>
                    <td align="center">创建时间</td>
                    <td align="center">创建IP</td>
                    <td align="center">E-Mail</td>
                    <td align="center">备注</td>
                    <td align="center">是否启用</td>
                    <td align="center">操作管理</td>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($userlist)): $i = 0; $__LIST__ = $userlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                    <td align="center"><label><input type="checkbox" class="ids chk-none" name="ids[]" value="<?php echo ($vo["uid"]); ?>"></label></td>
                    <td align="center"><?php echo ($vo["uid"]); ?></td>
                    <td align="center"><?php echo ($vo["username"]); ?></td>
                    <td align="left" style="position: relative;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo ($vo["usergroup"]["0"]["title"]); ?>
                    <?php if($vo['usergroup'][0]['id'] == 1): ?><a class="blue" style="position: absolute;right: 10px;top:3px;background:#666;border: 1px solid #666;">[点击查看权限]</a>
                    <?php else: ?>
                    <a class="blue" style="position: absolute;right: 10px;top:3px;" data="<?php echo ($vo["username"]); ?>" href="<?php echo U('Site/setRole','id=' . $vo["usergroup"][0]["id"] .'&title=' .$vo["usergroup"][0]["title"]);?>">[点击查看权限]</a><?php endif; ?>
                    </td>
                    <td align="center"><?php echo (date("Y-m-d H:i:s",$vo["create_time"])); ?></td>
                    <td align="center"><?php echo ($vo["create_ip"]); ?></td>
                    <td align="center"><?php echo ($vo["email"]); ?></td>
                    <td align="center"><a class="bsn blue" title="<?php echo ($vo["remark"]); ?>" style="cursor:pointer">鼠标悬停</a></td>
                    <td align="center"><?php if($vo['status'] == 1): ?><i class="iconfont" style="color:green;font-size: 16px;">&#xe60c;</i><?php else: ?><i class="iconfont" style="color:red;font-size: 16px;">&#xe60a;</i><?php endif; ?></td>
                    <td align="center">
                        <?php if($vo["uid"] == 1): ?><a class="ajax-edit blue" style="background: #666;border-color:#666"><i class="iconfont" style="color:white;font-size: 16px;">&#xe615;</i>&nbsp;&nbsp;修改</a>&nbsp;&nbsp;
                        <a class="ajax-edit red" style="background: #666;border-color:#666"><i class="iconfont" style="color:white;font-size: 16px;">&#xe614;</i>&nbsp;&nbsp;删除</a>
                        <?php else: ?>
                        <a class="ajax-edit blue" href="/Intendant/Site/addEditUser/?uid=<?php echo ($vo["uid"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe615;</i>&nbsp;&nbsp;修改</a>&nbsp;&nbsp;&nbsp;<a class="ajax-del red" data-title="<?php echo ($vo["username"]); ?>" data-type="用户" href="/Intendant/Site/delUser" data-id="<?php echo ($vo["uid"]); ?>"><i class="iconfont" style="color:white;font-size: 16px;">&#xe614;</i>&nbsp;&nbsp;删除</a><?php endif; ?>
                    </td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <div id="page10">
                <div class="pages"><?php echo ($page); ?></div>
            </div>
        </div>
        <div class="frame-table-btn">
            <button class="btn ajax-batch-del" href="/Intendant/Site/batchDelUser" data-type="用户" type="submit">批量删除</button>
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