<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';

// /* Enable Debugging */
// require_once __ROOT_DIR.'/core/debug.php';

use \FGTA4\exceptions\WebException;
// use \FGTA4\debug;




/**
 * hrms/hrd/hremplmut/apis/xapi.base.php
 *
 * hremplmutBase
 * Kelas dasar untuk keperluan-keperluan api
 * kelas ini harus di-inherit untuk semua api pada modul hremplmut
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 05/02/2023
 */
class hremplmutBase extends WebAPI {

	protected $main_tablename = "trn_hremplmut";
	protected $main_primarykey = "hremplmut_id";
	protected $main_field_version = "hremplmut_version";	
	
	protected $field_iscommit = "hremplmut_iscommit";
	protected $field_commitby = "hremplmut_commitby";
	protected $field_commitdate = "hremplmut_commitdate";		
			
	
	protected $fields_isapprovalprogress = "hremplmut_isapprovalprogress";			
	protected $field_isapprove = "hremplmut_isapproved";
	protected $field_approveby = "hremplmut_approveby";
	protected $field_approvedate = "hremplmut_approvedate";
	protected $field_isdecline = "hremplmut_isdeclined";
	protected $field_declineby = "hremplmut_declineby";
	protected $field_declinedate = "hremplmut_declinedate";

	protected $approval_tablename = "trn_hremplmutappr";
	protected $approval_primarykey = "hremplmutappr_id";
	protected $approval_field_approve = "hremplmutappr_isapproved";
	protected $approval_field_approveby = "hremplmutappr_by";
	protected $approval_field_approvedate = "hremplmutappr_date";
	protected $approval_field_decline = "hremplmutappr_isdeclined";
	protected $approval_field_declineby = "hremplmutappr_declinedby";
	protected $approval_field_declinedate = "hremplmutappr_declineddate";
	protected $approval_field_notes = "hremplmutappr_notes";
	protected $approval_field_version = "hremplmut_version";

			



	function __construct() {

		// $logfilepath = __LOCALDB_DIR . "/output//*hremplmut*/.txt";
		// debug::disable();
		// debug::start($logfilepath, "w");

		$DB_CONFIG = DB_CONFIG[$GLOBALS['MAINDB']];
		$DB_CONFIG['param'] = DB_CONFIG_PARAM[$GLOBALS['MAINDBTYPE']];		
		$this->db = new \PDO(
					$DB_CONFIG['DSN'], 
					$DB_CONFIG['user'], 
					$DB_CONFIG['pass'], 
					$DB_CONFIG['param']
		);

		
	}

	function pre_action_check($data, $action) {
		try {
			return true;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	public function get_header_row($id) {
		try {
			$sql = "
				select 
				A.*
				from 
				$this->main_tablename A 
				where 
				A.$this->main_primarykey = :id 
			";
			$stmt = $this->db->prepare($sql);
			$stmt->execute([":id" => $id]);
			$rows = $stmt->fetchall(\PDO::FETCH_ASSOC);
			if (!count($rows)) { throw new \Exception("Data '$id' tidak ditemukan"); }
			return (object)$rows[0];
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

}