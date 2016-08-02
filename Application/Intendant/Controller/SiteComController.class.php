<?php
namespace Intendant\Controller;
use Think\Controller;
class SiteComController extends Controller {
	//读取图标
    public function iconsCls(){        
        if(IS_POST){
            $iconsCls = file_get_contents("./public/admin/font/icons.css");
            $iconsCls = explode('}', $iconsCls);
            $tmp_iconsCls = array();
            foreach($iconsCls as $k => $v){
                if(preg_match("/\.(.+?){/", $v,$m)){
                    $tmp_iconsCls[] = $m[1];
                }
            }
            exit(json_encode($tmp_iconsCls));
        }
    }
    //系统配置，分配超管ID组，读取用户列表
    public function userIds(){
    	$p = !empty(I('p')) ? I('p') : 1;
		$username = I('username');       
        $uid = I('uid');
        if (!empty($username)) {
            $where['username'] = array('like', '%' . $username . '%');
        }        
        if (!empty($uid)) {
            $where['uid'] = $uid;
        }
        $search = md5(serialize($where));        
		$data = S('userids');		
	    $list = $data['user-ids.cache'.$p.$search];
	    $show = $data['user-ids-page.cache'.$p.$search];
	    unset($data);
	    if($list == null){
			$count = M('user')->where($where)->count();
			$Page  = new \Think\Page($count,C('ADMIN_PAGE_NUM'));// 实例化分页类 传入总记录数和每页显示的记录数(25)
			$Page->setConfig('theme','%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
			$Page->setConfig('prev','上一页');
	        $Page->setConfig('next','下一页');
	        $Page->setConfig('first','第一页');
	        $Page->setConfig('last','最后一页');
	        $pk = M('user')->getPk();
	        $list = M('user')->where($where)->order($pk.' desc')->limit($Page->firstRow.','.$Page->listRows)->select();
	        $show = $Page->show();// 分页显示输出
	        $data['user-ids.cache'.$p.$search] =$login;
	        $data['user-ids-page.cache'.$p.$search] =$show;  	
	        S('userids',$data,C('ADMIN_LOGIN_MANAGE_TIME'));     
	    }
        $this->assign("list", $list);
        $this->assign("page", $show);
		$this->display();
    }
    //验证添加菜单时是否已存在菜单名
	public function checkAddMTit(){
		if(IS_POST && I('title')){
			$count = M("AuthRule")->where(array("title"=>I("title")))->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//验证添加菜单时是否已存在控制器/方法
	public function checkAddMname(){
		if(IS_POST && I('name')){
			$count = M("AuthRule")->where(array("name"=>I("name")))->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//验证修改菜单时是否已存在菜单名
	public function checkEditMTit(){
		if(IS_POST && I('title')){
			$where = array(
				'id' => array('neq',I("get.id")),
				'title' => I("title")
			);
			$AuthRule = M("AuthRule");
			$count = $AuthRule->where($where)->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//验证修改菜单时是否已存在控制器/方法
	public function checkEditMname(){
		if(IS_POST && I('name')){
			$where = array(
				'id' => array('neq',I("get.id")),
				'name' => I("name")
			);
			$AuthRule = M("AuthRule");
			$count = $AuthRule->where($where)->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//添加账号时验证是否已存在用户
	public function checkAddUsername(){
		if(IS_POST && I('username')){
			$count = M("User")->where(array("username"=>I("username")))->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//添加帐号时验证是否已存在昵称
	public function checkAddNickname(){
		if(IS_POST && I('nickname')){
			$count = M("User")->where(array("nickname"=>I("nickname")))->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	public function checkAddEmail(){
		if(IS_POST && I('email')){
			$count = M("User")->where(array("email"=>I("email")))->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//编辑用户时验证是否已存在用户名
	public function checkEditUsername(){
		if(IS_POST && I('username')){
			$where = array(
				'uid' => array('neq',I("get.uid")),
				'username' => I("username")
			);
			$User = M("User");
			$count = $User->where($where)->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//编辑用户时验证是否已存在昵称
	public function checkEditNickname(){
		if(IS_POST && I('nickname')){
			$where = array(
				'uid' => array('neq',I("get.uid")),
				'nickname' => I("nickname")
			);
			$User = M("User");
			$count = $User->where($where)->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//编辑邮箱时验证是否已存在昵称
	public function checkEditEmail(){
		if(IS_POST && I('email')){
			$where = array(
				'uid' => array('neq',I("get.uid")),
				'email' => I("email")
			);
			$User = M("User");
			$count = $User->where($where)->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//添加角色时验证是否已存在角色名称
	public function checkAddRtitle(){
		if(IS_POST && I('title')){
			$count = M("AuthGroup")->where(array("title"=>I("title")))->count();;
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
	//编辑角色时验证是否已存在角色名称
	public function checkEditRtitle(){
		if(IS_POST && I('title')){
			$where = array(
				'id' => array('neq',I("get.id")),
				'title' => I("title")
			);
			$Group = M("AuthGroup");
			$count = $Group->where($where)->count();
			if(!$count){
				echo 'true';
			} else {
				echo 'false';
			}
			exit;
		}
	}
}
