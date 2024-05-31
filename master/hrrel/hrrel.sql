-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_hrrel`;


CREATE TABLE IF NOT EXISTS `mst_hrrel` (
	`hrrel_id` varchar(3) NOT NULL , 
	`hrrel_name` varchar(60) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hrrel_name` (`hrrel_name`),
	PRIMARY KEY (`hrrel_id`)
) 
ENGINE=InnoDB
COMMENT='Master HR Grade';


ALTER TABLE `mst_hrrel` ADD COLUMN IF NOT EXISTS  `hrrel_name` varchar(60) NOT NULL  AFTER `hrrel_id`;


ALTER TABLE `mst_hrrel` MODIFY COLUMN IF EXISTS  `hrrel_name` varchar(60) NOT NULL   AFTER `hrrel_id`;


ALTER TABLE `mst_hrrel` ADD CONSTRAINT `hrrel_name` UNIQUE IF NOT EXISTS  (`hrrel_name`);




INSERT INTO mst_hrrel (`hrrel_id`, `hrrel_name`, `_createby`, `_createdate`) VALUES ('S', 'SUAMI', 'root', NOW());
INSERT INTO mst_hrrel (`hrrel_id`, `hrrel_name`, `_createby`, `_createdate`) VALUES ('I', 'ISTRI', 'root', NOW());
INSERT INTO mst_hrrel (`hrrel_id`, `hrrel_name`, `_createby`, `_createdate`) VALUES ('A', 'ANAK', 'root', NOW());



