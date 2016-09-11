<?php
class ControllerAccountPersonal extends Controller {
	private $error = array();

	public function index() {
		if (!$this -> customer -> isLogged()) {
			$this -> session -> data['redirect'] = $this -> url -> link('account/personal', '', 'SSL');

			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}

		$this->document->addScript('catalog/view/javascript/personal/tree.min.js');
		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}
		$this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		// $active_tree = $this -> getActive_tree();
		// intval($active_tree) === 0 && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		$data['base'] = $server;

		
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/personal');
		$data['lang'] = $language -> data;

		$this -> document -> setTitle($data['lang']['heading_title']);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home'));

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('account/personal', '', 'SSL'));

		$data['heading_title'] = $this -> language -> get('heading_title');

		$data['column_left'] = $this -> load -> controller('common/column_left');
		$data['column_right'] = $this -> load -> controller('common/column_right');
		$data['content_top'] = $this -> load -> controller('common/content_top');
		$data['content_bottom'] = $this -> load -> controller('common/content_bottom');
		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');
		$data['idCustomer'] = $this -> customer -> getId();


		$id_user = $data['idCustomer'];
		$user = $this -> model_account_customer -> getCustomer($id_user);

		$data['nameCustomer'] = $this -> customer -> getFirstname();
		$data['telephone'] = $this -> customer -> getTelephone();
		// $data['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		// $data['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		// //$data['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		// echo "<pre>"; print_r($data['floor']); echo "</pre>"; die();
		// die('111231');$data['total'] = $data['total_left'] + $data['total_right'];
		$data['self'] = $this ;
	

		//=============================Refferal=======================
		$customer = $this -> model_account_customer-> getCustomer($this -> session -> data['customer_id']);

		$Hash = $customer['customer_code'];	
		
		$data['customer_code'] = $Hash;

		$customer = $customer['username'];	
		$data['username'] = $customer;

		$data['self'] = $this;
		$customer = null;

		//$data['customerChild'] = $this -> model_account_customer-> getParentByIdCustomer($this -> session -> data['customer_id']);
		
		//$total = $this -> model_account_customer-> getCountTreeCustom($this -> session -> data['customer_id']);
$data['trees'] =  HTTPS_SERVER . 'index.php?route=account/personal/get_BinaryTree';
		
		//==============================================================

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/personal.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/personal.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/personal.tpl', $data));
		}
	}
	public function getActive_tree(){
		$this->load->model('account/customer');
		$status_ml = $this -> model_account_customer ->getActive_tree();
		if (!empty($status_ml)) {
			$active_tree = $status_ml['active_tree'];
		}
		
		return $active_tree;
	}
	public function get_status_ml(){
		$this->load->model('account/customer');
		$status_ml = $this -> model_account_customer ->get_status_ml();
		if (!empty($status_ml)) {
			$status_ml = $status_ml['status'];
		}
		
		return $status_ml;
	}
	public function get_customer_in_ml(){
		$this->load->model('customize/register');
		$customerML = $this -> model_customize_register -> get_customer_ml_by_customer_id($this -> session -> data['customer_id']);
		$customerML = intval(count($customerML)) > 0 ? 1 : 2;
		
		return $customerML;
	}

	

	public function checkBinaryLeft($p_binary, $postion){

		$this -> load -> model('account/customer');
		if ($postion=='left') {
			$Binary = $this -> model_account_customer -> checkBinaryLeft($p_binary);
			if (!empty($Binary)) {
				$checkLeft = intval($Binary['left']);
				return $checkLeft === 0 ? 1 : 2;
			}
			else{
				return 1;
			}
				
				//return $checkLeft = 1;			
		}
		if ($postion=='right') {
			$Binary = $this -> model_account_customer -> checkBinaryRight($p_binary);	
			if (!empty($Binary)) {
				$checkRight = intval($Binary['right']);
			 	return $checkRight === 0 ? 1 : 2;
			} else {
				return 1;
			}
		}
		
	}
	public function checkBinaryRight($p_binary){
		$this -> load -> model('account/customer');
		$Binary = $this -> model_account_customer -> checkBinaryRight($p_binary);
		$CountBinary = count($Binary);
		if ($CountBinary > 0) {
			$checkRight = intval($Binary['right']);
		return $checkRight === 0 ? 1 : 2;
		}
		
	}
	public function checkBinary($p_binary){
		$this -> load -> model('account/customer');
		$binary = $this -> model_account_customer -> checkBinary($p_binary);
		$checkbinary = count($binary);
		return $checkbinary === 0 ? 2 : 1;
	}
	public function add_customer (){

			$this -> load -> model('account/customer');
			$this -> document -> addScript('catalog/view/javascript/register/register.js');
		//language
		
	
		//method to call function
		
		! array_key_exists('p_binary', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		! array_key_exists('token', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		! array_key_exists('postion', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		$p_binary = $this -> request -> get['p_binary'];
		$postion = $this -> request -> get['postion'];
		$code= $this->request->get['token'];
		if($postion === 'right' || $postion === 'left'){

		}else{
			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}
		try {	
			$customer = $this -> model_account_customer -> getCustomer($p_binary);
			!$customer && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
			
			$customercode = $this -> model_account_customer -> getCustomerbyCode($code);
			!$customercode && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
			
		} catch (Exception $e) {
			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}


		//start load country model
		$this -> load -> model('customize/country');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;

		$data['country'] = $this -> model_customize_country -> getCountry();
		//end load country model

		//data render website
		$data['self'] = $this;

		//error validate
		$data['error'] = $this -> error;
		$data['p_binary'] = $p_binary;
		$data['postion'] = $this -> request -> get['postion'];
		$data['country'] = $this -> model_customize_country -> getCountry();
		$data['action'] = $this -> url -> link('account/registers/confirmSubmit', 'token=' . $this -> request -> get['token'], 'SSL');
		$data['actionCheckUser'] = $this -> url -> link('account/registers/checkuser', '', 'SSL');
		$data['actionCheckEmail'] = $this -> url -> link('account/registers/checkemail', '', 'SSL');
		$data['actionCheckPhone'] = $this -> url -> link('account/registers/checkphone', '', 'SSL');
		$data['actionCheckCmnd'] = $this -> url -> link('account/registers/checkcmnd', '', 'SSL');
		// $data['column_left'] = $this->load->controller('common/column_left');

		// $data['footer'] = $this -> load -> controller('common/footer');
		// $data['header'] = $this -> load -> controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/registers.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/registers.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/registers.tpl', $data));
		}

	}

	public function replace_customer (){

			$this -> load -> model('account/customer');
			$this -> document -> addScript('catalog/view/javascript/register/register.js');
		//language
		
	
		//method to call function
		
		! array_key_exists('p_binary', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		! array_key_exists('token', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		! array_key_exists('postion', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		$p_binary = $this -> request -> get['p_binary'];
		$postion = $this -> request -> get['postion'];
		$code= $this->request->get['token'];
		if($postion === 'right' || $postion === 'left'){

		}else{
			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}
		try {	
			$customer = $this -> model_account_customer -> getCustomer($p_binary);
			!$customer && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
			
			$customercode = $this -> model_account_customer -> getCustomerbyCode($code);
			!$customercode && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
			
		} catch (Exception $e) {
			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}


		//start load country model
		$this -> load -> model('customize/country');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;

		$data['country'] = $this -> model_customize_country -> getCountry();
		//end load country model

		//data render website
		$data['self'] = $this;

		//error validate
		$data['error'] = $this -> error;
		$data['p_binary'] = $p_binary;
		$data['postion'] = $this -> request -> get['postion'];
		$data['country'] = $this -> model_customize_country -> getCountry();
		$data['action'] = $this -> url -> link('account/registers/confirmSubmit', 'token=' . $this -> request -> get['token'], 'SSL');
		$data['actionCheckUser'] = $this -> url -> link('account/registers/checkuser', '', 'SSL');
		$data['actionCheckEmail'] = $this -> url -> link('account/registers/checkemail', '', 'SSL');
		$data['actionCheckPhone'] = $this -> url -> link('account/registers/checkphone', '', 'SSL');
		$data['actionCheckCmnd'] = $this -> url -> link('account/registers/checkcmnd', '', 'SSL');
		// $data['column_left'] = $this->load->controller('common/column_left');

		// $data['footer'] = $this -> load -> controller('common/footer');
		// $data['header'] = $this -> load -> controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/replace_customer.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/replace_customer.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/replace_customer.tpl', $data));
		}

	}
	

	public function register_submit(){
		
		//method to call function
		// !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){
			$this -> load -> model('customize/register');
			$this -> load -> model('account/auto');
			$this -> load -> model('account/customer');
			//echo "<pre>"; print_r($this->request->post); echo "</pre>"; die();
			$check_p_binary = $this -> model_account_customer -> check_p_binary($this->request->post['p_binary']);
			
			if (intval($check_p_binary['number']) === 2) {
				die('Error');
			}else{
				
				$tmp = $this -> model_customize_register -> addCustomer_custom($this->request->post);

				$cus_id= $tmp;
				$amount = 0;
				
				$checkC_Wallet = $this -> model_account_customer -> checkR_Wallet($cus_id);
				if(intval($checkC_Wallet['number'])  === 0){
					if(!$this -> model_account_customer -> insertR_WalletR($amount, $cus_id)){
						die();
					}
				}
				$data['has_register'] = true;
				$mail = new Mail();
				$mail -> protocol = $this -> config -> get('config_mail_protocol');
				$mail -> parameter = $this -> config -> get('config_mail_parameter');
				$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

				$mail -> setTo($this -> request -> post['email']);
				$mail -> setFrom($this -> config -> get('config_email'));
				$mail -> setSender(html_entity_decode("Mining", ENT_QUOTES, 'UTF-8'));
				$mail -> setSubject("Mining - Congratulations Your Registration is Confirmed!");
				// $mail -> setHtml('
				// 	<h1><span style="font-size:12px">Congratulations Your Registration is Confirmed!</span></h1>
				// 	<p><span style="font-size:12px"><strong>What is Next?</strong></span></p>
				// 	<p><span style="font-size:12px">You can now&nbsp;<a href="' . $this -> url -> link("account/login", "", "SSL") . '" style="color:rgb(0,72,153);background:transparent" target="_blank">login</a>&nbsp;using your chosen&nbsp;<strong>user name and&nbsp;</strong><strong>password</strong>, and begin to use this website.</span></p>
				// 	<p><span style="font-size:12px">Please assess our website via:&nbsp;<a href="' . HTTPS_SERVER . '" target="_blank">http://mining.ceo/</a> for the next step</span></p>
				// 	<p><span style="font-size:12px">- Your Fullname : ' . $this -> request -> post["firstname"] . '</span></p>
				// 	<p><span style="font-size:12px">- Your Address : ' . $this -> request -> post["address"] . '</span></p>
				// 	<p><span style="font-size:12px">- Your user name : ' . $this -> request -> post["username"] . '</span></p>
				// 	<p><span style="font-size:12px">- Your Password : ' . $this -> request -> post["password"] . '</span></p>
				// 	<p><span style="font-size:12px">- Your Transaction Password : ' . $this -> request -> post["transaction_password"] . '</span></p>
				// 	<p><span style="font-size:12px"><span style="font-family:arial,helvetica,sans-serif">If you have any questions, feel free to contact us by using our support center in the adress belov</span></span></p>
				// 	<p><strong><span style="font-size:12px">Mining support team!</span></strong></p>
				// ');
				$mail -> setHtml('<div height="100%" bgcolor="#ffffff" marginwidth="10" marginheight="10">
				   <table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin:0 auto;background-color:#dbe0e6;background-image:url(?ui=2&amp;ik=b6257faf2d&amp;view=fimg&amp;th=1566b006d78bd58d&amp;attid=0.1.2&amp;disp=emb&amp;attbid=ANGjdJ9r7zVOhhs8-3gMyQ1Vp7jSs86OFzXFEm6dEpV_qKQZCfIT_gkDuui7ka5jcKYfaL1DdcIm6jQwAhMW6tVdo1Vy1Vld8FR_N_P2rXm-tOmILevjrc0HyWY8PKc&amp;sz=s0-l75-ft&amp;ats=1471026460326&amp;rm=1566b006d78bd58d&amp;zw&amp;atsh=1);background-repeat:repeat;min-height:200px;text-align:center">
				      <tbody>
				         <tr>
				            <td style="padding:30px"><img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" alt="logo" class="CToWUd"></td>
				         </tr>
				         <tr>
				            <td style="padding-bottom:30px">
				               <table cellpadding="0" cellspacing="0" border="0" width="600" style="background-color:#282b33;background-image:url(?ui=2&amp;ik=b6257faf2d&amp;view=fimg&amp;th=1566b006d78bd58d&amp;attid=0.1.1&amp;disp=emb&amp;attbid=ANGjdJ9haqT3rk4woSzBBTxqz2yb99XHp3iVjInGB7uDL-_6YN4Vjg5G1o12qqYdrIhAH5qkvG9ZcHHTmZTKm5_ksXYi7u36Qtm0iGYUVuqQ_Ie9cFrHauwsTrE-Zpw&amp;sz=s0-l75-ft&amp;ats=1471026460326&amp;rm=1566b006d78bd58d&amp;zw&amp;atsh=1);background-position:center center;border-top:8px solid;border-bottom:8px solid;border-color:#ffa540;overflow:hidden;border-radius:10px;margin:0 auto;text-align:left">
				                  <tbody>
				                     <tr>
				                        <td style="padding:3em 3em 1em;vertical-align:top" valign="top">
				                           <h2 style="color:#fff;font-size:2.5em;font-style:italic;padding-bottom:0.6em;border-bottom:1px solid #fff;margin-top:0">Hello!</h2>
				                           <p style="color:#fff;line-height:1.4">The data specified by you when registering on the website <a style="color:#ffa540;text-decoration:underline" href="' . HTTPS_SERVER . '" target="_blank" data-saferedirecturl="' . HTTPS_SERVER . '">Mining</a></p>
				                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
				                              <tbody>
				                                 <tr>
				                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
				                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
				                                       <div>Fullname</div>
				                                    </td>
				                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["firstname"] . '</a></td>
				                                   
				                                 </tr>
				                              </tbody>
				                           </table>
				                            <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
				                              <tbody>
				                                 <tr>
				                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
				                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
				                                       <div>E-mail</div>
				                                    </td>
				                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["email"] . '</a></td>
				                                   
				                                 </tr>
				                              </tbody>
				                           </table>
				                            <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
				                              <tbody>
				                                 <tr>
				                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
				                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
				                                       <div>Address</div>
				                                    </td>
				                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["address"] . '</a></td>
				                                    
				                                 </tr>
				                              </tbody>
				                           </table>
				                            <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
				                              <tbody>
				                                 <tr>
				                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
				                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
				                                       <div>Phone number</div>
				                                    </td>
				                                    
				                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["telephone"] . '</a></td>
				                                   
				                                 </tr>
				                              </tbody>
				                           </table>
				                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
				                              <tbody>
				                                 <tr>
				                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
				                                       <img src="https://gm1.ggpht.com/_fsbuXaR8hx4-eONztt7vZWKMkBwu4bKh8RFuc1KDAiQbM4269q776Qg-oS2Iq_x7jNd8AFcivAFZxTA4wD9jJK-T2XZHMQgDZVenrgCQbjshrUv0tjOqPuwzXpjaBH-ebT7J6ZrpKjoTjsfKS5eHUw1IlEXorFxLvYEuIAO_s6P0S8gQDT1LynQ7GTqptjmv4ZbIju58J5jeib6ldI9W5WMwIMRd32at6dJCy-hSDyS8r8m0x7Qpyd5yeZEOKiz8z8YF8Ta367ax8J1Ub8fcWSl8Y3S4AL16gLgSAO0E9w4VDs0xbHZ_Qg-ZXo9r19j1W_ShNuhMhHTGIFtgmYSnLUBW6ljdH1uyKrV--3dpG_TCOyI_ahh9HO6-oebwG0_PF_2Pl0yPsBCVklsBLkTu4yckVvT1hI_aHHxN6fE1BSEEmZKIyyVADtdhvg1uPeljAgJJTpYE-QPCB9s7DDDoNteNIMFiFLC6yCgEeCdFEuGVfSNv1p9_zOXqAiAxm0mm-K5xIzcHzHnFKnzAW3iuuULjJkvWKL7GIWT9OUlEAAesk7bTa2c5-BJJz6TpOaQdHVMRcWSz9hEJ_yKuHH5g8ZvHD58e-ZwvhTdSzOjKEQUUfJHZ1TOiaB2gd1DtV02SQz42lRTFLZfoSN9Evj7iAJIm2VxFSPiAG9ZnNra8aMqftPccvqcQWod=s0-l75-ft-l75-ft" class="CToWUd">
				                                       <div>password</div>
				                                    </td>
				                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["password"] . '</a></td>
				                                 </tr>
				                              </tbody>
				                           </table>
				                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
				                              <tbody>
				                                 <tr>
				                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
				                                       <img src="https://gm1.ggpht.com/_fsbuXaR8hx4-eONztt7vZWKMkBwu4bKh8RFuc1KDAiQbM4269q776Qg-oS2Iq_x7jNd8AFcivAFZxTA4wD9jJK-T2XZHMQgDZVenrgCQbjshrUv0tjOqPuwzXpjaBH-ebT7J6ZrpKjoTjsfKS5eHUw1IlEXorFxLvYEuIAO_s6P0S8gQDT1LynQ7GTqptjmv4ZbIju58J5jeib6ldI9W5WMwIMRd32at6dJCy-hSDyS8r8m0x7Qpyd5yeZEOKiz8z8YF8Ta367ax8J1Ub8fcWSl8Y3S4AL16gLgSAO0E9w4VDs0xbHZ_Qg-ZXo9r19j1W_ShNuhMhHTGIFtgmYSnLUBW6ljdH1uyKrV--3dpG_TCOyI_ahh9HO6-oebwG0_PF_2Pl0yPsBCVklsBLkTu4yckVvT1hI_aHHxN6fE1BSEEmZKIyyVADtdhvg1uPeljAgJJTpYE-QPCB9s7DDDoNteNIMFiFLC6yCgEeCdFEuGVfSNv1p9_zOXqAiAxm0mm-K5xIzcHzHnFKnzAW3iuuULjJkvWKL7GIWT9OUlEAAesk7bTa2c5-BJJz6TpOaQdHVMRcWSz9hEJ_yKuHH5g8ZvHD58e-ZwvhTdSzOjKEQUUfJHZ1TOiaB2gd1DtV02SQz42lRTFLZfoSN9Evj7iAJIm2VxFSPiAG9ZnNra8aMqftPccvqcQWod=s0-l75-ft-l75-ft" class="CToWUd">
				                                       <div>password</div>
				                                    </td>
				                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["transaction_password"] . '</a></td>
				                                 </tr>
				                              </tbody>
				                           </table>

				                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-top:37px;overflow:hidden">
				                              <tbody>
				                                 <tr>
				                                    <td style="padding:10px 20px;color:#fff;line-height:1.8">For registration confirmation please follow this link:<br><a href="' . HTTPS_SERVER . '" style="color:#ffa540;text-decoration:underline" target="_blank" data-saferedirecturl="http://mining.ceo/">' . HTTPS_SERVER . '</a></td>
				                                 </tr>
				                              </tbody>
				                           </table>
				                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="margin:47px 0 0">
				                              <tbody>
				                                 <tr>
				                                    <td style="padding:10px 20px;color:#fff" colspan="2" align="center">(this e-mail is automatically generated) <br><a href="' . HTTPS_SERVER . '" style="color:#ffa540;text-decoration:underline" target="_blank" data-saferedirecturl="' . HTTPS_SERVER . '">Unsubscribe</a></td>
				                                 </tr>
				                                 <tr>
				                                    <td style="border-top:1px solid #fff;padding:10px 0 20px;color:#fff" align="left">With best wishes!<br><a href="' . HTTPS_SERVER . '" style="color:#ffa540;text-decoration:underline" target="_blank" data-saferedirecturl="' . HTTPS_SERVER . '">' . HTTPS_SERVER . '</a></td>
				                                    <td style="border-top:1px solid #fff;padding:10px 0 20px" align="right"><i style="color:#fff">2016.08.08</i><br><a href="mailto:info@mining.com" style="color:#ffa540;text-decoration:underline" target="_blank">info@mining.com</a></td>
				                                 </tr>
				                              </tbody>
				                           </table>
				                        </td>
				                     </tr>
				                  </tbody>
				               </table>
				            </td>
				         </tr>
				      </tbody>
				   </table>
				</div>');
				$mail -> send();
				$this -> session -> data['success'] = $this -> language -> get('Create account success!');
				
				$this -> response -> redirect($this -> url -> link('account/login', '#success', 'SSL'));
			}
		}

	}

	public function replace_submit(){
		
		//method to call function
		// !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){
			$this -> load -> model('customize/register');
			$this -> load -> model('account/auto');
			$this -> load -> model('account/customer');
		
			$tmp = $this -> model_customize_register -> add_replace_custom($this->request->post);

			$cus_id= $tmp;
			$amount = 0;
			
			$checkC_Wallet = $this -> model_account_customer -> checkR_Wallet($cus_id);
			if(intval($checkC_Wallet['number'])  === 0){
				if(!$this -> model_account_customer -> insertR_WalletR($amount, $cus_id)){
					die();
				}
			}
			$data['has_register'] = true;
			$mail = new Mail();
			$mail -> protocol = $this -> config -> get('config_mail_protocol');
			$mail -> parameter = $this -> config -> get('config_mail_parameter');
			$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
			$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
			$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
			$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

			$mail -> setTo($this -> request -> post['email']);
			$mail -> setFrom($this -> config -> get('config_email'));
			$mail -> setSender(html_entity_decode("Mining", ENT_QUOTES, 'UTF-8'));
			$mail -> setSubject("Mining - Congratulations Your Registration is Confirmed!");
			// $mail -> setHtml('
			// 	<h1><span style="font-size:12px">Congratulations Your Registration is Confirmed!</span></h1>
			// 	<p><span style="font-size:12px"><strong>What is Next?</strong></span></p>
			// 	<p><span style="font-size:12px">You can now&nbsp;<a href="' . $this -> url -> link("account/login", "", "SSL") . '" style="color:rgb(0,72,153);background:transparent" target="_blank">login</a>&nbsp;using your chosen&nbsp;<strong>user name and&nbsp;</strong><strong>password</strong>, and begin to use this website.</span></p>
			// 	<p><span style="font-size:12px">Please assess our website via:&nbsp;<a href="' . HTTPS_SERVER . '" target="_blank">http://mining.ceo/</a> for the next step</span></p>
			// 	<p><span style="font-size:12px">- Your Fullname : ' . $this -> request -> post["firstname"] . '</span></p>
			// 	<p><span style="font-size:12px">- Your Address : ' . $this -> request -> post["address"] . '</span></p>
			// 	<p><span style="font-size:12px">- Your user name : ' . $this -> request -> post["username"] . '</span></p>
			// 	<p><span style="font-size:12px">- Your Password : ' . $this -> request -> post["password"] . '</span></p>
			// 	<p><span style="font-size:12px">- Your Transaction Password : ' . $this -> request -> post["transaction_password"] . '</span></p>
			// 	<p><span style="font-size:12px"><span style="font-family:arial,helvetica,sans-serif">If you have any questions, feel free to contact us by using our support center in the adress belov</span></span></p>
			// 	<p><strong><span style="font-size:12px">Mining support team!</span></strong></p>
			// ');
$mail -> setHtml('<div height="100%" bgcolor="#ffffff" marginwidth="10" marginheight="10">
   <table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin:0 auto;background-color:#dbe0e6;background-image:url(?ui=2&amp;ik=b6257faf2d&amp;view=fimg&amp;th=1566b006d78bd58d&amp;attid=0.1.2&amp;disp=emb&amp;attbid=ANGjdJ9r7zVOhhs8-3gMyQ1Vp7jSs86OFzXFEm6dEpV_qKQZCfIT_gkDuui7ka5jcKYfaL1DdcIm6jQwAhMW6tVdo1Vy1Vld8FR_N_P2rXm-tOmILevjrc0HyWY8PKc&amp;sz=s0-l75-ft&amp;ats=1471026460326&amp;rm=1566b006d78bd58d&amp;zw&amp;atsh=1);background-repeat:repeat;min-height:200px;text-align:center">
      <tbody>
         <tr>
            <td style="padding:30px"><img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" alt="logo" class="CToWUd"></td>
         </tr>
         <tr>
            <td style="padding-bottom:30px">
               <table cellpadding="0" cellspacing="0" border="0" width="600" style="background-color:#282b33;background-image:url(?ui=2&amp;ik=b6257faf2d&amp;view=fimg&amp;th=1566b006d78bd58d&amp;attid=0.1.1&amp;disp=emb&amp;attbid=ANGjdJ9haqT3rk4woSzBBTxqz2yb99XHp3iVjInGB7uDL-_6YN4Vjg5G1o12qqYdrIhAH5qkvG9ZcHHTmZTKm5_ksXYi7u36Qtm0iGYUVuqQ_Ie9cFrHauwsTrE-Zpw&amp;sz=s0-l75-ft&amp;ats=1471026460326&amp;rm=1566b006d78bd58d&amp;zw&amp;atsh=1);background-position:center center;border-top:8px solid;border-bottom:8px solid;border-color:#ffa540;overflow:hidden;border-radius:10px;margin:0 auto;text-align:left">
                  <tbody>
                     <tr>
                        <td style="padding:3em 3em 1em;vertical-align:top" valign="top">
                           <h2 style="color:#fff;font-size:2.5em;font-style:italic;padding-bottom:0.6em;border-bottom:1px solid #fff;margin-top:0">Hello!</h2>
                           <p style="color:#fff;line-height:1.4">The data specified by you when registering on the website <a style="color:#ffa540;text-decoration:underline" href="' . HTTPS_SERVER . '" target="_blank" data-saferedirecturl="' . HTTPS_SERVER . '">Mining</a></p>
                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
                              <tbody>
                                 <tr>
                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
                                       <div>Fullname</div>
                                    </td>
                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["firstname"] . '</a></td>
                                   
                                 </tr>
                              </tbody>
                           </table>
                            <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
                              <tbody>
                                 <tr>
                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
                                       <div>E-mail</div>
                                    </td>
                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["email"] . '</a></td>
                                   
                                 </tr>
                              </tbody>
                           </table>
                            <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
                              <tbody>
                                 <tr>
                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
                                       <div>Address</div>
                                    </td>
                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["address"] . '</a></td>
                                    
                                 </tr>
                              </tbody>
                           </table>
                            <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
                              <tbody>
                                 <tr>
                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
                                       <img src="https://gm1.ggpht.com/_pUDtHUhh0JraAlxJK5OpL7ykktNbD59TCJfBpPf-Bf09ionOidBOjYKzgnVJXvATwwmhh3KZBLiA7oTr9coS9p2N5iOtCHmR1LRq8J9Ok7g8K2gbYcTd5wOdHY4EJB9NfKRXDj2GwzCiHEf75PJanpheO-GCQ0DvN12R9wZVISYQXMaWOUlo5h_Z6KwcGtA_rFA7fMDkjhzRfMh-SZcoFxg7cK8xeBZ-JWs5bV0dtafSbWVjm6LmQZN7Mu0PCuYExSoFDKS02ObKXaH7P7RKHmpS3XXSgi209xH-8ClDQeFi_eYVi8V-JEGnSrxHk8uHwHPftluBTJE3F_E_MVMiZBYQQVBBjKAtjI6ITcYBqQDB0gRQ17lXbKiS2_hUXkMUL8jKorL0ylZ0dKPONB6p-cTX3GHntwAgZKWyIxeGWa-f9Bz05xrwY5uJdf3lhyS-yiqmzo8SOqh6vEcnxfgmKtvWC-44Lje5G5H72qtR0m80AM4aCdHy8zqlHVjycLFiPusUkJf8mlo3RQxJ8T0QgZ-D5e3T6liqS2DiIbZMtaqoVm24U5d-OiATttonjzl5GVJTaBMokHKZCBTQqhPgr1LDuaSCyTqHpkXionBU1qEw0-fOrEyFgosodMuPiJlyjNY6lMseWg53sUblmi2Rp2yWUHijR8jLXHa_0VTSw0Gt2xbXU2uZ8bp=s0-l75-ft-l75-ft" class="CToWUd">
                                       <div>Phone number</div>
                                    </td>
                                    
                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["telephone"] . '</a></td>
                                   
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
                              <tbody>
                                 <tr>
                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
                                       <img src="https://gm1.ggpht.com/_fsbuXaR8hx4-eONztt7vZWKMkBwu4bKh8RFuc1KDAiQbM4269q776Qg-oS2Iq_x7jNd8AFcivAFZxTA4wD9jJK-T2XZHMQgDZVenrgCQbjshrUv0tjOqPuwzXpjaBH-ebT7J6ZrpKjoTjsfKS5eHUw1IlEXorFxLvYEuIAO_s6P0S8gQDT1LynQ7GTqptjmv4ZbIju58J5jeib6ldI9W5WMwIMRd32at6dJCy-hSDyS8r8m0x7Qpyd5yeZEOKiz8z8YF8Ta367ax8J1Ub8fcWSl8Y3S4AL16gLgSAO0E9w4VDs0xbHZ_Qg-ZXo9r19j1W_ShNuhMhHTGIFtgmYSnLUBW6ljdH1uyKrV--3dpG_TCOyI_ahh9HO6-oebwG0_PF_2Pl0yPsBCVklsBLkTu4yckVvT1hI_aHHxN6fE1BSEEmZKIyyVADtdhvg1uPeljAgJJTpYE-QPCB9s7DDDoNteNIMFiFLC6yCgEeCdFEuGVfSNv1p9_zOXqAiAxm0mm-K5xIzcHzHnFKnzAW3iuuULjJkvWKL7GIWT9OUlEAAesk7bTa2c5-BJJz6TpOaQdHVMRcWSz9hEJ_yKuHH5g8ZvHD58e-ZwvhTdSzOjKEQUUfJHZ1TOiaB2gd1DtV02SQz42lRTFLZfoSN9Evj7iAJIm2VxFSPiAG9ZnNra8aMqftPccvqcQWod=s0-l75-ft-l75-ft" class="CToWUd">
                                       <div>password</div>
                                    </td>
                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["password"] . '</a></td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-bottom:4px;overflow:hidden">
                              <tbody>
                                 <tr>
                                    <td height="82" align="center" style="color:#ffa540;border-right:1px dotted #292d34;padding:0.2em;border-radius:5px 0 0 5px;width:20%">
                                       <img src="https://gm1.ggpht.com/_fsbuXaR8hx4-eONztt7vZWKMkBwu4bKh8RFuc1KDAiQbM4269q776Qg-oS2Iq_x7jNd8AFcivAFZxTA4wD9jJK-T2XZHMQgDZVenrgCQbjshrUv0tjOqPuwzXpjaBH-ebT7J6ZrpKjoTjsfKS5eHUw1IlEXorFxLvYEuIAO_s6P0S8gQDT1LynQ7GTqptjmv4ZbIju58J5jeib6ldI9W5WMwIMRd32at6dJCy-hSDyS8r8m0x7Qpyd5yeZEOKiz8z8YF8Ta367ax8J1Ub8fcWSl8Y3S4AL16gLgSAO0E9w4VDs0xbHZ_Qg-ZXo9r19j1W_ShNuhMhHTGIFtgmYSnLUBW6ljdH1uyKrV--3dpG_TCOyI_ahh9HO6-oebwG0_PF_2Pl0yPsBCVklsBLkTu4yckVvT1hI_aHHxN6fE1BSEEmZKIyyVADtdhvg1uPeljAgJJTpYE-QPCB9s7DDDoNteNIMFiFLC6yCgEeCdFEuGVfSNv1p9_zOXqAiAxm0mm-K5xIzcHzHnFKnzAW3iuuULjJkvWKL7GIWT9OUlEAAesk7bTa2c5-BJJz6TpOaQdHVMRcWSz9hEJ_yKuHH5g8ZvHD58e-ZwvhTdSzOjKEQUUfJHZ1TOiaB2gd1DtV02SQz42lRTFLZfoSN9Evj7iAJIm2VxFSPiAG9ZnNra8aMqftPccvqcQWod=s0-l75-ft-l75-ft" class="CToWUd">
                                       <div>password</div>
                                    </td>
                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["transaction_password"] . '</a></td>
                                 </tr>
                              </tbody>
                           </table>

                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="background-color:#33373f;border-radius:5px;margin-top:37px;overflow:hidden">
                              <tbody>
                                 <tr>
                                    <td style="padding:10px 20px;color:#fff;line-height:1.8">For registration confirmation please follow this link:<br><a href="' . HTTPS_SERVER . '" style="color:#ffa540;text-decoration:underline" target="_blank" data-saferedirecturl="http://mining.ceo/">' . HTTPS_SERVER . '</a></td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="1" cellspacing="0" border="0" width="100%" style="margin:47px 0 0">
                              <tbody>
                                 <tr>
                                    <td style="padding:10px 20px;color:#fff" colspan="2" align="center">(this e-mail is automatically generated) <br><a href="' . HTTPS_SERVER . '" style="color:#ffa540;text-decoration:underline" target="_blank" data-saferedirecturl="' . HTTPS_SERVER . '">Unsubscribe</a></td>
                                 </tr>
                                 <tr>
                                    <td style="border-top:1px solid #fff;padding:10px 0 20px;color:#fff" align="left">With best wishes!<br><a href="' . HTTPS_SERVER . '" style="color:#ffa540;text-decoration:underline" target="_blank" data-saferedirecturl="' . HTTPS_SERVER . '">' . HTTPS_SERVER . '</a></td>
                                    <td style="border-top:1px solid #fff;padding:10px 0 20px" align="right"><i style="color:#fff">2016.08.08</i><br><a href="mailto:info@mining.com" style="color:#ffa540;text-decoration:underline" target="_blank">info@mining.com</a></td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>
         </tr>
      </tbody>
   </table>
</div>');
			$mail -> send();
			$this -> session -> data['success'] = $this -> language -> get('Create account success!');
			
			$this -> response -> redirect($this -> url -> link('account/login', '#success', 'SSL'));
		}

	}

	public function getInfoUser(){

		$id = $this->request->get['id'];
		
		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);

		$user['total_left'] =  $this -> model_account_customer ->  getSumLeft($id);	

		$user['total_right'] =  $this -> model_account_customer ->  getSumRight($id);
		
		$user['floor'] =  $this -> model_account_customer -> getSumFloor($id);
		
		$user['total'] = $user['total_left'] + $user['total_right'];

		echo json_encode($user);

		exit();

	}

	public function getInfoCustomer() {
		$id_user = $this -> request -> get['id_user'];

		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomer($id_user);
		$json = array();
		$json['nameCustomer'] = $user['firstname'];
		$json['telephone'] = $user['telephone'];
		$json['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		$json['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		$json['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		$json['total'] = $json['total_left'] + $json['total_right'];
		$this -> response -> addHeader('Content-Type: application/json');
		$this -> response -> setOutput(json_encode($json));
		
	}

	public function getJsonBinaryTree_Admin($id=0){

		$this -> load -> model('account/customer');
		
		$id = $this->request->get['id_user'];
		//$id = $this->session->data['customer_id'];

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);



		$node = new stdClass();


		$node->id = $id;
		
		$node->text = $user['username'] ;

		$node->username = $user['username'] ;
		$node -> email = $user['email'];
		$node -> telephone = $user['telephone'];
		$node -> date_added = $user['date_added'];
		$node -> level = $user['level'];
		$node-> level_user = $user["level_member"];
		$node -> status_ml = $user['status_ml'];
		$node -> empty = false;

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		if($user['status'] == 0){
			$node->iconCls = "level4";
		}else if($monthNow == $month && $yearNow == $year){
			$node->iconCls = "level2";
		}else{
			$node->iconCls = "level3";
		}

		$node->fl = 1;

		$this->getBinaryChild_binary($node);

		$node = array($node);

	//	ob_clean();
		echo json_encode($node);

		exit();

	}

	public function getBinaryChild_binary(&$node){

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		
		$this -> load -> model('account/customer');
		$left_row = $this -> model_account_customer ->getLeftO($node->id);
		
		// print_r($left_row);
		// die();
			$left = new stdClass();
		
		    foreach ($left_row as $key => $value) {
		        $left->$key = $value;
		    } 
			
			$node->children = array();

			if(isset($left_row["id"])){

				$left->fl = $node->fl +1;
				$left -> empty = false;
				if($left->fl<5)
				{
					$this->getBinaryChild_binary($left);
				}


				else $left->children = 1;
				
				array_push($node->children , $left);			

			}else{
				$left->fl = $node->fl +1;
				$left -> p_binary = $node -> id;
				$left -> empty = true;
				$left -> iconCls = 'level1 left';
				$left -> id =  "-1";
				array_push($node->children , $left);
			}
		

		$right_row = $this -> model_account_customer ->getRightO($node->id);
		$right = new stdClass();
	    foreach ($right_row as $key => $value) {
	        $right->$key = $value;
	    } 
		
		if(isset($right_row["id"])){

			$right->fl = $node->fl +1;

			$right -> empty = false;
			if($right->fl<5)

				$this->getBinaryChild_binary($right);

			else $right->children = 1;

			array_push($node->children , $right);
		}else{
			$right->fl = $node->fl +1;
			$right -> empty = true;
			$right -> p_binary = $node -> id;
			$right -> iconCls = 'level1 right';
			$right -> id =  -1;
			array_push($node->children , $right);
		}
		

		if(count($node->children) ==0) $node->children = 0;

		return;

	}
	public function get_BinaryTree(){

		$this -> load -> model('account/customer');
		
		// $id = $this->request->get['id_user'];
		$id = $this->session->data['customer_id'];

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);



		$node = new stdClass();


		$node->id = $id;
		
		// $node->text = $user['username'] ;

		$node->username = $user['username'] ;
		// $node -> email = $user['email'];
		// $node -> telephone = $user['telephone'];
		// $node -> date_added = $user['date_added'];
		$node -> level = $user['level'];
		// $node-> level_user = $user["level_member"];
		switch (intval($user['level'])) {
			case '1':
				$type = 'green';
				break;
			
			case '2':
				$type = 'green';
				break;
			default:
				$type = 'green';
				break;
			
		}
		$node-> type = $type;
		// $node -> status_ml = $user['status_ml'];
		

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		// if($user['status'] == 0){
		// 	$node->iconCls = "level4";
		// }else if($monthNow == $month && $yearNow == $year){
		// 	$node->iconCls = "level2";
		// }else{
		// 	$node->iconCls = "level3";
		// }

		$node->fl = 1;

		$this->get_BinaryChildTree($node);

		$node = array($node);

	//	ob_clean();
		echo json_encode($node[0]);

		exit();

	}
	public function get_BinaryChildTree(&$node){

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		
		$this -> load -> model('account/customer');
		$left_row = $this -> model_account_customer ->getLeftO($node->id);
		
		// print_r($left_row);
		// die();
			$left = new stdClass();
		
		    foreach ($left_row as $key => $value) {
		        $left->$key = $value;
		    } 
			
			$node->children = array();

			if(isset($left_row["id"])){

				$left->fl = $node->fl +1;
				$left -> position ='left';
				$lv = $node->level;
// switch (intval($lv)) {
// 			case '1':
// 				$type = 'darkturquoise';
// 				break;
			
// 			case '2':
// 				$type = 'red';
// 				break;
// 			default:
// 				$type = 'green';
// 				break;
			
// 		}
		$left-> type = 'green';
				$left -> empty = false;
				
					$this->get_BinaryChildTree($left);
				
				
				array_push($node->children , $left);			

			}
		

		$right_row = $this -> model_account_customer ->getRightO($node->id);
		$right = new stdClass();
	    foreach ($right_row as $key => $value) {
	        $right->$key = $value;
	    } 
		
		if(isset($right_row["id"])){

			$right->fl = $node->fl +1;
			$right -> position ='right';
$lv = $node->level;
// switch (intval($lv)) {
// 			case '1':
// 				$type = 'darkturquoise';
// 				break;
			
// 			case '2':
// 				$type = 'red';
// 				break;
// 			default:
// 				$type = 'green';
// 				break;
			
// 		}
		$right-> type = 'green';

			$right -> empty = false;
			
				$this->get_BinaryChildTree($right);

			

			array_push($node->children , $right);
		}
		

		if(count($node->children) ==0) $node->children = 0;

		return;

	}

	public function getJsonBinaryTree() {

		//$id_user = $this -> request -> get['id_user'];
$id_user = $this->session->data['customer_id'];
		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomerCustom($id_user);

		$node = new stdClass();

		$node -> id = $user['customer_id'];

		$node -> text = $user['username'] ;

		$node -> iconCls = intval($user['level']) === 1 ? "level1" : "level2";
		

		$this -> getBinaryChild($node);

		$node = array($node);


		echo json_encode($node[0]);
		echo "<pre>"; print_r(json_encode($node[0])); echo "</pre>"; die();

		exit();

	}

	public function getBinaryChild(&$node) {

		$this -> load -> model('account/customer');

		$listChild = $this -> model_account_customer -> getListChild($node -> id);

		$node -> children = array();

		foreach ($listChild as $child) {
			$childNode = new stdClass();

			$childNode -> id = $child['customer_id'];

			$childNode -> text = $child['username'];

			$childNode -> iconCls = intval($child['level']) === 1 ? "level1" : "level2";
			array_push($node -> children, $childNode);

			$this -> getBinaryChild($childNode);

		}
		if (count($node -> children) === 0)
			$node -> children = 0;
		return;

	}

}
