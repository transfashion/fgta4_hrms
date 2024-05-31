-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_hrgrd`;


CREATE TABLE IF NOT EXISTS `mst_hrgrd` (
	`hrgrd_id` varchar(10) NOT NULL , 
	`hrgrd_name` varchar(60) NOT NULL , 
	`hrgrd_group` varchar(90)  , 
	`hrgrd_descr` varchar(90)  , 
	`hrgrd_order` int(4) NOT NULL DEFAULT 0, 
	`hrgrd_value` int(4) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hrgrd_name` (`hrgrd_name`),
	PRIMARY KEY (`hrgrd_id`)
) 
ENGINE=InnoDB
COMMENT='Master HR Grade';


ALTER TABLE `mst_hrgrd` ADD COLUMN IF NOT EXISTS  `hrgrd_name` varchar(60) NOT NULL  AFTER `hrgrd_id`;
ALTER TABLE `mst_hrgrd` ADD COLUMN IF NOT EXISTS  `hrgrd_group` varchar(90)   AFTER `hrgrd_name`;
ALTER TABLE `mst_hrgrd` ADD COLUMN IF NOT EXISTS  `hrgrd_descr` varchar(90)   AFTER `hrgrd_group`;
ALTER TABLE `mst_hrgrd` ADD COLUMN IF NOT EXISTS  `hrgrd_order` int(4) NOT NULL DEFAULT 0 AFTER `hrgrd_descr`;
ALTER TABLE `mst_hrgrd` ADD COLUMN IF NOT EXISTS  `hrgrd_value` int(4) NOT NULL DEFAULT 0 AFTER `hrgrd_order`;


ALTER TABLE `mst_hrgrd` MODIFY COLUMN IF EXISTS  `hrgrd_name` varchar(60) NOT NULL  AFTER `hrgrd_id`;
ALTER TABLE `mst_hrgrd` MODIFY COLUMN IF EXISTS  `hrgrd_group` varchar(90)   AFTER `hrgrd_name`;
ALTER TABLE `mst_hrgrd` MODIFY COLUMN IF EXISTS  `hrgrd_descr` varchar(90)   AFTER `hrgrd_group`;
ALTER TABLE `mst_hrgrd` MODIFY COLUMN IF EXISTS  `hrgrd_order` int(4) NOT NULL DEFAULT 0 AFTER `hrgrd_descr`;
ALTER TABLE `mst_hrgrd` MODIFY COLUMN IF EXISTS  `hrgrd_value` int(4) NOT NULL DEFAULT 0 AFTER `hrgrd_order`;


ALTER TABLE `mst_hrgrd` ADD CONSTRAINT `hrgrd_name` UNIQUE IF NOT EXISTS  (`hrgrd_name`);




INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('DIREC', 'DIRECTOR', '100', 'root', NOW());
INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('DIVHD', 'DIVISION HEAD / GENERAL MANAGER', '200', 'root', NOW());
INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('DEPHD', 'DEPARTMENT HEAD', '300', 'root', NOW());
INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('SECHD', 'SECTION HEAD', '400', 'root', NOW());
INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('ASSOC', 'ASSOCIATE/SUPERVISOR', '500', 'root', NOW());
INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('EXECV', 'EXECUTIVE', '600', 'root', NOW());
INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('STAFF', 'STAFF', '700', 'root', NOW());
INSERT INTO mst_hrgrd (`hrgrd_id`, `hrgrd_name`, `hrgrd_order`, `_createby`, `_createdate`) VALUES ('CLERK', 'CLERK', '800', 'root', NOW());



