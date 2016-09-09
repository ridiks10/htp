<?php
class ControllerPdRegister extends Controller {
	public function index() {
		$this->document->setTitle('Provide Donation');
		$this->load->model('pd/pd');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			
			$url = '';

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			$this->response->redirect($this->url->link('pd/pd', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		

		
		$data['action_dangky'] = $this->url->link('pd/register/submit', 'token=' . $this->session->data['token'], 'SSL');

		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

	$this->response->setOutput($this->load->view('pd/register.tpl', $data));
	}
	
	public function submit(){
		$this->load->model('pd/register');
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){
			$tmp = $this -> model_pd_register -> addCustomer_custom($this->request->post);
			$cus_id= $tmp;
			$username = hexdec(crc32(md5($cus_id)));
			$this -> model_pd_register -> update_username_customer($tmp, $username);

			$amount = 0;
			$checkC_Wallet = $this -> model_pd_register -> checkC_Wallet($cus_id);
			if(intval($checkC_Wallet['number'])  === 0){
				if(!$this -> model_pd_register -> insertC_Wallet($amount, $cus_id)){
					die();
				}
			}
			$checkR_Wallet = $this -> model_pd_register -> checkR_Wallet($cus_id);
			if(intval($checkC_Wallet['number'])  === 0){
				if(!$this -> model_pd_register -> insertR_Wallet($amount, $cus_id)){
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
				                                    <td height="82" align="left" style="padding:0.2em 0.2em 0.2em 1em;border-radius:0 5px 5px 0;width:80%;color:#fff"><a style="color:#fff!important;text-decoration:none">' . $this -> request -> post["p_node"] . '</a></td>
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
				
				$this->response->redirect($this->url->link('pd/register', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
	}

		
}