<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-approval-handler.php')) {
	require_once __DIR__ .'/data-approval-handler.php';
}


use \FGTA4\exceptions\WebException;



/**
 * hrms/hrd/hremplmut/apis/approval-open.php
 *
 * ==========
 * Detil-Open
 * ==========
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel approval hremplmut (trn_hremplmutappr)
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
		$tablename = 'trn_hremplmutappr';
		$primarykey = 'hremplmutappr_id';
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\hremplmut_approvalHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new hremplmut_approvalHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		} else {
			$hnd = new \stdClass;
		}

		try {

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			$result = new \stdClass; 

			$criteriaValues = [
				"hremplmutappr_id" => " hremplmutappr_id = :hremplmutappr_id "
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
				'hremplmutappr_id' => 'A.`hremplmutappr_id`', 'hremplmutappr_isapproved' => 'A.`hremplmutappr_isapproved`', 'hremplmutappr_by' => 'A.`hremplmutappr_by`', 'hremplmutappr_date' => 'A.`hremplmutappr_date`',
				'hremplmut_version' => 'A.`hremplmut_version`', 'hremplmutappr_isdeclined' => 'A.`hremplmutappr_isdeclined`', 'hremplmutappr_declinedby' => 'A.`hremplmutappr_declinedby`', 'hremplmutappr_declineddate' => 'A.`hremplmutappr_declineddate`',
				'hremplmutappr_notes' => 'A.`hremplmutappr_notes`', 'hremplmut_id' => 'A.`hremplmut_id`', 'docauth_descr' => 'A.`docauth_descr`', 'docauth_order' => 'A.`docauth_order`',
				'docauth_value' => 'A.`docauth_value`', 'docauth_min' => 'A.`docauth_min`', 'authlevel_id' => 'A.`authlevel_id`', 'authlevel_name' => 'A.`authlevel_name`',
				'auth_id' => 'A.`auth_id`', 'auth_name' => 'A.`auth_name`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "trn_hremplmutappr A";
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
				
				// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
				// 'tambahan' => 'dta',
				//'tanggal' => date("d/m/Y", strtotime($record['tanggal'])),
				//'gendername' => $record['gender']
				

/*{__LOOKUPUSERMERGE__}*/
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