<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __ROOT_DIR.'/core/debug.php';

require_once __DIR__ . '/xapi.base.php';

use \FGTA4\exceptions\WebException;

$API = new class extends myattdrepBase {

	public function execute($id, $param) {

		$userdata = $this->auth->session_get_user();

		try {
			$periode = explode('-', $param->periode);

			$empl_id = $userdata->empl_id;
			$year = $periode[0];
			$month = $periode[1];

			$sql = "
				select 
					hratdsum_dt,
					score_late,
					score_workeff,
					score_total
				from trn_hratdsum 
				where 
					empl_id = :empl_id
				and year(hratdsum_dt)= :year 
				and month(hratdsum_dt) = :month
				and score_total is not null
			";

			$stmt = $this->db->prepare($sql);
			$stmt->execute([
				':empl_id' => $empl_id,
				':year' => $year,
				':month' => $month
			]);

			$rows = $stmt->fetchall();

			return (object)[
				'success' => true,
				'dataresponse' => $rows,
				'param' => $param
			];
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};