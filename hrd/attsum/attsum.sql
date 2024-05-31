-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `trn_hratdsum`;


CREATE TABLE IF NOT EXISTS `trn_hratdsum` (
	`hratdsum_id` varchar(30) NOT NULL , 
	`hratdsum_dt` date NOT NULL , 
	`empl_id` varchar(30)  , 
	`position` varchar(60)  , 
	`organisation` varchar(60)  , 
	`schd_in` time  , 
	`schd_out` time  , 
	`actual_in` time  , 
	`actual_out` time  , 
	`actual_invar` int(8)  , 
	`actual_outvar` int(8)  , 
	`actual_workeff` int(8)  , 
	`daytype` varchar(30)  , 
	`score_late` decimal(4, 2)  , 
	`score_workeff` decimal(4, 2)  , 
	`score_add` decimal(4, 2)  , 
	`score_total` decimal(4, 2)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hratdsum_empldate` (`hratdsum_dt`, `empl_id`),
	PRIMARY KEY (`hratdsum_id`)
) 
ENGINE=InnoDB
COMMENT='Inquiry item';


ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `hratdsum_dt` date NOT NULL  AFTER `hratdsum_id`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `empl_id` varchar(30)   AFTER `hratdsum_dt`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `position` varchar(60)   AFTER `empl_id`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `organisation` varchar(60)   AFTER `position`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `schd_in` time   AFTER `organisation`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `schd_out` time   AFTER `schd_in`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `actual_in` time   AFTER `schd_out`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `actual_out` time   AFTER `actual_in`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `actual_invar` int(8)   AFTER `actual_out`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `actual_outvar` int(8)   AFTER `actual_invar`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `actual_workeff` int(8)   AFTER `actual_outvar`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `daytype` varchar(30)   AFTER `actual_workeff`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `score_late` decimal(4, 2)   AFTER `daytype`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `score_workeff` decimal(4, 2)   AFTER `score_late`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `score_add` decimal(4, 2)   AFTER `score_workeff`;
ALTER TABLE `trn_hratdsum` ADD COLUMN IF NOT EXISTS  `score_total` decimal(4, 2)   AFTER `score_add`;


ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `hratdsum_dt` date NOT NULL  AFTER `hratdsum_id`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `empl_id` varchar(30)   AFTER `hratdsum_dt`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `position` varchar(60)   AFTER `empl_id`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `organisation` varchar(60)   AFTER `position`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `schd_in` time   AFTER `organisation`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `schd_out` time   AFTER `schd_in`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `actual_in` time   AFTER `schd_out`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `actual_out` time   AFTER `actual_in`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `actual_invar` int(8)   AFTER `actual_out`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `actual_outvar` int(8)   AFTER `actual_invar`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `actual_workeff` int(8)   AFTER `actual_outvar`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `daytype` varchar(30)   AFTER `actual_workeff`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `score_late` decimal(4, 2)   AFTER `daytype`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `score_workeff` decimal(4, 2)   AFTER `score_late`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `score_add` decimal(4, 2)   AFTER `score_workeff`;
ALTER TABLE `trn_hratdsum` MODIFY COLUMN IF EXISTS  `score_total` decimal(4, 2)   AFTER `score_add`;


ALTER TABLE `trn_hratdsum` ADD CONSTRAINT `hratdsum_empldate` UNIQUE IF NOT EXISTS  (`hratdsum_dt`, `empl_id`);

ALTER TABLE `trn_hratdsum` ADD KEY IF NOT EXISTS `empl_id` (`empl_id`);

ALTER TABLE `trn_hratdsum` ADD CONSTRAINT `fk_trn_hratdsum_mst_empl` FOREIGN KEY IF NOT EXISTS  (`empl_id`) REFERENCES `mst_empl` (`empl_id`);





