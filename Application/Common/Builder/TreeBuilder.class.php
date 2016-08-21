<?php 
namespace Common\Builder;
use Think\View;
use Common\Builder\CommonController;
class TreeBuilder extends CommonController{
	private $meta_title;                  // 页面标题
    private $top_toolbar = array();   	  // 顶部工具栏按钮组
    private $bottom_toolbar = array();	  // 底部工具栏按钮组
    private $sort = 'sort';                 // 是否启用表格数据排序的html
    private $table_column_list = array(); // 表格标题字段
    private $table_data_list   = array(); // 表格数据列表
    private $table_data_list_key = 'id';  // 表格数据列表主键字段名
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
        $sortField = $sortField ? : 'sort';
        $sort = $sort ? : 'asc';
        $conAction = CONTROLLER_NAME.'-'.ACTION_NAME;
        $menu = S($conAction);
        if($menu == null){
            $menu = M($table)->order($sortField.' '.$sort)->select();
            $menu = recursive($menu);
            S($conAction,$menu,C('AUTH_MENU_TIME'));
        }       
        return $menu;
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
     * 设置表格数据排序和勾选的html
     * @param $sort     只要不为null,就表示启用(如果启用,那么得填写排序数据字段,不可以是主键)
     */
    public function setCheckboxSort($sort=null){
        $sort = $sort ? : 'sort';
        $this->sort = $sort;
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
    /**
     * 底部工具栏按钮
     * @param string $type 按钮类型
     * @param string $action 提交到方法
     * @param string $title 修改按钮的标题
     * @param string $controller 如果你需要切换到别的控制器下处理，比如填写这个参数
     */
    public function addBottomButton($type,$action,$bicon = null,$title = null,$dataType=null,$dateTitle=null, $controller = null) {
        switch ($type) {
            case 'sort':  // 排序按钮
                //预定义按钮属性以简化使用
                $button['title'] = $title ? : '排序';
                $button['class'] = 'btn ajax-sort';
                $button['bicon'] = $bicon ? : '&#xe61a;';
                $controller = $controller ? : CONTROLLER_NAME;;  // 是否切换控制器
                $button['href']  = U(MODULE_NAME.'/'.$controller.'/'.$action);
                // 这个按钮定义好了把它丢进按钮池里
                $this->bottom_toolbar[] = $button;
                break;
        }
        return $this;
    }
    /**
     * 加一个表格标题字段
     * @param $name 数据字段名(必填)
     * @param $title 表格标题(此项必须填写,否则表格将无法显示标题)
     * @param $type 格式化数据的类型(下面的display方法,可以自定义自己的格式化数据)
     * @param $param 参数
     * @param $align td位置(left,center,right),默认是居中center
     * @param $width td宽度,默认是auto
     */
    public function addTableColumn($name,$title,$type=null,$param=null,$align=null,$width=null){
        $align = $align ? : 'center';
        $width = $width ? : 'auto';
        $column = array(
            'name'  => $name,
            'title' => $title,
            'type'  => $type,
            'param' => $param,
            'align' => $align,
            'width' => $width
        );
        $this->table_column_list[] = $column;
        return $this;
    }
    /**
     * 表格数据列表
     */
    public function setTableDataList($table_data_list) {
        $this->table_data_list = $table_data_list;
        return $this;
    }
    /**
     * 表格数据列表的主键名称
     */
    public function setTableDataListKey($table_data_list_key) {
        $this->table_data_list_key = $table_data_list_key;
        return $this;
    }
    /**
     * 表格数据最后一排操作按钮
     * @param string $type 按钮类型
     * @param string $action 提交到方法
     * @param string $title 修改按钮的标题
     * @param string $dataType 这里设定弹出框的提示信息
     * @param string $dateTitle 这里设定设置弹出框具体操作那一个数据提示信息
     * @param string $controller 如果你需要切换到别的控制器下处理，比如填写这个参数
     */
    public function addRightButton($type,$action,$bicon = null,$title = null,$dataType=null,$dateTitle=null, $controller = null) {
        switch ($type) {
            case 'add':  // 编辑按钮
                // 预定义按钮属性以简化使用
                $button['title'] = $title ? : '添加子菜单';
                $button['class'] = 'ajax-add blue';
                $button['datatype'] = $dataType ? : '这个';
                $button['datatitle'] = $dateTitle ? : '东西';
                $button['bicon'] = $bicon ? : '&#xe615;';
                $controller = $controller ? : CONTROLLER_NAME;  // 是否切换控制器
                $button['href']  = U(MODULE_NAME.'/'.$controller.'/'.$action);
                // 这个按钮定义好了把它丢进按钮池里
                $this->table_right_toolbar[] = $button;
                break;    
            case 'edit':  // 编辑按钮
                // 预定义按钮属性以简化使用
                $button['title'] = $title ? : '修改';
                $button['class'] = 'ajax-add blue';
                $button['datatype'] = $dataType ? : '这个';
                $button['datatitle'] = $dateTitle ? : '东西';
                $button['bicon'] = $bicon ? : '&#xe615;';
                $controller = $controller ? : CONTROLLER_NAME;  // 是否切换控制器
                $button['href']  = U(MODULE_NAME.'/'.$controller.'/'.$action);
                // 这个按钮定义好了把它丢进按钮池里
                $this->table_right_toolbar[] = $button;
                break;            
            case 'del':
                // 预定义按钮属性以简化使用
                $button['title'] = '删除';
                $button['class'] = 'ajax-del red';
                $button['datatype'] = $dataType ? : '这个';
                $button['datatitle'] = $dateTitle ? : '东西';
                $button['bicon'] = $bicon ? : '&#xe614;';
                $controller = $controller ? : CONTROLLER_NAME;  // 是否切换控制器
                $button['href'] = U(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.$action);
                // 这个按钮定义好了把它丢进按钮池里
                $this->table_right_toolbar[] = $button;
                break;
                
        }
        return $this;
    }
    /**
     * 设置页面模版
     * @param $template 模版,在初始化类的时候已经指定模板,所以通常不需要设置
     */
    public function setTemplate($template) {
        $this->template = $template;
        return $this;
    }
    /**
     * 显示页面
     */
    public function display() {
        // 编译data_list中的值
        foreach ($this->table_data_list as &$data) {
            // 编译表格右侧按钮
            if ($this->table_right_toolbar) {
                foreach ($this->table_right_toolbar as $right_button) {
                    // 禁用按钮与隐藏比较特殊，它需要根据数据当前状态判断是显示禁用还是启用
                    // if ($right_button['type'] === 'forbid' || $right_button['type'] === 'hide'){
                    //     $right_button = $right_button[$data['status']];
                    // }

                    // 将约定的标记__data_id__替换成真实的数据ID
                    // $right_button['href'] = preg_replace(
                    //     '/data_id/i',
                    //     $data[$this->_table_data_list_key],
                    //     $right_button['href']
                    // );
                    if(!empty($this->window_title)){
                        $data[$right_button['datatitle']] = $this->window_title;
                    }
                    // 编译按钮属性
                    // $right_button['attribute'] = $this->compileHtmlAttr($right_button);
                    // $data['right_button'] .= '<a '.$right_button['attribute']
                    //                       .'>'.$right_button['title'].'</a> ';
                    $data['right_button'] .= '<a class="'.$right_button['class'].'" href="'.$right_button['href'].'/?'.$this->table_data_list_key.'='.$data[$this->table_data_list_key].'&title='.$data[$right_button['datatitle']].'" data-id="'.$data[$this->table_data_list_key].'" data-title="'.$data[$right_button['datatitle']].'" data-type="'.$right_button['datatype'].'"><i class="iconfont" style="color:white;font-size: 16px;">'.$right_button['bicon'].'</i>&nbsp;&nbsp;'.$right_button['title'].'</a>&nbsp;&nbsp;&nbsp;';

                }
            }

            // 根据表格标题字段指定类型编译列表数据
            foreach ($this->table_column_list as &$column) {
                switch ($column['type']) {
                    //状态1:√,0:×。切换图标
                    case 'status':
                        switch($data[$column['name']]){
                            case '1':
                                $data[$column['name']] = '<i class="iconfont" style="color:green;font-size: 16px;">&#xe60c;</i>';
                                break;
                            case '0':
                                $data[$column['name']] = '<i class="iconfont" style="color:red;font-size: 16px;">&#xe60a;</i>';
                                break;
                        }
                        break;
                    //将无限极分类的字段隔开
                    case 'title':
                        $data[$column['name']] = str_repeat('&nbsp;&nbsp;&nbsp;',$data['level']).$data['html'].'<i class="iconfont icon" style="">'.$data['icon'].'</i>'.$data[$column['name']];
                        break;
                    //将字符串，用悬浮消息框输出
                    case 'remark':
                        $data[$column['name']] = '<a class="bsn blue" title="'.$data[$column['name']].'" style="cursor:pointer"><i class="iconfont iconfont_btn">&#xe613;</i>&nbsp;悬停</a>';
                        break;
                    //将字节转换kb,mb
                    case 'byte':
                        $data[$column['name']] = format_size($data[$column['name']]);
                        break;
                    //将字段的图标输出,只能是字体图标
                    case 'icon':
                        $data[$column['name']] = '<i class="iconfont" style="color:red;font-size: 16px;">'.$data[$column['name']].'</i>';
                        break;
                    //降时间戳转换成正常时间显示
                    case 'timestamp':
                        $data[$column['name']] = date('Y年m月d日 H:i:s',$data[$column['name']]);
                        break;
                    case 'date':
                        $data[$column['name']] = time_format($data[$column['name']], 'Y-m-d');
                        break;
                    case 'datetime':
                        $data[$column['name']] = time_format($data[$column['name']]);
                        break;
                    case 'time':
                        $data[$column['name']] = time_format($data[$column['name']]);
                        break;
                    case 'img_path':
                        $data[$column['name']] = '<img class="picture" src="'.$data[$column['name']].'">';
                        break;
                    case 'img_id':
                        $data[$column['name']] = '<img class="picture" src="'.get_cover($data[$column['name']]).'">';
                        break;
                    //输出关联模型下一层的数据
                    case 'relation':
                        $data[$column['name']] = $data[$column['name']][0][$column['param']];
                        break;
                    // case 'callback': // 调用函数
                    //     if (is_array($column['param'])) {
                    //         $data[$column['name']] = call_user_func_array($column['param'], array($data[$column['name']]));
                    //     } else {
                    //         $data[$column['name']] = call_user_func($column['param'], $data[$column['name']]);
                    //     }
                    //     break;
                }
            }

            /**
             * 修改列表数据
             * 有时候列表数据需要在最终输出前做一次小的修改
             * 比如管理员列表ID为1的超级管理员右侧编辑按钮不显示删除
             */
            if ($this->alter_data_list) {
                foreach ($this->alter_data_list as $alter) {
                    if ($data[$alter['field']['key']] === $alter['field']['value']) {
                        $data[$alter['alter_data']['key']] = $alter['alter_data']['value'];
                    }
                }
            }
        }

        //编译top_button_list中的HTML属性
        // if ($this->top_button_list) {
        //     foreach ($this->top_button_list as &$button) {
        //         $button['attribute'] = $this->compileHtmlAttr($button);
        //     }
        // }

        $this->assign('meta_title',          $this->meta_title);          // 页面标题
        $this->assign('top_toolbar',         $this->top_toolbar);         // 顶部工具栏按钮
        $this->assign('bottom_toolbar',      $this->bottom_toolbar);      // 底部工具栏按钮
        $this->assign('search',              $this->search);              // 搜索配置
        $this->assign('sort',                $this->sort);                // 排序html
        $this->assign('checkbox',            $this->checkbox);            // 勾选html
        // $this->assign('tab_nav',             $this->_tab_nav);         // 页面Tab导航
        $this->assign('table_column_list',   $this->table_column_list);   // 表格的列
        $this->assign('table_data_list',     $this->table_data_list);     // 表格数据
        $this->assign('table_data_list_key', $this->table_data_list_key); //表格数据主键字段名称
        $this->assign('table_data_page',     $this->table_data_page);      // 表示个数据分页
        $this->assign('table_right_toolbar',   $this->table_right_toolbar);// 表格右侧操作按钮
        $this->assign('alter_data_list',     $this->alter_data_list);      // 表格数据列表重新修改的项目
        $this->assign('extra_html',          $this->extra_html);           // 额外HTML代码
        parent::display($this->template);
    }
}