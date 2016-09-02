<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title><?php echo ($meta_title); ?>-<?php echo C('WEB_SITE_TITLE');?>后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta name="author" content="<?php echo C('WEB_SITE_TITLE');?>">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="generator" content="HemaCms">
	<meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-title" content="<?php echo C('WEB_SITE_TITLE');?>">
    <meta name="format-detection" content="telephone=no,email=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="apple-touch-icon" type="image/x-icon" href="/favicon.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/logo.png">
    <link rel="stylesheet" type="text/css" href="/public/admin/css/frame.css">
    <link rel="stylesheet" type="text/css" href="/public/common/js/poshytip/src/tip-darkgray/tip-darkgray.css">
    <style type="text/css">
    .tip-darkgray{z-index: 99999;}
    </style>
    
    <!-- <link rel="stylesheet" type="text/css" href="__CUI__/css/cui.extend.min.css"> -->
    

    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<?php if(!empty($parent_menu)): ?><div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;<?php if(is_array($parent_menu)): $i = 0; $__LIST__ = $parent_menu;if( count($__LIST__)==0 ) : echo "父菜单获取失败" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i; echo ($menu["title"]); if($i != count($parent_menu)): ?>&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;<?php endif; endforeach; endif; else: echo "父菜单获取失败" ;endif; ?>
</div><?php endif; ?>

<?php if(!empty($top_toolbar)): ?><div id="frame-toolbar">
    <ul>
        <?php if(is_array($top_toolbar)): $i = 0; $__LIST__ = $top_toolbar;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$top_button): $mod = ($i % 2 );++$i;?><li><a class="<?php echo ($top_button["class"]); ?>" href="<?php echo ($top_button["href"]); ?>"><i class="iconfont iconfont_btn"><?php echo ($top_button["bicon"]); ?></i>&nbsp;&nbsp;<?php echo ($top_button["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div><?php endif; ?>

<div id="frame-content" style="margin-top:<?php echo ($margin); ?>">
	<?php if(!empty($search)): ?><div class="frame-table-list">
        <div class="input-title">搜索</div>
        <form method="get" action="<?php echo ($search["href"]); ?>">
            <!--<input type="hidden" name="search" value="ok">-->
            <div class="search-content">
            	<?php if($search['status'] == 1): ?>搜索类型：
		            <select class="select_2" name="status" style="width:100px;">
		                <option value='' <?php if($_GET['status'] == ''): ?>selected<?php endif; ?>>不限</option>
		                <option style="color:green" value="1" <?php if($_GET['status'] == '1'): ?>selected<?php endif; ?>>成功</option>
		                <option style="color:red" value="0" <?php if($_GET['status'] == '0'): ?>selected<?php endif; ?>>失败</option>
		            </select><?php endif; ?>
	            <?php if($search['username'] == 1): ?>用户名：<input type="text" class="input length_2" name="username" size='10' value="<?php echo ($_GET["username"]); ?>" placeholder="用户名"><?php endif; ?>
                <?php if($search['ip'] == 1): ?>IP：<input type="text" class="input length_2" name="ip" size='20' value="<?php echo ($_GET["ip"]); ?>" placeholder="IP"><?php endif; ?>
                <?php if($search['time'] == 1): ?>时间：
	                <input type="text" name="start_time" class="input length_2 my-date" value="<?php echo ($_GET["start_time"]); ?>" style="width:140px;">
	                -
	                <input type="text" class="input length_2 my-date" name="end_time" value="<?php echo ($_GET["end_time"]); ?>" style="width:140px;"><?php endif; ?>
                <button class="btn" style="height: 30px;line-height: 30px;padding-bottom: 31px;"><i class="iconfont iconfont_btn">&#xe612;</i>&nbsp;搜索</button>
            </div>
        </form>
    </div><?php endif; ?>
    
    <form name="ids" class="ajax-form" action="" method="post">
    <div class="frame-table-list">
    	<table width="100%">
            <thead>
            <tr pid=0>
                <td align="center" width="40">排序</td>
                <td align="center" width="20">展开</td>
                <?php if(is_array($table_column_list)): $i = 0; $__LIST__ = $table_column_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$column): $mod = ($i % 2 );++$i;?><td align="<?php echo ($column["align"]); ?>" width="<?php echo ($column["width"]); ?>"><?php echo (htmlspecialchars($column["title"])); ?></td><?php endforeach; endif; else: echo "" ;endif; ?>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($table_data_list)): $i = 0; $__LIST__ = $table_data_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><tr id="<?php echo ($data[$table_data_list_key]); ?>" pid="<?php echo ($data['pid']); ?>">              
                        <td align="center" width="40"><input style="text-align: center" name="sort[<?php echo ($data[$table_data_list_key]); ?>]" type="text" size="3" value="<?php echo ($data[$sort]); ?>" class="input"></td>
                        <td align="center" width="20"><a href="javascript:void(0)" class="show"><i class="iconfont out">&#xe61f;</i></a></td>
                        <?php if(is_array($table_column_list)): $i = 0; $__LIST__ = $table_column_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$column): $mod = ($i % 2 );++$i;?><td align="<?php echo ($column["align"]); ?>" width="<?php echo ($column["width"]); ?>"><?php echo ($data[$column['name']]); ?></td><?php endforeach; endif; else: echo "" ;endif; ?>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        
    </div>
    <?php if(!empty($bottom_toolbar)): ?><div class="frame-table-btn">
    	<?php if(is_array($bottom_toolbar)): $i = 0; $__LIST__ = $bottom_toolbar;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$bottom_button): $mod = ($i % 2 );++$i;?><button class="<?php echo ($bottom_button["class"]); ?>" href="<?php echo ($bottom_button["href"]); ?>" data-type="<?php echo ($bottom_button["datatype"]); ?>" data-title="<?php echo ($bottom_button["datatitle"]); ?>" type="submit"><i class="iconfont iconfont_btn"><?php echo ($bottom_button["bicon"]); ?></i>&nbsp;<?php echo ($bottom_button["title"]); ?></button><?php endforeach; endif; else: echo "" ;endif; ?>
    </div><?php endif; ?>
</form>

</div>
</body>
<script src="/public/common/js/jquery/jquery-1.12.3.min.js"></script>
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/common.ajax.js"></script>
<script src="/public/common/js/poshytip/src/jquery.poshytip.min.js"></script>

	<script src="/public/common/js/Huploadify/jquery.Huploadify.js"></script>
	<script type="text/javascript">
	//上传插件
	$('#site-menu-upload').Huploadify({
	    auto:true,
	    fileTypeExts:'*.data',
	    multi:false,
	    formData:null,
	    fileSizeLimit:1024,
	    showUploadedPercent:false,
	    showUploadedSize:false,
	    removeTimeout:1000,
	    uploader:'<?php echo U("Site/importMenu");?>',
	    onUploadSuccess : function(file, data, response) {
	        var data = JSON.parse(data);
	        if(!data.status){
	            admin.alert("提示信息", data.info,2, '3000');
	        }else{
	            admin.alert("提示信息", data.info,1, '3000');
	            setTimeout(function () {
	                admin.reloadPage();
	            }, 3000);             
	        }
	    },
	    'onUploadError' : function(file, errorCode, errorMsg, errorString) {            
	        admin.alert("提示信息", file.name + ' 上传失败。详细信息: ' + errorString,2, '3000');
	    }
	});
	</script>
	<script>
	$(function(){
	    $('tr[pid!=0]').hide();
	    $('.show').click(function(event){
	        if($(this).hasClass("active")){
	            $(this).removeClass("active");
	            var id = $(this).parents('tr').attr('id');
	            $('tr[pid='+id+']').hide().find('a.show').removeClass("active").find('i.out').html('&#xe61f;').animate({opacity:0},'slow');
	            $('tr[pid='+id+']').each(function () {
	                var zid = $(this).attr("id");
	                $('tr[pid='+zid+']').hide().find('a.show').removeClass("active").find('i.out').html('&#xe61f;').animate({opacity:0},'slow');
	                $('tr[pid='+zid+']').each(function () {
	                    var qid = $(this).attr("id");
	                    $('tr[pid='+qid+']').hide().find('a.show').removeClass("active").find('i.out').html('&#xe61f;').animate({opacity:0},'slow');
	                });
	            });
	            $(this).find('i').html('&#xe61f;');
	        }else{
	            $(this).addClass("active");
	            var id = $(this).parents('tr').attr('id');
	            $('tr[pid='+id+']').show().find('a.show').addClass("active").find('i.out').html('&#xe61c;').animate({opacity:1},'slow');
	            $('tr[pid='+id+']').each(function () {
	                var zid = $(this).attr("id");
	                $('tr[pid='+zid+']').show().find('a.show').addClass("active").find('i.out').html('&#xe61c;').animate({opacity:1},'slow');
	                $('tr[pid='+zid+']').each(function () {
	                    var qid = $(this).attr("id");
	                    $('tr[pid='+qid+']').show().find('a.show').addClass("active").find('i.out').html('&#xe61c;').animate({opacity:1},'slow');
	                });
	            });
	            $(this).find('i').html('&#xe61c;');
	        }
	    });
	    $('.ajax-add').on('click', function (e) {
	        var data = $(this).attr('data-level');
	        if(data >= 3){e.preventDefault();admin.alert('提示信息','对不起，菜单最多4级！',2,'3000');}
	    });    
	    //导出菜单
	    $('.export').on('click', function (e) {
	        e.preventDefault();
	        var btn = $(this),
	            submit = btn.attr('href');
	            myload = layer.load(0,{time:100*1000});
	        $.post(submit,'',function(data){
	            layer.close(layer.load(1));
	            if(!data.status){
	                admin.alert("提示信息", data.info,2, '3000');
	            }else{
	                admin.countdown(3);
	                admin.alert('操作提示', data.info+'<div>程序将在<b style="color:red;" id="second_show">03秒</b>后为你跳转！</div>', 1, '3000');
	                location.href = data.url;             
	            }
	        },'json').error(function(){
	            layer.close(layer.load(1));
	            admin.alert('提示信息',data.responseText,1,'3000');
	        });
	    });
	    //导入菜单
	    $('.import').on('click', function (e) {
	        e.preventDefault();
	        layer.confirm('该操作将清空所有数据，请备份好数据之后再进行导入，确定要继续吗？', {icon: 3,offset:'200px', title:'导入菜单提示'}, function(index){
	            layer.close(index);
	            $("#site-menu-upload .uploadify-button").click();
	        });
	    });
	    
	});
	</script>

</html>