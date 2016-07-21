<?php
namespace Intendant\Controller;
use Think\Controller;
use Think\Auth;
class IndexController extends Controller {
    public function _initialize(){
        //用户登陆信息检测处理
        $adminuid = session('admin_uid');
        if(!isset($adminuid))
        {
            $this->redirect('Login/index');
        }
    }
    public function index(){
    	$topNavKey = 'top-nav.cache';
	    $topNav = S($topNavKey);
	    if($topNav == null){
	    	$topNav = M("AuthRule")->where(['pid'=>0,'isshow'=>1])->order("sort asc")->select();
	    	S($topNavKey,$topNav,C('RULE_ID_TIME'));
	    }
    	$this->topNav = $topNav;
    	$this->display();
    }
    //获取左侧菜单
    public function getLeftMenu(){
    	$adminuid = session('admin_uid');
    	$Auth = new Auth();
        $myGroups = $Auth->getGroups($adminuid);//获取用户用户组
        session("admin_group",$myGroups[0]['title']);
        if(in_array($adminuid,explode(',',C('AUTH_SUPERADMIN')))){//区分是否管理员用户
        	$allRuleKey = 'all-rule-id.cache';
	        $ids = S($allRuleKey);
	        if($ids == null){
	            $allRule = M('AuthRule')->field('id')->select();
	            $allRuleIds = array_column($allRule,'id');
	            $ids = implode(',', $allRuleIds);
	            S($allRuleKey,$ids,C('RULE_ID_TIME'));
        	}
        } else {            
            if($myGroups[0]['group_id'] == '1'){//区分是否该角色拥有超级管理员角色
                $allRuleKey = 'all-rule-id.cache';
		        $ids = S($allRuleKey);
		        if($ids == null){
		            $allRule = M('AuthRule')->field('id')->select();
		            $allRuleIds = array_column($allRule,'id');
		            $ids = implode(',', $allRuleIds);
		            S($allRuleKey,$ids,C('RULE_ID_TIME'));
	        	}                
            } else {
                $ids = $myGroups[0]['rules'];
            }            
        }        
        $where = [
        	'pid'=>I('pid','','int'),
            'isshow'=>1,
            'id'=>array('in',$ids)
        ];
        $twoRule = M("AuthRule")->where($where)->order("sort asc")->field("id,title as text,icon")->select();
        foreach($twoRule as $k => $v){
            $where = [
                'pid'=>$v['id'],
                'isshow'=>1,
                'id'=>array('in',$ids)
            ];
            $threeRule = M("AuthRule")->where($where)->order("sort asc")->field("id,title as text,icon,name as url")->select();
            $twoRule[$k]['children'] = $threeRule;
        }
        exit(json_encode($twoRule));
    }
    //后台首页
    public function home(){
        //系统信息
        $infoKey = 'system-info.cache';
        $info = S($infoKey);
        if($info == null) {
            if (function_exists('gd_info')) {
                $gd = gd_info();
                $gd = $gd['GD Version'];
            } else {
                $gd = "不支持";
            }
            $info = array(
                '操作系统' => PHP_OS,
                '主机名IP端口' => $_SERVER['SERVER_NAME'] . ' (' . $_SERVER['SERVER_ADDR'] . ':' . $_SERVER['SERVER_PORT'] . ')',
                '运行环境' => $_SERVER["SERVER_SOFTWARE"],
                'PHP运行方式' => php_sapi_name(),
                '程序目录' => $_SERVER['DOCUMENT_ROOT'],
                'MYSQL版本' => function_exists("mysql_close") ? substr(mysql_get_client_info(), 0, 14) : '不支持',
                'GD库版本' => $gd,
                '上传附件限制' => ini_get('upload_max_filesize'),
                '执行时间限制' => ini_get('max_execution_time') . "秒",
                '剩余空间' => round((@disk_free_space(".") / (1024 * 1024)), 2) . 'M',
                '服务器时间' => date("Y年n月j日 H:i:s"),
                '北京时间' => gmdate("Y年n月j日 H:i:s", time() + 8 * 3600),
                '采集函数检测' => ini_get('allow_url_fopen') ? '支持' : '不支持',
                'register_globals' => get_cfg_var("register_globals") == "1" ? "ON" : "OFF",
                'magic_quotes_gpc' => (1 === get_magic_quotes_gpc()) ? 'YES' : 'NO',
                'magic_quotes_runtime' => (1 === get_magic_quotes_runtime()) ? 'YES' : 'NO',
            );
            S($infoKey,$info,300);
        }
        $loginLogKey = 'login-log.cache';
        $loginLog = S($loginLogKey);
        if($loginLog == null) {
            $sql = "SELECT logintime,loginip,country,area FROM hm_login_log WHERE  status = 1 ORDER BY id DESC LIMIT 5";
            $loginLog = M()->query($sql);
            S($loginLogKey,$loginLog,300);
        }
        $versionKey = 'version-log.cache';
        $version = S($versionKey);
        if($version == null) {
            $sql = "SELECT time,remark FROM hm_version ORDER BY time DESC LIMIT 5";
            $version = M()->query($sql);
            S($versionKey,$version,300);
        }
        // p($info);die;
        $this->username = session('admin_user');
        $this->groupname = session('admin_group');
        $this->systeminfo = $info;
        $this->loginlog = $loginLog;
        $this->versionlog = $version;
        $this->display();
    }
    //查看开发日志
    public function showVersion(){
        $p = !empty(I('p')) ? I('p') : 1;
        $versionListKey = 'version-list.cache'.$p;
        $versionListPageKey = 'version-list-page.cache'.$p;
        $versionListPageCount = 'version-list-page-count.cache';
        $version = S($versionListKey);
        $show = S($versionListPageKey);
        if($version == null){
            $count = M('version')->count();
            $Page  = new \Think\Page($count,C('ADMIN_PAGE_NUM'));// 实例化分页类 传入总记录数和每页显示的记录数(25)
            $total = ceil($count / C('ADMIN_PAGE_NUM'));
            $Page->setConfig('theme','%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
            $Page->setConfig('prev','上一页');
            $Page->setConfig('next','下一页');
            $Page->setConfig('first','第一页');
            $Page->setConfig('last','最后一页');
            $version = M('version')->order('time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
            $show = $Page->show();// 分页显示输出         
            S($versionListKey,$version,C('ADMIN_VERSION_MANAGE_TIME'));
            S($versionListPageKey,$show,C('ADMIN_VERSION_MANAGE_TIME'));
            S($versionListPageCount,$total,C('ADMIN_VERSION_MANAGE_TIME'));
        }
        $this->assign("versionlist", $version);
        $this->assign("page", $show);
        $this->display();
    }
}