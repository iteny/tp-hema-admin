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
