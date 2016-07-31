<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
    	// $sql = "select ifnull(pid,'count') pid,count(*) from hm_auth_rule group by pid with rollup";
    	// $sql = "insert into time values()";
    	// $str = M()->query($sql);
    	// p($str);die;
    	// S($cache['log'],null);
  //   	$handle = fopen("http://api.clink.cn/interfaceAction/cdrIbInterface!cdrIbDBCopy.action?hotline=&enterpriseId=3000001&userName=admin&pwd=d0782bdf141e366014b4bc0d7dc6ea00&seed=aaa&id=111&limit=1");
  //   	$content = "";  
		// while (!feof($handle)) {  
		//     $content .= fread($handle, 10000);  
		// }  
		// // fclose($handle); 
		// $content = json_decode($content);  
		// p($content);
		// $url = 'http://api.clink.cn/interfaceAction/cdrIbInterface!cdrIbDBCopy.action?hotline=&enterpriseId=3000001&userName=admin&pwd=d0782bdf141e366014b4bc0d7dc6ea00&seed=aaa&id=111&limit=1';
		// $url = 'http://api.clink.cn/interfaceAction/cdrIbInterface!cdrIbDBCopy.action';  
	 //    $data = array(  
	 //        'hotline'=>'',  
	 //        'enterpriseId'=>'3000001',  
	 //        'userName'=>'admin',  
	 //        'pwd'=>'d0782bdf141e366014b4bc0d7dc6ea00',  
	 //        'seed'=>'aaa',  
	 //        'format'=>'json',  
	 //        'id'=>111,  
	 //        'limit'=>1,  	        
	 //    );  
	  
	 //    $json_data = $this->postData($url, $data);  
	 //    $array = json_decode($json_data,true);  
	 //    echo '<pre>';print_r($array); 
	 	$url = 'http://img.baidu.com/img/logo-zhidao.gif';
		$curl = curl_init();
		curl_setopt($curl,CURLOPT_URL, $url);
		curl_setopt ($curl, CURLOPT_HEADER, false);
		curl_setopt ($curl, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($curl);
		curl_close($curl);
		file_put_contents('./'.basename($url),$result); 
		$this->ss = basename($url);
	    $this->display();

    }
    // public function postData($url, $data)  
    // {  
    //     $ch = curl_init();  
    //     $timeout = 300;   
    //     curl_setopt($ch, CURLOPT_URL, $url);  
    //     curl_setopt($ch, CURLOPT_POST, true);  
    //     curl_setopt($ch, CURLOPT_POSTFIELDS, $data);  
    //     curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
    //     curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);  
    //     $handles = curl_exec($ch);  
    //     curl_close($ch);  
    //     return $handles;  
    // }  
}