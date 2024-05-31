<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';


use \FGTA4\exceptions\WebException;


$API = new class extends myattdrepBase {

	public function execute($options) {

		$userdata = $this->auth->session_get_user();
		try {

			$records = [
				['periode_val'=>'2022-12', 'periode_display'=>'2022 Desember'],
				['periode_val'=>'2022-11', 'periode_display'=>'2022 November'],
				['periode_val'=>'2022-10', 'periode_display'=>'2022 Oktober'],
				['periode_val'=>'2022-09', 'periode_display'=>'2022 September'],
				['periode_val'=>'2022-08', 'periode_display'=>'2022 Agustus'],
				['periode_val'=>'2022-07', 'periode_display'=>'2022 Juli'],
				['periode_val'=>'2022-06', 'periode_display'=>'2022 Juni'],
				['periode_val'=>'2022-05', 'periode_display'=>'2022 Mei'],
				['periode_val'=>'2022-04', 'periode_display'=>'2022 April'],
				['periode_val'=>'2022-03', 'periode_display'=>'2022 Maret'],
				['periode_val'=>'2022-02', 'periode_display'=>'2022 Februari'],
				['periode_val'=>'2022-01', 'periode_display'=>'2022 Januari'],
			];


			// kembalikan hasilnya
			$result = new \stdClass;
			$result->total = count($records);
			$result->offset = 0;
			$result->maxrow = count($records);
			$result->records = $records;
			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};
