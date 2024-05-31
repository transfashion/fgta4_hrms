-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_hrcdt`;
-- drop table if exists `mst_hrcdtedu`;
-- drop table if exists `mst_hrcdtfam`;
-- drop table if exists `mst_hrcdttrain`;
-- drop table if exists `mst_hrcdtjobexp`;
-- drop table if exists `mst_hrcdtorg`;
-- drop table if exists `mst_hrcdtreff`;
-- drop table if exists `mst_hrcdtattch`;


CREATE TABLE IF NOT EXISTS `mst_hrcdt` (
	`hrcdt_id` varchar(36) NOT NULL , 
	`hrcdt_name` varchar(255) NOT NULL , 
	`hrcdt_photo` varchar(100) NOT NULL , 
	`gender_id` varchar(1) NOT NULL , 
	`hrcdt_birthplace` varchar(255) NOT NULL , 
	`hrcdt_birthdate` date NOT NULL , 
	`hrcdt_ktp` varchar(100) NOT NULL , 
	`hrcdt_address` varchar(255) NOT NULL , 
	`hrcdt_addressdom` varchar(255) NOT NULL , 
	`hrcdt_email` varchar(255) NOT NULL , 
	`hrcdt_handphone` varchar(20) NOT NULL , 
	`hrcdt_telp` varchar(20)  , 
	`marital_id` varchar(2) NOT NULL , 
	`religion_id` varchar(3) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `hrcdt_email` (`hrcdt_email`),
	UNIQUE KEY `hrcdt_handphone` (`hrcdt_handphone`),
	UNIQUE KEY `hrcdt_ktp` (`hrcdt_ktp`),
	PRIMARY KEY (`hrcdt_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Master Candidate Employee';


ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_name` varchar(255) NOT NULL  AFTER `hrcdt_id`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_photo` varchar(100) NOT NULL  AFTER `hrcdt_name`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `gender_id` varchar(1) NOT NULL  AFTER `hrcdt_photo`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_birthplace` varchar(255) NOT NULL  AFTER `gender_id`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_birthdate` date NOT NULL  AFTER `hrcdt_birthplace`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_ktp` varchar(100) NOT NULL  AFTER `hrcdt_birthdate`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_address` varchar(255) NOT NULL  AFTER `hrcdt_ktp`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_addressdom` varchar(255) NOT NULL  AFTER `hrcdt_address`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_email` varchar(255) NOT NULL  AFTER `hrcdt_addressdom`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_handphone` varchar(20) NOT NULL  AFTER `hrcdt_email`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `hrcdt_telp` varchar(20)   AFTER `hrcdt_handphone`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `marital_id` varchar(2) NOT NULL  AFTER `hrcdt_telp`;
ALTER TABLE `mst_hrcdt` ADD COLUMN IF NOT EXISTS  `religion_id` varchar(3) NOT NULL  AFTER `marital_id`;


ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_name` varchar(255) NOT NULL   AFTER `hrcdt_id`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_photo` varchar(100) NOT NULL   AFTER `hrcdt_name`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `gender_id` varchar(1) NOT NULL   AFTER `hrcdt_photo`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_birthplace` varchar(255) NOT NULL   AFTER `gender_id`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_birthdate` date NOT NULL   AFTER `hrcdt_birthplace`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_ktp` varchar(100) NOT NULL   AFTER `hrcdt_birthdate`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_address` varchar(255) NOT NULL   AFTER `hrcdt_ktp`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_addressdom` varchar(255) NOT NULL   AFTER `hrcdt_address`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_email` varchar(255) NOT NULL   AFTER `hrcdt_addressdom`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_handphone` varchar(20) NOT NULL   AFTER `hrcdt_email`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `hrcdt_telp` varchar(20)    AFTER `hrcdt_handphone`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `marital_id` varchar(2) NOT NULL   AFTER `hrcdt_telp`;
ALTER TABLE `mst_hrcdt` MODIFY COLUMN IF EXISTS  `religion_id` varchar(3) NOT NULL   AFTER `marital_id`;


ALTER TABLE `mst_hrcdt` ADD CONSTRAINT `hrcdt_email` UNIQUE IF NOT EXISTS  (`hrcdt_email`);
ALTER TABLE `mst_hrcdt` ADD CONSTRAINT `hrcdt_handphone` UNIQUE IF NOT EXISTS  (`hrcdt_handphone`);
ALTER TABLE `mst_hrcdt` ADD CONSTRAINT `hrcdt_ktp` UNIQUE IF NOT EXISTS  (`hrcdt_ktp`);

ALTER TABLE `mst_hrcdt` ADD KEY IF NOT EXISTS `gender_id` (`gender_id`);
ALTER TABLE `mst_hrcdt` ADD KEY IF NOT EXISTS `marital_id` (`marital_id`);
ALTER TABLE `mst_hrcdt` ADD KEY IF NOT EXISTS `religion_id` (`religion_id`);

ALTER TABLE `mst_hrcdt` ADD CONSTRAINT `fk_mst_hrcdt_mst_gender` FOREIGN KEY IF NOT EXISTS  (`gender_id`) REFERENCES `mst_gender` (`gender_id`);
ALTER TABLE `mst_hrcdt` ADD CONSTRAINT `fk_mst_hrcdt_mst_marital` FOREIGN KEY IF NOT EXISTS  (`marital_id`) REFERENCES `mst_marital` (`marital_id`);
ALTER TABLE `mst_hrcdt` ADD CONSTRAINT `fk_mst_hrcdt_mst_religion` FOREIGN KEY IF NOT EXISTS  (`religion_id`) REFERENCES `mst_religion` (`religion_id`);





CREATE TABLE IF NOT EXISTS `mst_hrcdtedu` (
	`hrcdtedu_id` varchar(14) NOT NULL , 
	`edu_id` varchar(7) NOT NULL , 
	`hrcdtedu_name` varchar(255) NOT NULL , 
	`hrcdtedu_title` varchar(255)  , 
	`hrcdtedu_city` varchar(255) NOT NULL , 
	`hrcdtedu_gpa` int(4) NOT NULL , 
	`hrcdt_id` varchar(36) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcdtedu_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrcdtedu` ADD COLUMN IF NOT EXISTS  `edu_id` varchar(7) NOT NULL  AFTER `hrcdtedu_id`;
ALTER TABLE `mst_hrcdtedu` ADD COLUMN IF NOT EXISTS  `hrcdtedu_name` varchar(255) NOT NULL  AFTER `edu_id`;
ALTER TABLE `mst_hrcdtedu` ADD COLUMN IF NOT EXISTS  `hrcdtedu_title` varchar(255)   AFTER `hrcdtedu_name`;
ALTER TABLE `mst_hrcdtedu` ADD COLUMN IF NOT EXISTS  `hrcdtedu_city` varchar(255) NOT NULL  AFTER `hrcdtedu_title`;
ALTER TABLE `mst_hrcdtedu` ADD COLUMN IF NOT EXISTS  `hrcdtedu_gpa` int(4) NOT NULL  AFTER `hrcdtedu_city`;
ALTER TABLE `mst_hrcdtedu` ADD COLUMN IF NOT EXISTS  `hrcdt_id` varchar(36) NOT NULL  AFTER `hrcdtedu_gpa`;


ALTER TABLE `mst_hrcdtedu` MODIFY COLUMN IF EXISTS  `edu_id` varchar(7) NOT NULL   AFTER `hrcdtedu_id`;
ALTER TABLE `mst_hrcdtedu` MODIFY COLUMN IF EXISTS  `hrcdtedu_name` varchar(255) NOT NULL  COMMENT 'Nama institusi pendidikan' AFTER `edu_id`;
ALTER TABLE `mst_hrcdtedu` MODIFY COLUMN IF EXISTS  `hrcdtedu_title` varchar(255)    AFTER `hrcdtedu_name`;
ALTER TABLE `mst_hrcdtedu` MODIFY COLUMN IF EXISTS  `hrcdtedu_city` varchar(255) NOT NULL   AFTER `hrcdtedu_title`;
ALTER TABLE `mst_hrcdtedu` MODIFY COLUMN IF EXISTS  `hrcdtedu_gpa` int(4) NOT NULL  COMMENT 'grade nilai kelulusan' AFTER `hrcdtedu_city`;
ALTER TABLE `mst_hrcdtedu` MODIFY COLUMN IF EXISTS  `hrcdt_id` varchar(36) NOT NULL   AFTER `hrcdtedu_gpa`;



ALTER TABLE `mst_hrcdtedu` ADD KEY IF NOT EXISTS `edu_id` (`edu_id`);
ALTER TABLE `mst_hrcdtedu` ADD KEY IF NOT EXISTS `hrcdt_id` (`hrcdt_id`);

ALTER TABLE `mst_hrcdtedu` ADD CONSTRAINT `fk_mst_hrcdtedu_mst_edu` FOREIGN KEY IF NOT EXISTS  (`edu_id`) REFERENCES `mst_edu` (`edu_id`);
ALTER TABLE `mst_hrcdtedu` ADD CONSTRAINT `fk_mst_hrcdtedu_mst_hrcdt` FOREIGN KEY IF NOT EXISTS (`hrcdt_id`) REFERENCES `mst_hrcdt` (`hrcdt_id`);





CREATE TABLE IF NOT EXISTS `mst_hrcdtfam` (
	`hrcdtfam_id` varchar(14) NOT NULL , 
	`hrrel_id` varchar(3) NOT NULL , 
	`hrcdtfam_name` varchar(255) NOT NULL , 
	`gender_id` varchar(1) NOT NULL , 
	`hrcdtfam_birthplace` varchar(255)  , 
	`hrcdtfam_birthdate` date  , 
	`hrcdtfam_handphone` varchar(14)  , 
	`hrcdt_id` varchar(36) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcdtfam_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrcdtfam` ADD COLUMN IF NOT EXISTS  `hrrel_id` varchar(3) NOT NULL  AFTER `hrcdtfam_id`;
ALTER TABLE `mst_hrcdtfam` ADD COLUMN IF NOT EXISTS  `hrcdtfam_name` varchar(255) NOT NULL  AFTER `hrrel_id`;
ALTER TABLE `mst_hrcdtfam` ADD COLUMN IF NOT EXISTS  `gender_id` varchar(1) NOT NULL  AFTER `hrcdtfam_name`;
ALTER TABLE `mst_hrcdtfam` ADD COLUMN IF NOT EXISTS  `hrcdtfam_birthplace` varchar(255)   AFTER `gender_id`;
ALTER TABLE `mst_hrcdtfam` ADD COLUMN IF NOT EXISTS  `hrcdtfam_birthdate` date   AFTER `hrcdtfam_birthplace`;
ALTER TABLE `mst_hrcdtfam` ADD COLUMN IF NOT EXISTS  `hrcdtfam_handphone` varchar(14)   AFTER `hrcdtfam_birthdate`;
ALTER TABLE `mst_hrcdtfam` ADD COLUMN IF NOT EXISTS  `hrcdt_id` varchar(36) NOT NULL  AFTER `hrcdtfam_handphone`;


ALTER TABLE `mst_hrcdtfam` MODIFY COLUMN IF EXISTS  `hrrel_id` varchar(3) NOT NULL   AFTER `hrcdtfam_id`;
ALTER TABLE `mst_hrcdtfam` MODIFY COLUMN IF EXISTS  `hrcdtfam_name` varchar(255) NOT NULL   AFTER `hrrel_id`;
ALTER TABLE `mst_hrcdtfam` MODIFY COLUMN IF EXISTS  `gender_id` varchar(1) NOT NULL   AFTER `hrcdtfam_name`;
ALTER TABLE `mst_hrcdtfam` MODIFY COLUMN IF EXISTS  `hrcdtfam_birthplace` varchar(255)    AFTER `gender_id`;
ALTER TABLE `mst_hrcdtfam` MODIFY COLUMN IF EXISTS  `hrcdtfam_birthdate` date    AFTER `hrcdtfam_birthplace`;
ALTER TABLE `mst_hrcdtfam` MODIFY COLUMN IF EXISTS  `hrcdtfam_handphone` varchar(14)    AFTER `hrcdtfam_birthdate`;
ALTER TABLE `mst_hrcdtfam` MODIFY COLUMN IF EXISTS  `hrcdt_id` varchar(36) NOT NULL   AFTER `hrcdtfam_handphone`;



ALTER TABLE `mst_hrcdtfam` ADD KEY IF NOT EXISTS `hrrel_id` (`hrrel_id`);
ALTER TABLE `mst_hrcdtfam` ADD KEY IF NOT EXISTS `gender_id` (`gender_id`);
ALTER TABLE `mst_hrcdtfam` ADD KEY IF NOT EXISTS `hrcdt_id` (`hrcdt_id`);

ALTER TABLE `mst_hrcdtfam` ADD CONSTRAINT `fk_mst_hrcdtfam_mst_hrrel` FOREIGN KEY IF NOT EXISTS  (`hrrel_id`) REFERENCES `mst_hrrel` (`hrrel_id`);
ALTER TABLE `mst_hrcdtfam` ADD CONSTRAINT `fk_mst_hrcdtfam_mst_gender` FOREIGN KEY IF NOT EXISTS  (`gender_id`) REFERENCES `mst_gender` (`gender_id`);
ALTER TABLE `mst_hrcdtfam` ADD CONSTRAINT `fk_mst_hrcdtfam_mst_hrcdt` FOREIGN KEY IF NOT EXISTS (`hrcdt_id`) REFERENCES `mst_hrcdt` (`hrcdt_id`);





CREATE TABLE IF NOT EXISTS `mst_hrcdttrain` (
	`hrcdttrain_id` varchar(14) NOT NULL , 
	`hrcdttrain_name` varchar(255) NOT NULL , 
	`hrcdttrain_organizer` varchar(255) NOT NULL , 
	`hrcdttrain_city` varchar(255) NOT NULL , 
	`hrcdttrain_year` int(4) NOT NULL , 
	`hrcdttrain_descr` varchar(255)  , 
	`hrcdt_id` varchar(36) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcdttrain_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrcdttrain` ADD COLUMN IF NOT EXISTS  `hrcdttrain_name` varchar(255) NOT NULL  AFTER `hrcdttrain_id`;
ALTER TABLE `mst_hrcdttrain` ADD COLUMN IF NOT EXISTS  `hrcdttrain_organizer` varchar(255) NOT NULL  AFTER `hrcdttrain_name`;
ALTER TABLE `mst_hrcdttrain` ADD COLUMN IF NOT EXISTS  `hrcdttrain_city` varchar(255) NOT NULL  AFTER `hrcdttrain_organizer`;
ALTER TABLE `mst_hrcdttrain` ADD COLUMN IF NOT EXISTS  `hrcdttrain_year` int(4) NOT NULL  AFTER `hrcdttrain_city`;
ALTER TABLE `mst_hrcdttrain` ADD COLUMN IF NOT EXISTS  `hrcdttrain_descr` varchar(255)   AFTER `hrcdttrain_year`;
ALTER TABLE `mst_hrcdttrain` ADD COLUMN IF NOT EXISTS  `hrcdt_id` varchar(36) NOT NULL  AFTER `hrcdttrain_descr`;


ALTER TABLE `mst_hrcdttrain` MODIFY COLUMN IF EXISTS  `hrcdttrain_name` varchar(255) NOT NULL   AFTER `hrcdttrain_id`;
ALTER TABLE `mst_hrcdttrain` MODIFY COLUMN IF EXISTS  `hrcdttrain_organizer` varchar(255) NOT NULL   AFTER `hrcdttrain_name`;
ALTER TABLE `mst_hrcdttrain` MODIFY COLUMN IF EXISTS  `hrcdttrain_city` varchar(255) NOT NULL   AFTER `hrcdttrain_organizer`;
ALTER TABLE `mst_hrcdttrain` MODIFY COLUMN IF EXISTS  `hrcdttrain_year` int(4) NOT NULL   AFTER `hrcdttrain_city`;
ALTER TABLE `mst_hrcdttrain` MODIFY COLUMN IF EXISTS  `hrcdttrain_descr` varchar(255)    AFTER `hrcdttrain_year`;
ALTER TABLE `mst_hrcdttrain` MODIFY COLUMN IF EXISTS  `hrcdt_id` varchar(36) NOT NULL   AFTER `hrcdttrain_descr`;



ALTER TABLE `mst_hrcdttrain` ADD KEY IF NOT EXISTS `hrcdt_id` (`hrcdt_id`);

ALTER TABLE `mst_hrcdttrain` ADD CONSTRAINT `fk_mst_hrcdttrain_mst_hrcdt` FOREIGN KEY IF NOT EXISTS (`hrcdt_id`) REFERENCES `mst_hrcdt` (`hrcdt_id`);





CREATE TABLE IF NOT EXISTS `mst_hrcdtjobexp` (
	`hrcdtjobexp_id` varchar(14) NOT NULL , 
	`hrcdtjobexp_company` varchar(255) NOT NULL , 
	`hrcdtjobexp_position` varchar(255) NOT NULL , 
	`hrcdtjobexp_dtjoin` date NOT NULL , 
	`hrcdtjobexp_dtleave` date NOT NULL , 
	`hrcdtjobexp_jobdescr` varchar(255) NOT NULL , 
	`hrcdtjobexp_reasonleave` varchar(255) NOT NULL , 
	`hrcdt_id` varchar(36) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcdtjobexp_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrcdtjobexp` ADD COLUMN IF NOT EXISTS  `hrcdtjobexp_company` varchar(255) NOT NULL  AFTER `hrcdtjobexp_id`;
ALTER TABLE `mst_hrcdtjobexp` ADD COLUMN IF NOT EXISTS  `hrcdtjobexp_position` varchar(255) NOT NULL  AFTER `hrcdtjobexp_company`;
ALTER TABLE `mst_hrcdtjobexp` ADD COLUMN IF NOT EXISTS  `hrcdtjobexp_dtjoin` date NOT NULL  AFTER `hrcdtjobexp_position`;
ALTER TABLE `mst_hrcdtjobexp` ADD COLUMN IF NOT EXISTS  `hrcdtjobexp_dtleave` date NOT NULL  AFTER `hrcdtjobexp_dtjoin`;
ALTER TABLE `mst_hrcdtjobexp` ADD COLUMN IF NOT EXISTS  `hrcdtjobexp_jobdescr` varchar(255) NOT NULL  AFTER `hrcdtjobexp_dtleave`;
ALTER TABLE `mst_hrcdtjobexp` ADD COLUMN IF NOT EXISTS  `hrcdtjobexp_reasonleave` varchar(255) NOT NULL  AFTER `hrcdtjobexp_jobdescr`;
ALTER TABLE `mst_hrcdtjobexp` ADD COLUMN IF NOT EXISTS  `hrcdt_id` varchar(36) NOT NULL  AFTER `hrcdtjobexp_reasonleave`;


ALTER TABLE `mst_hrcdtjobexp` MODIFY COLUMN IF EXISTS  `hrcdtjobexp_company` varchar(255) NOT NULL   AFTER `hrcdtjobexp_id`;
ALTER TABLE `mst_hrcdtjobexp` MODIFY COLUMN IF EXISTS  `hrcdtjobexp_position` varchar(255) NOT NULL   AFTER `hrcdtjobexp_company`;
ALTER TABLE `mst_hrcdtjobexp` MODIFY COLUMN IF EXISTS  `hrcdtjobexp_dtjoin` date NOT NULL   AFTER `hrcdtjobexp_position`;
ALTER TABLE `mst_hrcdtjobexp` MODIFY COLUMN IF EXISTS  `hrcdtjobexp_dtleave` date NOT NULL   AFTER `hrcdtjobexp_dtjoin`;
ALTER TABLE `mst_hrcdtjobexp` MODIFY COLUMN IF EXISTS  `hrcdtjobexp_jobdescr` varchar(255) NOT NULL   AFTER `hrcdtjobexp_dtleave`;
ALTER TABLE `mst_hrcdtjobexp` MODIFY COLUMN IF EXISTS  `hrcdtjobexp_reasonleave` varchar(255) NOT NULL   AFTER `hrcdtjobexp_jobdescr`;
ALTER TABLE `mst_hrcdtjobexp` MODIFY COLUMN IF EXISTS  `hrcdt_id` varchar(36) NOT NULL   AFTER `hrcdtjobexp_reasonleave`;



ALTER TABLE `mst_hrcdtjobexp` ADD KEY IF NOT EXISTS `hrcdt_id` (`hrcdt_id`);

ALTER TABLE `mst_hrcdtjobexp` ADD CONSTRAINT `fk_mst_hrcdtjobexp_mst_hrcdt` FOREIGN KEY IF NOT EXISTS (`hrcdt_id`) REFERENCES `mst_hrcdt` (`hrcdt_id`);





CREATE TABLE IF NOT EXISTS `mst_hrcdtorg` (
	`hrcdtorg_id` varchar(14) NOT NULL , 
	`hrcdtorg_name` varchar(255) NOT NULL , 
	`hrcdtorg_city` varchar(255) NOT NULL , 
	`hrcdtorg_position` varchar(255) NOT NULL , 
	`hrcdtorg_descr` varchar(255)  , 
	`hrcdt_id` varchar(36) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcdtorg_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrcdtorg` ADD COLUMN IF NOT EXISTS  `hrcdtorg_name` varchar(255) NOT NULL  AFTER `hrcdtorg_id`;
ALTER TABLE `mst_hrcdtorg` ADD COLUMN IF NOT EXISTS  `hrcdtorg_city` varchar(255) NOT NULL  AFTER `hrcdtorg_name`;
ALTER TABLE `mst_hrcdtorg` ADD COLUMN IF NOT EXISTS  `hrcdtorg_position` varchar(255) NOT NULL  AFTER `hrcdtorg_city`;
ALTER TABLE `mst_hrcdtorg` ADD COLUMN IF NOT EXISTS  `hrcdtorg_descr` varchar(255)   AFTER `hrcdtorg_position`;
ALTER TABLE `mst_hrcdtorg` ADD COLUMN IF NOT EXISTS  `hrcdt_id` varchar(36) NOT NULL  AFTER `hrcdtorg_descr`;


ALTER TABLE `mst_hrcdtorg` MODIFY COLUMN IF EXISTS  `hrcdtorg_name` varchar(255) NOT NULL   AFTER `hrcdtorg_id`;
ALTER TABLE `mst_hrcdtorg` MODIFY COLUMN IF EXISTS  `hrcdtorg_city` varchar(255) NOT NULL   AFTER `hrcdtorg_name`;
ALTER TABLE `mst_hrcdtorg` MODIFY COLUMN IF EXISTS  `hrcdtorg_position` varchar(255) NOT NULL   AFTER `hrcdtorg_city`;
ALTER TABLE `mst_hrcdtorg` MODIFY COLUMN IF EXISTS  `hrcdtorg_descr` varchar(255)    AFTER `hrcdtorg_position`;
ALTER TABLE `mst_hrcdtorg` MODIFY COLUMN IF EXISTS  `hrcdt_id` varchar(36) NOT NULL   AFTER `hrcdtorg_descr`;



ALTER TABLE `mst_hrcdtorg` ADD KEY IF NOT EXISTS `hrcdt_id` (`hrcdt_id`);

ALTER TABLE `mst_hrcdtorg` ADD CONSTRAINT `fk_mst_hrcdtorg_mst_hrcdt` FOREIGN KEY IF NOT EXISTS (`hrcdt_id`) REFERENCES `mst_hrcdt` (`hrcdt_id`);





CREATE TABLE IF NOT EXISTS `mst_hrcdtreff` (
	`hrcdtreff_id` varchar(14) NOT NULL , 
	`hrcdtreff_name` varchar(255) NOT NULL , 
	`hrcdtreff_relation` varchar(20) NOT NULL , 
	`hrcdtreff_handphone` varchar(14)  , 
	`hrcdt_id` varchar(36) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcdtreff_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrcdtreff` ADD COLUMN IF NOT EXISTS  `hrcdtreff_name` varchar(255) NOT NULL  AFTER `hrcdtreff_id`;
ALTER TABLE `mst_hrcdtreff` ADD COLUMN IF NOT EXISTS  `hrcdtreff_relation` varchar(20) NOT NULL  AFTER `hrcdtreff_name`;
ALTER TABLE `mst_hrcdtreff` ADD COLUMN IF NOT EXISTS  `hrcdtreff_handphone` varchar(14)   AFTER `hrcdtreff_relation`;
ALTER TABLE `mst_hrcdtreff` ADD COLUMN IF NOT EXISTS  `hrcdt_id` varchar(36) NOT NULL  AFTER `hrcdtreff_handphone`;


ALTER TABLE `mst_hrcdtreff` MODIFY COLUMN IF EXISTS  `hrcdtreff_name` varchar(255) NOT NULL   AFTER `hrcdtreff_id`;
ALTER TABLE `mst_hrcdtreff` MODIFY COLUMN IF EXISTS  `hrcdtreff_relation` varchar(20) NOT NULL   AFTER `hrcdtreff_name`;
ALTER TABLE `mst_hrcdtreff` MODIFY COLUMN IF EXISTS  `hrcdtreff_handphone` varchar(14)    AFTER `hrcdtreff_relation`;
ALTER TABLE `mst_hrcdtreff` MODIFY COLUMN IF EXISTS  `hrcdt_id` varchar(36) NOT NULL   AFTER `hrcdtreff_handphone`;



ALTER TABLE `mst_hrcdtreff` ADD KEY IF NOT EXISTS `hrcdt_id` (`hrcdt_id`);

ALTER TABLE `mst_hrcdtreff` ADD CONSTRAINT `fk_mst_hrcdtreff_mst_hrcdt` FOREIGN KEY IF NOT EXISTS (`hrcdt_id`) REFERENCES `mst_hrcdt` (`hrcdt_id`);





CREATE TABLE IF NOT EXISTS `mst_hrcdtattch` (
	`hrcdtattch_id` varchar(14) NOT NULL , 
	`hrcdtattch_name` varchar(255) NOT NULL , 
	`hrcdtattch_filename` varchar(50) NOT NULL , 
	`hrcdtattch_validity` date NOT NULL , 
	`hrcdtattch_expired` date  , 
	`hrcdtdate_id` varchar(36) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`hrcdtattch_id`)
) 
ENGINE=InnoDB
COMMENT='';


ALTER TABLE `mst_hrcdtattch` ADD COLUMN IF NOT EXISTS  `hrcdtattch_name` varchar(255) NOT NULL  AFTER `hrcdtattch_id`;
ALTER TABLE `mst_hrcdtattch` ADD COLUMN IF NOT EXISTS  `hrcdtattch_filename` varchar(50) NOT NULL  AFTER `hrcdtattch_name`;
ALTER TABLE `mst_hrcdtattch` ADD COLUMN IF NOT EXISTS  `hrcdtattch_validity` date NOT NULL  AFTER `hrcdtattch_filename`;
ALTER TABLE `mst_hrcdtattch` ADD COLUMN IF NOT EXISTS  `hrcdtattch_expired` date   AFTER `hrcdtattch_validity`;
ALTER TABLE `mst_hrcdtattch` ADD COLUMN IF NOT EXISTS  `hrcdtdate_id` varchar(36) NOT NULL  AFTER `hrcdtattch_expired`;


ALTER TABLE `mst_hrcdtattch` MODIFY COLUMN IF EXISTS  `hrcdtattch_name` varchar(255) NOT NULL   AFTER `hrcdtattch_id`;
ALTER TABLE `mst_hrcdtattch` MODIFY COLUMN IF EXISTS  `hrcdtattch_filename` varchar(50) NOT NULL   AFTER `hrcdtattch_name`;
ALTER TABLE `mst_hrcdtattch` MODIFY COLUMN IF EXISTS  `hrcdtattch_validity` date NOT NULL   AFTER `hrcdtattch_filename`;
ALTER TABLE `mst_hrcdtattch` MODIFY COLUMN IF EXISTS  `hrcdtattch_expired` date    AFTER `hrcdtattch_validity`;
ALTER TABLE `mst_hrcdtattch` MODIFY COLUMN IF EXISTS  `hrcdtdate_id` varchar(36) NOT NULL   AFTER `hrcdtattch_expired`;









