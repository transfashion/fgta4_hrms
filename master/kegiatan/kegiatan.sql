-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_kegaitan`;


CREATE TABLE IF NOT EXISTS `mst_kegaitan` (
	`kegiatan_id` varchar(14) NOT NULL , 
	`kegiatan_date` date NOT NULL , 
	`kegiatan_descr` varchar(90) NOT NULL , 
	`_createby` varchar(13) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(13)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`kegiatan_id`)
) 
ENGINE=InnoDB
COMMENT='Master Kegiatan';


ALTER TABLE `mst_kegaitan` ADD COLUMN IF NOT EXISTS  `kegiatan_date` date NOT NULL  AFTER `kegiatan_id`;
ALTER TABLE `mst_kegaitan` ADD COLUMN IF NOT EXISTS  `kegiatan_descr` varchar(90) NOT NULL  AFTER `kegiatan_date`;


ALTER TABLE `mst_kegaitan` MODIFY COLUMN IF EXISTS  `kegiatan_date` date NOT NULL  AFTER `kegiatan_id`;
ALTER TABLE `mst_kegaitan` MODIFY COLUMN IF EXISTS  `kegiatan_descr` varchar(90) NOT NULL  AFTER `kegiatan_date`;









