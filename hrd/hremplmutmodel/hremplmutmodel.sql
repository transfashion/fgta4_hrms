-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_hremplmutmodel`;


CREATE TABLE IF NOT EXISTS `mst_hremplmutmodel` (
	`hremplmutmodel_id` varchar(10) NOT NULL , 
	`hremplmutmodel_name` varchar(90) NOT NULL , 
	`hremplmutmodel_descr` varchar(255)  , 
	`hremplmutmodel_issitemut` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_isdeptmut` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_isjobmut` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_isgradecheck` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_gradedir` int(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hremplmutmodel_name` (`hremplmutmodel_name`),
	PRIMARY KEY (`hremplmutmodel_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar model mutasi karyawan';


ALTER TABLE `mst_hremplmutmodel` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_name` varchar(90) NOT NULL  AFTER `hremplmutmodel_id`;
ALTER TABLE `mst_hremplmutmodel` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_descr` varchar(255)   AFTER `hremplmutmodel_name`;
ALTER TABLE `mst_hremplmutmodel` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_issitemut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_descr`;
ALTER TABLE `mst_hremplmutmodel` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_isdeptmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_issitemut`;
ALTER TABLE `mst_hremplmutmodel` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_isjobmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isdeptmut`;
ALTER TABLE `mst_hremplmutmodel` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_isgradecheck` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isjobmut`;
ALTER TABLE `mst_hremplmutmodel` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_gradedir` int(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isgradecheck`;


ALTER TABLE `mst_hremplmutmodel` MODIFY COLUMN IF EXISTS  `hremplmutmodel_name` varchar(90) NOT NULL  AFTER `hremplmutmodel_id`;
ALTER TABLE `mst_hremplmutmodel` MODIFY COLUMN IF EXISTS  `hremplmutmodel_descr` varchar(255)   AFTER `hremplmutmodel_name`;
ALTER TABLE `mst_hremplmutmodel` MODIFY COLUMN IF EXISTS  `hremplmutmodel_issitemut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_descr`;
ALTER TABLE `mst_hremplmutmodel` MODIFY COLUMN IF EXISTS  `hremplmutmodel_isdeptmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_issitemut`;
ALTER TABLE `mst_hremplmutmodel` MODIFY COLUMN IF EXISTS  `hremplmutmodel_isjobmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isdeptmut`;
ALTER TABLE `mst_hremplmutmodel` MODIFY COLUMN IF EXISTS  `hremplmutmodel_isgradecheck` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isjobmut`;
ALTER TABLE `mst_hremplmutmodel` MODIFY COLUMN IF EXISTS  `hremplmutmodel_gradedir` int(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isgradecheck`;


ALTER TABLE `mst_hremplmutmodel` ADD CONSTRAINT `hremplmutmodel_name` UNIQUE IF NOT EXISTS  (`hremplmutmodel_name`);







