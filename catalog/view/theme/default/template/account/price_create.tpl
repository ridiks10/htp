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
         <div class="plan-col col-md-3">
            <div class="plan-header bg-light-green darken">PLAN SILVER</div>
            <div class="plan-pricing bg-light-green"><span class="plan-currency"></span><span class="plan-value">3 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 6 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.06 BTC Daily For 100 Days!</li>
               <!-- <a href="#" class="bg-light-green darken">DEPOSIT NOW</a> -->
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="3">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <!-- Start Up plan -->
         <div class="plan-col col-md-3">
            <div class="plan-header bg-light-green darken">PLAN GOLD</div>
            <div class="plan-pricing bg-light-green "><span class="plan-currency"></span><span class="plan-value">7 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 16 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.16 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="7">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <!-- Company plan -->
         <div class="plan-col col-md-3">
            <div class="plan-header bg-light-green darken">PLAN PLATINUM</div>
            <div class="plan-pricing bg-light-green"><span class="plan-currency"></span><span class="plan-value">10 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 28 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.28 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="10">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <!-- Enterprice plan -->
         <div class="plan-col col-md-3">
            <div class="plan-header bg-light-green darken">PLAN DIAMOIND</div>
            <div class="plan-pricing bg-light-green "><span class="plan-currency"></span><span class="plan-value">20 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 65 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.65 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="20">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <?php } 
            if (intval($package) === 1) { ?>
         <div class="plan-col col-md-4">
            <div class="plan-header bg-light-green darken">PLAN GOLD</div>
            <div class="plan-pricing bg-light-green "><span class="plan-currency"></span><span class="plan-value">7 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 16 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.16 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="7">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <!-- Company plan -->
         <div class="plan-col col-md-4">
            <div class="plan-header bg-light-green darken">PLAN PLATINUM</div>
            <div class="plan-pricing bg-light-green"><span class="plan-currency"></span><span class="plan-value">10 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 28 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.28 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="10">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <!-- Enterprice plan -->
         <div class="plan-col col-md-4">
            <div class="plan-header bg-light-green darken">PLAN DIAMOIND</div>
            <div class="plan-pricing bg-light-green "><span class="plan-currency"></span><span class="plan-value">20 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 65 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.65 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="20">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <?php  }
            if (intval($package) === 2) { ?>
         <div class="plan-col col-sm-6">
            <div class="plan-header bg-light-green darken">PLAN PLATINUM</div>
            <div class="plan-pricing bg-light-green"><span class="plan-currency"></span><span class="plan-value">10 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 28 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.28 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="10">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <!-- Enterprice plan -->
         <div class="plan-col col-sm-6">
            <div class="plan-header bg-light-green darken">PLAN DIAMOIND</div>
            <div class="plan-pricing bg-light-green "><span class="plan-currency"></span><span class="plan-value">20 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 65 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.65 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="20">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
         </div>
         <?php } if (intval($package) === 3) { ?>
         <div class="plan-col col-sm-6 col-sm-offset-3">
            <div class="plan-header bg-light-green darken">PLAN DIAMOIND</div>
            <div class="plan-pricing bg-light-green "><span class="plan-currency"></span><span class="plan-value">20 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
            <ul class="plan-features">
               <li>Daily Payments until 65 BTC Reached</li>
               <li>Est. Duration: 100 Days</li>
               <li>0.65 BTC Daily For 100 Days!</li>
               <form id="package1" class="product-form" rel="6" method="POST" action="<?php echo $self->url->link('account/price/paymentSubmit', '', 'SSL'); ?>">
                  <input type="hidden" name="amount"  class="form-control" value="20">
                  <button class="btn-investment bg-light-green darken" type="submit">
                  DEPOSIT NOW
                  </button>
               </form>
            </ul>
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