<?php
$tp_config = include("tp.config.php");
$db_config = include("db.config.php");
$cache_config = include("cache.config.php");
$site_config = include("siteset.config.php");
// $version_config = include("version.config.php");
$config = array_merge($db_config,$tp_config,$cache_config,$site_config);
return $config;