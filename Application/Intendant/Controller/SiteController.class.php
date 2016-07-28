<?php
namespace Intendant\Controller;
use Think\Controller;
// use Think\Auth;
use Think\Db;
use Hema\Database;
class SiteController extends AuthController {
	//后台菜单显示
	public function menu(){
		$allRulekey = 'all-rule.cache';
		$menu = S($allMenukey);
		if($menu == null){
			$menu = M('AuthRule')->order('sort asc')->select();
			$menu = recursive($menu);
			S($allMenukey,$menu,C('AUTH_MENU_TIME'));
		}
		$this->menu = $menu;
		$this->display();
	}
	//添加或修改菜单
	public function addEditMenu(){
		if(IS_POST && I('addEditMenu')){//处理提交
			$rules = array(
				array('title','require',-1), //菜单名称不能为空
				array('name','require',-2), //菜单规则不能为空
				array('title','',-3,0,'unique',1), //菜单名称唯一性
				array('name','',-4,0,'unique',1), //菜单规则唯一性
			);
			$tableRule = M("AuthRule");
			if($tableRule->validate($rules)->create()){
				if(I('id','','int')){//修改菜单
					$status = $tableRule->save();
					$msg = returnMsg("菜单修改成功","菜单修改失败",$status);
					if($status){
						S('all-rule.cache',null);
						S('all-rule-id.cache',null);
						S('all-rule-select.cache',null);
					}					
					exit(json_encode($msg));
				}else{//添加菜单
					$status = $tableRule->add();
					$msg = returnMsg("菜单添加成功","菜单添加失败",$status);
					if($status){
						S('all-rule.cache',null);
						S('all-rule-id.cache',null);
						S('all-rule-select.cache',null);
					}	
					exit(json_encode($msg));
				}				
			}
			else
			{
				exit(json_encode($tableRule->getError()));
			}
		}else{//转到页面
			$allRuleSelectkey = 'all-rule-select.cache';
			$menu = S($allRuleSelectkey);
			if($menu == null){
				$menu = M('AuthRule')->order('sort asc')->select();
				$menu = recursiveTwo($menu);
				S($allRuleSelectkey,$menu,C('AUTH_MENU_TIME'));
			}
			$this->selectMenu = $menu;
			$id = I('id','','int');
			if($id){//转到编辑菜单页				
				$thisRule = M('AuthRule')->where(array('id'=>$id))->find();
				$this->rule = $thisRule;
				$this->display('editMenu');
			}else{//转到新增页面
				$pid = I('pid','int');
                $pid = $pid != '' ? $pid : 0;
                $this->pid = $pid;
				$this->display('addMenu');
			}
		}		
	}
	// 删除菜单
	public function delMenu()
	{
		if(IS_POST && I('id')){			
			$id = I('id','','int');
			$db = M('AuthRule');
			$cateid = $db->field('id,pid')->select();
			$delid = get_all_child($cateid,$id);
			$delid[] = $id;			
			$where = array('id' => array('IN',$delid));
			$status = $db->where($where)->delete();
			$msg = returnMsg("菜单删除成功","菜单删除失败",$status);
			if($status){
				S('all-rule.cache',null);
				S('all-rule-id.cache',null);
				S('all-rule-select.cache',null);
			}	
			exit(json_encode(($msg)));
		}
	}
	//菜单排序
    public function sortMenu(){  
    	if(IS_POST){
    		$sortMenu = I('sort');
	        $ids = implode(',', array_keys($sortMenu));
	        $sql = "UPDATE hm_auth_rule SET sort = CASE id ";
	        foreach ($sortMenu as $id => $sort) {
	            $sql .= sprintf("WHEN %d THEN %d ", $id, $sort);
	        }
	        $sql .= "END WHERE id IN ($ids)";
	        $Model = M();
	        $status = $Model->execute($sql);
	        $msg = returnMsg("菜单排序成功","菜单排序失败",$status);
	        if($status){
				S('all-rule.cache',null);
				S('all-rule-select.cache',null);
			}	
	        exit(json_encode($msg));
    	}         
    }
    //导出菜单
	public function exportMenu(){
		$type = I('download') ? I('download') : false;
		if($type){
			$table_Rule = M("AuthRule")->select();
			header("Content-type:application/data");
			header("Content-Disposition:attachment;filename=菜单备份.data");
			exit(base64_encode(serialize($table_Rule)));
		} else {
			$sess_downRule = strtoupper(substr(md5(time().rand(10,10000)),5,10));
			session('downRule',$sess_downRule);
			$data['status'] = true;
			$data['info'] = "菜单导出成功";
			$data['url'] = U("Site/exportMenu",array("download"=>$sess_downRule));
			$this->ajaxReturn($data);
		}
	}
	//菜单导入
	public function importMenu(){
		if(IS_POST){
			$fileTypes = array('data'); // File extensions
			$fileParts = pathinfo($_FILES['file']['name']);
			if (in_array($fileParts['extension'],$fileTypes)) {
				//获取临时上传文件路径
				$tempFile = $_FILES['file']['tmp_name'];
				// echo $tempFile;die;
				$data_Rule = file_get_contents($tempFile);
				$data_Rule = unserialize(base64_decode($data_Rule));
				if(is_array($data_Rule)){
					M("AuthRule")->where("1")->delete();
					$status = M("AuthRule")->addAll($data_Rule);
					if($status > 0){
						$data['status'] = true;
						$data['info'] = '菜单导入成功';
					} else {
						$data['status'] = false;
						$data['info'] = '菜单数据导入失败，请手动恢复你备份的菜单数据';
					}
				} else {
					$data['status'] = false;
					$data['info'] = '非法数据';
				}
				$this->ajaxReturn($data);
			} else {
				echo 'Invalid file type.';
			}
		}
	}
	//用户管理
	public function user(){
		$p = !empty(I('p')) ? I('p') : 1;
		$userListKey = 'user-list.cache'.$p;
		$userListPageKey = 'user-list-page.cache'.$p;
		$userListPageCount = 'user-list-page-count.cache';
	    $user = S($userListKey);
	    $show = S($userListPageKey);
	    if($user == null){
			$count = D('UserRelation')->count();
			$Page  = new \Think\Page($count,C('ADMIN_PAGE_NUM'));// 实例化分页类 传入总记录数和每页显示的记录数(25)
			$total = ceil($count / C('ADMIN_PAGE_NUM'));
			$Page->setConfig('theme','%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
			$Page->setConfig('prev','上一页');
	        $Page->setConfig('next','下一页');
	        $Page->setConfig('first','第一页');
	        $Page->setConfig('last','最后一页');
	        $user = D('UserRelation')->relation(true)->order('uid asc')->limit($Page->firstRow.','.$Page->listRows)->select();
	        $show = $Page->show();// 分页显示输出	        
	        S($userListKey,$user,C('ADMIN_USER_MANAGE_TIME'));
	        S($userListPageKey,$show,C('ADMIN_USER_MANAGE_TIME'));
	        S($userListPageCount,$total,C('ADMIN_USER_MANAGE_TIME'));
	    }
        $this->assign("userlist", $user);
        $this->assign("page", $show);
		$this->display();
	}
	//添加或修改用户
	public function addEditUser(){
		if(IS_POST && I('addEditUser')){//处理提交
			$rules = array(
				//-1,账号以字母开头,5-17 字母、数字、下划线'_'
		        array('username','/^[a-zA-Z][\w]{4,16}$/',-2,0),
		        //-4,账号被占用
		        array('username', '', -3, 0, 'unique', 1),
		        //-1,昵称必须是中文
		        array('nickname','/^[\x{4e00}-\x{9fa5}]+$/u',-4,0),//
		        //-4,昵称被占用
		        array('nickname', '', -5, 0, 'unique', 1),       
		        
		        // 验证确认密码是否和密码一致
		        array('passworded','password',-7,0,'confirm'),
		        //-6,QQ不合法！
		        // array('qq','/^[1-9]\d{4,9}$/',-8,0),
		        //-3,邮箱格式不正确
		        array('email','email',-9,0),
		        //-6,手机号不合法！
		        // array('phone','/(13[0-9]|14[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/',-10,0),
		        //-5,QQ被占用
		        // array('qq','',-11,0,'unique',1),
		        //-5,邮箱被占用
		        array('email','',-12,0,'unique',1),
		        //-7,手机号被占用
		        // array('phone','',-13,0,'unique',1),
			);
			//密码以字母开头,8-17 字母、数字、下划线'_'
			if(empty(I('uid','','int'))){
				$rules[] = array('password','/^[a-zA-Z][\w]{7,16}$/',-6,0);
			}
			$tableUser = D("UserRelation");
			if($tableUser->validate($rules)->create()){
				if(I('uid','','int')){//修改
					if(I('password') == '' || I('passworded') == ''){//当没有修改密码时
					unset($tableUser->password);
					}
					else
					{
						$tableUser->password = jiami(I('password'));
					}
					$tableUser->usergroup = I('group_id');
					$status = $tableUser->relation(true)->save();
					$msg = returnMsg("用户修改成功","用户修改失败",$status);					
				}else{//添加
					$tableUser->password = jiami(I('password'));
					$tableUser->usergroup = I('group_id');
					$tableUser->create_time = time();
					$tableUser->create_ip = get_client_ip();
					$status = $tableUser->relation(true)->add();
					$msg = returnMsg("添加用户成功","添加用户失败",$status);								
				}
				//如果成功清楚用户管理缓存
				if($status){
					$userListPageCount = 'user-list-page-count.cache';
					if(!empty(S($userListPageCount))){
						for($i=1;$i<=S($userListPageCount);$i++){
							$userListKey = 'user-list.cache'.$i;
							$userListPageKey = 'user-list-page.cache'.$i;
							S($userListKey,null);
							S($userListPageKey,null);
						}
					}						
				}		
				exit(json_encode($msg));			
			}
			else
			{
				exit(json_encode($tableUser->getError()));
			}
		}else{//转到页面	
			$userGroupKey = 'user-group.cache';
			$group = S($userGroupKey);
			if($group == null){
				$group = M('AuthGroup')->order('sort asc')->select();				
				S($userGroupKey,$group,C('ADMIN_USER_MANAGE_TIME'));
			}
			$this->group = $group;		
			$id = I('uid','','int');
			if($id){//转到编辑页				
				$thisUser = D('UserRelation')->relation(true)->where(['uid'=>$id])->find();
				$this->user = $thisUser;
				$this->display('editUser');
			}else{//转到新增页				
				$this->display('addUser');
			}
		}
	}
	//删除单个管理员
	public function delUser(){
		$id = I('id');
		if($id == '1'){
			$msg = returnMsg("","不允许删除原始超级管理员",false);
			exit(json_encode(($msg)));
		}
		if(IS_POST && $id){
			$status = D("UserRelation")->relation(true)->where(['uid'=>$id])->delete();
			$msg = returnMsg("删除用户成功","删除用户失败，请联系管理员",$status);
			//如果成功清楚用户管理缓存
			if($status){
				$userListPageCount = 'user-list-page-count.cache';
				if(!empty(S($userListPageCount))){
					for($i=1;$i<=S($userListPageCount);$i++){
						$userListKey = 'user-list.cache'.$i;
						$userListPageKey = 'user-list-page.cache'.$i;
						S($userListKey,null);
						S($userListPageKey,null);
					}
				}						
			}	
			exit(json_encode(($msg)));
		}
	}
	//批量删除用户
	public function batchDelUser(){
		$ids = I('ids');
		if(in_array(1, $ids)) {
		    $msg = returnMsg("","不允许删除原始超级管理员",false);
			exit(json_encode(($msg)));
		}
		if(IS_POST && $ids){
			$where = array('uid' => array('IN',$ids));
			$status = D("UserRelation")->relation(true)->where($where)->delete();
			$msg = returnMsg("删除用户成功","删除用户失败，请联系管理员",$status);
			//如果成功清楚用户管理缓存
			if($status){
				$userListPageCount = 'user-list-page-count.cache';
				if(!empty(S($userListPageCount))){
					for($i=1;$i<=S($userListPageCount);$i++){
						$userListKey = 'user-list.cache'.$i;
						$userListPageKey = 'user-list-page.cache'.$i;
						S($userListKey,null);
						S($userListPageKey,null);
					}
				}						
			}	
			exit(json_encode(($msg)));
		}
	}
	//角色管理
	public function role(){
		$p = !empty(I('p')) ? I('p') : 1;
		$roleListKey = 'role-list.cache'.$p;
		$roleListPageKey = 'role-list-page.cache'.$p;
		$roleListPageCount = 'role-list-page-count.cache';
	    $role = S($roleListKey);
	    $show = S($roleListPageKey);
	    if($role == null){
			$count = M('AuthGroup')->count();
			$Page  = new \Think\Page($count,C('ADMIN_PAGE_NUM'));// 实例化分页类 传入总记录数和每页显示的记录数(25)
			$total = ceil($count / C('ADMIN_PAGE_NUM'));
			$Page->setConfig('theme','%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
			$Page->setConfig('prev','上一页');
	        $Page->setConfig('next','下一页');
	        $Page->setConfig('first','第一页');
	        $Page->setConfig('last','最后一页');
	        $role = M('AuthGroup')->order('sort asc')->limit($Page->firstRow.','.$Page->listRows)->select();
	        $show = $Page->show();// 分页显示输出	        
	        S($roleListKey,$role,C('ADMIN_ROLE_MANAGE_TIME'));
	        S($roleListPageKey,$show,C('ADMIN_ROLE_MANAGE_TIME'));
	        S($roleListPageCount,$total,C('ADMIN_ROLE_MANAGE_TIME'));
	    }
        $this->assign("rolelist", $role);
        $this->assign("page", $show);
		$this->display();
	}
	//添加或修改角色
	public function addEditRole(){
		if(IS_POST && I('addEditRole')){//处理提交
			$rules = array(
	        //-4,角色名称被占用
	        array('title', '', -3, 0, 'unique', 1),
	        //-1,角色名称必须是中文
	        array('title','/^[\x{4e00}-\x{9fa5}]+$/u',-4,0),
	        );
			$tableRole = M('AuthGroup');
			if($tableRole->validate($rules)->create()){
				if(I('id','','int')){//修改					
					$status = $tableRole->save();
					$msg = returnMsg("角色修改成功","角色修改失败",$status);					
				}else{//添加					
					$status = $tableRole->add();
					$msg = returnMsg("角色用户成功","角色用户失败",$status);								
				}
				//如果成功清楚用户管理缓存
				if($status){
					$roleListPageCount = 'role-list-page-count.cache';
					if(!empty(S($roleListPageCount))){
						for($i=1;$i<=S($roleListPageCount);$i++){
							$roleListKey = 'role-list.cache'.$i;
							$roleListPageKey = 'role-list-page.cache'.$i;
							S($roleListKey,null);
							S($roleListPageKey,null);
						}
					}						
				}		
				exit(json_encode($msg));			
			}
			else
			{
				exit(json_encode($tableRole->getError()));
			}
		}else{//转到页面					
			$id = I('id','','int');
			if($id){//转到编辑页				
				$thisRole = M('AuthGroup')->where(['id'=>$id])->find();
				$this->role = $thisRole;
				$this->display('editRole');
			}else{//转到新增页				
				$this->display('addRole');
			}
		}
	}
	//删除单个角色
	public function delRole(){
		$id = I('id');
		if($id == '1'){
			$msg = returnMsg("","不允许删除原始超级管理员角色",false);
			exit(json_encode(($msg)));
		}
		if(IS_POST && $id){
			$status = M('AuthGroup')->where(['id'=>$id])->delete();
			$msg = returnMsg("删除角色成功","删除角色失败，请联系管理员",$status);
			//如果成功清楚用户管理缓存
			if($status){
				$roleListPageCount = 'role-list-page-count.cache';
				if(!empty(S($roleListPageCount))){
					for($i=1;$i<=S($roleListPageCount);$i++){
						$roleListKey = 'role-list.cache'.$i;
						$roleListPageKey = 'role-list-page.cache'.$i;
						S($roleListKey,null);
						S($roleListPageKey,null);
					}
				}						
			}	
			exit(json_encode(($msg)));
		}
	}
	//角色排序
    public function sortRole(){  
    	if(IS_POST){
    		$sortRole = I('sort');
	        $ids = implode(',', array_keys($sortRole));
	        $sql = "UPDATE hm_auth_group SET sort = CASE id ";
	        foreach ($sortRole as $id => $sort) {
	            $sql .= sprintf("WHEN %d THEN %d ", $id, $sort);
	        }
	        $sql .= "END WHERE id IN ($ids)";
	        $Model = M();
	        $status = $Model->execute($sql);
	        $msg = returnMsg("角色排序成功","角色排序失败",$status);
	        //如果成功清楚用户管理缓存
			if($status){
				$roleListPageCount = 'role-list-page-count.cache';
				if(!empty(S($roleListPageCount))){
					for($i=1;$i<=S($roleListPageCount);$i++){
						$roleListKey = 'role-list.cache'.$i;
						$roleListPageKey = 'role-list-page.cache'.$i;
						S($roleListKey,null);
						S($roleListPageKey,null);
					}
				}						
			}
	        exit(json_encode($msg));
    	}         
    }
    //设置权限
	public function setRole()
	{
		if(I('id') == '1'){
			echo "不允许授权原始超级管理员角色";
			exit;
		}		
		if(IS_POST && I('setRole') == 'setRole'){
			$id = I('id','0','int');
			$data = array(
				'id' => $id,
				'rules' => I('ruleid')
			);
			$status = M("AuthGroup")->save($data);
			$msg = returnMsg("授权权限成功","授权权限失败",$status);
			if($status){
				S('role-auth.cache'.$id,null);
			}
			exit(json_encode($msg));
		}else{
			$id = I('id');
			$roleAuthkey = 'role-auth.cache'.$id;
			$auth = S($roleAuthkey);
			if($auth == null){				
				//加载角色节点权限数据		
				$tableRule = M("AuthRule")->field("id,title as name,pid")->order('sort asc')->select();	
				$tableGroup = M("AuthGroup")->find($id);
				$RuleIds = explode(",",$tableGroup['rules']);
				$data = treeState($tableRule,$RuleIds);	
				$auth = json_encode($data);
				S($roleAuthkey,$auth,C('ADMIN_ROLE_AUTH_TIME'));
			}
			$this->json = $auth;
			$this->id = $id;
			$this->title = I('title');
			$this->display();
		}				
	}
	//开发日志管理
	public function version(){
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
	//添加或修改开发日志
	public function addEditVersion(){
		if(IS_POST && I('addEditVersion')){//处理提交			
			$tableVersion = M('version');
			if($tableVersion->create()){
				if(I('id','','int')){//修改					
					$status = $tableVersion->save();
					$msg = returnMsg("开发日志修改成功","开发日志修改失败",$status);			
				}else{//添加		
					$tableVersion->time = time();			
					$status = $tableVersion->add();
					$msg = returnMsg("开发日志添加成功","开发日志添加失败",$status);			
				}
				//如果成功清楚用户管理缓存
				if($status){
					$versionListPageCount = 'version-list-page-count.cache';
					if(!empty(S($versionListPageCount))){
						for($i=1;$i<=S($versionListPageCount);$i++){
							$versionListKey = 'version-list.cache'.$i;
							$versionListPageKey = 'version-list-page.cache'.$i;
							S($versionListKey,null);
							S($versionListPageKey,null);
						}
					}						
				}		
				exit(json_encode($msg));			
			}
			else
			{
				exit(json_encode($tableRole->getError()));
			}
		}else{//转到页面					
			$id = I('id','','int');
			if($id){//转到编辑页				
				$thisVersion = M('version')->where(['id'=>$id])->find();
				$this->version = $thisVersion;
				$this->display('editVersion');
			}else{//转到新增页				
				$this->display('addVersion');
			}
		}
	}
	//批量删除开发日志
	public function batchDelVersion(){
		$ids = empty(I('id'))?I('ids'):I('id');		
		if(IS_POST && $ids){
			$where = array('id' => array('IN',$ids));
			$status = M('version')->where($where)->delete();
			$msg = returnMsg("删除开发日志成功","删除开发日志失败，请联系管理员",$status);
			//如果成功清楚用户管理缓存
			if($status){
				$versionListPageCount = 'version-list-page-count.cache';
				if(!empty(S($versionListPageCount))){
					for($i=1;$i<=S($versionListPageCount);$i++){
						$versionListKey = 'version-list.cache'.$i;
						$versionListPageKey = 'version-list-page.cache'.$i;
						S($versionListKey,null);
						S($versionListPageKey,null);
					}
				}						
			}
			exit(json_encode($msg));
		}
	}
	public function loginLog(){
		$p = !empty(I('p')) ? I('p') : 1;
		$username = I('username');
        $start_time = I('start_time');
        $end_time = I('end_time');
        $loginip = I('loginip');
        $status = I('status');
        if (!empty($username)) {
            $where['username'] = array('like', '%' . $username . '%');
        }
        if (!empty($start_time) && !empty($end_time)) {
            $start_time = strtotime($start_time);
            $end_time = strtotime($end_time) + 86399;
            $where['logintime'] = array(array('GT', $start_time), array('LT', $end_time), 'AND');
        }
        if (!empty($loginip)) {
            $where['loginip '] = array('like', "%{$loginip}%");
        }
        if ($status != '') {
            $where['status'] = $status;
        }
        $search = md5(serialize($where));        
		$data = S('loginlog');		
	    $login = $data['login-list.cache'.$p.$search];
	    $show = $data['login-list-page.cache'.$p.$search];
	    unset($data);
	    if($login == null){
			$count = M('LoginLog')->where($where)->count();
			$Page  = new \Think\Page($count,C('ADMIN_PAGE_NUM'));// 实例化分页类 传入总记录数和每页显示的记录数(25)
			$total = ceil($count / C('ADMIN_PAGE_NUM'));
			$Page->setConfig('theme','%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
			$Page->setConfig('prev','上一页');
	        $Page->setConfig('next','下一页');
	        $Page->setConfig('first','第一页');
	        $Page->setConfig('last','最后一页');
	        $login = M('LoginLog')->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
	        $show = $Page->show();// 分页显示输出
	        $data['login-list.cache'.$p.$search] =$login;
	        $data['login-list-page.cache'.$p.$search] =$show;  	
	        S('loginlog',$data,C('ADMIN_LOGIN_MANAGE_TIME'));     
	    }
        $this->assign("loginlist", $login);
        $this->assign("page", $show);
		$this->display();
	}
	// 删除上月登录日志
	public function delLoginLog()
	{
		$status = M('LoginLog')->where(array("logintime" => array("lt", time() - (86400 * 30))))->delete();
        $msg = returnMsg("删除登录日志成功！","删除登录日志失败！",$status);
        if($status){
        	S('loginlog',null);
        }
		exit(json_encode($msg));		
	}
	//操作日志管理
	public function operateLog(){
		$p = !empty(I('p')) ? I('p') : 1;
		$username = I('username');
        $start_time = I('start_time');
        $end_time = I('end_time');
        $ip = I('ip');
        $status = I('status');
        if (!empty($username)) {
            $where['username'] = array('like', '%' . $username . '%');
        }
        if (!empty($start_time) && !empty($end_time)) {
            $start_time = strtotime($start_time);
            $end_time = strtotime($end_time) + 86399;
            $where['time'] = array(array('GT', $start_time), array('LT', $end_time), 'AND');
        }
        if (!empty($loginip)) {
            $where['ip '] = array('like', "%{$ip}%");
        }
        if ($status != '') {
            $where['status'] = $status;
        }
        $search = md5(serialize($where));        
		$data = S('operatelog');		
	    $operate = $data['operate-list.cache'.$p.$search];
	    $show = $data['operate-list-page.cache'.$p.$search];
	    unset($data);
	    if($operate == null){
			$count = M('OperateLog')->where($where)->count();
			$Page  = new \Think\Page($count,C('ADMIN_PAGE_NUM'));// 实例化分页类 传入总记录数和每页显示的记录数(25)
			$total = ceil($count / C('ADMIN_PAGE_NUM'));
			$Page->setConfig('theme','%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
			$Page->setConfig('prev','上一页');
	        $Page->setConfig('next','下一页');
	        $Page->setConfig('first','第一页');
	        $Page->setConfig('last','最后一页');
	        $operate = M('OperateLog')->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
	        $show = $Page->show();// 分页显示输出
	        $data['operate-list.cache'.$p.$search] =$login;
	        $data['operate-list-page.cache'.$p.$search] =$show;  	
	        S('operatelog',$data,C('ADMIN_LOGIN_MANAGE_TIME'));     
	    }
        $this->assign("operatelist", $operate);
        $this->assign("page", $show);
		$this->display();
	}
	// 删除上月操作日志
	public function delOperateLog()
	{
		$status = M('OperateLog')->where(array("time" => array("lt", time() - (86400 * 30))))->delete();
        $msg = returnMsg("删除操作日志成功！","删除操作日志失败！",$status);
        if($status){
        	S('operatelog',null);
        }
		exit(json_encode($msg));		
	}
	//数据备份
	public function database($type = null){
		switch ($type) {
			/* 数据备份 */
            case 'export':
            	$Db = \Think\Db::getInstance();
				$list  = $Db->query('SHOW TABLE STATUS');
				$list  = array_map('array_change_key_case', $list);
				foreach ($list as $k => $v) {
		            $list[$k]['size'] = format_size($v['data_length'] + $v['Index_length']);
		            $total+=$v['data_length'] + $v['Index_length'];
		        }
				$count = count($list);
				$this->assign("lists", $list);
				$this->assign("total", format_size($total));
		        $this->assign("tables", $count);
		        break;
		    /* 数据还原 */
            case 'import':
            	//列出备份文件列表
                $path = C('DATA_BACKUP_PATH');
                if(!is_dir($path)){
                    mkdir($path, 0755, true);
                }
                $path = realpath($path);
                $flag = \FilesystemIterator::KEY_AS_FILENAME;
                $glob = new \FilesystemIterator($path,  $flag);

                $list = array();
                foreach ($glob as $name => $file) {
                    if(preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)){
                        $name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');

                        $date = "{$name[0]}-{$name[1]}-{$name[2]}";
                        $time = "{$name[3]}:{$name[4]}:{$name[5]}";
                        $part = $name[6];

                        if(isset($list["{$date} {$time}"])){
                            $info = $list["{$date} {$time}"];
                            $info['part'] = max($info['part'], $part);
                            $info['size'] = $info['size'] + $file->getSize();
                        } else {
                            $info['part'] = $part;
                            $info['size'] = $file->getSize();
                        }
                        $extension        = strtoupper(pathinfo($file->getFilename(), PATHINFO_EXTENSION));
                        $info['compress'] = ($extension === 'SQL') ? '-' : $extension;
                        $info['time']     = strtotime("{$date} {$time}");

                        $list["{$date} {$time}"] = $info;
                    }
                }
                $this->assign('lists', $list);
                break;
            default:
                $this->error('参数错误！');
		}
        $this->display($type);
	}
	/**
     * 备份数据库
     * @param  String  $tables 表名
     * @param  Integer $id     表ID
     * @param  Integer $start  起始行数
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function export($tables = null, $id = null, $start = null){
        if(IS_POST && !empty($tables) && is_array($tables)){ //初始化
            $path = C('DATA_BACKUP_PATH');
            if(!is_dir($path)){
                mkdir($path, 0755, true);
            }
            //读取备份配置
            $config = array(
                'path'     => realpath($path) . DIRECTORY_SEPARATOR,
                'part'     => C('DATA_BACKUP_PART_SIZE'),
                'compress' => C('DATA_BACKUP_COMPRESS'),
                'level'    => C('DATA_BACKUP_COMPRESS_LEVEL'),
            );

            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if(is_file($lock)){
                $this->error('检测到有一个备份任务正在执行，请稍后再试！');
            } else {
                //创建锁文件
                file_put_contents($lock, NOW_TIME);
            }

            //检查备份目录是否可写
            is_writeable($config['path']) || $this->error('备份目录不存在或不可写，请检查后重试！');
            session('backup_config', $config);

            //生成备份文件信息
            $file = array(
                'name' => date('Ymd-His', NOW_TIME),
                'part' => 1,
            );
            session('backup_file', $file);

            //缓存要备份的表
            session('backup_tables', $tables);

            //创建备份文件
            $Database = new Database($file, $config);
            if(false !== $Database->create()){
                $tab = array('id' => 0, 'start' => 0);
                $this->success('初始化成功！', '', array('tables' => $tables, 'tab' => $tab));
            } else {
                $this->error('初始化失败，备份文件创建失败！');
            }
        } elseif (IS_GET && is_numeric($id) && is_numeric($start)) { //备份数据
            $tables = session('backup_tables');
            //备份指定表
            $Database = new Database(session('backup_file'), session('backup_config'));
            $start  = $Database->backup($tables[$id], $start);
            if(false === $start){ //出错
                $this->error('备份出错！');
            } elseif (0 === $start) { //下一表
                if(isset($tables[++$id])){
                    $tab = array('id' => $id, 'start' => 0);
                    $this->success('备份完成！', '', array('tab' => $tab));
                } else { //备份完成，清空缓存
                    unlink(session('backup_config.path') . 'backup.lock');
                    session('backup_tables', null);
                    session('backup_file', null);
                    session('backup_config', null);
                    $this->success('备份完成！');
                }
            } else {
                $tab  = array('id' => $id, 'start' => $start[0]);
                $rate = floor(100 * ($start[0] / $start[1]));
                $this->success("正在备份...({$rate}%)", '', array('tab' => $tab));
            }
        } else { //出错
            $this->error('参数错误！');
        }
    }
    //清除正在执行的备份任务
	public function delBackupLock()
	{
		unlink(C('DATA_BACKUP_PATH') . 'backup.lock');
		$this->success('清除正在执行的备份任务成功！');
	}
	/**
     * 优化表
     * @param  String $tables 表名
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function optimize($tables = null){
        if($tables) {
            $Db   = Db::getInstance();
            if(is_array($tables)){
                $tables = implode('`,`', $tables);
                $list = $Db->query("OPTIMIZE TABLE `{$tables}`");

                if($list){
                    $this->success("数据表优化完成！");
                } else {
                    $this->error("数据表优化出错请重试！");
                }
            } else {
                $list = $Db->query("OPTIMIZE TABLE `{$tables}`");
                if($list){
                    $this->success("数据表'{$tables}'优化完成！");
                } else {
                    $this->error("数据表'{$tables}'优化出错请重试！");
                }
            }
        } else {
            $this->error("请指定要优化的表！");
        }
    }

    /**
     * 修复表
     * @param  String $tables 表名
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function repair($tables = null){
        if($tables) {
            $Db   = Db::getInstance();
            if(is_array($tables)){
                $tables = implode('`,`', $tables);
                $list = $Db->query("REPAIR TABLE `{$tables}`");

                if($list){
                    $this->success("数据表修复完成！");
                } else {
                    $this->error("数据表修复出错请重试！");
                }
            } else {
                $list = $Db->query("REPAIR TABLE `{$tables}`");
                if($list){
                    $this->success("数据表'{$tables}'修复完成！");
                } else {
                    $this->error("数据表'{$tables}'修复出错请重试！");
                }
            }
        } else {
            $this->error("请指定要修复的表！");
        }
    }
    /**
     * 删除备份文件
     * @param  Integer $time 备份时间
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function delData($id = 0){
        if($id){
            $name  = $id . '-*.sql*';
            $path  = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . $name;
            array_map("unlink", glob($path));
            if(count(glob($path))){
                $this->error('备份文件删除失败，请检查权限！');
            } else {
                $this->success('备份文件删除成功！');
            }
        } else {
            $this->error('参数错误！');
        }
    }
    /**
     * 还原数据库
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function import($time = 0, $part = null, $start = null){
        if(is_numeric($time) && is_null($part) && is_null($start)){ //初始化
            //获取备份文件信息
            $name  = date('Ymd-His', $time) . '-*.sql*';
            $path  = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . $name;
            $files = glob($path);
            $list  = array();
            foreach($files as $name){
                $basename = basename($name);
                $match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
                $gz       = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
                $list[$match[6]] = array($match[6], $name, $gz);
            }
            ksort($list);

            //检测文件正确性
            $last = end($list);
            if(count($list) === $last[0]){
                session('backup_list', $list); //缓存备份列表
                $this->success('初始化完成！', '', array('part' => 1, 'start' => 0));
            } else {
                $this->error('备份文件可能已经损坏，请检查！');
            }
        } elseif(is_numeric($part) && is_numeric($start)) {
            $list  = session('backup_list');
            $db = new Database($list[$part], array(
                'path'     => realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR,
                'compress' => $list[$part][2]));

            $start = $db->import($start);

            if(false === $start){
                $this->error('还原数据出错！');
            } elseif(0 === $start) { //下一卷
                if(isset($list[++$part])){
                    $data = array('part' => $part, 'start' => 0);
                    $this->success("正在还原...#{$part}", '', $data);
                } else {
                    session('backup_list', null);
                    $this->success('还原完成！');
                }
            } else {
                $data = array('part' => $part, 'start' => $start[0]);
                if($start[1]){
                    $rate = floor(100 * ($start[0] / $start[1]));
                    $this->success("正在还原...#{$part} ({$rate}%)", '', $data);
                } else {
                    $data['gz'] = 1;
                    $this->success("正在还原...#{$part}", '', $data);
                }
            }

        } else {
            $this->error('参数错误！');
        }
    }
    public function sendEmail($time){
    	if($time){
    		$subject = '你好，下面是数据备份文件';
            $name  = date('Ymd-His', $time) . '-*.sql*';
            $path  = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . $name;
            $forpath = glob($path);
            foreach($forpath as $k => $v)
            {
            	\Intendant\Model\EmailModel::sendEmail('河马叔叔','8192332@qq.com','',$v,$subject);
            }
        } else {
            $this->error('参数错误！');
        }
    }
}