-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_hrjob`;
-- drop table if exists `mst_hrjobrole`;


CREATE TABLE IF NOT EXISTS `mst_hrjob` (
	`hrjob_id` varchar(20) NOT NULL , 
	`hrjob_name` varchar(60) NOT NULL , 
	`hrjob_descr` varchar(90)  , 
	`hrjob_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`hrgrd_id` varchar(10) NOT NULL , 
	`deptmodel_id` varchar(10) NOT NULL , 
	`hrsection_id` varchar(10)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hrjob_name` (`hrjob_name`),
	PRIMARY KEY (`hrjob_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Master Job';


ALTER TABLE `mst_hrjob` ADD COLUMN IF NOT EXISTS  `hrjob_name` varchar(60) NOT NULL  AFTER `hrjob_id`;
ALTER TABLE `mst_hrjob` ADD COLUMN IF NOT EXISTS  `hrjob_descr` varchar(90)   AFTER `hrjob_name`;
ALTER TABLE `mst_hrjob` ADD COLUMN IF NOT EXISTS  `hrjob_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `hrjob_descr`;
ALTER TABLE `mst_hrjob` ADD COLUMN IF NOT EXISTS  `hrgrd_id` varchar(10) NOT NULL  AFTER `hrjob_isdisabled`;
ALTER TABLE `mst_hrjob` ADD COLUMN IF NOT EXISTS  `deptmodel_id` varchar(10) NOT NULL  AFTER `hrgrd_id`;
ALTER TABLE `mst_hrjob` ADD COLUMN IF NOT EXISTS  `hrsection_id` varchar(10)   AFTER `deptmodel_id`;


ALTER TABLE `mst_hrjob` MODIFY COLUMN IF EXISTS  `hrjob_name` varchar(60) NOT NULL  AFTER `hrjob_id`;
ALTER TABLE `mst_hrjob` MODIFY COLUMN IF EXISTS  `hrjob_descr` varchar(90)   AFTER `hrjob_name`;
ALTER TABLE `mst_hrjob` MODIFY COLUMN IF EXISTS  `hrjob_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `hrjob_descr`;
ALTER TABLE `mst_hrjob` MODIFY COLUMN IF EXISTS  `hrgrd_id` varchar(10) NOT NULL  AFTER `hrjob_isdisabled`;
ALTER TABLE `mst_hrjob` MODIFY COLUMN IF EXISTS  `deptmodel_id` varchar(10) NOT NULL  AFTER `hrgrd_id`;
ALTER TABLE `mst_hrjob` MODIFY COLUMN IF EXISTS  `hrsection_id` varchar(10)   AFTER `deptmodel_id`;


ALTER TABLE `mst_hrjob` ADD CONSTRAINT `hrjob_name` UNIQUE IF NOT EXISTS  (`hrjob_name`);

ALTER TABLE `mst_hrjob` ADD KEY IF NOT EXISTS `hrgrd_id` (`hrgrd_id`);
ALTER TABLE `mst_hrjob` ADD KEY IF NOT EXISTS `deptmodel_id` (`deptmodel_id`);
ALTER TABLE `mst_hrjob` ADD KEY IF NOT EXISTS `hrsection_id` (`hrsection_id`);

ALTER TABLE `mst_hrjob` ADD CONSTRAINT `fk_mst_hrjob_mst_hrgrd` FOREIGN KEY IF NOT EXISTS  (`hrgrd_id`) REFERENCES `mst_hrgrd` (`hrgrd_id`);
ALTER TABLE `mst_hrjob` ADD CONSTRAINT `fk_mst_hrjob_mst_deptmodel` FOREIGN KEY IF NOT EXISTS  (`deptmodel_id`) REFERENCES `mst_deptmodel` (`deptmodel_id`);
ALTER TABLE `mst_hrjob` ADD CONSTRAINT `fk_mst_hrjob_mst_hrsection` FOREIGN KEY IF NOT EXISTS  (`hrsection_id`) REFERENCES `mst_hrsection` (`hrsection_id`);


INSERT INTO mst_hrjob (`hrjob_id`, `hrjob_name`, `hrgrd_id`, `deptmodel_id`, `_createby`, `_createdate`) VALUES ('COM-BM-EAG', 'Brand Manager (EAG)', 'DEPHD', 'COM', 'root', NOW());
INSERT INTO mst_hrjob (`hrjob_id`, `hrjob_name`, `hrgrd_id`, `deptmodel_id`, `_createby`, `_createdate`) VALUES ('COM-BM-FLA', 'Brand Manager (FLA)', 'DEPHD', 'COM', 'root', NOW());
INSERT INTO mst_hrjob (`hrjob_id`, `hrjob_name`, `hrgrd_id`, `deptmodel_id`, `_createby`, `_createdate`) VALUES ('COM-BM-GEX', 'Brand Manager (GEX)', 'DEPHD', 'COM', 'root', NOW());
INSERT INTO mst_hrjob (`hrjob_id`, `hrjob_name`, `hrgrd_id`, `deptmodel_id`, `_createby`, `_createdate`) VALUES ('COM-BM-HBS', 'Brand Manager (HBS)', 'DEPHD', 'COM', 'root', NOW());
INSERT INTO mst_hrjob (`hrjob_id`, `hrjob_name`, `hrgrd_id`, `deptmodel_id`, `_createby`, `_createdate`) VALUES ('COM-BM-FRG', 'Brand Manager FRG', 'DEPHD', 'COM', 'root', NOW());



CREATE TABLE IF NOT EXISTS `mst_hrjobrole` (
	`hrjobrole_id` varchar(14) NOT NULL , 
	`role_id` varchar(30)  , 
	`hrjob_id` varchar(20) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hrjobrole_pair` (`hrjobrole_id`, `role_id`),
	PRIMARY KEY (`hrjobrole_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrjobrole` ADD COLUMN IF NOT EXISTS  `role_id` varchar(30)   AFTER `hrjobrole_id`;
ALTER TABLE `mst_hrjobrole` ADD COLUMN IF NOT EXISTS  `hrjob_id` varchar(20) NOT NULL  AFTER `role_id`;


ALTER TABLE `mst_hrjobrole` MODIFY COLUMN IF EXISTS  `role_id` varchar(30)   AFTER `hrjobrole_id`;
ALTER TABLE `mst_hrjobrole` MODIFY COLUMN IF EXISTS  `hrjob_id` varchar(20) NOT NULL  AFTER `role_id`;


ALTER TABLE `mst_hrjobrole` ADD CONSTRAINT `hrjobrole_pair` UNIQUE IF NOT EXISTS  (`hrjobrole_id`, `role_id`);

ALTER TABLE `mst_hrjobrole` ADD KEY IF NOT EXISTS `role_id` (`role_id`);
ALTER TABLE `mst_hrjobrole` ADD KEY IF NOT EXISTS `hrjob_id` (`hrjob_id`);

ALTER TABLE `mst_hrjobrole` ADD CONSTRAINT `fk_mst_hrjobrole_fgt_role` FOREIGN KEY IF NOT EXISTS  (`role_id`) REFERENCES `fgt_role` (`role_id`);
ALTER TABLE `mst_hrjobrole` ADD CONSTRAINT `fk_mst_hrjobrole_mst_hrjob` FOREIGN KEY IF NOT EXISTS (`hrjob_id`) REFERENCES `mst_hrjob` (`hrjob_id`);





