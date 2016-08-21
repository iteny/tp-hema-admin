<?php 
namespace Common\Builder;
use Think\View;
use Common\Builder\CommonController;
class TreeBuilder extends CommonController{
	private $meta_title;                  // 页面标题
    private $top_toolbar = array();   	  // 顶部工具栏按钮组
    private $bottom_toolbar = array();	  // 底部工具栏按钮组
    private $table_column_list = array(); // 表格标题字段
    private $table_data_list   = array(); // 表格数据列表
    private $table_right_toolbar = array(); // 表格右侧操作按钮组
    private $template;                    // 模版
    /**
     * 初始化方法
     */
    protected function _initialize() {
        $this->template = APP_PATH.'Common/Builder/Layout/tree.html';
    }
    /**
     * 得到tree数据列表
     * @param $table 设置表名
     * @param $sortField 排序字段名,允许为主键,排序的时候需要用到，可以更改
     * @param $sort 设置排序的方式,asc升序,desc倒序
     */
    public function getDataList($table,$sortField=null,$sort=null){

    }
    /**
     * 设置页面标题
     * @param $title 标题文本
     * @return $this
     */
    public function setMetaTitle($meta_title) {
        $this->meta_title = $meta_title;
        return $this;
    }
    /**
     * 顶部工具栏按钮
     * @param string $type 按钮类型
     * @param string $action 提交到方法
     * @param string $title 修改按钮的标题
     * @param string $controller 如果你需要切换到别的控制器下处理，比如填写这个参数
     */
    public function addTopButton($type,$action,$bicon = null,$title = null, $controller = null) {
        switch ($type) {
            case 'add':  // 添加新增按钮
                // 预定义按钮属性以简化使用
                $button['title'] = '添加';
                $button['class'] = 'btn btn-primary';
                $button['bicon'] = $bicon ? : '&#xe610;';
                $controller = $controller ? : CONTROLLER_NAME;  // 是否切换控制器
                $button['href']  = U(MODULE_NAME.'/'.$controller.'/'.$action);
                // 这个按钮定义好了把它丢进按钮池里
                $this->top_toolbar[] = $button;
                break;
            case 'refresh':  // 添加启用按钮(禁用的反操作)
                //预定义按钮属性以简化使用
                $button['title'] = '刷新';
                $button['class'] = 'btn btn-primary';
                $button['bicon'] = $bicon ? : '&#xe608;';
                $controller = $controller ? : CONTROLLER_NAME;  // 是否切换控制器
                $action = $action ? : ACTION_NAME;
                $button['href']  = U(MODULE_NAME.'/'.$controller.'/'.$action);
                // 这个按钮定义好了把它丢进按钮池里
                $this->top_toolbar[] = $button;
                break;            
        }
        return $this;
    }
}