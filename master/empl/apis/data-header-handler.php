<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR . "/core/sequencer.php";

use \FGTA4\utils\Sequencer;



class empl_headerHandler extends WebAPI  {

	public function CreateNewId(object &$obj) : string {
		$seqname = 'EMP';

		$dt = new \DateTime();	
		$ye = $dt->format("y");
		$seq = new Sequencer($this->db, 'seq_generalmonthly', $seqname, ['seqgroup', 'ye', 'mo']);
		$raw = $seq->getraw(['seqgroup'=>'empl', 'ye'=>$ye, 'mo'=>0]);
		$id = $raw['ye'] . str_pad($raw['lastnum'], 4, '0', STR_PAD_LEFT);

		if ($obj->empl_nik = '--NULL--') {
			$obj->empl_nik = $id;
		}

		return $id;		
	}


	
	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		
		$criteriaValues['site_id'] = " A.site_id = :site_id ";
		$criteriaValues['dept_id'] = " A.dept_id = :dept_id ";
		
		$criteriaValues['enabled'] = " A.empl_isdisabled = 0 ";
		if (property_exists($options->criteria, 'getpartnerid')) {
			$this->getpartnerid = true;
			unset($options->criteria->getpartnerid);
		}


	}	

	public function SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void {
		// if (property_exists($this, 'getpartnerid')) {
		// 	if ($this->getpartnerid) {
		// 	}
		// }
	}

	public function DataListLooping(array &$record) : void {
		if (property_exists($this, 'getpartnerid')) {
			if ($this->getpartnerid) {
				$partner = \FGTA4\utils\SqlUtility::LookupRow($record['empl_id'], $this->db, 'mst_partner', 'empl_id');
				if ($partner!=null) {
					$record['partner_id'] = $partner['partner_id'];
					$record['partner_name'] = $partner['partner_name'];
				} else {
					$record['partner_id'] = null;
					$record['partner_name'] = null;
				}
			}
		}
	}


}		
		
		
		