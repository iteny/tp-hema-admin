<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
	public function index(){		
		//使用Builder建立数据列表页面
        $builder = new \Common\Builder\ListBuilder();
        $data = $builder->getDataList('OperateLog','true','id','status','username','ip','time');
        $builder->addTopButton('refresh')
        		->addTopButton('add','addTest')
        		->addBottomButton('del','delrizhi','删除一个月前的操作日志','操作日志','一个月前')
        		->setSearch(1,1,1,1)
        		->addTableColumn('id','编号',null,null,40)
        		->addTableColumn('username','用户名',null,null,100)
        		->addTableColumn('info','操作说明',null,null,400)
        		->addTableColumn('get','请求路径',null,null,400)
        		->addTableColumn('status','状态','status',null,40)
        		// ->addTableColumn('useragent','用户浏览器信息')
        		->addTableColumn('time','时间','timestamp',null,300)
        		->addTableColumn('ip','IP',null,null,100)
        		->addTableColumn('country','用户登录地区',null,null,100)
        		->setTableDataList($data['list'])    // 数据列表
                ->setTableDataPage($data['show']) // 数据列表分页
        		->display();
	}
}