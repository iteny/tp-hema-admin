<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
	public function index(){
		//使用Builder建立数据列表页面
        $builder = new \Common\Builder\ListBuilder();
        $data = $builder->getDataList('Version',null,'time','desc',null);
        $builder->addTopButton('refresh')
        		->addTopButton('add','addVersion')
        		->addBottomButton('delBatch','delVersion',null,'批量删除','开发日志')
        		->addRightButton('edit','editVersion',null,null,'开发日志','id')
        		->addRightButton('del','delVersion',null,null,'开发日志','id')        		
        		->setCheckboxSort(1,null)
        		->addTableColumn('id','编号',null,null,null,40)
        		->addTableColumn('version','版本号',null,null,null,150)
        		->addTableColumn('time','日志时间','timestamp',null,null,100)
        		->addTableColumn('remark','更新内容','remark',null,null,100)        		
        		->addTableColumn('right_button', '操作管理', 'btn',null,null,300)
        		->setTableDataList($data['list'])    // 数据列表
                ->setTableDataPage($data['show']) // 数据列表分页
        		->display();
	}
}