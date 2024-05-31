<?php

require_once __ROOT_DIR.'/core/webapi.php';	
require_once __ROOT_DIR.'/core/webauth.php';	
require_once __ROOT_DIR.'/core/sqlutil.php';	

require_once __DIR__ . '/sync_base.php';


use FGTA4\utils\SqlUtility;


class SYNC extends SyncBase {
	public function Run() : void {
		$this->output("sync greatday attendance");

		try {
			$filepath = implode('/', ['/mnt', 'ramdisk', 'attendance2022.csv']);
			if (!is_file($filepath)) {	
				throw new \Exception("File '$filepath' tidak ditemukan!"); 
			}


			
			$map = $this->getMap();

			$mo = ['2022-09', '2022-10', '2022-11', '2022-12'];

			foreach ($mo as $month) {

				if (!$fp=fopen($filepath, "r")) {
					throw new \Exception("File '$filepath' tidak bisa dibuka!");
				}

				$this->ClearTempTable();

				$i=0;
				while (!feof($fp)) {
					$line = trim(fgets($fp));
					if ($line=="") {
						continue;
					}

					$i++;
					if ($i<=8) { continue; }
					//if ($i>9) { break; }

					$data = explode('|', $line);
					$obj = $this->attArrayToObject($data);
					if ($obj->dt==null) {
						//continue;
					}

					if (str_starts_with($obj->dt, $month)) {
						$this->output($obj->dt . " " . $obj->nik . " " . $obj->nama);
						$id = uniqid();
						$obj->id = $id;
						$obj->empl_id = $this->getEmpl($obj->nik, $obj->nama);
						if ($obj->empl_id==null) {
							if (array_key_exists($obj->nik, $map)) {
								$obj->empl_id = $this->getEmpl($map[$obj->nik], $obj->nama);
							}
						}

						$this->updateData($obj);
						
						$score = $this->getScore($id, $obj);
						$this->updateScore($id, $score);

					} else {
						$this->output("skip " . $obj->dt);
					}
				}

				// cek apakah ada nik yang belum terdaftar di kalista
				$this->cekNik();
				$this->summary();

				fclose($fp);
			}	


		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	function summary() {
		try {
			$sql = "select * from tmp_greatdaysum where unit<>'CT CORP'";
			$stmt = $this->db_kalista->prepare($sql);
			$stmt->execute();
			$rows = $stmt->fetchall();
			foreach ($rows as $row) {

				$obj = new \stdClass;
				$obj->hratdsum_dt = $row['dt'];
				$obj->empl_id = $row['empl_id'];
				$obj->position = $row['position'];
				$obj->organisation = $row['unit'];
				$obj->schd_in = $row['schd_in'];
				$obj->schd_out = $row['schd_out'];
				$obj->actual_in = $row['act_in'];
				$obj->actual_out = $row['act_out'];
				$obj->actual_invar = $row['act_invar'];
				$obj->actual_outvar = $row['act_outvar'];
				$obj->actual_workeff = $row['eff_work'];
				$obj->daytype = $row['daytype'];
				$obj->score_late = $row['score_late'];
				$obj->score_workeff = $row['score_workeff'];
				$obj->score_add = $row['score_add'];
				$obj->score_total = $row['score_total'];

				$this->output("updating summary " . $obj->hratdsum_dt . " " . $obj->empl_id);
				$this->updateAtdSumKalista($obj);
			}


		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	function updateAtdSumKalista(object $obj) : void {
		$sql = "select hratdsum_id from trn_hratdsum where hratdsum_dt = :hratdsum_dt and empl_id = :empl_id";
		$stmtCek = $this->db_kalista->prepare($sql);

		try {
			$stmtCek->execute([
				':hratdsum_dt' => $obj->hratdsum_dt,
				':empl_id' => $obj->empl_id
			]);

			$row = $stmtCek->fetch();
			if ($row==null) {
				$obj->hratdsum_id = uniqid();
				$obj->_createby = $this->kalistauser;
				$obj->_createdate = date('Y-m-d H:i:s');

				$cmd = SqlUtility::CreateSQLInsert("trn_hratdsum", $obj);
				$stmtInsert = $this->db_kalista->prepare($cmd->sql);
				$stmtInsert->execute($cmd->params);	

			} else {
				$obj->hratdsum_id = $row['hratdsum_id'];
				$obj->_modifyby = $this->kalistauser;
				$obj->_modifydate = date('Y-m-d H:i:s');

				$keys = new \stdClass;
				$keys->hratdsum_id = $obj->hratdsum_id;

				$cmd = SqlUtility::CreateSQLUpdate("trn_hratdsum", $obj, $keys);
				$stmt = $this->db_kalista->prepare($cmd->sql);
				$stmt->execute($cmd->params);


			}	
			

		} catch (\Execute $ex) {
			throw $ex;
		}
	}


	function cekNik() {
		try {
			$sql = "
				select distinct nik, nama, unit from tmp_greatdaysum where empl_id is null and unit<>'CT CORP' ;
			";

			$stmt = $this->db_kalista->prepare($sql);
			$stmt->execute();
			$rows = $stmt->fetchall();
			if (count($rows)>0) {
				$belumada = [];
				foreach ($rows as $row) {
					$belumada[] = $row['nik'] . " " . $row['nama'] . " " . $row['unit'];
				}
				
				$error  = "Data berikut belum terdaftar di kalista";
				$error .= implode("\r\n", $belumada);
				throw new \Exception($error);
			}

		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	function getMap() : array {
		$map['TF20000108'] = 'TF18000043'; 
		$map['TF20000112'] = 'TF20000019'; 
		$map['TF18000033'] = 'TF19000176'; 
		$map['TF21000114'] = 'TF21000010'; 
		$map['TF20000021'] = 'TF21000001'; 
		$map['TF20000110'] = '4618200006'; 
		$map['TF20000107'] = '4718800007'; 
		$map['TF20000109'] = 'TF21000011'; 
		$map['TF20000111'] = '4455200011'; 
		$map['TF20000113'] = '4716800019'; 
		$map['TF22000126'] = 'TF22000100'; 
		return $map;
	}

	function getEmpl(string $nik, string $nama) : ?string{
		try {
			$sql = "select empl_id from mst_empl where empl_nik = :nik ";
			$stmt = $this->db_kalista->prepare($sql);
			$stmt->execute([':nik'=>$nik]);
			$row = $stmt->fetch();
			if ($row==null) {
				return null;
			}

			return $row['empl_id'];
		} catch (\Exception $ex) {
			throw $ex;
		}
	}


	function updateScore(string $id, object $score) : void {
		try {
			$obj = new stdClass;
			$obj->id = $id;
			$obj->score_late = $score->late;
			$obj->score_workeff = $score->workeff;
			$obj->score_add = $score->add;
			$obj->score_total = $score->total;

			$keys =  new stdClass;
			$keys->id = $id;

			$cmd = SqlUtility::CreateSQLUpdate("tmp_greatdaysum", $obj, $keys);
			$stmt = $this->db_kalista->prepare($cmd->sql);
			$stmt->execute($cmd->params);

		} catch (\Exception $ex) {
			throw $ex;
		}
	}


	function getScore(string $id, object $obj) : object {
		
		$LATE_LOW = 0;
		$LATE_HIGH = -120;
		$LATE_WEIGHT = 1;

		$WORKEFF_LOW = 6*60;
		$WORKEFF_HIGH = 8*60;
		$WORKEFF_WEIGHT = 1.5;
		

		$score = new \stdClass;
		$score->late = 0;
		$score->workeff = 0;
		$score->add = 0;
		$score->total = 0;


		$score_late = 0;
		$score_workeff = 0;
		$score_add = 0;

		if ($obj->daytype=='PHOFF' || $obj->daytype=='OFF') {
			$score->total = null;
		} else {
			// hitung late
			if ($obj->act_in!=null && $obj->act_out!=null && $obj->act_invar>=$LATE_LOW) {
				$score_late = 4;
			} else if ($obj->act_in!=null && $obj->act_out!=null && $obj->act_invar<$LATE_LOW && $obj->act_invar>=$LATE_HIGH) {
				// harusnya diisi 3 s/d kurang dari 4 (proporsional)
				$score_late = 3;
			} else if ($obj->act_in!=null && $obj->act_out!=null && $obj->act_invar<$LATE_HIGH) {
				$score_late = 2;
			} else if ($obj->act_in==null && $obj->act_out==null) {
				$score_late = 0;
			} else {
				$score_late = 1;
			}
		
			// hitung work effective
			if ($obj->eff_work>=$WORKEFF_HIGH) {
				$score_workeff = 4;
			} else if ($obj->eff_work<$WORKEFF_HIGH && $obj->eff_work>=$WORKEFF_LOW) {
				// harusnya diisi 3 s/d kurang dari 4 (proporsional)
				$score_workeff = 3;
			} else if ($obj->act_in==null && $obj->act_out==null) {
				$score_workeff = 0;
			} else if ($obj->act_in!=null || $obj->act_out!=null) {
				$score_workeff = 1;
			} else {
				// work effektif kurang dari WORKEFF_LOW
				$score_workeff = 2;
			}
			
			// hitung additional score
			if ($score_late>=4 && $score_workeff>=4) {
				$score_add = 1;
			}
		

			$score_total =  ((($LATE_WEIGHT * $score_late) + ($WORKEFF_WEIGHT * $score_workeff)) / ($LATE_WEIGHT + $WORKEFF_WEIGHT)) + $score_add;

			$score->late = $score_late;
			$score->workeff = $score_workeff;
			$score->add = $score_add;
			$score->total = $score_total;
		} 

		return $score;
	}


	function updateData($obj) {
		try {
			
			$sqlCek = "select * from tmp_greatdaysum where dt=:dt and nik=:nik";
			$stmtCek = $this->db_kalista->prepare($sqlCek);

			$stmtCek->execute([':dt'=>$obj->dt, ':nik'=>$obj->nik]);
			$row = $stmtCek->fetch();
			if ($row!=null) {
				return;
			}

			$cmd = SqlUtility::CreateSQLInsert("tmp_greatdaysum", $obj);
			$stmtInsert = $this->db_kalista->prepare($cmd->sql);
			$stmtInsert->execute($cmd->params);	


		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	function ClearTempTable() : void {
		try {
			$sql = "delete from tmp_greatdaysum ";
			$this->db_kalista->query($sql);
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

	function attArrayToObject(array $data) : object {
		$obj = new \stdClass;
		$obj->dt = $this->dtIdToIso($data[0]);
		$obj->nama = $data[1];
		$obj->nik = $data[2];
		$obj->position = $data[3];
		$obj->unit = $data[4];
		$obj->shift = $data[5];
		$obj->schd_in = $data[6];
		$obj->schd_out = $data[7];
		$obj->act_in = $this->emptyToNull($data[8]);
		$obj->act_invar = $this->toInteger($data[9]);
		$obj->act_out = $this->emptyToNull($data[10]);
		$obj->act_outvar = $this->toInteger($data[11]);
		$obj->break_start = $this->emptyToNull($data[12]);
		$obj->break_end = $this->emptyToNull($data[13]);
		$obj->daytype = $data[14];
		$obj->eff_work = $this->emptyToNull($data[15]) ?? 0;
		$obj->overtime = $data[16];
		$obj->overtime_index = $this->emptyToNull($data[17]);
		$obj->overtime_meal = $data[18];
		$obj->overtime_transport = $data[19];
		$obj->statusatt = $data[20];
		$obj->statusother = $data[21];
		$obj->remark = $this->emptyToNull($data[22]);

		return $obj;
	}

	function dtIdToIso(string $dt) : ?string {
		$d = explode('/', $dt);
		if (!is_array($d)) {
			return null;
		}

		if (count($d)<3) {
			return null;
		}

		$o = implode("-", [$d[2], $d[1], $d[0]]);
		return $o;
	}

	function toInteger(string $text) : int {
		if ($text=="") return 0;
		return (int)str_replace(',' , "", $text);
	}

	function emptyToNull(string $text) : ?string {
		if (trim($text)=="") {
			return null;
		} else {
			return $text;
		}
	}

	public function ConnectDb() {
		$KALISTADB_CONFIG = DB_CONFIG[$this->KalistaDb];
		$this->db_kalista = new \PDO(
					$KALISTADB_CONFIG['DSN'], 
					$KALISTADB_CONFIG['user'], 
					$KALISTADB_CONFIG['pass'], 
					DB_CONFIG_PARAM['mariadb']
		);
	}
}




console::class(new class($args) extends clibase {
	function execute() {
		$sync = new SYNC();
		try {
			$sync->setup();
			$sync->ConnectDb();
			$sync->Run();
			exit(0);
		} catch (\Exception $ex) {
			echo "\r\n\r\nERROR.\r\n";
			echo $ex->getMessage();
			echo "\r\n";
			$trace = $ex->getTrace();
			print_r($trace[0]);
			echo "\r\n";
			$sync->ReportError($ex);
			exit(9999);
		} finally {
			echo "\r\n";
		}

	}
});