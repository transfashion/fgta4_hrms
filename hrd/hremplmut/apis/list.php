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
 * hrms/hrd/hremplmut/apis/list.php
 *
 * ========
 * DataList
 * ========
 * Menampilkan data-data pada tabel header hremplmut (trn_hremplmut)
 * sesuai dengan parameter yang dikirimkan melalui variable $option->criteria
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 05/02/2023
 */
$API = new class extends hremplmutBase {

	public function execute($options) {

		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\hremplmut_headerHandler";
		if (class_exists($handlerclassname)) {
			$hnd = new hremplmut_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
		} else {
			$hnd = new \stdClass;
		}


		try {
		
			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "list", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			$criteriaValues = [
				"search" => " A.hremplmut_id LIKE CONCAT('%', :search, '%') OR A.site_id LIKE CONCAT('%', :search, '%') OR A.prev_site_id LIKE CONCAT('%', :search, '%') "
			];

			if (method_exists(get_class($hnd), 'buildListCriteriaValues')) {
				// ** buildListCriteriaValues(object &$options, array &$criteriaValues) : void
				//    apabila akan modifikasi parameter2 untuk query
				//    $criteriaValues['fieldname'] = " A.fieldname = :fieldname";  <-- menambahkan field pada where dan memberi parameter value
				//    $criteriaValues['fieldname'] = "--";                         <-- memberi parameter value tanpa menambahkan pada where
				//    $criteriaValues['fieldname'] = null                          <-- tidak memberi efek pada query secara langsung, parameter digunakan untuk keperluan lain 
				//
				//    untuk memberikan nilai default apabila paramter tidak dikirim
				//    // \FGTA4\utils\SqlUtility::setDefaultCriteria($options->criteria, '--fieldscriteria--', '--value--');
				$hnd->buildListCriteriaValues($options, $criteriaValues);
			}

			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			
			$maxrow = 30;
			$offset = (property_exists($options, 'offset')) ? $options->offset : 0;

			/* prepare DbLayer Temporay Data Helper if needed */
			if (method_exists(get_class($hnd), 'prepareListData')) {
				// ** prepareListData(object $options, array $criteriaValues) : void
				//    misalnya perlu mebuat temporary table,
				//    untuk membuat query komplex dapat dibuat disini	
				$hnd->prepareListData($options, $criteriaValues);
			}


			/* Data Query Configuration */
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
			$sqlLimit = "LIMIT $maxrow OFFSET $offset";

			if (method_exists(get_class($hnd), 'SqlQueryListBuilder')) {
				// ** SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
				//    menambah atau memodifikasi field-field yang akan ditampilkan
				//    apabila akan memodifikasi join table
				//    apabila akan memodifikasi nilai parameter
				$hnd->SqlQueryListBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
			}
			
			// filter select columns
			if (!property_exists($options, 'selectFields')) {
				$options->selectFields = [];
			}
			$columsSelected = $this->SelectColumns($sqlFieldList, $options->selectFields);
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($columsSelected);


			/* Sort Configuration */
			if (!property_exists($options, 'sortData')) {
				$options->sortData = [];
			}
			if (!is_array($options->sortData)) {
				$options->sortData = [];
			}
		


			if (method_exists(get_class($hnd), 'sortListOrder')) {
				// ** sortListOrder(array &$sortData) : void
				//    jika ada keperluan mengurutkan data
				//    $sortData['fieldname'] = 'ASC/DESC';
				$hnd->sortListOrder($options->sortData);
			}
			$sqlOrders = \FGTA4\utils\SqlUtility::generateSqlSelectSort($options->sortData);


			/* Compose SQL Query */
			$sqlCount = "select count(*) as n from $sqlFromTable $sqlWhere";
			$sqlData = "
				select 
				$sqlFields 
				from 
				$sqlFromTable 
				$sqlWhere 
				$sqlOrders 
				$sqlLimit
			";

			/* Execute Query: Count */
			$stmt = $this->db->prepare($sqlCount );
			$stmt->execute($where->params);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);
			$total = (float) $row['n'];

			/* Execute Query: Retrieve Data */
			$stmt = $this->db->prepare($sqlData);
			$stmt->execute($where->params);
			$rows  = $stmt->fetchall(\PDO::FETCH_ASSOC);


			$handleloop = false;
			if (method_exists(get_class($hnd), 'DataListLooping')) {
				$handleloop = true;
			}

			/* Proces result */
			$records = [];
			foreach ($rows as $row) {
				$record = [];
				foreach ($row as $key => $value) {
					$record[$key] = $value;
				}


				/*
				$record = array_merge($record, [
					// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
					//'tanggal' => date("d/m/y", strtotime($record['tanggal'])),
				 	//'tambahan' => 'dta'
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
					 
				]);
				*/


				// lookup data id yang refer ke table lain
				$this->addFields('hremplmutmodel_name', 'hremplmutmodel_id', $record, 'mst_hremplmutmodel', 'hremplmutmodel_name', 'hremplmutmodel_id');
				$this->addFields('empl_name', 'empl_id', $record, 'mst_empl', 'empl_name', 'empl_id');
				$this->addFields('site_name', 'site_id', $record, 'mst_site', 'site_name', 'site_id');
				$this->addFields('dept_name', 'dept_id', $record, 'mst_dept', 'dept_name', 'dept_id');
				$this->addFields('deptmodel_name', 'deptmodel_id', $record, 'mst_deptmodel', 'deptmodel_name', 'deptmodel_id');
				$this->addFields('hrjob_name', 'hrjob_id', $record, 'mst_hrjob', 'hrjob_name', 'hrjob_id');
				$this->addFields('doc_name', 'doc_id', $record, 'mst_doc', 'doc_name', 'doc_id');
				$this->addFields('prev_site_name', 'prev_site_id', $record, 'mst_site', 'site_name', 'site_id');
				$this->addFields('prev_dept_name', 'prev_dept_id', $record, 'mst_dept', 'dept_name', 'dept_id');
				$this->addFields('prev_deptmodel_name', 'prev_deptmodel_id', $record, 'mst_deptmodel', 'deptmodel_name', 'deptmodel_id');
				$this->addFields('prev_hrjob_name', 'prev_hrjob_id', $record, 'mst_hrjob', 'hrjob_name', 'hrjob_id');
				$this->addFields('user_empl_name', 'user_empl_id', $record, 'mst_empl', 'empl_name', 'empl_id');
				$this->addFields('user_dept_name', 'user_dept_id', $record, 'mst_dept', 'dept_name', 'dept_id');
				$this->addFields('hremplmut_commitby', 'hremplmut_commitby', $record, $GLOBALS['MAIN_USERTABLE'], 'user_fullname', 'user_id');
				$this->addFields('hremplmut_approveby', 'hremplmut_approveby', $record, $GLOBALS['MAIN_USERTABLE'], 'user_fullname', 'user_id');
				$this->addFields('hremplmut_declineby', 'hremplmut_declineby', $record, $GLOBALS['MAIN_USERTABLE'], 'user_fullname', 'user_id');
				$this->addFields('hremplmut_executeby', 'hremplmut_executeby', $record, $GLOBALS['MAIN_USERTABLE'], 'user_fullname', 'user_id');
					 


				if ($handleloop) {
					// ** DataListLooping(array &$record) : void
					//    apabila akan menambahkan field di record
					$hnd->DataListLooping($record);
				}

				array_push($records, $record);
			}

			/* modify and finalize records */
			if (method_exists(get_class($hnd), 'DataListFinal')) {
				// ** DataListFinal(array &$records) : void
				//    finalisasi data list
				$hnd->DataListFinal($records);
			}

			// kembalikan hasilnya
			$result = new \stdClass; 
			$result->total = $total;
			$result->offset = $offset + $maxrow;
			$result->maxrow = $maxrow;
			$result->records = $records;
			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};