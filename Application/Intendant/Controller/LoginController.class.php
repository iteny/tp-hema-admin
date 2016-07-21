<?php
/**
 * 后台用户登录
 * @CreateTime: 2016/2/14 19:11
 * @Author: iteny <8192332@qq.com>
 * @blog: http://itenyblog.com
 */
namespace Intendant\Controller;
use Think\Controller;
class LoginController extends Controller {
	public function index(){
    	if(IS_POST){//登录方法
    		$data = [
    			'code'=> I('verify'),
    			'user'=> I('username'),
    			'pwd' => I('password'),
    		];
    		if(is_array($data)){
    			$login = new \Intendant\Model\LoginModel($data);
    			$login->login();
                unset($login);
    		}else{
    			$msg = [
                    "status" => 10,
                    "info" => "请输入帐号密码验证码"
                ];
                exit(json_encode($msg)); 
    		}
    	}else{
    		$this->display();
    	}
    }
    //验证码
    public function verify()
    {
      	$Verify = new \Think\Verify();
      	$Verify->fontttf = '5.ttf'; //字体
      	$Verify->fontSize = 30; //验证码字体大小
	    $Verify->length   = 4; //验证码位数
	    $Verify->useNoise = true; //关闭验证码杂点
	    $Verify->entry();
    }
}