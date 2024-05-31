<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-header-handler.php')) {
	require_once __DIR__ .'/data-header-handler.php';
}


use \FGTA4\exceptions\WebException;


/**
 * hrms/master/empl/apis/open.php
 *
 * ====
 * Open
 * ====
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel header empl (mst_empl)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 20/01/2023
 */
$API = new class extends emplBase {
	
	public function execute($options) {
		$event = 'on-open';
		$tablename = 'mst_empl';
		$primarykey = 'empl_id';
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\empl_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new empl_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		} else {
			$hnd = new \stdClass;
		}

		try {

			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "open", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			$criteriaValues = [
				"empl_id" => " empl_id = :empl_id "
			];
			if (method_exists(get_class($hnd), 'buildOpenCriteriaValues')) {
				// buildOpenCriteriaValues(object $options, array &$criteriaValues) : void
				$hnd->buildOpenCriteriaValues($options, $criteriaValues);
			}
			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			$result = new \stdClass; 

			if (method_exists(get_class($hnd), 'prepareOpenData')) {
				// prepareOpenData(object $options, $criteriaValues) : void
				$hnd->prepareOpenData($options, $criteriaValues);
			}


			$sqlFieldList = [
				'empl_id' => 'A.`empl_id`', 'empl_nik' => 'A.`empl_nik`', 'empl_name' => 'A.`empl_name`', 'empl_isdisabled' => 'A.`empl_isdisabled`',
				'empl_dtjoin' => 'A.`empl_dtjoin`', 'empl_dtexit' => 'A.`empl_dtexit`', 'empl_birthplace' => 'A.`empl_birthplace`', 'empl_birthdate' => 'A.`empl_birthdate`',
				'gender_id' => 'A.`gender_id`', 'religion_id' => 'A.`religion_id`', 'empl_addressline1' => 'A.`empl_addressline1`', 'empl_addressline2' => 'A.`empl_addressline2`',
				'empl_addressline3' => 'A.`empl_addressline3`', 'empl_city' => 'A.`empl_city`', 'empl_postcode' => 'A.`empl_postcode`', 'empl_prov' => 'A.`empl_prov`',
				'country_id' => 'A.`country_id`', 'empl_mobilephone' => 'A.`empl_mobilephone`', 'empl_phone' => 'A.`empl_phone`', 'empl_email' => 'A.`empl_email`',
				'edu_id' => 'A.`edu_id`', 'empl_kk' => 'A.`empl_kk`', 'empl_ktp' => 'A.`empl_ktp`', 'empl_npwp' => 'A.`empl_npwp`',
				'marital_id' => 'A.`marital_id`', 'empl_bpjstk' => 'A.`empl_bpjstk`', 'empl_bpjskes' => 'A.`empl_bpjskes`', 'empl_namaibu' => 'A.`empl_namaibu`',
				'empl_rek1' => 'A.`empl_rek1`', 'empl_rek2' => 'A.`empl_rek2`', 'hrstatus_id' => 'A.`hrstatus_id`', 'dept_id' => 'A.`dept_id`',
				'hrjob_id' => 'A.`hrjob_id`', 'site_id' => 'A.`site_id`', 'auth_id' => 'A.`auth_id`', '_createby' => 'A.`_createby`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "mst_empl A";
			$sqlWhere = $where->sql;

			if (method_exists(get_class($hnd), 'SqlQueryOpenBuilder')) {
				// SqlQueryOpenBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
				$hnd->SqlQueryOpenBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
			}
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($sqlFieldList);

			
			$sqlData = "
				select 
				$sqlFields 
				from 
				$sqlFromTable 
				$sqlWhere 
			";

			$stmt = $this->db->prepare($sqlData);
			$stmt->execute($where->params);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);

			$record = [];
			foreach ($row as $key => $value) {
				$record[$key] = $value;
			}



			$result->record = array_merge($record, [
				'empl_dtjoin' => date("d/m/Y", strtotime($record['empl_dtjoin'])),
				'empl_dtexit' => date("d/m/Y", strtotime($record['empl_dtexit'])),
				'empl_birthdate' => date("d/m/Y", strtotime($record['empl_birthdate'])),
				
				// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
				// 'tambahan' => 'dta',
				//'tanggal' => date("d/m/Y", strtotime($record['tanggal'])),
				//'gendername' => $record['gender']
				
				'gender_name' => \FGTA4\utils\SqlUtility::Lookup($record['gender_id'], $this->db, 'mst_gender', 'gender_id', 'gender_name'),
				'religion_name' => \FGTA4\utils\SqlUtility::Lookup($record['religion_id'], $this->db, 'mst_religion', 'religion_id', 'religion_name'),
				'country_name' => \FGTA4\utils\SqlUtility::Lookup($record['country_id'], $this->db, 'mst_country', 'country_id', 'country_name'),
				'edu_name' => \FGTA4\utils\SqlUtility::Lookup($record['edu_id'], $this->db, 'mst_edu', 'edu_id', 'edu_name'),
				'marital_name' => \FGTA4\utils\SqlUtility::Lookup($record['marital_id'], $this->db, 'mst_marital', 'marital_id', 'marital_name'),
				'hrstatus_name' => \FGTA4\utils\SqlUtility::Lookup($record['hrstatus_id'], $this->db, 'mst_hrstatus', 'hrstatus_id', 'hrstatus_name'),
				'dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
				'hrjob_name' => \FGTA4\utils\SqlUtility::Lookup($record['hrjob_id'], $this->db, 'mst_hrjob', 'hrjob_id', 'hrjob_name'),
				'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
				'auth_name' => \FGTA4\utils\SqlUtility::Lookup($record['auth_id'], $this->db, 'mst_auth', 'auth_id', 'auth_name'),


				'_createby' => \FGTA4\utils\SqlUtility::Lookup($record['_createby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				'_modifyby' => \FGTA4\utils\SqlUtility::Lookup($record['_modifyby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),

			]);


			

			if (method_exists(get_class($hnd), 'DataOpen')) {
				//  DataOpen(array &$record) : void 
				$hnd->DataOpen($result->record);
			}

			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};