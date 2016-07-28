<?php

/**
 * 邮件发送模型
 * @CreateTime: 2016/2/14 19:11
 * @Author: iteny <8192332@qq.com>
 * @blog: http://itenyblog.com
 */
namespace Intendant\Model;
// require_once THINK_PATH.'Library/Hema/swiftmailer/lib/swift_required.php';
// use Hema\swiftmailer\lib\swift_required;
class EmailModel{
	public function __construct(){
	}
	/**
	 * [sendEmail description]
	 * @param  string $fromname [description] 发送人名字	 *
	 * @param  string $toname [description] 收件人名字
	 * @param  string $toaddr [description] 收件人地址
	 * @param  [type] $file   [description] 附件(需要指定准确的路径)
	 * @param  [type] $subject[description] 邮件的主题
	 * @param  [type] $content[description] 邮件的主题内容
	 * @return [type]         [description]
	 */
	public static function sendEmail($fromname = '河马叔叔',$toaddr = '8192332@qq.com',$toname = '未说明',$file = null,$subject  = '未指定',$content = '无内容'){
		// import('Hema.PHPMailer.PHPMailerAutoload');
		// $sendtime = time();
	 //    $time = date('Y-m-d',time());
	 //    $mail = new \PHPMailer(); //实例化
	 //    $mail->IsSMTP(); // 启用SMTP
	 //    $mail->Host = "smtp.163.com"; //SMTP服务器 以163邮箱为例子
	 //    $mail->Port = 25;  //邮件发送端口
	 //    $mail->SMTPAuth   = true;  //启用SMTP认证

	 //    $mail->CharSet  = "UTF-8"; //字符集
	 //    $mail->Encoding = "base64"; //编码方式

	 //    $mail->Username = "";  //你的邮箱
	 //    $mail->Password = "";  //你的密码
	 //    $mail->Subject = "你好"; //邮件标题

	 //    $mail->From = "iteny@163.com";  //发件人地址（也就是你的邮箱）
	 //    $mail->FromName = $toname . '--发送时间：' .$time;  //发件人姓名

	 //    $address = "8192332@qq.com";//收件人email
	 //    $mail->AddAddress($address, "亲");//添加收件人（地址，昵称）

	 //    $mail->AddAttachment( $file); // 添加附件,并指定名称
	 //    $mail->IsHTML(true); //支持html格式内容
	 //    $mail->AddEmbeddedImage("logo.jpg", "my-attach", "logo.jpg"); //设置邮件中的图片
	 //    $mail->Body = $content; //邮件主体内容

	 //    //发送
	 //    if(!$mail->Send()) {
	 //        echo json_encode(array(
	 //            'status' => 0,
	 //            'info' => "发送失败" . $mail->ErrorInfo,
	 //        ));
	 //    } else {
	 //    	$sendtime = time() - $sendtime;
	 //    	$files = empty($file)?'':$file;
	 //        echo json_encode(array(
	 //            'status' => 1,
	 //            'info' => "已发送：" . $files . "成功，耗时：{$sendtime} 秒",
	 //        ));

	 //    }


		Vendor('Swift.swift_required');
		// 配置邮件服务器，得到传输对象
		$sendtime = time();
	    $time = date('Y-m-d',time());
		$transport = \Swift_SmtpTransport::newInstance('smtp.'.C('YOUR_EMAIL_SMTP'),C('YOUR_EMAIL_PORT'));
		// 设置登录名和密码
		$transport->setUsername(C('YOUR_EMAIL'));
		$transport->setPassword(C('YOUR_EMAIL_PWD'));
		//得到发送邮件对象Swift_Mailer对象
		$mailer = \Swift_Mailer::newInstance($transport);
		//得到邮件信息对象
		$message = \Swift_Message::newInstance();
		//设置管理员的信息
		$message->setFrom([C('YOUR_EMAIL')=>$fromname . '--发送时间：' .$time]);
		//邮件发给谁
		$message->setTo([$toaddr=>$toname]);
		//设置邮件主题
		$message->setSubject($subject);
		// 主题内容
		$message->setBody("{$content}",'text/html','utf-8');
		//附件
		if($file){
			$message->attach(\Swift_Attachment::fromPath($file));
		}
		try{
			if($mailer->send($message)){
				$sendtime = time() - $sendtime;
		    	$files = empty($file)?'':$file;
		        echo json_encode(array(
		            'status' => 1,
		            'info' => "已发送：" . $files . "成功，耗时：{$sendtime} 秒",
		        ));
			}else{
				echo json_encode(array(
		            'status' => 0,
		            'info' => "邮件发送失败",
		        ));
			}
		}catch(\Swift_ConnectionException $e){
			echo json_encode(array(
	            'status' => 0,
	            'info' => "邮件发送失败" . $e->getMessage(),
	        ));
		}
	}
}