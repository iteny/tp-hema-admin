<?php
namespace Intendant\Model;
use Think\Model\RelationModel;

class ConfigRelationModel extends RelationModel{
	Protected $tableName = 'config';
	protected $_link = array(
		'Config' => array(    
			'mapping_type'  => self::HAS_MANY,    
			'class_name'    => 'Config',    
			'foreign_key'   => 'pid',    
			'mapping_name'  => 'me',    
			'mapping_order' => 'sort asc',
		),
	);
}