<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>操作日志</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;日志设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;操作日志管理
</div>
<div id="frame-toolbar">
    <ul>
        <li><a class="active" href="/Intendant/Site/operateLog"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;操作日志</a></li>
        <li><a class="ajax-del" data-type="操作日志" data-title="一个月前" href="/Intendant/Site/delOperateLog"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;删除一个月前的操作操作日志</a></li>
    </ul>
</div>
<div id="frame-content">
    <div class="frame-table-list">
        <div class="input-title">搜索</div>
        <form method="get" action="/Intendant/Site/operateLog">
            <!--<input type="hidden" name="search" value="ok">-->
            <div class="search-content">
                     搜索类型：
                  <select class="select_2" name="status" style="width:100px;">
                      <option value='' <?php if($_GET['status'] == ''): ?>selected<?php endif; ?>>不限</option>
                      <option style="color:green" value="1" <?php if($_GET['status'] == '1'): ?>selected<?php endif; ?>>操作成功</option>
                      <option style="color:red" value="0" <?php if($_GET['status'] == '0'): ?>selected<?php endif; ?>>操作失败</option>
                  </select>
                    用户名：<input type="text" class="input length_2" name="username" size='10' value="<?php echo ($_GET["username"]); ?>" placeholder="用户名">
                    IP：<input type="text" class="input length_2" name="ip" size='20' value="<?php echo ($_GET["ip"]); ?>" placeholder="IP">
                    时间：
                    <input type="text" name="start_time" class="input length_2 my-date" value="<?php echo ($_GET["start_time"]); ?>" style="width:140px;">
                    -
                    <input type="text" class="input length_2 my-date" name="end_time" value="<?php echo ($_GET["end_time"]); ?>" style="width:140px;">
                    <button class="btn" style="height: 30px;line-height: 30px;padding-bottom: 31px;">搜索</button>
            </div>
        </form>
    </div>
    <form name="commonSort" class="ajax-form" action="/admin/Site/sortUser" method="post">
        <div class="frame-table-list">
            <table width="100%">
                <!--<colgroup>-->
                <!--<col width="10">-->
                <!--<col width="30">-->
                <!--<col width="30">-->
                <!--<col width="5">-->
                <!--<col width="280">-->
                <!--<col width="60">-->
                <!--<col width="40">-->
                <!--<col width="40">-->
                <!--</colgroup>-->
                <thead>
                <tr>
                    <td align="center" width="40">ID</td>
                    <td align="center" width="100">操作用户</td>
                    <td align="left" width="300">操作说明</td>
                    <td align="center">请求路径</td>
                    <td align="center">状态</td>
                    <td align="center" width="300">用户浏览器信息</td>
                    <td align="center">时间</td>
                    <td align="center" width="100">IP</td>
                    <td align="center">用户登录地区</td>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($operatelist)): $i = 0; $__LIST__ = $operatelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$log): $mod = ($i % 2 );++$i;?><tr>
                    <td align="center"><?php echo ($log["id"]); ?></td>
                    <td align="center"><?php echo ($log["username"]); ?></td>
                    <td align="left"><?php echo ($log["info"]); ?></td>
                    <td align="center"><?php echo ($log["get"]); ?></td>
                    <td align="center"><?php if($log['status'] == 1): ?><i class="iconfont" style="color:green;font-size: 16px;">&#xe60c;</i><?php else: ?><i class="iconfont" style="color:red;font-size: 16px;">&#xe60a;</i><?php endif; ?></td>
                    <td align="center"><?php echo ($log["useragent"]); ?></td>
                    <td align="center"><?php echo (date("Y年m月d日 H:i:s",$log["time"])); ?></td>
                    <td align="center"><?php echo ($log["ip"]); ?></td>
                    <td align="center"><?php echo ($log["country"]); ?></td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <div id="page10">
                <div class="pages"><?php echo ($page); ?></div>
            </div>
        </div>
    </form>
</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/datetimepicker/build/jquery.datetimepicker.full.min.js"></script><!--时间插件-->
<link href="/public/common/js/datetimepicker/jquery.datetimepicker.css" rel="stylesheet" /> <!--时间插件CSS-->
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/common.ajax.js"></script>
<script>
    $.datetimepicker.setLocale('ch');
    $('.my-date').datetimepicker({lang:'ch'});
</script>
</html>