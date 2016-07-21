<?php
//得到该分类下所有分类的ID
function get_all_child($array,$id)
{
	$arr = array();
	foreach($array as $v)
	{
		if($v['pid'] == $id)
		{
			$arr[] =$v['id'];
			$arr = array_merge($arr,get_all_child($array,$v['id']));
		}
	}
	return $arr;
}
/**
 * [doReturn 返回前端ajax处理数据结果]
 * @param  string $success [成功信息]
 * @param  string $error   [失败信息]
 * @param  [type] $status  [处理数据结果]
 * @return [type]          [description]
 */
function returnMsg($success = '成功',$error = '失败',$status){
	if($status !== false){
		$msg = array(
			"status" => true,
			"info" => $success
		);
		\Intendant\Model\RecordModel::record($success,1);
	} else {
		$msg = array(
			"status" => false,
			"info" => $error
		);
		\Intendant\Model\RecordModel::record($error,0);
	}
	return $msg;
}
/**
 * 递归重新排序无限极分类数组
 */
function recursive($array,$pid=0,$level=0)
{
	$arr = array();
	foreach($array as $v)
	{
		if($v['pid'] == $pid)
		{
			if($level < 5){
				$v['level'] = $level;
				$v['html'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',$level);
				$arr[] = $v;
				$arr = array_merge($arr,recursive($array,$v['id'],$level+1));
			}
		}
	}
	return $arr;
}
function category($array,$pid=0,$level=0)
{
	$arr = array();
	foreach($array as $v)
	{
		if($v['pid'] == $pid)
		{
			if($level < 2){
				$v['level'] = $level;
				$v['html'] = str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',$level);
				$arr[] = $v;
				$arr = array_merge($arr,recursive($array,$v['id'],$level+1));
			}
		}
	}
	return $arr;
}
/**
 * 递归重新排序无限极分类数组
 */
function recursiveTwo($arr,$pid=0,$level=0)
{
	$array = array();
	foreach($arr as $v)
	{
		if($v['pid'] == $pid)
		{
			$v['level'] = $level;
			$v['html'] = str_repeat(' ',$level);
			$array[] = $v;
			$array = array_merge($array,recursiveTwo($arr,$v['id'],$level+1));
		}
	}
	return $array;
}
function categoryTwo($arr,$pid=0,$level=0)
{
	$array = array();
	foreach($arr as $v)
	{
		if($v['pid'] == $pid)
		{
			$v['level'] = $level;
			$v['html'] = str_repeat(' ',$level);
			$array[] = $v;
			$array = array_merge($array,recursiveTwo($arr,$v['id'],$level+1));
		}
	}
	return $array;
}
/**
 * [treeRule 菜单无限极]
 * @param  [type] $data    [菜单数据]
 * @param  string $rule_id [菜单rule_id]
 * @return [type]          [description]
 */
function treeRule($data,$pid = '0'){
	$tree = array();
	foreach($data as $v){
		if($v['pid'] == $pid){
			$v['children'] = treeRule($data,$v['id']);
			$tree[] = $v;
		}
	}
	return $tree;
}
/**
 * [treeState 树形数据状态收缩]
 * @param  [type] $data  [description]
 * @param  [type] $rules [description]
 * @return [type]        [description]
 */
function treeState($data,$rules){//其实主要用与菜单数据，其他的树形数据也可以通用
	foreach($data as $k=>$v){

		if(is_array($v['children']) && count($v['children']) != 0){
			if(isset($rules) && in_array($v['id'],$rules)){//判断是否让数据具有选中效果
				$data[$k]["checked"] = true;
			}
			$data[$k]["open"] = "true";
			if(isset($rules)){//判断是否让数据具有选中效果
				$data[$k]["children"] = treeState($data[$k]["children"],$rules);
			} else {
				$data[$k]["children"] = treeState($data[$k]["children"]);
			}

		} else {
			if(isset($rules) && in_array($v['id'],$rules)){//判断是否让数据具有选中效果
				$data[$k]["checked"] = true;
			}
		}
	}
	return $data;
}
//获得图片与文件的列表
function getFileBackupList() {
    $list = array();
    $size = 0;
    $handle = opendir(C('FILE_BACKUP_PATH'));

    while ($file = readdir($handle)) {
        if ($file != "." && $file != "..") {
            $tem = array();
            $tem['file'] = $file; //  checkCharset($file);
            $_size = filesize(C('FILE_BACKUP_PATH') . "$file");
            $tem['size'] = format_size($_size);
            $tem['time'] = date("Y年m月d日 H:i:s", filectime(C('FILE_BACKUP_PATH') . "$file"));
            $size+=$_size;
            $list[] = $tem;
        }
    }
    return array("list" => $list, "size" => format_size($size));
}
/**
 * 功能：生成随机字符串
 * @param int       $length  要生成的随机字符串长度
 * @param string    $type    随机码类型：0，数字+大写字母；1，数字；2，小写字母；3，大写字母；4，特殊字符；-1，数字+大小写字母+特殊字符
 * @return string
 */
function randCode($length = 5, $type = 0) {
    $arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){}[]|");
    if ($type == 0) {
        array_pop($arr);
        $string = implode("", $arr);
    } else if ($type == "-1") {
        $string = implode("", $arr);
    } else {
        $string = $arr[$type];
    }
    $count = strlen($string) - 1;
    for ($i = 0; $i < $length; $i++) {
        $str[$i] = $string[rand(0, $count)];
        $code .= $str[$i];
    }
    return $code;
}
/**
 * 功能：ZipArchive打包文件夹
 * @param str $path   需要打包的文件夹路径
 * @param int $zip  指向功能类
 */
function addFileToZip($path,$zip){
	$handler=opendir($path); //打开当前文件夹由$path指定。
	while(($filename=readdir($handler))!==false){
	    if($filename != "." && $filename != ".."){//文件夹文件名字为'.'和‘..’，不要对他们进行操作
	        if(is_dir($path."/".$filename)){// 如果读取的某个对象是文件夹，则递归
	            addFileToZip($path."/".$filename, $zip);
	        }else{ //将文件加入zip对象
	            $zip->addFile($path."/".$filename);
	        }
	    }
	}
	@closedir($path);
}
/**
 * 功能：删除目录及目录下所有文件或删除指定文件
 * @param str $path   待删除目录路径
 * @param int $delDir 是否删除目录，1或true删除目录，0或false则只删除文件保留目录（包含子目录）
 * @return bool 返回删除状态
 */
function delDirAndFile($path, $delDir = FALSE) {
    $handle = opendir($path);
    if ($handle) {
        while (false !== ( $item = readdir($handle) )) {
            if ($item != "." && $item != "..")
                is_dir("$path/$item") ? delDirAndFile("$path/$item", $delDir) : unlink("$path/$item");
        }
        closedir($handle);
        if ($delDir)
            return rmdir($path);
    }else {
        if (file_exists($path)) {
            return unlink($path);
        } else {
            return FALSE;
        }
    }
}



