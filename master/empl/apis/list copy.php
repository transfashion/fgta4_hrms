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
 * hrms/master/empl/apis/list.php
 *
 * ========
 * DataList
 * ========
 * Menampilkan data-data pada tabel header empl (mst_empl)
 * sesuai dengan parameter yang dikirimkan melalui variable $option->criteria
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 01/09/2022
 */
$API = new class extends emplBase {

	public function execute($options) {

		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\empl_headerHandler";
		if (class_exists($handlerclassname)) {
			$hnd = new empl_headerHandler($options);
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

			// \FGTA4\utils\SqlUtility::setDefaultCriteria($options->criteria, '--fieldscriteria--', '--value--');
			$criteriaValues = [
				"search" => " A.empl_id LIKE CONCAT('%', :search, '%') OR A.empl_nik LIKE CONCAT('%', :search, '%') OR A.empl_name LIKE CONCAT('%', :search, '%') "
			];
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'buildListCriteriaValues')) {
					$hnd->buildListCriteriaValues($options, $criteriaValues);
				}
			}
			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			$result = new \stdClass; 
			$maxrow = 30;
			$offset = (property_exists($options, 'offset')) ? $options->offset : 0;


			/* prepare DbLayer Temporay Data Helper if needed */
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'prepareListData')) {
					$hnd->prepareListData($options, $criteriaValues);
				}
			}


			/* Data Query Configuration */
			$sqlFieldList = [
				'empl_id' => 'A.`empl_id`', 'empl_nik' => 'A.`empl_nik`', 'empl_name' => 'A.`empl_name`', 'empl_isdisabled' => 'A.`empl_isdisabled`',
				'empl_dtjoin' => 'A.`empl_dtjoin`', 'empl_dtexit' => 'A.`empl_dtexit`', 'empl_birthplace' => 'A.`empl_birthplace`', 'empl_birthdate' => 'A.`empl_birthdate`',
				'gender_id' => 'A.`gender_id`', 'religion_id' => 'A.`religion_id`', 'empl_addressline1' => 'A.`empl_addressline1`', 'empl_addressline2' => 'A.`empl_addressline2`',
				'empl_addressline3' => 'A.`empl_addressline3`', 'empl_city' => 'A.`empl_city`', 'empl_postcode' => 'A.`empl_postcode`', 'empl_prov' => 'A.`empl_prov`',
				'country_id' => 'A.`country_id`', 'empl_mobilephone' => 'A.`empl_mobilephone`', 'empl_phone' => 'A.`empl_phone`', 'empl_email' => 'A.`empl_email`',
				'edu_id' => 'A.`edu_id`', 'empl_kk' => 'A.`empl_kk`', 'empl_ktp' => 'A.`empl_ktp`', 'empl_npwp' => 'A.`empl_npwp`',
				'marital_id' => 'A.`marital_id`', 'empl_bpjstk' => 'A.`empl_bpjstk`', 'empl_bpjskes' => 'A.`empl_bpjskes`', 'hrstatus_id' => 'A.`hrstatus_id`',
				'dept_id' => 'A.`dept_id`', 'hrjob_id' => 'A.`hrjob_id`', 'site_id' => 'A.`site_id`', 'auth_id' => 'A.`auth_id`'
			];
			$sqlFromTable = "mst_empl A";
			$sqlWhere = $where->sql;
			$sqlLimit = "LIMIT $maxrow OFFSET $offset";

			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'SqlQueryListBuilder')) {
					$hnd->SqlQueryListBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
				}
			}
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($sqlFieldList);


			/* Sort Configuration */
			if (!is_array($options->sortData)) {
				$options->sortData = [];
			}
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'sortListOrder')) {
					$hnd->sortListOrder($options->sortData);
				}
			}
			$sqlOrders = \FGTA4\utils\SqlUtility::generateSqlSelectSort($options->sortData);


			/* Compose SQL Query */
			$sqlCount = "select count(*) as n from $sqlFromTable $sqlWhere $sqlLimit";
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


			/* Proces result */
			$records = [];
			foreach ($rows as $row) {
				$record = [];
				foreach ($row as $key => $value) {
					$record[$key] = $value;
				}

				$record = array_merge($record, [
					// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
					//'tanggal' => date("d/m/y", strtotime($record['tanggal'])),
				 	//'tambahan' => 'dta'
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
					 
				]);

				/* modify field in record row */
				if (is_object($hnd)) {
					if (method_exists(get_class($hnd), 'DataListLooping')) {
						$hnd->DataListLooping($record);
					}
				}

				array_push($records, $record);
			}

			/* modify and finalize records */
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'DataListFinal')) {
					$hnd->DataListFinal($records);
				}
			}


			// kembalikan hasilnya
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