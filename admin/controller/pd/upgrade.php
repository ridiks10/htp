<?php
class ControllerPdUpgrade extends Controller {
	public function index() {
		$this->document->setTitle('Provide Donation');
		$this->load->model('pd/pd');

	$this -> document -> addScript('view/javascript/register/register.js');

		$this -> document -> addScript('../catalog/view/javascript/autocomplete/jquery.easy-autocomplete.min.js');
		$this -> document -> addStyle('../catalog/view/theme/default/stylesheet/autocomplete/easy-autocomplete.min.css');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			
			$url = '';

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			$this->response->redirect($this->url->link('pd/pd', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		

		
		$data['action_upgrade'] = $this->url->link('pd/upgrade/submit', 'token=' . $this->session->data['token'], 'SSL');

		$data['check_p_binary'] = $this->url->link('pd/register/get_position', 'token=' . $this->session->data['token'], 'SSL');


		$data['getaccount'] = $this->url->link('pd/upgrade/getaccount&token='.$this->session->data['token']);

		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

	$this->response->setOutput($this->load->view('pd/upgrade.tpl', $data));
	}

	public function get_position($p_binary){
		$this -> load -> model('pd/register');
		$p_binary = $this -> request -> get['p_binary'];
		$check_pbinary = $this -> model_pd_register ->get_customer_Id_by_username($p_binary);

		$check_p_binary = $this -> model_pd_register -> count_p_binary($check_pbinary['customer_id']);
		if (!empty($check_p_binary)) {
			$html ='';
			if (intval($check_p_binary['left']) === 0 && intval($check_p_binary['right']) === 0 ) {
				$html .= '<option value="">Chọn vị trí</option>';
	            $html .= '<option value="left">Trái</option>';
	            $html .= '<option value="right">Phải</option>';
			} elseif (intval($check_p_binary['left']) === 0 && intval($check_p_binary['right']) !== 0 ) {
				$html .= '<option value="">Chọn vị trí</option>';
	            $html .= '<option value="left">Trái</option>';
	            
			} elseif (intval($check_p_binary['left']) !== 0 && intval($check_p_binary['right']) === 0 ) {
				$html .= '<option value="">Chọn vị trí</option>';
	            $html .= '<option value="right">Phải</option>';
			}
			$json['html'] = $html;

			
		} else{
			$json['html'] = null;
		}
		$this -> response -> setOutput(json_encode($json));
		
	}
	
	public function getaccount() {
		if ($this -> request -> post['keyword']) {
			$this -> load -> model('pd/register');
			$tree = $this -> model_pd_register -> getCustomLike($this -> request -> post['keyword']);
			
			if (count($tree) > 0) {
				foreach ($tree as $value) {
					 echo '<li class="list-group-item"  onClick="selectU(' . "'" . $value['name'] . "'" . ','.$value['customer_id'].');">' . $value['name'] . '</li>';
				}
			}
		}
	}

	public function submit(){

		$this->load->model('pd/register');
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){
			$customer_id = $this->request->post['customer_id'];
			$amount = $this->request->post['investment'];
			$this ->model_pd_register -> createPD_upgrade($customer_id, $amount);
			$this -> session -> data['success'] = $this -> language -> get('Upgradesuccess!');
			
			$this->response->redirect($this->url->link('pd/upgrade', 'token=' . $this->session->data['token'], 'SSL'));
			/*$data['token'] = $this->session->data['token'];
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			$this->response->setOutput($this->load->view('pd/upgrade.tpl', $data));*/
		}
		
	}
	public function send_sms($phone_send,$content){
		$APIKey="70152DEE3829626055A11C11E1F766";
		$SecretKey="86CF68BD01032D2E48DD90FDE471D8";
		$YourPhone = $phone_send;
		$content = $content;
        $ch = curl_init();
		$SampleXml = "<RQST>"
           . "<APIKEY>". $APIKey ."</APIKEY>"
           . "<SECRETKEY>". $SecretKey ."</SECRETKEY>"                                    
           . "<ISFLASH>0</ISFLASH>"
   			."<SMSTYPE>4</SMSTYPE>"
           . "<CONTENT>". ''.$content.'' ."</CONTENT>"
           . "<CONTACTS>"
           . "<CUSTOMER>"
           . "<PHONE>". $YourPhone ."</PHONE>"
           . "</CUSTOMER>"                               
           . "</CONTACTS>"
		   . "</RQST>";
							   		
							   
		curl_setopt($ch, CURLOPT_URL,            "http://api.esms.vn/MainService.svc/xml/SendMultipleMessage_V2/" );
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_POST,           1 );
		curl_setopt($ch, CURLOPT_POSTFIELDS,     $SampleXml ); 
		curl_setopt($ch, CURLOPT_HTTPHEADER,     array('Content-Type: text/plain')); 

		$result=curl_exec ($ch);		
		$xml = simplexml_load_string($result);

		if ($xml === false) {
			die('Error parsing XML');   
		}
		print "$xml->CodeResult";   		
		
	}

	public function createInvestment($customer_id, $amount){
		$this->load->model('pd/register');
		$pd_query = $this -> model_pd_register -> createPD($customer_id, $amount);
	}

	public function update_C_wallet($customer_id){
		$this->load->model('pd/register');
		$customer = $this -> model_pd_register -> getCustomerCustom($customer_id);

        $partent = $this -> model_pd_register -> getCustomerCustom($customer['p_node']);

    	switch (intval($partent['package'])) {
    		case 5000000:
    			$per = 10;
    			break;
    		
    		case 20000000:
    			$per = 15;
    			break;
    		case 50000000:
    			$per = 18;
    			break;
    		case 100000000:
    			$per = 20;
    			break;
    		case 500000000:
    			$per = 25;
    			break;
    		case 1000000000:
    			$per = 32;
    			break;
    	}
    	
		$price = (intval($customer['package']) * $per) / 100;

		$double = intval($partent['package'])*2;

		if ($price > $double) {
			$per_comission = $double;
		} else{
			$per_comission = $price;
		}
		

		$this -> model_pd_register -> update_C_Wallet($per_comission, $partent['customer_id']);
		$this -> model_pd_register -> saveTranstionHistory($partent['customer_id'], 'Ví Hoa hồng', '+ ' . number_format($per_comission) . ' VND', "Thưởng trực tiếp ".$per." % từ thành viên ".$customer['username']." đầu tư gói  (".number_format($customer['package'])." VND)");
	}
}