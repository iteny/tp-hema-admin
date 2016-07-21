<?php
namespace Intendant\Model;
use Think\Model\RelationModel;

class UserRelationModel extends RelationModel{
	Protected $tableName = 'user';
	protected $_auto = array(
        //-1,账号以字母开头,5-17 字母、数字、下划线'_'
        array('username','/^[a-zA-Z][\w]{4,16}$/',-2,0),
        //-4,账号被占用
        array('username', '', -3, 0, 'unique', 1),
        //-1,昵称必须是中文
        array('nickname','/^[\x{4e00}-\x{9fa5}]+$/u',-4,0),//
        //-4,昵称被占用
        array('nickname', '', -5, 0, 'unique', 1),
        //密码以字母开头,8-17 字母、数字、下划线'_'
        array('password','/^[a-zA-Z][\w]{7,16}$/',-6,0),
        // 验证确认密码是否和密码一致
        array('passworded','password',-7,0,'confirm'),
        //-6,QQ不合法！
        // array('qq','/^[1-9]\d{4,9}$/',-8,0),
        //-3,邮箱格式不正确
        array('email','email',-9,0),
        //-6,手机号不合法！
        // array('phone','/(13[0-9]|14[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/',-10,0),
        //-5,QQ被占用
        // array('qq','',-11,0,'unique',1),
        //-5,邮箱被占用
        array('email','',-12,0,'unique',1),
        //-7,手机号被占用
        // array('phone','',-13,0,'unique',1),
    );
	protected $_link = array(
		'AuthGroup' => array(
			'mapping_type' => self::MANY_TO_MANY,
			'class_name' => 'AuthGroup',
			'mapping_name' => 'usergroup',
			'foreign_key' => 'uid',
			'relation_foreign_key' => 'group_id',
			'relation_table' => 'hm_auth_group_access'
		),
	);
}
?>