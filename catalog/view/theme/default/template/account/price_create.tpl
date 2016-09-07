<?php 
   $self->document->setTitle('Dashboard');
   echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left');
   
   ?>
<div id="content-wrapper">
   <div class="page-pricing-header">
      <div class="bg-overlay" style="background: #8f7c5f;"></div>
      <div class="page-pricing-header-content">
         <h1 class="page-title"><strong>OUR INVESTMENT PLANS</strong></h1>
         <div class="clearfix"></div>
      </div>
   </div>
   <div id="create-error" class="alert alert-dismissable alert-danger" style="display:none">
   </div>
   <?php if (intval($self->getActive_tree()) === 0) {?>
      <div class="panel">
      <div class="panel-heading">
         <span class="panel-title">Plan Active 1 BTC</span>
      </div>
      <div class="panel-body">
         <form method="post" name="spendform">
          
            <table cellspacing="1" cellpadding="2" border="0" width="100%" class="table">
               <tbody>
                  <tr>
                     <td>Interest</td>
                     <td width="200">Spent Amount</td>
                    
                  </tr>
                  <tr>
                     <td><p>Introduction of participants.</p>
<p>Direct commission from F1.</p>
<p>Cyclic commission</p></td>
                     <td align="right">1 BTC</td>
                     
                  </tr>
                  <tr>
                    <td colspan="2"><button id="btn_active" type="button" class="btn btn-danger" data-link="<?php echo $self->url->link('account/account/active1BTC', '', 'SSL'); ?>">DEPOSIT NOW </button></td>
                  </tr>
               </tbody>
            </table>
          
         </form>
      </div>
   </div>
  <?php } ?>
   
   <div class="panel">
      <div class="panel-heading">
         <span class="panel-title">Plan Investment</span>
      </div>
      <div class="panel-body">
         <div class="plans-panel" style="max-width: 1050px;">
      <div class="plans-container text-center">
         <!-- Personal plan -->
         <?php $package = $self->get_package(); ?>
         <?php if (intval($package) === 0) { ?>
         <div class="col-md-4">
            <div class="deposite deposite_red">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('5000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('7200000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('1800000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="1">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
              
            </div>
          </div>
          <div class=" col-md-4">
               <div class="deposite deposite_orange">
                    <span class="deposite_title">90 days</span>
                    <div class="deposite_time_wrap">
                        <span class="deposite_time_wrap_text">2% per day</span>
                        <div class="deposite_time">
                            <span class="deposite_time_digit"><?php echo number_format('20000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                        </div>
                    </div>
                    <div class="deposite_time_triangle">
                    </div>
                    <div class="deposite_info">
                       <span>Profit / 90 days: <?php echo number_format('28000000') ?> VNĐ</span>
                        <span>Reinvestment / days: <?php echo number_format('7200000') ?> VNĐ</span>
                        <span>2% per day</span>
                    </div>
                     <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="2">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
               </div>
            </div>
               <div class="col-md-4">
                  <div class="deposite deposite_green">
                    <span class="deposite_title">90 days</span>
                    <div class="deposite_time_wrap">
                        <span class="deposite_time_wrap_text">2% per day</span>
                        <div class="deposite_time">
                            <span class="deposite_time_digit"><?php echo number_format('50000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                        </div>
                    </div>
                    <div class="deposite_time_triangle">
                    </div>
                    <div class="deposite_info">
                        <span>Profit / 90 days: <?php echo number_format('72000000') ?> VNĐ</span>
                        <span>Reinvestment / days: <?php echo number_format('18000000') ?> VNĐ</span>
                        <span>2% per day</span>
                    </div>
                     <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="3">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
                  </div>
               </div>
            <div class="col-md-4">
               <div class="deposite deposite_cyan">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('100000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('144000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('36000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="4">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
           <div class="col-md-4">
               <div class="deposite deposite_blue">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('500000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('720000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('180000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="5">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
          <div class="col-md-4">
               <div class="deposite deposite_purple">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('1000000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('1440000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('360000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="6">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
         
         <?php } 
            if (intval($package) === 1) { ?>
            <div class=" col-md-4">
               <div class="deposite deposite_orange">
                    <span class="deposite_title">90 days</span>
                    <div class="deposite_time_wrap">
                        <span class="deposite_time_wrap_text">2% per day</span>
                        <div class="deposite_time">
                            <span class="deposite_time_digit"><?php echo number_format('20000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                        </div>
                    </div>
                    <div class="deposite_time_triangle">
                    </div>
                    <div class="deposite_info">
                       <span>Profit / 90 days: <?php echo number_format('28000000') ?> VNĐ</span>
                        <span>Reinvestment / days: <?php echo number_format('7200000') ?> VNĐ</span>
                        <span>2% per day</span>
                    </div>
                     <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="2">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
               </div>
            </div>
               <div class="col-md-4">
                  <div class="deposite deposite_green">
                    <span class="deposite_title">90 days</span>
                    <div class="deposite_time_wrap">
                        <span class="deposite_time_wrap_text">2% per day</span>
                        <div class="deposite_time">
                            <span class="deposite_time_digit"><?php echo number_format('50000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                        </div>
                    </div>
                    <div class="deposite_time_triangle">
                    </div>
                    <div class="deposite_info">
                        <span>Profit / 90 days: <?php echo number_format('72000000') ?> VNĐ</span>
                        <span>Reinvestment / days: <?php echo number_format('18000000') ?> VNĐ</span>
                        <span>2% per day</span>
                    </div>
                     <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="3">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
                  </div>
               </div>
            <div class="col-md-4">
               <div class="deposite deposite_cyan">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('100000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('144000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('36000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="4">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
           <div class="col-md-4">
               <div class="deposite deposite_blue">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('500000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('720000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('180000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="5">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
          <div class="col-md-4">
               <div class="deposite deposite_purple">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('1000000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('1440000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('360000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="6">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
         
         <?php  }
            if (intval($package) === 2) { ?>
         <div class="col-md-4">
                  <div class="deposite deposite_green">
                    <span class="deposite_title">90 days</span>
                    <div class="deposite_time_wrap">
                        <span class="deposite_time_wrap_text">2% per day</span>
                        <div class="deposite_time">
                            <span class="deposite_time_digit"><?php echo number_format('50000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                        </div>
                    </div>
                    <div class="deposite_time_triangle">
                    </div>
                    <div class="deposite_info">
                        <span>Profit / 90 days: <?php echo number_format('72000000') ?> VNĐ</span>
                        <span>Reinvestment / days: <?php echo number_format('18000000') ?> VNĐ</span>
                        <span>2% per day</span>
                    </div>
                     <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="3">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
                  </div>
               </div>
            <div class="col-md-4">
               <div class="deposite deposite_cyan">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('100000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('144000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('36000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="4">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
           <div class="col-md-4">
               <div class="deposite deposite_blue">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('500000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('720000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('180000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="5">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
          <div class="col-md-4">
               <div class="deposite deposite_purple">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('1000000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('1440000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('360000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="6">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>

         <?php } if (intval($package) === 3) { ?>
          <div class="col-md-4">
               <div class="deposite deposite_cyan">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('100000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('144000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('36000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="4">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
           <div class="col-md-4">
               <div class="deposite deposite_blue">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('500000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('720000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('180000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="5">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
          <div class="col-md-4">
               <div class="deposite deposite_purple">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('1000000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('1440000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('360000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="6">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
      
          <?php } if (intval($package) === 4) { ?>
         <div class="col-md-4">
               <div class="deposite deposite_blue">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('500000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('720000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('180000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="5">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
          <div class="col-md-4">
               <div class="deposite deposite_purple">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('1000000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('1440000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('360000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="6">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
    
          <?php } if (intval($package) === 5) { ?>
        <div class="col-md-4">
               <div class="deposite deposite_purple">
              <span class="deposite_title">90 days</span>
              <div class="deposite_time_wrap">
                  <span class="deposite_time_wrap_text">2% per day</span>
                  <div class="deposite_time">
                      <span class="deposite_time_digit"><?php echo number_format('1000000000') ?></span>
                      <span class="deposite_time_text">VNĐ</span>
                  </div>
              </div>
              <div class="deposite_time_triangle">
              </div>
              <div class="deposite_info">
                  <span>Profit / 90 days: <?php echo number_format('1440000000') ?> VNĐ</span>
                  <span>Reinvestment / days: <?php echo number_format('360000000') ?> VNĐ</span>
                  <span>2% per day</span>
              </div>
               <form  class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                     <input type="hidden" name="amount"  class="form-control" value="6">
                     <button class="deposite_registry" type="submit">
                     DEPOSIT NOW
                     </button>
               </form>
           </div>
          </div>
         <?php } ?>

      </div>
   </div>
      </div>
   </div>
   
</div>
<!-- / #content-wrapper -->
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>