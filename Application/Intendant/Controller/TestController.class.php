<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
	public function index(){
		// 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->display();
	}
}