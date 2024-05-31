<?php

class SyncBase {

	protected $KalistaDb;
	protected $kalistauser;


	public function Setup() {
		$this->KalistaDb = getenv('KALISTADB');
		$this->kalistauser = getenv('KALISTAUSER');

	}


	public function output($str, ?array $options = null) {
		echo $str;


		$nonewline = false;
		if (is_array($options)) {
			$nonewline =  (array_key_exists('nonewline', $options)) ?  $options['nonewline'] : false;
		};

		if (!$nonewline) {
			echo "\r\n";
		}
	}

	public function ReportError(\Exception $ex) : void {
		
	}



}