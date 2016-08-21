<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
	public function index(){
		//使用Builder建立数据列表页面
        $builder = new \Common\Builder\TreeBuilder();
        $data = $builder->getDataList('AuthRule');
        $builder->setMetaTitle('菜单设置')
                ->addTopButton('refresh')
		->addTopButton('add','addMenu')
		->addBottomButton('sort','sortMenu',null,null,'菜单')
                ->addRightButton('add','addMenu',null,null,'菜单','id')
		->addRightButton('edit','editMenu',null,null,'菜单','id')
		->addRightButton('del','delMenu',null,null,'菜单','id')        		
		->addTableColumn('id','编号',null,null,null,40)
		->addTableColumn('title','菜单名称','title',null,'left',240)
		->addTableColumn('name','控制器方法',null,null,null,160)
		->addTableColumn('isshow','是否显示','status',null,null,20)        		
		->addTableColumn('right_button', '操作管理', 'btn',null,null,160)
		->setTableDataList($data)    // 数据列表
        	->display();
	}
}