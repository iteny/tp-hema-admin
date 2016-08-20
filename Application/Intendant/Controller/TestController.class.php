<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
	public function index(){
		//使用Builder建立数据列表页面
        $builder = new \Common\Builder\ListBuilder();
        $data = $builder->getDataList('AuthGroup',null,'sort','asc',null);
        $builder->addTopButton('refresh')
        		->addTopButton('add','addRole')
        		->addBottomButton('sort','sortRole',null,null,'角色')
        		->addBottomButton('delBatch','delRole',null,'批量删除','角色')
        		->addRightButton('edit','setRole','&#xe617;','权限设置','角色','title')
        		->addRightButton('edit','editRole',null,null,'角色','title')
        		->addRightButton('del','delRole',null,null,'角色','title')
        		->alterTableData(//修改当角色ID为1是不可以对他进行任何操作
        			['key' => 'id', 'value' => '1'],
        			['key' => 'right_button', 'value' => '<a class="black"><i class="iconfont iconfont_btn">&#xe617;</i>&nbsp;&nbsp;权限设置</a>&nbsp;&nbsp;&nbsp;<a class="black"><i class="iconfont iconfont_btn">&#xe615;</i>&nbsp;&nbsp;修改</a>&nbsp;&nbsp;&nbsp;<a class="black"><i class="iconfont iconfont_btn">&#xe614;</i>&nbsp;&nbsp;删除</a>&nbsp;&nbsp;&nbsp;']
        		)
        		->setSearch(1)
        		->setCheckboxSort(1,'sort')
        		->addTableColumn('id','编号',null,null,'center',40)
        		->addTableColumn('title','角色名称',null,null,'left',150)
        		->addTableColumn('status','是否启用','status',null,'center',100)
        		->addTableColumn('remark','备注','remark',null,'center',100)        		
        		->addTableColumn('right_button', '操作管理', 'btn',null,'center',300)
        		->setTableDataList($data['list'])    // 数据列表
                ->setTableDataPage($data['show']) // 数据列表分页
        		->display();
	}
}