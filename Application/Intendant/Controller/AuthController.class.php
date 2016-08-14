<?php
namespace Intendant\Controller;
use Think\Controller;
use Think\Auth;
/**
 * 权限判断核心文件
 *
 */
class AuthController extends Controller{
	public function _initialize(){
		//用户登陆信息检测处理
		$adminuid = session('admin_uid');
		if(!isset($adminuid))
	    {
	        $this->redirect('Login/index');
	    }
	    $this->assign('admin_public_layout', C('ADMIN_PUBLIC_LAYOUT'));  // 页面公共继承模版
	    // 检查普通用户权限
		$AuthModel = new Auth();
		$AuthGroups = $AuthModel->getGroups($adminuid);
		if(in_array($adminuid,explode(',',C('AUTH_SUPERADMIN')))){
			return true;
		}
		foreach($AuthGroups as $v){
			if($v['group_id'] == '1'){//区分是否该角色拥有超级管理员角色
				return true;
			}
		}
		if(!$AuthModel->check(CONTROLLER_NAME.'/'.ACTION_NAME,$adminuid)){
			if(IS_POST){
				$this->ajaxReturn(['info' => '对不起，你没有权限执行这个操作！','status'=>false]);
				exit;
			}else if(IS_GET){
				$str = '';
				$str .= '<div class="quan" style="background: #09C repeat-x;-moz-opacity: 0.7;opacity: 0.7;filter: Alpha(opacity=70);border: 1px solid #25333c; border-radius:3px;margin:0;padding:6px;box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);">';
				$str .= '<h2 class="h_a" style="font-size:24px;background:#cfdee5;margin:0;padding:0px;padding: 10px 9px;font-family:Microsoft Yahei;font-weight:bold;color:red;text-align:center;">对不起，你没有权限执行这个操作！</h2>';
				$str .= '</div>';
				echo $str;
				exit;
			}
		}		
	}
}
?>