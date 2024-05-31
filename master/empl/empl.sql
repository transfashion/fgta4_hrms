-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_empl`;


CREATE TABLE IF NOT EXISTS `mst_empl` (
	`empl_id` varchar(30) NOT NULL , 
	`empl_nik` varchar(30)  , 
	`empl_name` varchar(60) NOT NULL , 
	`empl_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`empl_dtjoin` date NOT NULL , 
	`empl_dtexit` date  , 
	`empl_birthplace` varchar(30) NOT NULL , 
	`empl_birthdate` date  , 
	`gender_id` varchar(1)  , 
	`religion_id` varchar(3)  , 
	`empl_addressline1` varchar(255)  , 
	`empl_addressline2` varchar(255)  , 
	`empl_addressline3` varchar(255)  , 
	`empl_city` varchar(20)  , 
	`empl_postcode` varchar(10) NOT NULL , 
	`empl_prov` varchar(20)  , 
	`country_id` varchar(10)  , 
	`empl_mobilephone` varchar(30) NOT NULL , 
	`empl_phone` varchar(30) NOT NULL , 
	`empl_email` varchar(120)  , 
	`edu_id` varchar(7)  , 
	`empl_kk` varchar(30)  , 
	`empl_ktp` varchar(30)  , 
	`empl_npwp` varchar(30)  , 
	`marital_id` varchar(2)  , 
	`empl_bpjstk` varchar(30)  , 
	`empl_bpjskes` varchar(30)  , 
	`empl_namaibu` varchar(90) NOT NULL , 
	`empl_rek1` varchar(90) NOT NULL , 
	`empl_rek2` varchar(90) NOT NULL , 
	`hrstatus_id` varchar(3)  , 
	`dept_id` varchar(30)  , 
	`hrjob_id` varchar(20)  , 
	`site_id` varchar(30)  , 
	`auth_id` varchar(30)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `empl_nik` (`empl_nik`),
	UNIQUE KEY `empl_email` (`empl_email`),
	PRIMARY KEY (`empl_id`)
) 
ENGINE=InnoDB
COMMENT='Master Employee';


ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_nik` varchar(30)   AFTER `empl_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_name` varchar(60) NOT NULL  AFTER `empl_nik`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `empl_name`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_dtjoin` date NOT NULL  AFTER `empl_isdisabled`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_dtexit` date   AFTER `empl_dtjoin`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_birthplace` varchar(30) NOT NULL  AFTER `empl_dtexit`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_birthdate` date   AFTER `empl_birthplace`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `gender_id` varchar(1)   AFTER `empl_birthdate`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `religion_id` varchar(3)   AFTER `gender_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_addressline1` varchar(255)   AFTER `religion_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_addressline2` varchar(255)   AFTER `empl_addressline1`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_addressline3` varchar(255)   AFTER `empl_addressline2`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_city` varchar(20)   AFTER `empl_addressline3`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_postcode` varchar(10) NOT NULL  AFTER `empl_city`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_prov` varchar(20)   AFTER `empl_postcode`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `country_id` varchar(10)   AFTER `empl_prov`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_mobilephone` varchar(30) NOT NULL  AFTER `country_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_phone` varchar(30) NOT NULL  AFTER `empl_mobilephone`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_email` varchar(120)   AFTER `empl_phone`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `edu_id` varchar(7)   AFTER `empl_email`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_kk` varchar(30)   AFTER `edu_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_ktp` varchar(30)   AFTER `empl_kk`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_npwp` varchar(30)   AFTER `empl_ktp`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `marital_id` varchar(2)   AFTER `empl_npwp`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_bpjstk` varchar(30)   AFTER `marital_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_bpjskes` varchar(30)   AFTER `empl_bpjstk`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_namaibu` varchar(90) NOT NULL  AFTER `empl_bpjskes`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_rek1` varchar(90) NOT NULL  AFTER `empl_namaibu`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `empl_rek2` varchar(90) NOT NULL  AFTER `empl_rek1`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `hrstatus_id` varchar(3)   AFTER `empl_rek2`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30)   AFTER `hrstatus_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `hrjob_id` varchar(20)   AFTER `dept_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `site_id` varchar(30)   AFTER `hrjob_id`;
ALTER TABLE `mst_empl` ADD COLUMN IF NOT EXISTS  `auth_id` varchar(30)   AFTER `site_id`;


ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_nik` varchar(30)   AFTER `empl_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_name` varchar(60) NOT NULL  AFTER `empl_nik`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `empl_name`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_dtjoin` date NOT NULL  AFTER `empl_isdisabled`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_dtexit` date   AFTER `empl_dtjoin`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_birthplace` varchar(30) NOT NULL  AFTER `empl_dtexit`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_birthdate` date   AFTER `empl_birthplace`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `gender_id` varchar(1)   AFTER `empl_birthdate`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `religion_id` varchar(3)   AFTER `gender_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_addressline1` varchar(255)   AFTER `religion_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_addressline2` varchar(255)   AFTER `empl_addressline1`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_addressline3` varchar(255)   AFTER `empl_addressline2`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_city` varchar(20)   AFTER `empl_addressline3`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_postcode` varchar(10) NOT NULL  AFTER `empl_city`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_prov` varchar(20)   AFTER `empl_postcode`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `country_id` varchar(10)   AFTER `empl_prov`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_mobilephone` varchar(30) NOT NULL  AFTER `country_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_phone` varchar(30) NOT NULL  AFTER `empl_mobilephone`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_email` varchar(120)   AFTER `empl_phone`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `edu_id` varchar(7)   AFTER `empl_email`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_kk` varchar(30)   AFTER `edu_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_ktp` varchar(30)   AFTER `empl_kk`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_npwp` varchar(30)   AFTER `empl_ktp`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `marital_id` varchar(2)   AFTER `empl_npwp`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_bpjstk` varchar(30)   AFTER `marital_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_bpjskes` varchar(30)   AFTER `empl_bpjstk`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_namaibu` varchar(90) NOT NULL  AFTER `empl_bpjskes`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_rek1` varchar(90) NOT NULL  AFTER `empl_namaibu`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `empl_rek2` varchar(90) NOT NULL  AFTER `empl_rek1`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `hrstatus_id` varchar(3)   AFTER `empl_rek2`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30)   AFTER `hrstatus_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `hrjob_id` varchar(20)   AFTER `dept_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `site_id` varchar(30)   AFTER `hrjob_id`;
ALTER TABLE `mst_empl` MODIFY COLUMN IF EXISTS  `auth_id` varchar(30)   AFTER `site_id`;


ALTER TABLE `mst_empl` ADD CONSTRAINT `empl_nik` UNIQUE IF NOT EXISTS  (`empl_nik`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `empl_email` UNIQUE IF NOT EXISTS  (`empl_email`);

ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `gender_id` (`gender_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `religion_id` (`religion_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `country_id` (`country_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `edu_id` (`edu_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `marital_id` (`marital_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `hrstatus_id` (`hrstatus_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `dept_id` (`dept_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `hrjob_id` (`hrjob_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `site_id` (`site_id`);
ALTER TABLE `mst_empl` ADD KEY IF NOT EXISTS `auth_id` (`auth_id`);

ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_gender` FOREIGN KEY IF NOT EXISTS  (`gender_id`) REFERENCES `mst_gender` (`gender_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_religion` FOREIGN KEY IF NOT EXISTS  (`religion_id`) REFERENCES `mst_religion` (`religion_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_country` FOREIGN KEY IF NOT EXISTS  (`country_id`) REFERENCES `mst_country` (`country_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_edu` FOREIGN KEY IF NOT EXISTS  (`edu_id`) REFERENCES `mst_edu` (`edu_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_marital` FOREIGN KEY IF NOT EXISTS  (`marital_id`) REFERENCES `mst_marital` (`marital_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_hrstatus` FOREIGN KEY IF NOT EXISTS  (`hrstatus_id`) REFERENCES `mst_hrstatus` (`hrstatus_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_hrjob` FOREIGN KEY IF NOT EXISTS  (`hrjob_id`) REFERENCES `mst_hrjob` (`hrjob_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_site` FOREIGN KEY IF NOT EXISTS  (`site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `mst_empl` ADD CONSTRAINT `fk_mst_empl_mst_auth` FOREIGN KEY IF NOT EXISTS  (`auth_id`) REFERENCES `mst_auth` (`auth_id`);





