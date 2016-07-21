<?php
// 百度编辑器
namespace Intendant\Controller;
use Think\Controller;
use Think\Image;
//文件删除类
use Think\Storage\Driver\File;
class UeditorController extends Controller {
	private $thumb;//缩略图模式(看手册)
	private $water;	//是否加水印(0:无水印,1:水印文字,2水印图片)
	private $waterText;//水印文字
	private $waterPosition;//水印位置
	private $savePath; //保存位置
	private $userid; //操作用户名
	public function _initialize(){
		//用户登陆信息检测处理
		$sess_uid = session('admin_uid');
		if(!isset($sess_uid))
        {
            $this->redirect('Login/index');
        }
		$this->userid=empty($_SESSION['admin_user'])? $_GET['admin_user'] : $_SESSION['admin_user'] .'/';
		if(empty($this->userid)){
			$this->userid= 'null/';
		}

		$this->rootPath= './Uploads/ueditor/';
		$this->savePath='';
		$this->thumb=1;
		$this->water=1;
		$this->waterText='逐日软件';
 		$this->waterPosition= 9;
	}
	public function upload()
	{
		// date_default_timezone_set("Asia/chongqing");
		// date_default_timezone_set("Asia/Chongqing");
		// error_reporting(E_ERROR);
		// header("Content-Type: text/html; charset=utf-8");
		$lujin = './Public/common/js/ueditor/php/config.json';
		$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($lujin)), true);
		$action = htmlspecialchars($_GET['action']);
		// echo __ROOT__;
		// // echo CONF_PATH;
		// echo $lujin;
		// p($action);
		// echo json_encode($CONFIG['imagePathFormat']);
		switch ($action) {
			case 'config':
				$result =  json_encode($CONFIG);
				break;
				/* 上传图片 */
			case 'uploadimage':
				$upload = new \Think\Upload();// 实例化上传类
			    $upload->maxSize   =     1024000 ;// 设置附件上传大小
			    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
			    $upload->rootPath  =     './Uploads/'; // 设置附件上传根目录
			    $upload->savePath  =     'ueditor/images/'; // 设置附件上传（子）目录
			    $upload->saveName  =     array('uniqid','');
			    $upload->autoSub   =     true;
			    $upload->subName   =   	 array('date','Y-m-d');
			    // 上传文件
			    $info   =   $upload->upload();
			    if(!$info) {// 上传错误提示错误信息
			        $this->error($upload->getError());
			    }else{// 上传成功

			        // $this->success('上传成功！');
			        $image = new Image();
				    foreach($info as $file){			     	
				        // 生成缩略图
				        $image->open('./Uploads/'.$file['savepath'].$file['savename']);
				        $image->thumb(600, 500,Image::IMAGE_THUMB_CENTER)->save('./Uploads/'.$file['savepath'].$file['savename']);
				        // $image->open('./Uploads/'.$file['savepath'].$file['savename'])->text('fasdfasd','./Public/'.'1.ttf',20,'#000000',\Think\Image::IMAGE_WATER_SOUTHEAST)->save('./Uploads/'.$file['savepath'].$file['savename']);
				        $image->open('./Uploads/'.$file['savepath'].$file['savename'])->water('./Uploads/'.'logo.png',\Think\Image::IMAGE_WATER_SOUTHEAST)->save('./Uploads/'.$file['savepath'].$file['savename']);
				        // echo "/uploads/".$file['savepath'].$file['savename'];
				        $data=array(
							'state'=>'SUCCESS',
							'url'=> __ROOT__ . "/Uploads/".$file['savepath'].$file['savename'],
							'title'=>$file['savename'],
							'original'=>$file['name'],
							'type'=>'.' . $file['ext'],
							'size'=>$file['size'],
						);
				        $this->ajaxReturn($data);
				    }
			    }
			    break;
			 	// echo '111';
				/* 上传涂鸦 */
			case 'uploadscrawl':
				$config = array(
		            "pathFormat" => $CONFIG['scrawlPathFormat'],
		            "maxSize" => $CONFIG['scrawlMaxSize'],
		            "allowFiles" => $CONFIG['scrawlAllowFiles'],
		            "oriName" => "scrawl.png"
		        );
		        $fieldName = $CONFIG['scrawlFieldName'];
		        $base64 = "base64";
		        $result=$this->upBase64($config,$fieldName);
		        break;
				/* 上传视频 */
			case 'uploadvideo':
				$result = $this->_ueditor_upload(array('maxSize' => 1073741824,/*1G*/'exts'  =>    array('mp4', 'avi', 'wmv','rm','rmvb','mkv')));
				break;
				/* 上传文件 */
			case 'uploadfile':
				$result = $this->_ueditor_upload(array('exts'  =>    array('jpg', 'gif', 'png', 'jpeg','txt','pdf','doc','docx','xls','xlsx','zip','rar','ppt','pptx',)));
				break;

				/* 列出图片 */
			case 'listimage':
				$allowFiles = $CONFIG['imageManagerAllowFiles'];
				$listSize = $CONFIG['imageManagerListSize'];
				$path = $CONFIG['imageManagerListPath'];
				$get=$_GET;
				$result =$this->file_list($allowFiles, $listSize, $get);
		        break;
				/* 列出文件 */
			case 'listfile':
				$result = "";
				break;

				/* 抓取远程文件 */
			case 'catchimage':
				$result=$this->_get_remote_image();
				break;

			default:
				$result = json_encode(array('state'=> '请求地址出错'));
				break;
		}

		/* 输出结果 */
		if (isset($_GET["callback"]) && false ) {//TODO 跨域上传
			if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
				echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
			} else {
				echo json_encode(array(
						'state'=> 'callback参数不合法'
				));
			}
		} else {
			exit($result) ;
		}
	}
	/**
	 * 处理base64编码的图片上传
	 * @return mixed
	 */
	private function upBase64($config,$fieldName)
	{
	    $base64Data = $_POST[$fieldName];
	    $img = base64_decode($base64Data);

	    $dirname=$this->rootPath . $this->savePath . 'scrawl/' . $this->userid . date('Y-m-d',time()) . '/';
	    $file['filesize']=strlen($img);
	    $file['oriName']=$config['oriName'];
	    $file['ext']=strtolower(strrchr($config['oriName'], '.'));
	    $file['name']= uniqid() .  $file['ext'];
	    $file['fullName']=$dirname . $file['name'];
	    $fullName=$file['fullName'];
	    // dump($file);

 	//检查文件大小是否超出限制
	    if ($file['filesize'] >= ($config["maxSize"])) {
  		$data=array(
			'state'=>'文件大小超出网站限制',
		);
		return json_encode($data);
	    }

	    //创建目录失败
	    if (!file_exists($dirname) && !mkdir($dirname, 0777, true)) {
	           $data=array(
			'state'=>'目录创建失败',
		);
		return json_encode($data);
	    } else if (!is_writeable($dirname)) {
	         $data=array(
			'state'=>'目录没有写权限',
		);
		return json_encode($data);
	    }

	    //移动文件
	    if (!(file_put_contents($fullName, $img) && file_exists($fullName))) { //移动失败
        	         $data=array(
		'state'=>'写入文件内容错误',
		);
	    } else { //移动成功
	        	$data=array(
			'state'=>'SUCCESS',
			'url'=>__ROOT__ . substr($file['fullName'],1),
			'title'=>$file['name'],
			'original'=>$file['oriName'],
			'type'=>$file['ext'],
			'size'=>$file['filesize'],
		);
	    }
	    return json_encode($data);
	}
	// 列出文件
	private function file_list($allowFiles, $listSize, $get){
		$dirname= $this->rootPath . $this->savePath . 'images/' . $this->userid;
		// if ($this->userid!='admin') {
		// 	$dirname.=$this->userid . '/';
		// }
		$allowFiles = substr(str_replace(".", "|", join("", $allowFiles)), 1);

		/* 获取参数 */
		$size = isset($get['size']) ? htmlspecialchars($get['size']) : $listSize;
		$start = isset($get['start']) ? htmlspecialchars($get['start']) : 0;
		$end = $start + $size;

		/* 获取文件列表 */
		// $path = $_SERVER['DOCUMENT_ROOT'] . (substr($path, 0, 1) == "/" ? "":"/") . $path;
		$path=$dirname;
		$files = $this->getfiles($path, $allowFiles);
		if (!count($files)) {
		    return json_encode(array(
		        "state" => "no match file",
		        "list" => array(),
		        "start" => $start,
		        "total" => count($files)
		    ));
		}

		/* 获取指定范围的列表 */
		$len = count($files);
		for ($i = min($end, $len) - 1, $list = array(); $i < $len && $i >= 0 && $i >= $start; $i--){
		    $list[] = $files[$i];
		}
		//倒序
		//for ($i = $end, $list = array(); $i < $len && $i < $end; $i++){
		//    $list[] = $files[$i];
		//}

		/* 返回数据 */
		$result = json_encode(array(
		    "state" => "SUCCESS",
		    "list" => $list,
		    "start" => $start,
		    "total" => count($files)
		));

		return $result;
	}
	/**
     * 遍历获取目录下的指定类型的文件
     * @param $path
     * @param array $files
     * @return array
     */
    private function getfiles( $path , $allowFiles, &$files = array() ) {
        if ( !is_dir( $path ) ) return null;
        if(substr($path, strlen($path) - 1) != '/') $path .= '/';
        $handle = opendir( $path);
        while ( false !== ( $file = readdir( $handle ) ) ) {
            if ( $file != '.' && $file != '..' ) {
                $path2 = $path . $file;
                if ( is_dir( $path2)) {
                    $this->getfiles( $path2 ,$allowFiles,  $files );
                } else {
	                if (preg_match("/\.(".$allowFiles.")$/i", $file)) {
	                    $files[] = array(
	                        'url'=> __ROOT__ . substr($path2, 1),
	                        'mtime'=> filemtime($path2)
	                    );
	                }
                }
            }
        }
        return $files;
    }
}
?>