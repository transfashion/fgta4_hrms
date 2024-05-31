-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `trn_hremplmut`;
-- drop table if exists `trn_hremplmutappr`;


CREATE TABLE IF NOT EXISTS `trn_hremplmut` (
	`hremplmut_id` varchar(30) NOT NULL , 
	`hremplmutmodel_id` varchar(10) NOT NULL , 
	`empl_id` varchar(30) NOT NULL , 
	`site_id` varchar(30) NOT NULL , 
	`dept_id` varchar(30)  , 
	`deptmodel_id` varchar(10) NOT NULL , 
	`hrgrd_value` int(4) NOT NULL DEFAULT 0, 
	`hrjob_id` varchar(20) NOT NULL , 
	`hremplmut_effdate` date NOT NULL , 
	`hremplmut_descr` varchar(255)  , 
	`doc_id` varchar(30) NOT NULL , 
	`prev_site_id` varchar(30) NOT NULL , 
	`prev_dept_id` varchar(30)  , 
	`prev_deptmodel_id` varchar(10) NOT NULL , 
	`prev_hrgrd_value` int(4) NOT NULL DEFAULT 0, 
	`prev_hrjob_id` varchar(20) NOT NULL , 
	`hremplmutmodel_issitemut` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_isdeptmut` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_isjobmut` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_isgradecheck` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutmodel_gradedir` int(1) NOT NULL DEFAULT 0, 
	`user_empl_id` varchar(30) NOT NULL , 
	`user_dept_id` varchar(30)  , 
	`hremplmut_version` int(4) NOT NULL DEFAULT 0, 
	`hremplmut_rejectnotes` varchar(255)  , 
	`hremplmut_iscommit` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmut_commitby` varchar(14)  , 
	`hremplmut_commitdate` datetime  , 
	`hremplmut_isapprovalprogress` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmut_isapproved` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmut_approveby` varchar(14)  , 
	`hremplmut_approvedate` datetime  , 
	`hremplmut_isdeclined` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmut_declineby` varchar(14)  , 
	`hremplmut_declinedate` datetime  , 
	`hremplmut_isexecute` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmut_executeby` varchar(14)  , 
	`hremplmut_executedate` datetime  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hremplmut_id`)
) 
ENGINE=InnoDB
COMMENT='Mutasi karyawan';


ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_id` varchar(10) NOT NULL  AFTER `hremplmut_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `empl_id` varchar(30) NOT NULL  AFTER `hremplmutmodel_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `site_id` varchar(30) NOT NULL  AFTER `empl_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30)   AFTER `site_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `deptmodel_id` varchar(10) NOT NULL  AFTER `dept_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hrgrd_value` int(4) NOT NULL DEFAULT 0 AFTER `deptmodel_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hrjob_id` varchar(20) NOT NULL  AFTER `hrgrd_value`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_effdate` date NOT NULL  AFTER `hrjob_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_descr` varchar(255)   AFTER `hremplmut_effdate`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `doc_id` varchar(30) NOT NULL  AFTER `hremplmut_descr`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `prev_site_id` varchar(30) NOT NULL  AFTER `doc_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `prev_dept_id` varchar(30)   AFTER `prev_site_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `prev_deptmodel_id` varchar(10) NOT NULL  AFTER `prev_dept_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `prev_hrgrd_value` int(4) NOT NULL DEFAULT 0 AFTER `prev_deptmodel_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `prev_hrjob_id` varchar(20) NOT NULL  AFTER `prev_hrgrd_value`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_issitemut` tinyint(1) NOT NULL DEFAULT 0 AFTER `prev_hrjob_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_isdeptmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_issitemut`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_isjobmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isdeptmut`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_isgradecheck` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isjobmut`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmutmodel_gradedir` int(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isgradecheck`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `user_empl_id` varchar(30) NOT NULL  AFTER `hremplmutmodel_gradedir`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `user_dept_id` varchar(30)   AFTER `user_empl_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_version` int(4) NOT NULL DEFAULT 0 AFTER `user_dept_id`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_rejectnotes` varchar(255)   AFTER `hremplmut_version`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_iscommit` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_rejectnotes`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_commitby` varchar(14)   AFTER `hremplmut_iscommit`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_commitdate` datetime   AFTER `hremplmut_commitby`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_isapprovalprogress` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_commitdate`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_isapprovalprogress`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_approveby` varchar(14)   AFTER `hremplmut_isapproved`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_approvedate` datetime   AFTER `hremplmut_approveby`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_approvedate`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_declineby` varchar(14)   AFTER `hremplmut_isdeclined`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_declinedate` datetime   AFTER `hremplmut_declineby`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_isexecute` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_declinedate`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_executeby` varchar(14)   AFTER `hremplmut_isexecute`;
ALTER TABLE `trn_hremplmut` ADD COLUMN IF NOT EXISTS  `hremplmut_executedate` datetime   AFTER `hremplmut_executeby`;


ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmutmodel_id` varchar(10) NOT NULL  AFTER `hremplmut_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `empl_id` varchar(30) NOT NULL  AFTER `hremplmutmodel_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `site_id` varchar(30) NOT NULL  AFTER `empl_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30)   AFTER `site_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `deptmodel_id` varchar(10) NOT NULL  AFTER `dept_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hrgrd_value` int(4) NOT NULL DEFAULT 0 AFTER `deptmodel_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hrjob_id` varchar(20) NOT NULL  AFTER `hrgrd_value`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_effdate` date NOT NULL  AFTER `hrjob_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_descr` varchar(255)   AFTER `hremplmut_effdate`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `doc_id` varchar(30) NOT NULL  AFTER `hremplmut_descr`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `prev_site_id` varchar(30) NOT NULL  AFTER `doc_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `prev_dept_id` varchar(30)   AFTER `prev_site_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `prev_deptmodel_id` varchar(10) NOT NULL  AFTER `prev_dept_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `prev_hrgrd_value` int(4) NOT NULL DEFAULT 0 AFTER `prev_deptmodel_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `prev_hrjob_id` varchar(20) NOT NULL  AFTER `prev_hrgrd_value`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmutmodel_issitemut` tinyint(1) NOT NULL DEFAULT 0 AFTER `prev_hrjob_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmutmodel_isdeptmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_issitemut`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmutmodel_isjobmut` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isdeptmut`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmutmodel_isgradecheck` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isjobmut`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmutmodel_gradedir` int(1) NOT NULL DEFAULT 0 AFTER `hremplmutmodel_isgradecheck`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `user_empl_id` varchar(30) NOT NULL  AFTER `hremplmutmodel_gradedir`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `user_dept_id` varchar(30)   AFTER `user_empl_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_version` int(4) NOT NULL DEFAULT 0 AFTER `user_dept_id`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_rejectnotes` varchar(255)   AFTER `hremplmut_version`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_iscommit` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_rejectnotes`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_commitby` varchar(14)   AFTER `hremplmut_iscommit`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_commitdate` datetime   AFTER `hremplmut_commitby`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_isapprovalprogress` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_commitdate`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_isapprovalprogress`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_approveby` varchar(14)   AFTER `hremplmut_isapproved`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_approvedate` datetime   AFTER `hremplmut_approveby`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_approvedate`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_declineby` varchar(14)   AFTER `hremplmut_isdeclined`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_declinedate` datetime   AFTER `hremplmut_declineby`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_isexecute` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_declinedate`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_executeby` varchar(14)   AFTER `hremplmut_isexecute`;
ALTER TABLE `trn_hremplmut` MODIFY COLUMN IF EXISTS  `hremplmut_executedate` datetime   AFTER `hremplmut_executeby`;



ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `hremplmutmodel_id` (`hremplmutmodel_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `empl_id` (`empl_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `site_id` (`site_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `dept_id` (`dept_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `deptmodel_id` (`deptmodel_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `hrjob_id` (`hrjob_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `doc_id` (`doc_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `prev_site_id` (`prev_site_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `prev_dept_id` (`prev_dept_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `prev_deptmodel_id` (`prev_deptmodel_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `prev_hrjob_id` (`prev_hrjob_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `user_empl_id` (`user_empl_id`);
ALTER TABLE `trn_hremplmut` ADD KEY IF NOT EXISTS `user_dept_id` (`user_dept_id`);

ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_hremplmutmodel` FOREIGN KEY IF NOT EXISTS  (`hremplmutmodel_id`) REFERENCES `mst_hremplmutmodel` (`hremplmutmodel_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_empl` FOREIGN KEY IF NOT EXISTS  (`empl_id`) REFERENCES `mst_empl` (`empl_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_site` FOREIGN KEY IF NOT EXISTS  (`site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_deptmodel` FOREIGN KEY IF NOT EXISTS  (`deptmodel_id`) REFERENCES `mst_deptmodel` (`deptmodel_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_hrjob` FOREIGN KEY IF NOT EXISTS  (`hrjob_id`) REFERENCES `mst_hrjob` (`hrjob_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_doc` FOREIGN KEY IF NOT EXISTS  (`doc_id`) REFERENCES `mst_doc` (`doc_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_site_2` FOREIGN KEY IF NOT EXISTS  (`prev_site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_dept_2` FOREIGN KEY IF NOT EXISTS  (`prev_dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_deptmodel_2` FOREIGN KEY IF NOT EXISTS  (`prev_deptmodel_id`) REFERENCES `mst_deptmodel` (`deptmodel_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_hrjob_2` FOREIGN KEY IF NOT EXISTS  (`prev_hrjob_id`) REFERENCES `mst_hrjob` (`hrjob_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_empl_2` FOREIGN KEY IF NOT EXISTS  (`user_empl_id`) REFERENCES `mst_empl` (`empl_id`);
ALTER TABLE `trn_hremplmut` ADD CONSTRAINT `fk_trn_hremplmut_mst_dept_3` FOREIGN KEY IF NOT EXISTS  (`user_dept_id`) REFERENCES `mst_dept` (`dept_id`);





CREATE TABLE IF NOT EXISTS `trn_hremplmutappr` (
	`hremplmutappr_id` varchar(14) NOT NULL , 
	`hremplmutappr_isapproved` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutappr_by` varchar(14)  , 
	`hremplmutappr_date` datetime  , 
	`hremplmut_version` int(4) NOT NULL DEFAULT 0, 
	`hremplmutappr_isdeclined` tinyint(1) NOT NULL DEFAULT 0, 
	`hremplmutappr_declinedby` varchar(14)  , 
	`hremplmutappr_declineddate` datetime  , 
	`hremplmutappr_notes` varchar(255)  , 
	`hremplmut_id` varchar(30) NOT NULL , 
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
	UNIQUE KEY `hremplmut_auth_id` (`hremplmut_id`, `auth_id`),
	PRIMARY KEY (`hremplmutappr_id`)
) 
ENGINE=InnoDB
COMMENT='Approval Employee Mutation';


ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmutappr_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutappr_id`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmutappr_by` varchar(14)   AFTER `hremplmutappr_isapproved`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmutappr_date` datetime   AFTER `hremplmutappr_by`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmut_version` int(4) NOT NULL DEFAULT 0 AFTER `hremplmutappr_date`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmutappr_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_version`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmutappr_declinedby` varchar(14)   AFTER `hremplmutappr_isdeclined`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmutappr_declineddate` datetime   AFTER `hremplmutappr_declinedby`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmutappr_notes` varchar(255)   AFTER `hremplmutappr_declineddate`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `hremplmut_id` varchar(30) NOT NULL  AFTER `hremplmutappr_notes`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `docauth_descr` varchar(90)   AFTER `hremplmut_id`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `docauth_order` int(4) NOT NULL DEFAULT 0 AFTER `docauth_descr`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `docauth_value` int(4) NOT NULL DEFAULT 100 AFTER `docauth_order`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `docauth_min` int(4) NOT NULL DEFAULT 0 AFTER `docauth_value`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `authlevel_id` varchar(10) NOT NULL  AFTER `docauth_min`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `authlevel_name` varchar(60) NOT NULL  AFTER `authlevel_id`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `auth_id` varchar(10)   AFTER `authlevel_name`;
ALTER TABLE `trn_hremplmutappr` ADD COLUMN IF NOT EXISTS  `auth_name` varchar(60) NOT NULL  AFTER `auth_id`;


ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmutappr_isapproved` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmutappr_id`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmutappr_by` varchar(14)   AFTER `hremplmutappr_isapproved`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmutappr_date` datetime   AFTER `hremplmutappr_by`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmut_version` int(4) NOT NULL DEFAULT 0 AFTER `hremplmutappr_date`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmutappr_isdeclined` tinyint(1) NOT NULL DEFAULT 0 AFTER `hremplmut_version`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmutappr_declinedby` varchar(14)   AFTER `hremplmutappr_isdeclined`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmutappr_declineddate` datetime   AFTER `hremplmutappr_declinedby`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmutappr_notes` varchar(255)   AFTER `hremplmutappr_declineddate`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `hremplmut_id` varchar(30) NOT NULL  AFTER `hremplmutappr_notes`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `docauth_descr` varchar(90)   AFTER `hremplmut_id`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `docauth_order` int(4) NOT NULL DEFAULT 0 AFTER `docauth_descr`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `docauth_value` int(4) NOT NULL DEFAULT 100 AFTER `docauth_order`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `docauth_min` int(4) NOT NULL DEFAULT 0 AFTER `docauth_value`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `authlevel_id` varchar(10) NOT NULL  AFTER `docauth_min`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `authlevel_name` varchar(60) NOT NULL  AFTER `authlevel_id`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `auth_id` varchar(10)   AFTER `authlevel_name`;
ALTER TABLE `trn_hremplmutappr` MODIFY COLUMN IF EXISTS  `auth_name` varchar(60) NOT NULL  AFTER `auth_id`;


ALTER TABLE `trn_hremplmutappr` ADD CONSTRAINT `hremplmut_auth_id` UNIQUE IF NOT EXISTS  (`hremplmut_id`, `auth_id`);

ALTER TABLE `trn_hremplmutappr` ADD KEY IF NOT EXISTS `hremplmut_id` (`hremplmut_id`);

ALTER TABLE `trn_hremplmutappr` ADD CONSTRAINT `fk_trn_hremplmutappr_trn_hremplmut` FOREIGN KEY IF NOT EXISTS (`hremplmut_id`) REFERENCES `trn_hremplmut` (`hremplmut_id`);





