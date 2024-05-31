-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_edu`;


CREATE TABLE IF NOT EXISTS `mst_edu` (
	`edu_id` varchar(7) NOT NULL , 
	`edu_name` varchar(30) NOT NULL , 
	`edu_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `edu_name` (`edu_name`),
	PRIMARY KEY (`edu_id`)
) 
ENGINE=InnoDB
COMMENT='Master Education';


ALTER TABLE `mst_edu` ADD COLUMN IF NOT EXISTS  `edu_name` varchar(30) NOT NULL  AFTER `edu_id`;
ALTER TABLE `mst_edu` ADD COLUMN IF NOT EXISTS  `edu_descr` varchar(90)   AFTER `edu_name`;


ALTER TABLE `mst_edu` MODIFY COLUMN IF EXISTS  `edu_name` varchar(30) NOT NULL  AFTER `edu_id`;
ALTER TABLE `mst_edu` MODIFY COLUMN IF EXISTS  `edu_descr` varchar(90)   AFTER `edu_name`;


ALTER TABLE `mst_edu` ADD CONSTRAINT `edu_name` UNIQUE IF NOT EXISTS  (`edu_name`);




INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('SD', 'SD', 'root', NOW());
INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('SMP', 'SMP / Sederajat', 'root', NOW());
INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('SMA', 'SMA / Sederajat', 'root', NOW());
INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('D1', 'Diploma 1', 'root', NOW());
INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('D3', 'Diploma 2', 'root', NOW());
INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('S1', 'Strata 1', 'root', NOW());
INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('S2', 'Starta 2', 'root', NOW());
INSERT INTO mst_edu (`edu_id`, `edu_name`, `_createby`, `_createdate`) VALUES ('S3', 'Starta 3', 'root', NOW());



