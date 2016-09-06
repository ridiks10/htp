<?php 
   $self -> document -> setTitle($lang['heading_title']); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<!-- -------------------------------------------------------- -->
<div id="content-wrapper">
   <div class="row">
      <div class="col-md-12">
         <style>
            #EditProfile .list-group-item span { float: right; }
         </style>
         <div class="panel">
            <div class="panel-heading">
               <h3 class="panel-title"><?php echo $lang['heading_header'] ?></h3>
            </div>
        
            <div class="panel-body panel-custom panel-pd">
               <ul class="nav nav-tabs">
                  <li class="active">
                     <a data-toggle="tab" href="#EditProfile" ><?php echo $lang['text_account'] ?></a>
                  </li>
                  <li>
                     <a data-toggle="tab" href="#ChangePassword"><?php echo 'Password';//echo $lang['text_password'] ?></a>
                  </li>
                  
                  <li>
                     <a data-toggle="tab" href="#BitcoinWallet">Bitcoin Wallet Address</a>
                  </li>
               </ul>
               <div class="tab-content">
                  <div class="tab-pane fade active in" id="EditProfile" data-link="<?php echo $self -> url -> link('account/setting/account', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" >
                     <div class="row">
                        <div class="col-md-6">
                           
                              <h3>Account Details</h3>
                              <ul class="list-group">
                                 <li class="list-group-item" id="UserName">Username: <span>huuthanhphuyen</span></li>
                                 <li class="list-group-item">Affiliate Status: <span>Premium</span></li>
                                 <li class="list-group-item" id="Date">Affiliate Since: <span>28/12/2015</span></li>
                                 <li class="list-group-item" id="LastIP">Last Login IP: <span>171.250.123.121</span></li>
                                 <li class="list-group-item" id="date_add_login">Last Login Time: <span>Accepted</span></li>
                              </ul>
                          
                        </div>
                        <div class="col-md-6">
                           
                              <h3>Personal Details</h3>
                              <ul class="list-group">
                                 <li class="list-group-item" id="fullname">Full Name: <span></span></li>
                                 <li class="list-group-item" id="Email">E-mail: <span></span></li>
                                 <li class="list-group-item" id="Address">
                                    Address: <span style="text-align: right;">
                                    </span>
                                    <div class="clearfix"></div>
                                 </li>
                                 <li class="list-group-item" id="Country">Country: <span></span></li>
                                 <li class="list-group-item" id="Phone">Phone: <span>+84913452268</span></li>
                              </ul>
                          
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane fade" id="ChangePassword">
                     <div class="row">
                        <div class="col-md-6">
                    
                              <h3><?php echo $lang['text_password'] ?></h3>
                     <form id="frmChangePassword" action="<?php echo $self -> url -> link('account/setting/editpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                       
                           <div class="controls">
                              <label class="control-label" for="OldPassword"><?php echo $lang['text_old_password'] ?></label>
                              <input class="form-control" id="OldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswd', '', 'SSL'); ?>" />
                              <span id="OldPassword-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                        
                        
                           <div class="controls">
                              <label class="control-label" for="Password"><?php echo $lang['text_new_password'] ?></label>
                              <input class="form-control" id="Password" name="password" type="password"/>
                              <span id="Password-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                     
                    
                           <div class="controls">
                              <label class="control-label" for="ConfirmPassword"><?php echo $lang['text_confirm_password'] ?></label>
                              <input class="form-control" id="ConfirmPassword"  type="password"/>
                              <span id="ConfirmPassword-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                        
                        <div class="" style="padding:0px; margin-top:10px;">
                           <div class="btn-toolbar">
                              <button type="submit" class="btn btn-primary"><?php echo $lang['text_button_password'] ?></button>
                           </div>
                        </div>
                     </form>
                
                 
                 </div>
                 <div class="col-md-6">
                   
                              <h3><?php echo $lang['text_transaction_password'] ?></h3>
                     <form id="changePasswdTransaction" action="<?php echo $self -> url -> link('account/setting/edittransactionpasswd', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
                        
                           <div class="controls">
                              <label class="control-label" for="TranoldPassword"><?php echo $lang['text_old_password'] ?></label>
                              <input class="form-control" id="TranoldPassword" type="password" data-link="<?php echo $self -> url -> link('account/setting/checkpasswdtransaction', '', 'SSL'); ?>" />
                              <span id="TranoldPassword-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                       
                        
                           <div class="controls">
                              <label class="control-label" for="Tranpassword"><?php echo $lang['text_new_password'] ?></label>
                              <input class="form-control" id="Tranpassword_New" name="transaction_password" type="password"/>
                              <span id="Tranpassword_New-error" class="field-validation-error">
                              <span></span>
                              </span>
                           </div>
                       
                       
                           <div class="controls">
                              <label class="control-label" for="TranConfirmPassword"><?php echo $lang['text_confirm_password'] ?></label>
                              <input class="form-control" id="TranConfirmPassword" type="password"/>
                              <span id="TranConfirmPassword-error" class="field-validation-error" style="display:none">
                              <span></span>
                              </span>
                           </div>
                       
                        <div class="" style="padding:0px; margin-top:10px;">
                           <div class="btn-toolbar">
                              <button type="submit" class="btn btn-primary"><?php echo $lang['text_button_password'] ?></button>

                            <!--   <a data-link="<?php echo $self -> url -> link('account/forgotten/resetPasswdTran', '', 'SSL'); ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" id="reset_passwdTran" href="javascript:;" class="btn btn-danger"><?php echo $lang['text_button_transaction_password'] ?></a> -->
                           </div>
                        </div>
                     </form>
                 
                 </div>
             </div>
                  </div>
                  
                  <div class="tab-pane" id="BitcoinWallet">
                    <div class="row">
                       
                        <div class="col-md-6">
                          
                              <h3>Update Bitcoin Wallet Address</h3>
                               <?php if(!$customer['wallet']){ ?>
                               
                                    <form id="updateWallet" action="<?php echo $self -> url -> link('account/setting/updatewallet', '', 'SSL'); ?>" method="GET" novalidate="novalidate">
                                       <div style="margin-bottom:20px">
                                          <label for="BitcoinWalletAddress">Bitcoin Wallet Address</label>
                                          <input class="form-control" id="BitcoinWalletAddress" name="wallet" type="text" data-link="<?php echo $self -> url -> link('account/account/main', '', 'SSL'); ?>"/>
                                          <span id="BitcoinWalletAddress-error" class="field-validation-error">
                                          <span></span>
                                          </span>
                                       </div>
                                       <div style="margin-bottom:20px">
                                          <label for="transaction_password">Transaction Password</label>
                                          <input class="form-control" id="Password2" name="transaction_password" type="password"/>
                                          <span id="Password2-error" class="field-validation-error">
                                          <span></span>
                                          </span>
                                       </div>
                                       <div class="loading">
                                       </div>
                                       <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                    <!-- /.col-lg-6 (nested) -->
                               
                                 <?php }else {?>
                                
                                    <div style="margin-bottom:20px">
                                       <label for="BitcoinWalletAddress">Bitcoin Wallet Address</label>
                                       <input readonly class="form-control" id="BitcoinWalletAddress" type="text"/>
                                    </div>
                                    <div id="bitcoin-image" data-img="https://chart.googleapis.com/chart?chs=200x200&amp;cht=qr&amp;chl=">
                                       <div class="form-group">
                                          <img style="border:1px solid #cecece"/>
                                       </div>
                                    </div>
                                 
                                 <?php } ?>
                          
                        </div>
                     </div>
                    <!-- -------------------------------- -->
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- ============================ -->
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Update profile successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>