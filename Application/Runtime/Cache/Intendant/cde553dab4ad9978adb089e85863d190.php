<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>系统配置,分配超管ID组,用户列表</title>
	<link href="/public/admin/css/frame.css" rel="stylesheet">
	<style type="text/css">
	.frame-table-list tbody tr.line_check td{background:#FF9966;color: white;border-bottom: 1px solid #ededed;}
	</style>
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;站长设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;系统配置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;分配超管ID组(用户列表)
</div>
<div id="frame-content" style="margin-top: 32px;">
    <div class="frame-table-list">
        <div class="input-title">搜索</div>
        <form method="get" action="/Intendant/SiteCom/userIds">            
            <div class="search-content">
            		ID：<input type="text" class="input length_2" name="uid" size='10' value="<?php echo ($_GET["uid"]); ?>" placeholder="ID">        
                    用户名：<input type="text" class="input length_2" name="username" size='10' value="<?php echo ($_GET["username"]); ?>" placeholder="用户名">                 
                    <button class="btn" style="height: 30px;line-height: 30px;padding-bottom: 31px;">搜索</button>
            </div>
        </form>
    </div>
    <form name="commonSort" class="ajax-form" action="/admin/Site/sortUser" method="post">
        <div class="frame-table-list">
            <table width="100%">                
                <thead>
                <tr>
                    <td align="center">ID</td>
                    <td align="center" width="100">用户名</td>                    
                    <td align="center">创建时间</td>      
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr onClick="select_list(this,'<?php echo ($vo["username"]); ?>',<?php echo ($vo["uid"]); ?>)" title="点击选择" class="<?php  if(in_array($vo['uid'],explode(',',C('AUTH_SUPERADMIN')))){ echo 'line_check'; } ?>">
                    <td align="center"><?php echo ($vo["uid"]); ?></td>
                    <td align="center"><?php echo ($vo["username"]); ?></td>
                    <td align="center"><?php echo (date("Y年m月d日 h:i:s",$vo["create_time"])); ?></td>
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
<script src="/public/common/js/layer/layer.js"></script>
<script src="/public/admin/js/admin.common.js"></script>
<script src="/public/admin/js/common.ajax.js"></script>
<script src="/public/common/js/poshytip/src/jquery.poshytip.min.js"></script>
<script type="text/javascript">
function select_list(obj, name, id) {
	var user_ids = window.parent.$('#user_ids').val();
	if ($(obj).attr('class') == 'line_check'){
		$(obj).removeClass('line_check');
		var checkids = user_ids.split(",");
		$.each(checkids,function(index,val){  
		    if(val==id){
		   	    checkids.splice(index,1);
			}
 		});
		window.parent.$('#user_ids').val(checkids);
	}else{
		$(obj).addClass('line_check');
		if (user_ids == '') {
            window.parent.$('#user_ids').val(id);
        } else {
        	//SOS判断是id是否已经存在
        	var sos = admin.inArray(user_ids.split(","),id);
        	if(sos == true){
        		window.parent.admin.alert('操作提示','该用户已经在ID组里',2,'8000'); 
        		return false
        	}else{
        		user_ids = user_ids +','+id;
            	window.parent.$('#user_ids').val(user_ids);
        	}            
        }
	}
}
</script>
</html>