<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查看开发日志</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
    <link href="/public/common/js/poshytip/src/tip-darkgray/tip-darkgray.css" rel="stylesheet">
    <style type="text/css">
    ul.timeline {
             list-style-type: none;
             background: url("/public/admin/img/version_line.png") repeat-y scroll 170px 0 transparent;
             /*margin: 10px 0;*/
             padding: 50px;
         }
      
         ul.timeline li {
            position: relative;
            margin-bottom: 20px;
        }
        ul.timeline li .time {
            position: absolute;
            width: 90px;
            text-align: right;
            left: 0;
            top: 10px;
            color: #999;
        }
        ul.timeline li .version {
            position: absolute;
            width: 290px;
            text-align: right;
            left: -200px;
            top: 30px;
            font-size: 24px;
            line-height: 50px;
            color: #3594cb;
            overflow: hidden;
        }
        ul.timeline li .number {
            position: absolute;
            background: url("/public/admin/img/version_dot.png") no-repeat scroll 0 0 transparent;
            width: 56px;
            height: 56px;
            left: 97px;
            line-height: 56px;
            text-align: center;
            color: #fff;
            font-size: 18px;
        }
        ul.timeline li.alt .number {
            background-image: url("/public/admin/img/version_dot_alt.png");
        }
        ul.timeline li .content {
            margin-left: 180px;
            
        }
        ul.timeline li .content pre {
            background-color: #09C;
            border: 1px solid #ededed;
            border-radius: 4px;
            padding: 20px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            font-family: "Microsoft Yahei",Tahoma;
            line-height: 20px;
        }
        ul.timeline li.alt .content pre {
            background-color: #09C;
        }
    </style>
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;后台首页&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;查看更新日志
</div>
<!-- <div id="frame-toolbar">
    <ul>
        <li><a class="active" href="/Intendant/Site/version"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;开发日志管理</a></li>
        <li><a href="/Intendant/Site/addEditVersion"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;添加日志</a></li>
    </ul>
</div> -->
<div id="frame-content" style="margin-top: 35px;">
    <form name="ids" class="ajax-form" action="" method="post">
        <div class="frame-table-list">
            <table width="100%">                
                <thead>
                <div class="title">开发日志</div>
                </thead>
                <tbody>
                    <div style="background: white;">
                    <ul class="timeline">
                        <?php if(is_array($versionlist)): $i = 0; $__LIST__ = $versionlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                            <div class="time"><?php echo (date("Y-m-d",$vo["time"])); ?></div>
                            <div class="version">版本:<?php echo ($vo["version"]); ?></div>
                            <div class="number">第几个版本</div>
                            <div class="content">
                                <pre>
                                    <?php echo (stripslashes(htmlspecialchars_decode($vo["remark"]))); ?>
                                </pre>
                            </div>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    <ul>
                    </div>
                </tbody>
            </table>
            
        </div>
        <div class="frame-table-btn">
            <!-- <div id="page10"> -->
                <div class="pages"><?php echo ($page); ?></div>
            <!-- </div> -->
        </div>
    </form>
</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/common.ajax.js"></script>
<script src="/public/common/js/poshytip/src/jquery.poshytip.min.js"></script>
<script type="text/javascript">
$(function() {                 
    var liNodes = $('ul.timeline li'), count = liNodes.length, i, liNode;
    for(i=0; i<count; i++) {
        liNode = $(liNodes.get(i));
        if(i % 2 !== 0) {
            liNode.addClass('alt');
        }
        liNode.find('.number').text(count - i);
    } 
});
</script>
</html>