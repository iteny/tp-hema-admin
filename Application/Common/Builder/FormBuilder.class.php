<?php 
namespace Common\Builder;
use Think\View;
use Common\Builder\CommonController;
class FormBuilder extends CommonController{
	private $meta_title;                  // 页面标题
	private $tab_nav = null;     	  		  // 页面Tab导航
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
    /**
     * 只要参数不设置null,tab就是开启的,如果开启那么传递的数据也必须是关联模型的数据
     */
    public function setTabNav($tab_status) {
    	$tab_status = $tab_status ? : 'true';
        $this->tab_nav = $tab_status;
        return $this;
    }
    /**
     * 设置表单提交地址
     * @param $post_url 提交地址
     */
    public function setPostUrl($post_url) {
        $this->post_url = $post_url;
        return $this;
    }
    /**
     * 加入一个表单项
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * @author jry <598821125@qq.com>
     */
    public function addFormField($name, $type, $title, $tip, $options = array(), $extra_class = '', $extra_attr = '') {
        $item['name'] = $name;
        $item['type'] = $type;
        $item['title'] = $title;
        $item['tip'] = $tip;
        $item['options'] = $options;
        $item['extra_class'] = $extra_class;
        $item['extra_attr'] = $extra_attr;
        $this->_form_items[] = $item;
        return $this;
    }
    /**
     * 设置表单表单数据
     * @param $form_data 表单数据
     * @return $this
     * @author jry <598821125@qq.com>
     */
    public function setFormData($form_data) {
        $this->_form_data = $form_data;
        return $this;
    }
}