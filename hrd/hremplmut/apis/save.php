<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
// require_once __ROOT_DIR . "/core/sequencer.php";
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-header-handler.php')) {
	require_once __DIR__ .'/data-header-handler.php';
}


use \FGTA4\exceptions\WebException;
// use \FGTA4\utils\Sequencer;



/**
 * hrms/hrd/hremplmut/apis/save.php
 *
 * ====
 * Save
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
	
	public function execute($data, $options) {
		$event = 'on-save';
		$tablename = 'trn_hremplmut';
		$primarykey = 'hremplmut_id';
		$autoid = $options->autoid;
		$datastate = $data->_state;
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\hremplmut_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new hremplmut_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = &$this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		} else {
			$hnd = new \stdClass;
		}

		try {

			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "save", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			$result = new \stdClass; 
			
			$key = new \stdClass;
			$obj = new \stdClass;
			foreach ($data as $fieldname => $value) {
				if ($fieldname=='_state') { continue; }
				if ($fieldname==$primarykey) {
					$key->{$fieldname} = $value;
				}
				$obj->{$fieldname} = $value;
			}

			// apabila ada tanggal, ubah ke format sql sbb:
			// $obj->tanggal = (\DateTime::createFromFormat('d/m/Y',$obj->tanggal))->format('Y-m-d');
			$obj->hremplmut_effdate = (\DateTime::createFromFormat('d/m/Y',$obj->hremplmut_effdate))->format('Y-m-d');



			if ($obj->hremplmut_descr=='') { $obj->hremplmut_descr = '--NULL--'; }
			if ($obj->hremplmut_rejectnotes=='') { $obj->hremplmut_rejectnotes = '--NULL--'; }


			unset($obj->hremplmut_rejectnotes);
			unset($obj->hremplmut_iscommit);
			unset($obj->hremplmut_commitby);
			unset($obj->hremplmut_commitdate);
			unset($obj->hremplmut_isapprovalprogress);
			unset($obj->hremplmut_isapproved);
			unset($obj->hremplmut_approveby);
			unset($obj->hremplmut_approvedate);
			unset($obj->hremplmut_isdeclined);
			unset($obj->hremplmut_declineby);
			unset($obj->hremplmut_declinedate);
			unset($obj->hremplmut_isexecute);
			unset($obj->hremplmut_executeby);
			unset($obj->hremplmut_executedate);


			// current user & timestamp	
			if ($datastate=='NEW') {
				$obj->_createby = $userdata->username;
				$obj->_createdate = date("Y-m-d H:i:s");

				if (method_exists(get_class($hnd), 'PreCheckInsert')) {
					// PreCheckInsert($data, &$obj, &$options)
					$hnd->PreCheckInsert($data, $obj, $options);
				}
			} else {
				$obj->_modifyby = $userdata->username;
				$obj->_modifydate = date("Y-m-d H:i:s");	
		
				if (method_exists(get_class($hnd), 'PreCheckUpdate')) {
					// PreCheckUpdate($data, &$obj, &$key, &$options)
					$hnd->PreCheckUpdate($data, $obj, $key, $options);
				}
			}

			//handle data sebelum sebelum save
			if (method_exists(get_class($hnd), 'DataSaving')) {
				// ** DataSaving(object &$obj, object &$key)
				$hnd->DataSaving($obj, $key);
			}

			$this->db->setAttribute(\PDO::ATTR_AUTOCOMMIT,0);
			$this->db->beginTransaction();

			try {

				$action = '';
				if ($datastate=='NEW') {
					$action = 'NEW';
					if ($autoid) {
						$obj->{$primarykey} = $this->NewId($hnd, $obj);
					}
					$cmd = \FGTA4\utils\SqlUtility::CreateSQLInsert($tablename, $obj);
				} else {
					$action = 'MODIFY';
					$cmd = \FGTA4\utils\SqlUtility::CreateSQLUpdate($tablename, $obj, $key);
				}
	
				$stmt = $this->db->prepare($cmd->sql);
				$stmt->execute($cmd->params);

				\FGTA4\utils\SqlUtility::WriteLog($this->db, $this->reqinfo->modulefullname, $tablename, $obj->{$primarykey}, $action, $userdata->username, (object)[]);




				// result
				$options->criteria = [
					"hremplmut_id" => $obj->hremplmut_id
				];

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

				$dataresponse = array_merge($record, [
					//  untuk lookup atau modify response ditaruh disini
					'hremplmutmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['hremplmutmodel_id'], $this->db, 'mst_hremplmutmodel', 'hremplmutmodel_id', 'hremplmutmodel_name'),
					'empl_name' => \FGTA4\utils\SqlUtility::Lookup($record['empl_id'], $this->db, 'mst_empl', 'empl_id', 'empl_name'),
					'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
					'dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'deptmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptmodel_id'], $this->db, 'mst_deptmodel', 'deptmodel_id', 'deptmodel_name'),
					'hrjob_name' => \FGTA4\utils\SqlUtility::Lookup($record['hrjob_id'], $this->db, 'mst_hrjob', 'hrjob_id', 'hrjob_name'),
					'hremplmut_effdate' => date("d/m/Y", strtotime($row['hremplmut_effdate'])),
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

					'_createby' => \FGTA4\utils\SqlUtility::Lookup($record['_createby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
					'_modifyby' => \FGTA4\utils\SqlUtility::Lookup($record['_modifyby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				]);
				
				if (method_exists(get_class($hnd), 'DataOpen')) {
					//  DataOpen(array &$record) : void 
					$hnd->DataOpen($dataresponse);
				}

				$result->dataresponse = (object) $dataresponse;
				if (method_exists(get_class($hnd), 'DataSavedSuccess')) {
					$hnd->DataSavedSuccess($result);
				}

				$this->db->commit();
				return $result;

			} catch (\Exception $ex) {
				$this->db->rollBack();
				throw $ex;
			} finally {
				$this->db->setAttribute(\PDO::ATTR_AUTOCOMMIT,1);
			}

		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	public function NewId(object $hnd, object $obj) : string {
		// dipanggil hanya saat $autoid == true;

		$id = null;
		$handled = false;
		if (method_exists(get_class($hnd), 'CreateNewId')) {
			// CreateNewId(object $obj) : string 
			$id = $hnd->CreateNewId($obj);
			$handled = true;
		}

		if (!$handled) {
			$id = uniqid();
		}

		return $id;
	}

};