<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class empl_headerHandler extends WebAPI  {


	public function buildListCriteriaValues(object $options, array &$criteriaValues) : void {
		// $criteriaValues['brand_id'] = " A.brand_id = :brand_id ";
		$criteriaValues['enabled'] = " A.empl_isdisabled = 0 ";
	}	

	public function prepareListData(object $options, $criteriaValues) : void {
		// misalnya perlu mebuat temporary table
		// untuk membuat query komplex dapat dibuat disini
	}

	
	public function SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void {
		// menambah atau memodifikasi field-field yang akan ditampilkan
		// apabila akan memodifikasi join table
		// apabila akan memodifikasi nilai parameter
	}

	public function sortListOrder(array &$sortData) : void {
		// $sortData['fieldname'] = 'ASC/DESC';
	}

	public function DataListLooping(array &$record) : void {
		// apabila akan menambahkan field di record
	}

	public function DataListFinal(array &$records) : void {
		// finalisasi data list
	}



	public function buildOpenCriteriaValues(object $options, array &$criteriaValues) : void {
		// $criteriaValues['brand_id'] = " A.brand_id = :brand_id ";
	}

	public function prepareOpenData(object $options, $criteriaValues) : void {
		// misalnya perlu mebuat temporary table
		// untuk membuat query komplex dapat dibuat disini
	}

	public function SqlQueryOpenBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void {
		// menambah atau memodifikasi field-field yang akan ditampilkan
		// apabila akan memodifikasi join table
		// apabila akan memodifikasi nilai parameter
	}

	public function DataOpen(array &$record) : void {
		// apabila akan menambahkan field di record
	}


	public function DataSavedSuccess($result) {
		// $this->caller->log('save success');
	}	
}		
		
		
		