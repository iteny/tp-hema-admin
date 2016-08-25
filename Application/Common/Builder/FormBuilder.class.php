<?php 
namespace Common\Builder;
use Think\View;
use Common\Builder\CommonController;
class FormBuilder extends CommonController{
	private $meta_title;                  // 页面标题
	private $tab_nav = [];     	  		  // 页面Tab导航
	private $post_url;                    // 表单提交地址
	private $form_tag = [];  			  // 表单项目
	private $form_data = [];   			  // 表单数据
	private $template;              	  // 模版
	/**
     * 初始化方法
     * @return $this
     */
    protected function _initialize() {
        $this->template = APP_PATH.'Common/Builder/Layout/form.html';
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
    public function setTabNav($tab_list, $current_tab) {
        $this->tab_nav = array('tab_list' => $tab_list, 'current_tab' => $current_tab);
        return $this;
    }
}