<?php 
   if(!$notCreate) $self -> document -> setTitle('Confirm: '.($bitcoin / 100000000).' BTC');
   else $self -> document -> setTitle("You can not create more orders !!!!");
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div id="content-wrapper">
   <div class="row">
      <?php if(!$notCreate) { ?>
      <div class="col-md-6">
         <div class="panel">
            <div class="panel-heading">
               <span class="panel-title">Please confirm: <code><?php echo ($bitcoin / 100000000) ?> BTC </code></span>
            </div>
            <div class="panel-body">
               <h3>Blockchain QR code</h3>
               <br/>
               <img src="https://chart.googleapis.com/chart?chs=200x200&amp;chld=L|1&amp;cht=qr&amp;chl=bitcoin:<?php echo $wallet ?>?amount=<?php echo ($bitcoin / 100000000) ?>"/>
               <br/>
               <h3>Blockchain Wallet</h3>
               <br/>
               <code><?php echo $wallet ?></code>
               <br/>
               <br/>
               <code id="websocket">Received: 0 BTC</code>
            </div>
         </div>
      </div>
      <?php } ?>
      <div class="col-md-6">
         <div class="panel">
            <div class="panel-heading">
               <span class="panel-title">Detail Payment</span>
            </div>
            <div class="panel-body">
               <?php if ($invoice) { ?>
               
               <div id="detail-payment" class="provide-info" style="background:none; min-height:105px" data-id="<?php echo $invoice['invoice_id_hash'] ?>" data-link="<?php echo $self->url->link('account/price/detail_payment', '', 'SSL'); ?>">

               </div>
               <?php } ?>
            </div>
            <div class="panel-heading">
               <span class="panel-title">Detail Package</span>
            </div>
            <div class="panel-body">
               <?php if (intval($package) == 1) { ?>
                  <div class="plan-col">
                     <div class="plan-header bg-light-green darken">PLAN SILVER</div>
                     <div class="plan-pricing bg-light-green"><span class="plan-currency"></span><span class="plan-value">3 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
                     <ul class="plan-features">
                        <li>Daily Payments until 6 BTC Reached</li>
                        <li>Est. Duration: 100 Days</li>
                       
                        <li>0.06 BTC Daily For 100 Days!</li>
                        <!-- <a href="#" class="bg-light-green darken">DEPOSIT NOW</a> -->

                     </ul>
                  </div>
               <?php } ?>
               <?php if (intval($package) == 2) { ?>
                  <div class="plan-col">
                     <div class="plan-header bg-light-green darker">PLAN GOLD</div>
                     <div class="plan-pricing bg-light-green darken"><span class="plan-currency"></span><span class="plan-value">7 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
                     <ul class="plan-features">
                        <li>Daily Payments until 16 BTC Reached</li>
                        <li>Est. Duration: 100 Days</li>
        
                        <li>0.16 BTC Daily For 100 Days!</li>
                       
                     </ul>
                  </div>
               <?php } ?>
               <?php if (intval($package) == 3) { ?>
                  <div class="plan-col">
                     <div class="plan-header bg-light-green darken">PLAN PLATINUM</div>
                     <div class="plan-pricing bg-light-green"><span class="plan-currency"></span><span class="plan-value">10 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
                     <ul class="plan-features">
                        <li>Daily Payments until 28 BTC Reached</li>
                        <li>Est. Duration: 100 Days</li>
                        
                        <li>0.28 BTC Daily For 100 Days!</li>
                     </ul>
                  </div>
               <?php } ?>
               <?php if (intval($package) == 4) { ?>
                  <div class="plan-col">
                     <div class="plan-header bg-light-green darker">PLAN DIAMOIND</div>
                     <div class="plan-pricing bg-light-green darken"><span class="plan-currency"></span><span class="plan-value">20 <i class="fa fa-bitcoin"></i></span><span class="plan-period"></span></div>
                     <ul class="plan-features">
                        <li>Daily Payments until 65 BTC Reached</li>
                        <li>Est. Duration: 100 Days</li>
                        
                        <li>0.65 BTC Daily For 100 Days!</li>
                     </ul>
                  </div>
               <?php } ?>
              
            </div>
         </div>
      </div>
   </div>
</div>
<?php if(!$notCreate) { ?>
<script type="text/javascript">
   var str = 'We are waiting for 3 confirmation from <a style="color: #f0ad4e;" href="https://blockchain.info/" target="_blank">blockchain.info</a>';
   $('#websocket').html(str);
</script>
<?php }?>
<?php 
   echo $self -> load -> controller('common/footer'); 
   ?>