<?php
/**
 * 操作日志记录
 * @CreateTime: 2016/2/14 19:11
 * @Author: iteny <8192332@qq.com>
 * @blog: http://itenyblog.com
 */
namespace Intendant\Model;
final class RecordModel{
	/**
	 * [record description]
	 * @param  [type]  $message [description]
	 * @param  integer $status  [description]
	 * @return [type]           [description]
	 */
	public static function record($message = null, $status = 0){
		if(C('OPERATE_LOG') == true){
			$fangs = 'GET';
	        if (IS_AJAX) {
	            $fangs = 'Ajax';
	        } else if (IS_POST) {
	            $fangs = 'POST';
	        }
			$uname = session('admin_user');
		    $Ip = new \Org\Net\IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
		    $area = $Ip->getlocation(get_client_ip()); // 获取某个IP地址所在的位置
		    $data = [
		    	'username' => $uname,
		    	'ip' => $area['ip'],
		    	'time' => time(),
		    	'country' => $area['country'],
		    	'useragent' => $_SERVER['HTTP_USER_AGENT'],
		    	'info' => "提示语：{$message}<br/>模块：" . MODULE_NAME . ",控制器：" . CONTROLLER_NAME . ",方法：" . ACTION_NAME . "<br/>请求方式：{$fangs}",
		    	'get' => $_SERVER['HTTP_REFERER'],
		    	'status' => $status,

		    ];
		    M('OperateLog')->add($data);
		}
	}

}