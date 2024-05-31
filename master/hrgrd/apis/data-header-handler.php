<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class hrgrd_headerHandler extends WebAPI  {



	public function sortListOrder(array &$sortData) : void {
		$sortData['hrgrd_order'] = 'ASC';
	}
}		
		
		
		