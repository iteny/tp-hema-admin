<?php
/**
 * 后台登录模型
 * @CreateTime: 2016/2/14 19:11
 * @Author: iteny <8192332@qq.com>
 * @blog: http://itenyblog.com
 */
namespace Intendant\Model;
class LoginModel{
	protected static $username = null;
	protected static $password = null;
	protected static $verifycode = null;
	public function __construct($data = null){
		self::$username = $data['user'];
		self::$password = $data['pwd'];
		self::$verifycode = $data['code'];
	}
	public static function login(){
		if(self::checkVerify(self::$verifycode)){
			$data = ['username'=>self::$username,'password'=>self::$password];
			$validator = new \Hema\Validata($data);
			$validator->field('username')->isEmpty('username is required')->minLength(5)->maxLength(16)->alphanumeric();
            $validator->field('password')->isEmpty('password is required')->minLength(8)->maxLength(16)->alphanumeric();
			if($validator->validate()){
                $error = S('error_' . $data['username']); //判断是否锁定
                if(isset($error[ 'status']) && C('USER_STATE_LOCK') == $error['status'])
                {
                    self::recordLogin(0,'帐号已锁定');
                    $msg[ 'status' ] = 4;
                    $msg[ 'info' ] = '密码错误'.C('USER_LOCK_CNT').'次帐号被锁定，请在'.C('USER_LOCK_TIME').'分钟后再登录!';                    
                    exit(json_encode($msg));                  
                }
				$where = ['username'=>self::$username,'password'=>jiami(self::$password)];
				$row = M('user')->where($where)
				     ->field('username,uid,status')
				     ->find();

				if($row){
					if($row['status']==0){
						self::recordLogin(0,'帐号封禁');
                        $msg = [
                            "status" => 5,
                            "info" => "帐号封禁"
                        ];//登录成功
                        exit(json_encode($msg)); 
                    }elseif($row['status']==-1){
                    	self::recordLogin(0,'前台帐号');
                    	$msg = [
                            "status" => 7,
                            "info" => "帐号不存在"
                        ];//登录成功
                        exit(json_encode($msg));
                    }elseif($row['status']==1){
                    	self::recordLogin(1,'密码保密');
                        self::logout(); //清理session以防万一
                        session("admin_user", $row['username']);
                        session("admin_uid", $row['uid']);
                        // $groupId = M('authGroupAccess')->where(['uid'=>$row['uid']])->find();
                        // $group = M('authGroup')->where(['id'=>$groupId['group_id']])->find();
                        // session("admin_group",$group['title']);
                        $msg = [
                            "status" => 1,
                            "info" => "登录成功3秒后为你跳转"
                        ];
                        exit(json_encode($msg));                        
                    }else{
                    	self::recordLogin(0,'未知错误');
                    	$msg = [
                            "status" => 10,
                            "info" => "未知错误"
                        ];
                        exit(json_encode($msg));  
                    }
				}else{
                    if(!isset($error))
                    {
                        $error['cnt'] = 1;
                    }
                    else
                    {
                        if($error['cnt'] > (C('USER_LOCK_CNT')-2)) //大于设定次数
                        {
                            $error['status'] = C('USER_STATE_LOCK');
                        }
                        $error['cnt']++;
                    }
                    S('error_' . $data['username'], $error,C('USER_LOCK_TIME'));
					self::recordLogin(0,'帐号密码错误');
					$msg = [
                        "status" => 4,
                        "info" => "帐号或密码错误"
                    ];
                    exit(json_encode($msg));  
				}

			}else{
				self::recordLogin(0,'格式错误');
				$msg = [
                    "status" => 4,
                    "info" => "帐号或密码格式错误"
                ];
                exit(json_encode($msg));
			}

		}else{
			self::recordLogin(0,'验证码错误');
			$msg = [
                "status" => 0,
                "info" => "验证码错误"
            ];
            exit(json_encode($msg));
		}
	}
	//验证验证码
	private static function checkVerify($code, $id = '')
    {  	$verify = new \Think\Verify();
    	return $verify->check($code, $id);
    }
    //清除登录信息，也可用来退出登录
    public static function logout(){
    	session('admin_user',null);
    	session('admin_uid',null);

    }
    public static function recordLogin($status = '0',$message = '未知'){
		$Ip = new \Org\Net\IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
        $area = $Ip->getlocation(get_client_ip()); // 获取某个IP地址所在的位置
        $uname = session('admin_user');
        $data = [
            "username" => I('username'),
            "status" => $status,
            "info" => $message,
            "logintime" => time(),
            "loginip" => $area['ip'],
            "area" => $area['area'] == '' ? '对方在服务器本地登录' : $area['area'],
            "country" => $area['country'],
            "useragent" => $_SERVER['HTTP_USER_AGENT']

        ];
        M('LoginLog')->add($data);
	}
}