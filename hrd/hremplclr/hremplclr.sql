-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `trn_hremplclr`;
-- drop table if exists `trn_hremplclrappr`;


CREATE TABLE IF NOT EXISTS `trn_hremplclr` (
	`hremplclr_id` varchar(30) NOT NULL , 
	`empl_id` varchar(30) NOT NULL , 
	`site_id` varchar(30) NOT NULL , 
	`dept_id` varchar(30)  , 
	`hrjob_id` varchar(20) NOT NULL , 
	`hremplclr_effdate` date NOT NULL , 
	`hremplclr_descr` varchar(255)  , 
	`doc_id` varchar(30) NOT NULL , 
	`hremplclr_isoutstdchecking` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclr_isoutstdcheck` tinyint(1) NOT NULL DEFAULT 0, 
	`user_empl_id` varchar(30) NOT NULL , 
	`user_dept_id` varchar(30)  , 
	`hremplclr_version` int(4) NOT NULL DEFAULT 0, 
	`hremplclr_rejectnotes` varchar(255)  , 
	`hremplclr_iscommit` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclr_commitby` varchar(14)  , 
	`hremplclr_commitdate` datetime  , 
	`hremplclr_isapprovalprogress` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclr_isapproved` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclr_approveby` varchar(14)  , 
	`hremplclr_approvedate` datetime  , 
	`hremplclr_isdeclined` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclr_declineby` varchar(14)  , 
	`hremplclr_declinedate` datetime  , 
	`hremplclr_isexecute` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclr_executeby` varchar(14)  , 
	`hremplclr_executedate` datetime  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hremplclr_id`)
) 
ENGINE=InnoDB
COMMENT='Clearance karyawan';


ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `empl_id` varchar(30) NOT NULL  AFTER `hremplclr_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `site_id` varchar(30) NOT NULL  AFTER `empl_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30)   AFTER `site_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hrjob_id` varchar(20) NOT NULL  AFTER `dept_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_effdate` date NOT NULL  AFTER `hrjob_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_descr` varchar(255)   AFTER `hremplclr_effdate`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `doc_id` varchar(30) NOT NULL  AFTER `hremplclr_descr`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_isoutstdchecking` tinyint(1) NOT NULL DEFAULT 0 AFTER `doc_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_isoutstdcheck` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_isoutstdchecking`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `user_empl_id` varchar(30) NOT NULL  AFTER `hremplclr_isoutstdcheck`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `user_dept_id` varchar(30)   AFTER `user_empl_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_version` int(4) NOT NULL DEFAULT 0 AFTER `user_dept_id`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_rejectnotes` varchar(255)   AFTER `hremplclr_version`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_iscommit` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_rejectnotes`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_commitby` varchar(14)   AFTER `hremplclr_iscommit`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_commitdate` datetime   AFTER `hremplclr_commitby`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_isapprovalprogress` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_commitdate`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_isapprovalprogress`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_approveby` varchar(14)   AFTER `hremplclr_isapproved`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_approvedate` datetime   AFTER `hremplclr_approveby`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_approvedate`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_declineby` varchar(14)   AFTER `hremplclr_isdeclined`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_declinedate` datetime   AFTER `hremplclr_declineby`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_isexecute` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_declinedate`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_executeby` varchar(14)   AFTER `hremplclr_isexecute`;
ALTER TABLE `trn_hremplclr` ADD COLUMN IF NOT EXISTS  `hremplclr_executedate` datetime   AFTER `hremplclr_executeby`;


ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `empl_id` varchar(30) NOT NULL  AFTER `hremplclr_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `site_id` varchar(30) NOT NULL  AFTER `empl_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30)   AFTER `site_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hrjob_id` varchar(20) NOT NULL  AFTER `dept_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_effdate` date NOT NULL  AFTER `hrjob_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_descr` varchar(255)   AFTER `hremplclr_effdate`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `doc_id` varchar(30) NOT NULL  AFTER `hremplclr_descr`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_isoutstdchecking` tinyint(1) NOT NULL DEFAULT 0 AFTER `doc_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_isoutstdcheck` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_isoutstdchecking`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `user_empl_id` varchar(30) NOT NULL  AFTER `hremplclr_isoutstdcheck`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `user_dept_id` varchar(30)   AFTER `user_empl_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_version` int(4) NOT NULL DEFAULT 0 AFTER `user_dept_id`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_rejectnotes` varchar(255)   AFTER `hremplclr_version`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_iscommit` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_rejectnotes`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_commitby` varchar(14)   AFTER `hremplclr_iscommit`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_commitdate` datetime   AFTER `hremplclr_commitby`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_isapprovalprogress` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_commitdate`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_isapprovalprogress`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_approveby` varchar(14)   AFTER `hremplclr_isapproved`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_approvedate` datetime   AFTER `hremplclr_approveby`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_approvedate`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_declineby` varchar(14)   AFTER `hremplclr_isdeclined`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_declinedate` datetime   AFTER `hremplclr_declineby`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_isexecute` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_declinedate`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_executeby` varchar(14)   AFTER `hremplclr_isexecute`;
ALTER TABLE `trn_hremplclr` MODIFY COLUMN IF EXISTS  `hremplclr_executedate` datetime   AFTER `hremplclr_executeby`;



ALTER TABLE `trn_hremplclr` ADD KEY IF NOT EXISTS `empl_id` (`empl_id`);
ALTER TABLE `trn_hremplclr` ADD KEY IF NOT EXISTS `site_id` (`site_id`);
ALTER TABLE `trn_hremplclr` ADD KEY IF NOT EXISTS `dept_id` (`dept_id`);
ALTER TABLE `trn_hremplclr` ADD KEY IF NOT EXISTS `hrjob_id` (`hrjob_id`);
ALTER TABLE `trn_hremplclr` ADD KEY IF NOT EXISTS `doc_id` (`doc_id`);
ALTER TABLE `trn_hremplclr` ADD KEY IF NOT EXISTS `user_empl_id` (`user_empl_id`);
ALTER TABLE `trn_hremplclr` ADD KEY IF NOT EXISTS `user_dept_id` (`user_dept_id`);

ALTER TABLE `trn_hremplclr` ADD CONSTRAINT `fk_trn_hremplclr_mst_empl` FOREIGN KEY IF NOT EXISTS  (`empl_id`) REFERENCES `mst_empl` (`empl_id`);
ALTER TABLE `trn_hremplclr` ADD CONSTRAINT `fk_trn_hremplclr_mst_site` FOREIGN KEY IF NOT EXISTS  (`site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `trn_hremplclr` ADD CONSTRAINT `fk_trn_hremplclr_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `trn_hremplclr` ADD CONSTRAINT `fk_trn_hremplclr_mst_hrjob` FOREIGN KEY IF NOT EXISTS  (`hrjob_id`) REFERENCES `mst_hrjob` (`hrjob_id`);
ALTER TABLE `trn_hremplclr` ADD CONSTRAINT `fk_trn_hremplclr_mst_doc` FOREIGN KEY IF NOT EXISTS  (`doc_id`) REFERENCES `mst_doc` (`doc_id`);
ALTER TABLE `trn_hremplclr` ADD CONSTRAINT `fk_trn_hremplclr_mst_empl_2` FOREIGN KEY IF NOT EXISTS  (`user_empl_id`) REFERENCES `mst_empl` (`empl_id`);
ALTER TABLE `trn_hremplclr` ADD CONSTRAINT `fk_trn_hremplclr_mst_dept_2` FOREIGN KEY IF NOT EXISTS  (`user_dept_id`) REFERENCES `mst_dept` (`dept_id`);





CREATE TABLE IF NOT EXISTS `trn_hremplclrappr` (
	`hremplclrappr_id` varchar(14) NOT NULL , 
	`hremplclrappr_isapproved` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclrappr_by` varchar(14)  , 
	`hremplclrappr_date` datetime  , 
	`hremplclr_version` int(4) NOT NULL DEFAULT 0, 
	`hremplclrappr_isdeclined` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplclrappr_declinedby` varchar(14)  , 
	`hremplclrappr_declineddate` datetime  , 
	`hremplclrappr_notes` varchar(255)  , 
	`hremplclr_id` varchar(30) NOT NULL , 
	`docauth_descr` varchar(90)  , 
	`docauth_order` int(4) NOT NULL DEFAULT 0, 
	`docauth_value` int(4) NOT NULL DEFAULT 100, 
	`docauth_min` int(4) NOT NULL DEFAULT 0, 
	`authlevel_id` varchar(10) NOT NULL , 
	`authlevel_name` varchar(60) NOT NULL , 
	`auth_id` varchar(10)  , 
	`auth_name` varchar(60) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hremplclr_auth_id` (`hremplclr_id`, `auth_id`),
	PRIMARY KEY (`hremplclrappr_id`)
) 
ENGINE=InnoDB
COMMENT='Approval Employee Clearance';


ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclrappr_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclrappr_id`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclrappr_by` varchar(14)   AFTER `hremplclrappr_isapproved`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclrappr_date` datetime   AFTER `hremplclrappr_by`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclr_version` int(4) NOT NULL DEFAULT 0 AFTER `hremplclrappr_date`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclrappr_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_version`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclrappr_declinedby` varchar(14)   AFTER `hremplclrappr_isdeclined`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclrappr_declineddate` datetime   AFTER `hremplclrappr_declinedby`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclrappr_notes` varchar(255)   AFTER `hremplclrappr_declineddate`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `hremplclr_id` varchar(30) NOT NULL  AFTER `hremplclrappr_notes`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `docauth_descr` varchar(90)   AFTER `hremplclr_id`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `docauth_order` int(4) NOT NULL DEFAULT 0 AFTER `docauth_descr`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `docauth_value` int(4) NOT NULL DEFAULT 100 AFTER `docauth_order`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `docauth_min` int(4) NOT NULL DEFAULT 0 AFTER `docauth_value`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `authlevel_id` varchar(10) NOT NULL  AFTER `docauth_min`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `authlevel_name` varchar(60) NOT NULL  AFTER `authlevel_id`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `auth_id` varchar(10)   AFTER `authlevel_name`;
ALTER TABLE `trn_hremplclrappr` ADD COLUMN IF NOT EXISTS  `auth_name` varchar(60) NOT NULL  AFTER `auth_id`;


ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclrappr_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclrappr_id`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclrappr_by` varchar(14)   AFTER `hremplclrappr_isapproved`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclrappr_date` datetime   AFTER `hremplclrappr_by`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclr_version` int(4) NOT NULL DEFAULT 0 AFTER `hremplclrappr_date`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclrappr_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplclr_version`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclrappr_declinedby` varchar(14)   AFTER `hremplclrappr_isdeclined`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclrappr_declineddate` datetime   AFTER `hremplclrappr_declinedby`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclrappr_notes` varchar(255)   AFTER `hremplclrappr_declineddate`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `hremplclr_id` varchar(30) NOT NULL  AFTER `hremplclrappr_notes`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `docauth_descr` varchar(90)   AFTER `hremplclr_id`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `docauth_order` int(4) NOT NULL DEFAULT 0 AFTER `docauth_descr`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `docauth_value` int(4) NOT NULL DEFAULT 100 AFTER `docauth_order`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `docauth_min` int(4) NOT NULL DEFAULT 0 AFTER `docauth_value`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `authlevel_id` varchar(10) NOT NULL  AFTER `docauth_min`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `authlevel_name` varchar(60) NOT NULL  AFTER `authlevel_id`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `auth_id` varchar(10)   AFTER `authlevel_name`;
ALTER TABLE `trn_hremplclrappr` MODIFY COLUMN IF EXISTS  `auth_name` varchar(60) NOT NULL  AFTER `auth_id`;


ALTER TABLE `trn_hremplclrappr` ADD CONSTRAINT `hremplclr_auth_id` UNIQUE IF NOT EXISTS  (`hremplclr_id`, `auth_id`);

ALTER TABLE `trn_hremplclrappr` ADD KEY IF NOT EXISTS `hremplclr_id` (`hremplclr_id`);

ALTER TABLE `trn_hremplclrappr` ADD CONSTRAINT `fk_trn_hremplclrappr_trn_hremplclr` FOREIGN KEY IF NOT EXISTS (`hremplclr_id`) REFERENCES `trn_hremplclr` (`hremplclr_id`);





