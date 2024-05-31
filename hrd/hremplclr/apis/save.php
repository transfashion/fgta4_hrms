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
 * hrms/hrd/hremplclr/apis/save.php
 *
 * ====
 * Save
 * ====
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel header hremplclr (trn_hremplclr)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 05/02/2023
 */
$API = new class extends hremplclrBase {
	
	public function execute($data, $options) {
		$event = 'on-save';
		$tablename = 'trn_hremplclr';
		$primarykey = 'hremplclr_id';
		$autoid = $options->autoid;
		$datastate = $data->_state;
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\hremplclr_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new hremplclr_headerHandler($options);
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
			$obj->hremplclr_effdate = (\DateTime::createFromFormat('d/m/Y',$obj->hremplclr_effdate))->format('Y-m-d');



			if ($obj->hremplclr_descr=='') { $obj->hremplclr_descr = '--NULL--'; }
			if ($obj->hremplclr_rejectnotes=='') { $obj->hremplclr_rejectnotes = '--NULL--'; }


			unset($obj->hremplclr_isoutstdchecking);
			unset($obj->hremplclr_isoutstdcheck);
			unset($obj->hremplclr_rejectnotes);
			unset($obj->hremplclr_iscommit);
			unset($obj->hremplclr_commitby);
			unset($obj->hremplclr_commitdate);
			unset($obj->hremplclr_isapprovalprogress);
			unset($obj->hremplclr_isapproved);
			unset($obj->hremplclr_approveby);
			unset($obj->hremplclr_approvedate);
			unset($obj->hremplclr_isdeclined);
			unset($obj->hremplclr_declineby);
			unset($obj->hremplclr_declinedate);
			unset($obj->hremplclr_isexecute);
			unset($obj->hremplclr_executeby);
			unset($obj->hremplclr_executedate);


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
					"hremplclr_id" => $obj->hremplclr_id
				];

				$criteriaValues = [
					"hremplclr_id" => " hremplclr_id = :hremplclr_id "
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
					'hremplclr_id' => 'A.`hremplclr_id`', 'empl_id' => 'A.`empl_id`', 'site_id' => 'A.`site_id`', 'dept_id' => 'A.`dept_id`',
					'hrjob_id' => 'A.`hrjob_id`', 'hremplclr_effdate' => 'A.`hremplclr_effdate`', 'hremplclr_descr' => 'A.`hremplclr_descr`', 'doc_id' => 'A.`doc_id`',
					'hremplclr_isoutstdchecking' => 'A.`hremplclr_isoutstdchecking`', 'hremplclr_isoutstdcheck' => 'A.`hremplclr_isoutstdcheck`', 'user_empl_id' => 'A.`user_empl_id`', 'user_dept_id' => 'A.`user_dept_id`',
					'hremplclr_version' => 'A.`hremplclr_version`', 'hremplclr_rejectnotes' => 'A.`hremplclr_rejectnotes`', 'hremplclr_iscommit' => 'A.`hremplclr_iscommit`', 'hremplclr_commitby' => 'A.`hremplclr_commitby`',
					'hremplclr_commitdate' => 'A.`hremplclr_commitdate`', 'hremplclr_isapprovalprogress' => 'A.`hremplclr_isapprovalprogress`', 'hremplclr_isapproved' => 'A.`hremplclr_isapproved`', 'hremplclr_approveby' => 'A.`hremplclr_approveby`',
					'hremplclr_approvedate' => 'A.`hremplclr_approvedate`', 'hremplclr_isdeclined' => 'A.`hremplclr_isdeclined`', 'hremplclr_declineby' => 'A.`hremplclr_declineby`', 'hremplclr_declinedate' => 'A.`hremplclr_declinedate`',
					'hremplclr_isexecute' => 'A.`hremplclr_isexecute`', 'hremplclr_executeby' => 'A.`hremplclr_executeby`', 'hremplclr_executedate' => 'A.`hremplclr_executedate`', '_createby' => 'A.`_createby`',
					'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
				];
				$sqlFromTable = "trn_hremplclr A";
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
					'empl_name' => \FGTA4\utils\SqlUtility::Lookup($record['empl_id'], $this->db, 'mst_empl', 'empl_id', 'empl_name'),
					'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
					'dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'hrjob_name' => \FGTA4\utils\SqlUtility::Lookup($record['hrjob_id'], $this->db, 'mst_hrjob', 'hrjob_id', 'hrjob_name'),
					'hremplclr_effdate' => date("d/m/Y", strtotime($row['hremplclr_effdate'])),
					'doc_name' => \FGTA4\utils\SqlUtility::Lookup($record['doc_id'], $this->db, 'mst_doc', 'doc_id', 'doc_name'),
					'user_empl_name' => \FGTA4\utils\SqlUtility::Lookup($record['user_empl_id'], $this->db, 'mst_empl', 'empl_id', 'empl_name'),
					'user_dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['user_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'hremplclr_commitby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplclr_commitby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
					'hremplclr_approveby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplclr_approveby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
					'hremplclr_declineby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplclr_declineby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
					'hremplclr_executeby' => \FGTA4\utils\SqlUtility::Lookup($record['hremplclr_executeby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),

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