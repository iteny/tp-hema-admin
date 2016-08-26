<?php
namespace Intendant\Controller;
use Think\Controller;
class TestController extends AuthController {
        public function index(){
                $table = D('ConfigRelation');
                $m = $table->relation(true)->where(['pid' => 0])->select();
                $this->assign('list',$m);
                $this->display(APP_PATH.'Common/Builder/Layout/form.html');
                // echo D('ConfigRelation')->getLastSql();
                // echo M('config')->getLastSql();
                // echo M('config')->getLastSql();
                // $ss = M(); // 实例化一个model对象 没有对应任何数据表
                // $aa = $ss->query("SELECT a.*,b.* FROM hm_config a,hm_config b where a.id=b.pid");
                // p($aa);

        }
}