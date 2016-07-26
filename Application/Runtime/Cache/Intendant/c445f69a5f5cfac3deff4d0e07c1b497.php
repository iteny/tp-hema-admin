<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	  <meta charset="UTF-8">
	  <title>数据备份</title>
    <link href="/public/admin/css/frame.css" rel="stylesheet">
    
</head>
<body>
<div id="frame-top">
    当前位置&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60e;</i>&nbsp;&nbsp;设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;站长设置&nbsp;&nbsp;<i class="iconfont" style="color:#666;font-size: 12px;">&#xe60f;</i>&nbsp;&nbsp;数据备份列表
</div>
<div id="frame-toolbar">
    <ul>
        <li><a class="active" href="/Intendant/Site/dataBase/type/export"><i class="iconfont" style="color:white;font-size: 16px;">&#xe611;</i>&nbsp;&nbsp;数据备份</a></li>
        <li><a class="ajax-del" data-type="登录日志" data-title="一个月前" href="/Intendant/Site/dataBase/type/import"><i class="iconfont" style="color:white;font-size: 16px;">&#xe610;</i>&nbsp;&nbsp;还原数据</a></li>
    </ul>
</div>
<div id="frame-content">
    <form name="export" class="ajax-form" action="/Intendant/Site/export" method="post">
        <div class="frame-table-list">
            <table width="100%">
                <colgroup>
                    <col width="40">
                    <col width="40">
                    <col width="270">
                    <col width="170">
                    <!-- <col width="100">
                    <col width="50"> -->
                    <col width="80">
                    <col width="160">                 
                </colgroup>
                <thead>
                <tr>
                    <td width="40" align="center"><input class="check-all" checked="chedked" type="checkbox" value=""</td>
                    <td width="200" align="center">表名</td>
                    <td width="80" align="center">表用途</td>
                    <td width="40" align="center">记录数</td>
                    <td width="40" align="center">已使用大小</td>
                    <td width="80" align="center">创建时间</td>
                    <td width="80" align="center">碎片</td>
                    <td width="80" align="center">表引擎</td>
                    <td width="80" align="center">备份状态</td>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                  <td align="center">
                    <input class="ids chk-none" checked="chedked" type="checkbox" name="tables[]" value="<?php echo ($vo["name"]); ?>">
                  </td>
                  <td align="center"><?php echo ($vo["name"]); ?></td>
                  <td align="center"><?php echo ($vo["comment"]); ?></td>
                  <td align="center"><?php echo ($vo["rows"]); ?></td>
                  <td align="center"><?php echo ($vo["size"]); ?></td>
                  <td align="center"><?php echo ($vo["create_time"]); ?></td>
                  <td align="center"><?php echo ($vo["data_free"]); ?></td>
                  <td align="center"><?php echo ($vo["engine"]); ?></td>
                  <td align="center" class="info">未备份</td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
        </div>
        <div class="frame-table-btn">
            <button class="btn ajax-export" href="/Intendant/Site/batchDelVersion" data-type="用户" type="submit">开始备份</button>
            <button class="btn ajax-batch-del" href="/Intendant/Site/batchDelVersion" data-type="用户" type="submit">优化表</button>
            <button class="btn ajax-batch-del" href="/Intendant/Site/batchDelVersion" data-type="用户" type="submit">修复表</button>
            <button class="btn ajax-batch-del" href="/Intendant/Site/batchDelVersion" data-type="用户" type="submit">清除正在执行的备份任务</button>
            <button class="btn ajax-batch-del" style="float:right;margin-right: 40px;">数据库中共有<?php echo ($tables); ?>张表，共计<?php echo ($total); ?></button>
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
$(function(){
  var $form = $('form[name=export]'),
      $export = $(".ajax-export");
  $export.click(function(e){
      e.preventDefault();
      if($("input:checkbox[name='tables[]']:checked").length <= 0){
          admin.alert('操作提示','至少选择一张数据表进行备份',3,'5000');
          return false;
      }
      if($export.attr("disabledSubmit")){
          $export.text('请勿重复提交...').prop('disabled', true).addClass('disabled');
          return false;
      }
      $export.attr("disabledSubmit",true);
      $export.html("正在发送备份请求...");
      $.post(
          $form.attr("action"),
          $form.serialize(),
          function(data){
              if(data.status){
                  tables = data.tables;
                  $export.html(data.info + "开始备份，请不要关闭本页面！");
                  backup(data.tab);
                  window.onbeforeunload = function(){ return "正在备份数据库，请不要关闭！" }
              } else {
                  admin.alert('操作提示',data.info,2,'3000');
                  $export.parent().children().removeClass("disabled");
                  $export.html("立即备份");
                  setTimeout(function(){
                    $('#top-alert').find('button').click();
                    $(that).removeClass('disabled').prop('disabled',false);
                },1500);
              }
          },
          "json"
      );
      return false;
  });
  function backup(tab, status){
      status && showmsg(tab.id, "开始备份...(0%)");
      $.get($form.attr("action"), tab, function(data){
          if(data.status){
              showmsg(tab.id, data.info);
              // alert(data.info);
              if(!$.isPlainObject(data.tab)){
                  $export.parent().children().removeClass("disabled");
                  $export.html("备份完成，点击重新备份");
                  admin.countdown(3);
                  admin.alert('操作提示', '数据备份成功!'+'<div>程序将在<b style="color:green;" id="second_show">03秒</b>后为你跳转！</div>', 1, '3000');
                  setTimeout(function () {
                      window.location.href = '/Intendant/Site/dataBase/type/export';
                  }, 3000);
                  window.onbeforeunload = function(){ return null }
                  return;
              }
              backup(data.tab, tab.id != data.tab.id);
          } else {
              admin.alert('操作提示',data.info,2,'3000');
              $export.parent().children().removeClass("disabled");
              $export.html("立即备份");
              setTimeout(function(){
                $('#top-alert').find('button').click();
                $(that).removeClass('disabled').prop('disabled',false);
            },1500);
          }
      }, "json");

  }
  function showmsg(id, msg){
      $form.find("input[value=" + tables[id] + "]").closest("tr").find(".info").html(msg);
  }
});
</script>
</html>