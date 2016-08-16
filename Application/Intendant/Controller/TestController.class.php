<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
	public function index(){
		
		
		// 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $data = $builder->getDataList('LoginLog');
        // p($data['list']);
        $builder->addTopButton('refresh')
        		->addTopButton('add','addTest')
        		->addBottomButton('del','delrizhi','删除一个月前的登录日志')
        		->setSearch(1,1,1,1)
        		->addTableColumn('id','编号')
        		->addTableColumn('username','用户名')
        		->addTableColumn('info','登录信息')
        		->addTableColumn('status','状态','status')
        		->addTableColumn('useragent','用户浏览器信息')
        		->addTableColumn('logintime','时间','timestamp')
        		->addTableColumn('loginip','IP')
        		->addTableColumn('country','用户登录地区')
        		->setTableDataList($data['list'])    // 数据列表
                ->setTableDataPage($data['show']) // 数据列表分页
        		->display();
	}
}