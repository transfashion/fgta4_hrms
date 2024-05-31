-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_hrstatus`;


CREATE TABLE IF NOT EXISTS `mst_hrstatus` (
	`hrstatus_id` varchar(3) NOT NULL , 
	`hrstatus_name` varchar(30) NOT NULL , 
	`hrstatus_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hrstatus_name` (`hrstatus_name`),
	PRIMARY KEY (`hrstatus_id`)
) 
ENGINE=InnoDB
COMMENT='Master Status HR';


ALTER TABLE `mst_hrstatus` ADD COLUMN IF NOT EXISTS  `hrstatus_name` varchar(30) NOT NULL  AFTER `hrstatus_id`;
ALTER TABLE `mst_hrstatus` ADD COLUMN IF NOT EXISTS  `hrstatus_descr` varchar(90)   AFTER `hrstatus_name`;


ALTER TABLE `mst_hrstatus` MODIFY COLUMN IF EXISTS  `hrstatus_name` varchar(30) NOT NULL  AFTER `hrstatus_id`;
ALTER TABLE `mst_hrstatus` MODIFY COLUMN IF EXISTS  `hrstatus_descr` varchar(90)   AFTER `hrstatus_name`;


ALTER TABLE `mst_hrstatus` ADD CONSTRAINT `hrstatus_name` UNIQUE IF NOT EXISTS  (`hrstatus_name`);




INSERT INTO mst_hrstatus (`hrstatus_id`, `hrstatus_name`, `_createby`, `_createdate`) VALUES ('PE', 'PERMANENT', 'root', NOW());
INSERT INTO mst_hrstatus (`hrstatus_id`, `hrstatus_name`, `_createby`, `_createdate`) VALUES ('C0', 'PROBATION', 'root', NOW());
INSERT INTO mst_hrstatus (`hrstatus_id`, `hrstatus_name`, `_createby`, `_createdate`) VALUES ('C1', 'CONTRACT I', 'root', NOW());
INSERT INTO mst_hrstatus (`hrstatus_id`, `hrstatus_name`, `_createby`, `_createdate`) VALUES ('C2', 'CONTRACT II', 'root', NOW());
INSERT INTO mst_hrstatus (`hrstatus_id`, `hrstatus_name`, `_createby`, `_createdate`) VALUES ('C3', 'CONTRACT III', 'root', NOW());
INSERT INTO mst_hrstatus (`hrstatus_id`, `hrstatus_name`, `_createby`, `_createdate`) VALUES ('T1', 'TRAINEE', 'root', NOW());



