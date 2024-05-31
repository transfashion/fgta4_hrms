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
 * hrms/hrd/hremplclr/apis/xapi.base.php
 *
 * hremplclrBase
 * Kelas dasar untuk keperluan-keperluan api
 * kelas ini harus di-inherit untuk semua api pada modul hremplclr
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 05/02/2023
 */
class hremplclrBase extends WebAPI {

	protected $main_tablename = "trn_hremplclr";
	protected $main_primarykey = "hremplclr_id";
	protected $main_field_version = "hremplclr_version";	
	
	protected $field_iscommit = "hremplclr_iscommit";
	protected $field_commitby = "hremplclr_commitby";
	protected $field_commitdate = "hremplclr_commitdate";		
			
	
	protected $fields_isapprovalprogress = "hremplclr_isapprovalprogress";			
	protected $field_isapprove = "hremplclr_isapproved";
	protected $field_approveby = "hremplclr_approveby";
	protected $field_approvedate = "hremplclr_approvedate";
	protected $field_isdecline = "hremplclr_isdeclined";
	protected $field_declineby = "hremplclr_declineby";
	protected $field_declinedate = "hremplclr_declinedate";

	protected $approval_tablename = "trn_hremplclrappr";
	protected $approval_primarykey = "hremplclrappr_id";
	protected $approval_field_approve = "hremplclrappr_isapproved";
	protected $approval_field_approveby = "hremplclrappr_by";
	protected $approval_field_approvedate = "hremplclrappr_date";
	protected $approval_field_decline = "hremplclrappr_isdeclined";
	protected $approval_field_declineby = "hremplclrappr_declinedby";
	protected $approval_field_declinedate = "hremplclrappr_declineddate";
	protected $approval_field_notes = "hremplclrappr_notes";
	protected $approval_field_version = "hremplclr_version";

			



	function __construct() {

		// $logfilepath = __LOCALDB_DIR . "/output//*hremplclr*/.txt";
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