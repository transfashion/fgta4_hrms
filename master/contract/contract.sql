-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_hrcont`;


CREATE TABLE IF NOT EXISTS `mst_hrcont` (
	`hrcont_id` varchar(36) NOT NULL , 
	`hrcont_filedoc` varchar(90) NOT NULL , 
	`hrcont_nodoc` varchar(255) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcont_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Karyawan Kontrak';


ALTER TABLE `mst_hrcont` ADD COLUMN IF NOT EXISTS  `hrcont_filedoc` varchar(90) NOT NULL  AFTER `hrcont_id`;
ALTER TABLE `mst_hrcont` ADD COLUMN IF NOT EXISTS  `hrcont_nodoc` varchar(255) NOT NULL  AFTER `hrcont_filedoc`;


ALTER TABLE `mst_hrcont` MODIFY COLUMN IF EXISTS  `hrcont_filedoc` varchar(90) NOT NULL   AFTER `hrcont_id`;
ALTER TABLE `mst_hrcont` MODIFY COLUMN IF EXISTS  `hrcont_nodoc` varchar(255) NOT NULL   AFTER `hrcont_filedoc`;









