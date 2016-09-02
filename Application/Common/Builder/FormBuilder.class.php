<?php 
namespace Common\Builder;
use Think\View;
use Common\Builder\CommonController;
class FormBuilder extends CommonController{
	private $meta_title;                  // 页面标题
	private $tab_nav = null;     	      // 页面Tab导航
	private $post_url = '/'.MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;// 表单提交地址
	private $form_tag = [];  			  // 表单标签
	private $form_data = [];   			  // 表单数据
    private $extra_tag = [];              // 额外的表单标签
	private $template;              	  // 模版
    private $margin;                      // 解决form模板内容区域的距离问题
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
    public function setMetaTitle($meta_title,$margin = null) {
        $this->meta_title = $meta_title;
        $this->margin = $margin;
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
     * @param $name 表单名当为编辑模式时与数据表字段对应
     * @param $type 表单类型(内置的好多种,具体看手册)
     * @param $title 表单标题
     * @param $tip 表单输入的说明信息
     * @param $option 默认是添加模式,修改为任意其他字符串,就可改变为编辑模式建议写edit,radio,select模板都有用到
     * @param $extra_class 扩展样式
     * @param $relation 当为编辑模式时,后台数据关联时,使用
     */
    public function addFormTag($name, $type, $title, $tip =null,$option= 'add', $extra_class = null, $relation = null) {
        $field['name'] = $name;
        $field['type'] = $type;
        $field['title'] = $title;
        $field['tip'] = $tip;      
        $field['option'] = $option;    
        $field['extra_class'] = $extra_class;
        $field['relation'] = $relation;
        $this->form_tag[] = $field;
        return $this;
    }
    /**
     * 设置表单表单数据
     * @param $form_data 表单数据
     * @return $this
     * @author jry <598821125@qq.com>
     */
    public function setFormData($form_data) {
        $this->form_data = $form_data;
        return $this;
    }
    /**
     * 显示页面
     * @author jry <598821125@qq.com>
     */
    public function display() {
        if($this->tab_nav == null){
            //额外已经构造好的表单项目与单个组装的的表单项目进行合并
            $this->form_tag = array_merge($this->form_tag, $this->extra_tag);

            //编译表单值
            if ($this->form_data) {
                foreach ($this->form_tag as &$tag) {
                    if ($this->form_data[$tag['name']]) {
                        $tag['value'] = $this->form_data[$tag['name']];
                    }
                }
            }
        }else{
            $this->assign('form_data',  $this->form_data);  //页面标题
        }
        $this->assign('meta_title',  $this->meta_title);  //页面标题
        $this->assign('margin',  $this->margin);  //页面标题
        $this->assign('tab_nav',     $this->tab_nav);     //页面Tab导航
        $this->assign('post_url',    $this->post_url);    //标题提交地址
        $this->assign('form_tag',  $this->form_tag);  //表单项目
        $this->assign('submit_type', $this->submit_type); //提交的方式,get,post
        $this->assign('extra_js',  $this->extra_js);  //额外的js代码
        parent::display($this->template);
    }
}