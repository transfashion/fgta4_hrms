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
 * hrms/hrd/hremplmut/apis/open.php
 *
 * ====
 * Open
 * ====
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel header hremplmut (trn_hremplmut)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 05/02/2023
 */
$API = new class extends hremplmutBase {
	
	public function execute($options) {
		$event = 'on-open';
		$tablename = 'trn_hremplmut';
		$primarykey = 'hremplmut_id';
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\hremplmut_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new hremplmut_headerHandler($options);
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

			if (method_exists(get_class($hnd), 'PreCheckOpen')) {
				// PreCheckOpen($data, &$key, &$options)
				$hnd->PreCheckOpen($data, $key, $options);
			}

			$criteriaValues = [
				"hremplmut_id" => " hremplmut_id = :hremplmut_id "
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
			

			if (method_exists(get_class($hnd), 'prepareOpenData')) {
				// prepareOpenData(object $options, $criteriaValues) : void
				$hnd->prepareOpenData($options, $criteriaValues);
			}


			$sqlFieldList = [
				'hremplmut_id' => 'A.`hremplmut_id`', 'hremplmutmodel_id' => 'A.`hremplmutmodel_id`', 'empl_id' => 'A.`empl_id`', 'site_id' => 'A.`site_id`',
				'dept_id' => 'A.`dept_id`', 'deptmodel_id' => 'A.`deptmodel_id`', 'hrgrd_value' => 'A.`hrgrd_value`', 'hrjob_id' => 'A.`hrjob_id`',
				'hremplmut_effdate' => 'A.`hremplmut_effdate`', 'hremplmut_descr' => 'A.`hremplmut_descr`', 'doc_id' => 'A.`doc_id`', 'prev_site_id' => 'A.`prev_site_id`',
				'prev_dept_id' => 'A.`prev_dept_id`', 'prev_deptmodel_id' => 'A.`prev_deptmodel_id`', 'prev_hrgrd_value' => 'A.`prev_hrgrd_value`', 'prev_hrjob_id' => 'A.`prev_hrjob_id`',
				'hremplmutmodel_issitemut' => 'A.`hremplmutmodel_issitemut`', 'hremplmutmodel_isdeptmut' => 'A.`hremplmutmodel_isdeptmut`', 'hremplmutmodel_isjobmut' => 'A.`hremplmutmodel_isjobmut`', 'hremplmutmodel_isgradecheck' => 'A.`hremplmutmodel_isgradecheck`',
				'hremplmutmodel_gradedir' => 'A.`hremplmutmodel_gradedir`', 'user_empl_id' => 'A.`user_empl_id`', 'user_dept_id' => 'A.`user_dept_id`', 'hremplmut_version' => 'A.`hremplmut_version`',
				'hremplmut_rejectnotes' => 'A.`hremplmut_rejectnotes`', 'hremplmut_iscommit' => 'A.`hremplmut_iscommit`', 'hremplmut_commitby' => 'A.`hremplmut_commitby`', 'hremplmut_commitdate' => 'A.`hremplmut_commitdate`',
				'hremplmut_isapprovalprogress' => 'A.`hremplmut_isapprovalprogress`', 'hremplmut_isapproved' => 'A.`hremplmut_isapproved`', 'hremplmut_approveby' => 'A.`hremplmut_approveby`', 'hremplmut_approvedate' => 'A.`hremplmut_approvedate`',
				'hremplmut_isdeclined' => 'A.`hremplmut_isdeclined`', 'hremplmut_declineby' => 'A.`hremplmut_declineby`', 'hremplmut_declinedate' => 'A.`hremplmut_declinedate`', 'hremplmut_isexecute' => 'A.`hremplmut_isexecute`',
				'hremplmut_executeby' => 'A.`hremplmut_executeby`', 'hremplmut_executedate' => 'A.`hremplmut_executedate`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "trn_hremplmut A";
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


			$approverow = \FGTA4\utils\SqlUtility::LookupRow((object)["$this->main_primarykey"=>$record[$this->main_primarykey], "$this->approval_field_approveby"=>$userdata->username, "$this->approval_field_approve"=>'1'], $this->db, $this->approval_tablename);
			$declinerow = \FGTA4\utils\SqlUtility::LookupRow((object)["$this->main_primarykey"=>$record[$this->main_primarykey], "$this->approval_field_declineby"=>$userdata->username, "$this->approval_field_decline"=>'1'], $this->db, "$this->approval_tablename");
			

			$result->record = array_merge($record, [
				'hremplmut_effdate' => date("d/m/Y", strtotime($record['hremplmut_effdate'])),
				
				// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
				// 'tambahan' => 'dta',
				//'tanggal' => date("d/m/Y", strtotime($record['tanggal'])),
				//'gendername' => $record['gender']
				
				'hremplmutmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['hremplmutmodel_id'], $this->db, 'mst_hremplmutmodel', 'hremplmutmodel_id', 'hremplmutmodel_name'),
				'empl_name' => \FGTA4\utils\SqlUtility::Lookup($record['empl_id'], $this->db, 'mst_empl', 'empl_id', 'empl_name'),
				'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
				'dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
				'deptmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptmodel_id'], $this->db, 'mst_deptmodel', 'deptmodel_id', 'deptmodel_name'),
				'hrjob_name' => \FGTA4\utils\SqlUtility::Lookup($record['hrjob_id'], $this->db, 'mst_hrjob', 'hrjob_id', 'hrjob_name'),
				'doc_name' => \FGTA4\utils\SqlUtility::Lookup($record['doc_id'], $this->db, 'mst_doc', 'doc_id', 'doc_name'),
				'prev_site_name' => \FGTA4\utils\SqlUtility::Lookup($record['prev_site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
				'prev_dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['prev_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
				'prev_deptmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['prev_deptmodel_id'], $this->db, 'mst_deptmodel', 'deptmodel_id', 'deptmodel_name'),
				'prev_hrjob_name' => \FGTA4\utils\SqlUtility::Lookup($record['prev_hrjob_id'], $this->db, 'mst_hrjob', 'hrjob_id', 'hrjob_name'),
				'user_empl_name' => \FGTA4\utils\SqlUtility::Lookup($record['user_empl_id'], $this->db, 'mst_empl', 'empl_id', 'empl_name'),
				'user_dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['user_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
				'hremplmut_commitby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplmut_commitby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				'hremplmut_approveby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplmut_approveby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				'hremplmut_declineby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplmut_declineby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				'hremplmut_executeby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplmut_executeby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),


				'pros_isuseralreadyapproved' => $approverow!=null ? '1' : '0',
				'pros_isuseralreadydeclined' => $declinerow!=null ? '1' : '0',
			
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