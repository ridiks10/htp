<?php
class ModelAccountRegister extends Model {
	//Tai
	public function get_customer_by_binary($p_binary) {
		$query = $this -> db -> query("SELECT c.username, c.telephone, c.customer_id , ml.level, ml.p_binary FROM ". DB_PREFIX ."customer AS c
				JOIN ". DB_PREFIX ."customer_ml AS ml
				ON ml.customer_id = c.customer_id
				WHERE ml.customer_id = '" . (int)$p_binary . "'");
		return $query -> row;
	}
	public function get_p_binary_by_customer_id($id_customer){
		$query = $this -> db -> query("
			SELECT p_binary
			FROM  ".DB_PREFIX."customer_ml
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}

	//====Tai
	public function get_customer_print($id_customer){
		$query = $this -> db -> query("
			SELECT c.*, pd.filled, pd.date_finish_forAdmin, pd.date_finish as pd_date_finish, pd.date_added as pd_date_added, ml.p_binary
			FROM  ".DB_PREFIX."customer c JOIN sm_customer_provide_donation pd on c.customer_id = pd.customer_id
			JOIN sm_customer_ml ml ON c.customer_id = ml.customer_id
			WHERE c.customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function get_username_by_id($id_customer){
		$query = $this -> db -> query("
			SELECT username
			FROM  ".DB_PREFIX."customer
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function get_filled_by_id($id_customer){
		$query = $this -> db -> query("
			SELECT SUM(filled) as sum_filled
			FROM  ".DB_PREFIX."customer_provide_donation
			WHERE customer_id = '".$this -> db -> escape($id_customer)."' AND date_finish >= NOW()
		");
		return $query -> row;
	}
	public function insertC_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_c_wallet SET
			customer_id = '".$this -> db -> escape($id_customer)."',
			amount = '0'
		");
		return $query;
	}

	public function checkC_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_c_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function checkR_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_r_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function checkM_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_m_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function insertR_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_r_wallet SET
			customer_id = '".$this -> db -> escape($id_customer)."',
			amount = '0'
		");
		return $query;
	}
	public function insertM_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_m_wallet SET
			customer_id = '".$this -> db -> escape($id_customer)."',
			amount = '0'
		");
		return $query;
	}

	public function checkCN_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_cn_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function insertCN_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_cn_wallet SET
			customer_id = '".$this -> db -> escape($id_customer)."',
			amount = '0'
		");
		return $query;
	}
	public function checkCH_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_ch_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function insertCH_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_ch_wallet SET
			customer_id = '".$this -> db -> escape($id_customer)."',
			amount = '0'
		");
		return $query;
	}
	public function checkTT_Wallet($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM  ".DB_PREFIX."customer_tt_wallet
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}
	public function insertTT_Wallet($id_customer){
		$query = $this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_tt_wallet SET
			customer_id = '".$this -> db -> escape($id_customer)."',
			amount = '0'
		");
		return $query;
	}
	public function update_C_Wallet($amount , $customer_id){
		$query = $this -> db -> query("
		UPDATE " . DB_PREFIX . "customer_c_wallet SET
			amount = amount + ".intval($amount)."
			WHERE customer_id = '".$customer_id."'
		");
	}
	public function update_status_r_wallet($customer_id){
		$query = $this -> db -> query("
		UPDATE " . DB_PREFIX . "customer SET
			status_r_wallet = 1	
			WHERE customer_id = '".$customer_id."'
		");
	}
	
	public function update_CH_Wallet($amount , $customer_id){
		$query = $this -> db -> query("
		UPDATE " . DB_PREFIX . "customer_ch_wallet SET
			amount = amount + ".intval($amount)."
			WHERE customer_id = '".$customer_id."'
		");
	}
	public function saveTranstionHistory($customer_id, $wallet, $text_amount, $system_decsription){
		$date_added= date('Y-m-d H:i:s');
		$query = $this -> db -> query("
			INSERT INTO ".DB_PREFIX."customer_transaction_history SET
			customer_id = '".$customer_id."',
			wallet = '".$wallet."',
			text_amount = '".$text_amount."',
			system_decsription = '".$system_decsription."',
			date_added = '".$date_added."'
		");
		return $query;
	}
	public function getCustomerCustom($customer_id) {
		$query = $this -> db -> query("SELECT c.username, c.firstname, c.telephone,c.p_node, c.customer_id ,c.package, ml.level FROM ". DB_PREFIX ."customer AS c
				JOIN ". DB_PREFIX ."customer_ml AS ml
				ON ml.customer_id = c.customer_id
				WHERE c.customer_id = '" . (int)$customer_id . "'");
		return $query -> row;
	}

	public function createPD($customer_id, $amount){
		$date_added= date('Y-m-d H:i:s');
		$this -> db -> query("
			INSERT INTO ". DB_PREFIX . "customer_provide_donation SET 
			customer_id = '".$customer_id."',
			date_added = '".$date_added."',
			filled = '".$amount."',
			date_finish =DATE_ADD(NOW(),INTERVAL +90 DAY),
			date_finish_forAdmin = DATE_ADD(NOW(),INTERVAL +90 DAY),
			status = 1
		");
		//update max_profit and pd_number
		$pd_id = $this->db->getLastId();

		//$max_profit = (float)($amount * $this->config->get('config_pd_profit')) / 100;
		
		$pd_number = hexdec( crc32($pd_id) );
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_provide_donation SET 
			
				pd_number = '".$pd_number."'
				WHERE id = '".$pd_id."'
			");
		$data['query'] = $query ? true : false;
		$data['pd_number'] = $pd_number;
		$data['pd_id'] = $pd_id;
		return $data;
	}

	public function checkExitUserName($username) {
		$query = $this -> db -> query("
			SELECT EXISTS(SELECT 1 FROM " . DB_PREFIX . "customer WHERE username = '" . $username . "')  AS 'exit'
			");

		return $query -> row['exit'];
	}

	public function checkExitUserNameForToken($username, $idUserNameLogin) {
		$query = $this -> db -> query("
			SELECT EXISTS(SELECT 1 FROM " . DB_PREFIX . "customer WHERE customer_id <> '". $idUserNameLogin ."' AND  username = '" . $username . "')  AS 'exit'
			");

		return $query -> row['exit'];
	}

	public function checkExitEmail($email) {
		$query = $this -> db -> query("
			SELECT count(*) AS number FROM " . DB_PREFIX . "customer WHERE email = '" . $email . "'
			");

		return $query -> row['number'];
	}

	public function checkExitPhone($telephone) {
		$query = $this -> db -> query("
			SELECT count(*) AS number FROM " . DB_PREFIX . "customer WHERE telephone = '" . $telephone . "'
			");

		return $query -> row['number'];
	}

	public function checkExitCMND($cmnd) {
		$query = $this -> db -> query("
			SELECT count(*) AS number FROM " . DB_PREFIX . "customer WHERE cmnd = '" . $cmnd . "'
			");

		return $query -> row['number'];
	}

	public function getId_by_username($username) {
		$query = $this -> db -> query("
			SELECT customer_id FROM " . DB_PREFIX . "customer WHERE customer_code = '" . $this -> db -> escape($username) . "'
			");

		return $query -> row['customer_id'];
	}
	public function get_customer_Id_by_username($username) {
		$query = $this -> db -> query("
			SELECT customer_id FROM " . DB_PREFIX . "customer WHERE username = '" . $this -> db -> escape($username) . "'
			");

		return $query -> row;
	}

	public function addCustomer_custom($data,$package){
		$date_added = date('Y-m-d H:i:s');
		$p_node = $this->get_customer_Id_by_username($data['p_node']);
		$p_node= $p_node['customer_id'];
		$p_binary = $this->get_customer_Id_by_username($data['p_binary']);
		$p_binary= $p_binary['customer_id'];
		$newDate = preg_replace("/(\d+)\D+(\d+)\D+(\d+)/","$3-$2-$1",$data['date_cmnd']);
		$date_cmnd = date('Y-m-d',strtotime($newDate));
		$this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer SET
			p_node = '" . $this -> db -> escape($p_node) . "',
		
			email = '" . $this -> db -> escape($data['email']) . "', 
			firstname = '" . $this -> db -> escape($data['firstname']) . "', 
			address_cmnd = '" . $this -> db -> escape($data['address']) . "',
			code_active = '" . $this -> db -> escape($data['code']) . "',
			telephone = '" . $this -> db -> escape($data['telephone']) . "', 
			salt = '" . $this -> db -> escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', 
			
			status = '1', 
			cmnd = '" . $this -> db -> escape($data['cmnd']) . "', 
			bank_name = '" . $this -> db -> escape($data['bank_name']) . "', 
			branch_bank = '" . $this -> db -> escape($data['branch_bank']) . "', 
			account_holder = '" . $this -> db -> escape($data['account_holder']) . "', 
			account_number = '" . $this -> db -> escape($data['account_number']) . "', 
			date_cmnd = '" . $this -> db -> escape($date_cmnd) . "',
			address_cus = '" . $this -> db -> escape($data['address_cus']) . "',
			country_id = '230',
			password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',
			transaction_password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',
			date_added = '".$date_added."',
			date_register_tree = '".$date_added."',
			check_Newuser = 1,
			language = 'vietnamese',
			package = '" . $this -> db -> escape($package) . "'
		");
		$password = mt_rand(9,999999);
		$customer_id = $this -> db -> getLastId();
		$dt_return['customer_id'] = $customer_id;
		$dt_return['pass'] = $password;

		// p_binary = '" . $data['p_node'] . "',
		
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "customer_ml SET 
			customer_id = '" . (int)$customer_id . "',
			customer_code = '".hexdec(crc32(md5($data['email'])))."',
			level = '1', 
			p_binary = '" . $p_binary . "', 
			p_node = '" . $p_node . "',
			date_added = '".$date_added."'");

		//update p_binary

		if($data['postion'] === 'right'){
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $p_binary . "'");
		}else{
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $p_binary . "'");
		}
		return $dt_return;
	}
	public function check_p_binary($id){
		$query = $this -> db -> query("
			SELECT COUNT(p_binary) AS number
			FROM  ".DB_PREFIX."customer_ml
			WHERE p_binary = '".$this -> db -> escape($id)."'
		");
		return $query -> row;
	}
	public function count_p_binary($p_binary){
		$query = $this -> db -> query("
			SELECT `left`,`right` FROM ". DB_PREFIX ."customer_ml WHERE `customer_id` ='".$p_binary."' AND status <> -1
		");
		return $query -> row;
	}
	public function checkBinaryLeft($id){
		$query = $this -> db -> query("
			SELECT `left` FROM ". DB_PREFIX ."customer_ml WHERE `customer_id` ='".$id."' AND status <> -1
		");
		return $query -> row;
	}
	public function checkBinaryRight($id){
		$query = $this -> db -> query("
			SELECT `right` FROM ". DB_PREFIX ."customer_ml WHERE `customer_id` ='".$id."' AND status <> -1
		");
		return $query -> row;
	}
	public function get_customer_ml_by_customer_id($customer_id){
		$query = $this -> db -> query("SELECT * FROM `sm_customer_ml` 
			WHERE customer_id = '" . (int)$customer_id . "'");
		return $query -> rows;
	}
	public function update_status_ml($customer_id){
		$query = $this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `status` = '1' 
			WHERE customer_id = '" . $customer_id . "'");
		return $query;
	}
	public function update_username_customer($customer_id,$username){
		$query = $this -> db -> query("UPDATE " . DB_PREFIX . "customer SET username= '".$username."', 	customer_code = '".hexdec(crc32(md5($username)))."'
			WHERE customer_id = '" . $customer_id . "'");
		return $query;
	}
	public function get_customer_ml(){
		$query = $this -> db -> query("SELECT customer_id FROM `sm_customer_ml` 
			WHERE `left` = 0  OR `right` = 0 ORDER BY `date_added` ASC LIMIT 1");
		return $query -> row;
	}

	public function update_customer_ml($customer_id, $p_node, $id_p_binary){
		
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "customer_ml SET 
			customer_id = '" . (int)$customer_id . "',
			customer_code = '".hexdec(crc32(md5($customer_id)))."',
			level = '1',
			status = '1',
			p_binary = '" . $id_p_binary . "', 
			p_node = '" . $p_node . "',
			date_added = NOW()");
		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' 
			WHERE customer_id = '" . $id_p_binary . "'");
	}

	public function add_replace_custom($data){
		
		
		$data['p_node'] = $this->getId_by_username($data['node']);
		//$data['p_node'] = $this -> session -> data['customer_id'];

		$this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer SET
			p_node = '" . $this -> db -> escape($data['p_node']) . "',
			customer_code = '".hexdec(crc32(md5($data['username'])))."',
			email = '" . $this -> db -> escape($data['email']) . "', 
			firstname = '" . $this -> db -> escape($data['firstname']) . "', 
			address_cmnd = '" . $this -> db -> escape($data['address']) . "', 
			username = '" . $this -> db -> escape($data['username']) . "', 
			telephone = '" . $this -> db -> escape($data['telephone']) . "', 
			salt = '" . $this -> db -> escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', 
			password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', 
			status = '1', 
			cmnd = '" . $this -> db -> escape($data['cmnd']) . "', 
			country_id = '". $this -> db -> escape($data['country_id']) ."',
			transaction_password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['transaction_password'])))) . "',
			date_added = NOW(),
			date_register_tree = DATE_ADD(NOW(),INTERVAL + 45 MINUTE),
			check_Newuser = 1,
			language = 'vietnamese'
		");

		$customer_id = $this -> db -> getLastId();

		// p_binary = '" . $data['p_node'] . "',

		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `p_binary` = '" . (int)$customer_id . "' WHERE `p_binary` = '" . $data['p_binary'] . "'");

		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `customer_id` = '" . (int)$customer_id . "', p_node = '" . $this -> db -> escape($data['p_node']) . "', `status` = 1 WHERE `id` = '" . $data['p_binary'] . "'");
		//update p_binary

		if($data['postion'] === 'right'){
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE `right` = '" . $data['p_binary'] . "'");
		}else{
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE `left` = '" . $data['p_binary'] . "'");
		}
		return $customer_id;
	}

	public function addCustomer($data) {
		
		
		$data['p_node'] = $this -> session -> data['customer_id'];

		$this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer SET
			p_node = '" . $this -> db -> escape($data['p_node']) . "', 
			email = '" . $this -> db -> escape($data['email']) . "', 
			username = '" . $this -> db -> escape($data['username']) . "', 
			telephone = '" . $this -> db -> escape($data['telephone']) . "', 
			salt = '" . $this -> db -> escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', 
			password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', 
			status = '1', 
			cmnd = '" . $this -> db -> escape($data['cmnd']) . "', 
			country_id = '". $this -> db -> escape($data['country_id']) ."',
			transaction_password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['transaction_password'])))) . "',
			date_added = NOW(),
			date_register_tree = DATE_ADD(NOW(),INTERVAL + 45 MINUTE),
			check_Newuser = 1,
			language = 'vietnamese'
		");

		$customer_id = $this -> db -> getLastId();

		// p_binary = '" . $data['p_node'] . "',
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "customer_ml SET 
			customer_id = '" . (int)$customer_id . "',
			level = '1', 
			p_binary = '" . $data['p_node'] . "', 
			p_node = '" . $data['p_node'] . "', 
			date_added = NOW()");

		//update p_binary
		$totalChild = $this -> getTotalChild($data['p_node']);
		if ($totalChild > 2) {
			//update p_binary
			$tmp_id = $this -> reduce_p_binary($data['p_node'], $customer_id);

			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `p_binary` = '" . (int)$tmp_id . "' WHERE customer_id = '" . $customer_id . "' AND status <> 0");
			
			$customerParent = $this -> getCustomer_ml($tmp_id);
			if(intval($customerParent['left']) === 0){
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $tmp_id . "'");
			}else{
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $tmp_id . "'");
			}
		}else{
			$totalChild = $this -> getTotalChild($data['p_node']);
			if ($totalChild == 1) {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
			} else {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
			}
			
		}

		return $customer_id;

	}

	public function getCustomer_ml($customer_id) {
		$query = $this -> db -> query("SELECT * FROM " . DB_PREFIX . "customer_ml  WHERE customer_id = '" . (int)$customer_id . "'");
		return $query -> row;
	}

	public function getTotalChild($customer_id) {
		$query = $this -> db -> query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_ml WHERE p_binary = '" . (int)$customer_id . "' AND status <> 0");
		return intval($query -> row['total']);
	}

	function reduce_p_binary($p_node, $customer_id) {

		$query = $this -> db -> query("SELECT customer_id FROM " . DB_PREFIX . "customer_ml 
			WHERE p_node = '" . (int)$p_node . " ' 
			AND customer_id <> '" . $customer_id . "'
			AND status <> 0
			OR p_binary =  '" . $p_node . "'
			ORDER BY id");
		$rows = $query -> rows;

		foreach ($rows as $key => $value) {

			if ($this -> getTotalChild($value['customer_id']) < 2) {
				$query = null;
				$rows = null;
				return $value['customer_id'];
				break;
			}
			// else{
			// 	$this -> reduce_p_binary($value['customer_id'], $customer_id);
			// }
		}
	}
	public function addCustomerByToken($data, $p_node) {

		$data['p_node'] = $p_node;

		$this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer SET
			p_node = '" . $this -> db -> escape($data['p_node']) . "', 
			email = '" . $this -> db -> escape($data['email']) . "', 
			username = '" . $this -> db -> escape($data['username']) . "', 
			telephone = '" . $this -> db -> escape($data['telephone']) . "', 
			salt = '" . $this -> db -> escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', 
			password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', 
			status = '1', 
			cmnd = '" . $this -> db -> escape($data['cmnd']) . "', 
			country_id = '". $this -> db -> escape($data['country_id']) ."',
			transaction_password = '" . $this -> db -> escape(sha1($salt . sha1($salt . sha1($data['transaction_password'])))) . "',
			date_added = NOW(),
			date_register_tree = DATE_ADD(NOW(),INTERVAL + 45 MINUTE),
			check_Newuser = 1,
			language = 'english'
		");

		$customer_id = $this -> db -> getLastId();

		// p_binary = '" . $data['p_node'] . "',
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "customer_ml SET 
			customer_id = '" . (int)$customer_id . "',
			level = '1', 
			p_binary = '" . $data['p_node'] . "', 
			p_node = '" . $data['p_node'] . "', 
			date_added = NOW()");

		//update p_binary
		$totalChild = $this -> getTotalChild($data['p_node']);
		
		if ($totalChild > 2) {
			//update p_binary
			$tmp_id = $this -> reduce_p_binary($data['p_node'], $customer_id);
	
			$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `p_binary` = '" . (int)$tmp_id . "' WHERE customer_id = '" . $customer_id . "' AND status <> 0");
			
			$totalChild = $this -> getTotalChild($tmp_id);
			if ($totalChild == 1) {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $tmp_id . "'");
			} else {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $tmp_id . "'");
			}
		}else{
			$totalChild = $this -> getTotalChild($data['p_node']);
			if ($totalChild == 1) {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
			} else {
				$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `right` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
			}
			
		}


		return $customer_id;
	}
	public function getCustomLike($name) {
		$listId = '';
		$query = $this -> db -> query("
			SELECT username AS name, customer_id FROM ". DB_PREFIX ."customer
			WHERE username Like '%".$this->db->escape($name)."%'
			LIMIT 12
		") ;
		$array_id = $query -> rows;

		return $array_id;
	}
	public function getCustomer($customer_id) {
		$query = $this -> db -> query("SELECT c.* FROM " . DB_PREFIX . "customer c  WHERE c.customer_id = '" . (int)$customer_id . "'");
		return $query -> row;
	}
	public function createPD_upgrade($customer_id, $amount){
		$this -> db -> query("
			INSERT INTO ". DB_PREFIX . "customer_provide_donation SET 
			customer_id = '".$customer_id."',
			date_added = NOW(),
			filled = '".$amount."',
			date_finish = DATE_ADD(NOW(),INTERVAL + 90 DAY),
			date_finish_forAdmin = DATE_ADD(NOW(),INTERVAL + 90 DAY),
			status = 0
		");
		//update max_profit and pd_number
		$pd_id = $this->db->getLastId();
		$pd_number = hexdec( crc32($pd_id) );
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_provide_donation SET 
			
				pd_number = '".$pd_number."'
				WHERE id = '".$pd_id."'
			");
		return $query;
	}

	public function getTableCustomerMLByUsername($customer_id){
		$query = $this -> db -> query("
			SELECT *
			FROM  ".DB_PREFIX."customer_ml
			WHERE customer_id = '".$customer_id."'
		");

		return $query -> row;
	}
	public function update_pd_binary($left = true, $customer_id, $total_pd){
		if($left){
			$query = $this -> db -> query("
				UPDATE ".DB_PREFIX."customer
				SET total_pd_left = total_pd_left + ".$total_pd."
				WHERE customer_id = '".$customer_id."'
			");
		}else{
			$query = $this -> db -> query("
				UPDATE ".DB_PREFIX."customer
				SET total_pd_right = total_pd_right + ".$total_pd."
				WHERE customer_id = '".$customer_id."'
			");
		}
		return $query;
	}


	//Tai
	public function getInfoUsers_binary($id_id){

		$query = $this->db->query("select u.*,ml.level,ml.p_binary as p_binary_ml, u.account_holder as account_holder,
			ml.status as status_ml, l.name_vn as level_member from ". DB_PREFIX . "customer_ml as ml 
			Left Join " . DB_PREFIX . "customer as u ON ml.customer_id = u.customer_id Left Join " . DB_PREFIX . "member_level as l ON l.id = ml.level Where ml.customer_id = " . $id_id);
		$return  = $query->row;
		return $return;
	}
	public function getLeftO($id) {
		$query = $this -> db -> query('select u2.email, u2.telephone, u2.date_added, 
			mlm.customer_id as id, mlm.level,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as text, 
			CONCAT( "level1"," left") as iconCls,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as name,u2.firstname as account_holder,
			l.name_vn as level_user,u2.username,u2.status,u2.date_added  from ' . DB_PREFIX . 'customer AS u2 
			LEFT join ' . DB_PREFIX . 'customer_ml AS mlm ON u2.customer_id = mlm.customer_id 
			INNER join ' . DB_PREFIX . 'customer_ml AS u1 ON u1.left = mlm.customer_id left Join ' . DB_PREFIX . 'member_level as l ON l.id = mlm.level where mlm.p_binary = ' . (int)$id);
		//	return json_decode(json_encode($query->row), false);
		return $query -> row;
	}

	public function getRightO($id) {
		$query = $this -> db -> query('select u2.email, u2.telephone,u2.date_added, u2.firstname as account_holder,
			mlm.customer_id as id, mlm.level,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as text, CONCAT( "level1"," right") as iconCls,CONCAT(u2.firstname," (ĐT: ",u2.telephone,")") as name,l.name_vn as level_user,u2.username,u2.status,u2.date_added from ' . DB_PREFIX . 'customer AS u2 LEFT join ' . DB_PREFIX . 'customer_ml AS mlm ON u2.customer_id = mlm.customer_id INNER join ' . DB_PREFIX . 'customer_ml AS u1 ON u1.right = mlm.customer_id left Join ' . DB_PREFIX . 'member_level as l ON l.id = mlm.level where mlm.p_binary = ' . (int)$id);
		//return json_decode(json_encode($query->row), false);
		return $query -> row;
	}
	// End
	public function check_show_pnode($customer_id){
		$query = $this -> db -> query("
			SELECT p_node FROM ". DB_PREFIX ."customer_ml WHERE `customer_id` ='".$customer_id."'
		");
		return $query -> row;
	}
	// lãi trực tiếp
	public function update_lai_tuctiep($id_customer){
		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_ml SET `left` = '" . (int)$customer_id . "' WHERE customer_id = '" . $data['p_node'] . "'");
	}
	public function show_pd_customer($id_customer){
		$query = $this -> db -> query("
			SELECT filled
			FROM  ".DB_PREFIX."customer_provide_donation
			WHERE customer_id = '".$this -> db -> escape($id_customer)."'
		");
		return $query -> row;
	}

	public function add_code($data){
		
		$this -> db -> query("
			INSERT INTO " . DB_PREFIX . "customer_code SET
			package = '" . $this -> db -> escape($data['investment']) . "', 
			name = '" . $this -> db -> escape($this->chuyenChuoi($data['username'])) . "', 
			telephone = '" . $this -> db -> escape($data['telephone']) . "',
			address = '" . $this -> db -> escape($this->chuyenChuoi($data['address'])) . "',
			
			
			date_added = NOW(),
			status = 0
		");
		$id = $this -> db -> getLastId();
		$hex = substr(hexdec(crc32(md5($id))),0, 6);
		$code = substr(md5(uniqid(rand(), true)), 0, 5).$hex;		
		$dt_return['code'] = $code;
		// p_binary = '" . $data['p_node'] . "',
		$this -> db -> query("UPDATE " . DB_PREFIX . "customer_code SET code = '".$code."' WHERE id = '" . $id . "'");
		
		return $dt_return;
	}
	public function chuyenChuoi($str) {
	// In thường
	     $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
	     $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
	     $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
	     $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
	     $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
	     $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
	     $str = preg_replace("/(đ)/", 'd', $str);    
	// In đậm
	     $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
	     $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
	     $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
	     $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
	     $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
	     $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
	     $str = preg_replace("/(Đ)/", 'D', $str);
	     return $str; // Trả về chuỗi đã chuyển
	} 
	public function  get_goidautu($customer_id){
		$query = $this -> db -> query("
			SELECT SUM(filled) as package
			FROM  ".DB_PREFIX."customer_provide_donation
			WHERE customer_id = '".$this -> db -> escape($customer_id)."'
		");
		return $query -> row;
	} 
	public function  check_conghuong($customer_id){
		$query = $this -> db -> query("
			SELECT COUNT(*) as numbers
			FROM  ".DB_PREFIX."customer
			WHERE p_node = '".$this -> db -> escape($customer_id)."' AND status_r_wallet = 0
		");
		return $query -> row;
	} 
}
