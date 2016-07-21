<?php
return array (
  'INTENDANT_NAME' => 'HemaCMS管理系统1123速读法',
  'SITEURL' => '',
  'SITEFILEURL' => '',
  'SITEEMAIL' => '',
  'SITEKEYWORDS' => '',
  'SITEINFO' => '',
  'DOMAINACCESS' => '1',
  'GENERATE' => '1',
  'CHECKCODE_TYPE' => '0',
  'SITENAME' => '',
  //数据库备份根路径,路径必须以 / 结尾
  'DATA_BACKUP_PATH' => './Data/',
  //数据库备份卷大小,该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M
  'DATA_BACKUP_PART_SIZE' => 20971520,
  //数据库备份文件是否启用压缩,0:不压缩1:启用压缩,压缩备份文件需要PHP环境支持gzopen,gzwrite函数
  'DATA_BACKUP_COMPRESS' => 1,
  //数据库备份文件压缩级别,1:普通4:一般9:最高,数据库备份文件的压缩级别，该配置在开启压缩时生效
  'DATA_BACKUP_COMPRESS_LEVEL' => 9,
  'FILE_BACKUP_PATH' => './FileZip/', //文件备份路径
  'YOUR_EMAIL' => '',//你的邮箱
  'YOUR_EMAIL_PWD',//你的邮箱密码
  'SETCONFIG' => 'setconfig',
);
?>