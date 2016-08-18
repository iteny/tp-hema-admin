<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
	public function index(){
		//使用Builder建立数据列表页面
        $builder = new \Common\Builder\ListBuilder();
        $data = $builder->getDataList('UserRelation','no','uid','status','username','create_ip','create_time');
        $builder->addTopButton('refresh')
        		->addTopButton('add','addUser')
        		->addBottomButton('delBatch','delrizhi','批量删除')
        		->addRightButton('edit','editUser',null,null,'用户','username')
        		->addRightButton('del','delUser',null,null,'用户','username')
        		->setSearch(1,1,1,1)
        		->setTableDataListKey('uid')
        		->addTableColumn('uid','编号',null,null,'center',40)
        		->addTableColumn('username','用户名',null,null,'center',150)
        		->addTableColumn('usergroup','所属用户组','relation','title','center',200)
        		->addTableColumn('create_time','创建时间','timestamp',null,'center',300)
        		->addTableColumn('create_ip','创建IP',null,null,'center',200)
        		->addTableColumn('email','邮箱',null,null,'center',200)
        		->addTableColumn('remark','备注','remark',null,'center',100)
        		->addTableColumn('status','是否启用','status',null,'center',100)
        		->addTableColumn('right_button', '操作管理', 'btn',null,'center',200)
        		->setTableDataList($data['list'])    // 数据列表
                ->setTableDataPage($data['show']) // 数据列表分页
        		->display();
	}
}