<?php 
$self->document->setTitle('Dashboard');
echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left');

?>
<script type="text/javascript">
// (function(){ var widget_id = 'Kj5usLKKyh';var d=document;var w=window;function l(){
// var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<div id="content-wrapper">
<div class="overlay">
 
  <?php $date = $self -> get_date_register_tree();   ?>
  <?php if ($date) { ?>
  <div class="text-center">
    <h1><span style="color:red" class="text-danger countdown" data-countdown="<?php echo $date; ?>"> </span></h1>
  </div>
      <div id="create-error" class="alert alert-dismissable alert-danger" style="display:none">
   </div>
    <div class="alert alert-warning">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>Warning!</strong> You have 45 minutes to activate the system on trees! If you do not enable you to be removed from the tree after all the time expiration
    </div>
    <div class="text-center">
      <button id="btn_active" type="button" class="btn btn-danger" data-link="<?php echo $self->url->link('account/account/active1BTC', '', 'SSL'); ?>">DEPOSIT NOW </button>
    </div>
  <?php } ?>
  <!-- / .page-header -->
  <div class="row">
    <div class="col-md-12">
    
      <div class="row">
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>OctaCapital Shares
            </h3>
            <span>0 Shares
            </span> 
            <i class="fa fa-star blue">
            </i>
            <h6>
              --
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Octa Bank Shares
            </h3>
            <span>0 Shares
            </span> 
            <i class="fa fa-star blue">
            </i>
            <h6>
              --
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Octa Energy Shares
            </h3>
            <span>0 Shares
            </span> 
            <i class="fa fa-bar-chart red">
            </i>
            <h6>
              <a href="members.php?page=oilgas">Buy Shares</a>
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Member package
            </h3>
            <span>Premium
            </span> 
            <i class="fa fa-bar-chart blue">
            </i>
            <h6>
               <a href="<?php echo $self->url->link('account/price', '', 'SSL'); ?>">Upgrade package</a> 
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Cash Account
            </h3>
            <span>$0.00
            </span> 
            <i class="fa fa-euro green">
            </i>
            <h6>
              Pending withdrawal:0
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Mandatory Account
            </h3>
            <span>$0.00
            </span> 
            <i class="fa fa-eur red">
            </i>
            <h6>
              --
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>NX Coin Account 
            </h3>
            <span>0.0000
            </span> 
            <i class="fa fa-bitcoin blue">
            </i>
            <h6>
              --
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>OPR Account 
            </h3>
            <span>0
            </span> 
            <i class="fa fa-bar-chart blue">
            </i>
            <h6>
                    Active Program Deposits: 35,311.2852                    
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Personally sponsored
            </h3>
            <span>0
            </span> 
            <i class="fa fa-users green">
            </i>
            <h6>
              PV Points : 0 
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Binary Team left
            </h3>
             <span class="total_left" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_binary_left', '', 'SSL'); ?>"></span>
            <i class="fa fa-sitemap red">
            </i>
            <h6>
              BV Points left: <span class="m-0 counter total_pd_left" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_pd_left', '', 'SSL'); ?>"></san>
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Binary Team right
            </h3>
            <span class="total_right" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_binary_right', '', 'SSL'); ?>"></span>
            <i class="fa fa-sitemap red">
            </i>
            <h6>
              BV Points right:
              <san class="m-0 counter total_pd_right" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/total_pd_right', '', 'SSL'); ?>"></san>
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="stats-counter">
            <h3>Team Bonus
            </h3>
            <span>$0.00
            </span> 
            <i class="fa fa-euro blue">
            </i>
            <h6>
              Total Team Bonus earned:€0.00
            </h6> 
          </div>
          <!-- Stats Counter -->   
        </div>
      </div>
    </div>
    <!-- /6. $EASY_PIE_CHARTS -->
    <div class="col-md-12">
      
      <div class="row">
        <div class="col-md-6">
          <div class="widget-area no-padding blank border-dark-gray">
            <div class="social-widget">
              <span id="fb">
                <i class="fa fa-users">
                </i>
              </span>
              <ul>
                <li>
                  <p>807,119
                    <i>
                    </i>
                  </p>
                  <h4>
                    <i>Total members
                    </i>
                  </h4>
                  <p>
                  </p>
                </li>
                <li>
                  <p>203
                    <i>
                    </i>
                  </p>
                  <h4>
                    <i>Total countries
                    </i>
                  </h4>
                  <p>
                  </p>
                </li>
              </ul>
            </div>
            <!-- Social Widget -->
          </div>
          <!-- Widget Area -->
        </div>
        <div class="col-md-6">
          <div class="widget-area new-member-frame">
            <div class="ribbon-wrapper">
              <div class="ribbon-design red">Welcome
              </div>
            </div>
            <h4>Latest members
            </h4>
         
            <div class="simply-scroll simply-scroll-container">
        <div class="simply-scroll-clip">
          <ul id="scroller" class="simply-scroll-list" style="width: 4080px;">
          <?php 
            foreach ($getall_user as $value) {
          ?>
            <li>
              <table width="200" border="0">
                <tbody>
                  <tr>
                    <td rowspan="2" width="60" align="center"> 
                      <img src="image/flag_icon/<?php echo $value['iso_code_2'];?>.svg" width="30" height="20">
                    </td>
                    <td align="left" valign="bottom">
                      <font face="Cambria, Hoefler Text, Liberation Serif, Times, Times New Roman, serif" size="3px">
                        <strong><?php echo $value['username'];?>
                        </strong>
                      </font>
                    </td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><?php echo $value['name'];?>
                    </td>
                  </tr>
                </tbody>
              </table>
            </li>
           
            <?php } ?>
              
          </ul>
        </div>
      </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- /9. $UNIQUE_VISITORS_STAT_PANEL -->
  <div class="clearfix" style="margin-right: 20px; margin-bottom:20px;">
  </div>
  
  <!-- edit  -->
  <div class="row">
    <div class="col-md-3">
      <div id="owl-demo" class="owl-carousel">
                  <div>
                    <div class="owl-item">
                       <li>
                          <i class="fa fa-line-chart" aria-hidden="true"></i>
                          <p>
                             <strong>LAST </strong>Result<br>
                             <strong>4.37%</strong>
                          </p>
                       </li>
                    </div>
                  </div>
                  <div>
                    <div class="owl-item">
                       <li>
                          <i class="fa fa-users"></i>
                          <p>
                             <strong>New members</strong>Yesterday<br>
                             <strong>452</strong>
                          </p>
                       </li>
                    </div>
                  </div>
                </div>
    </div>
    <div class="col-md-3 right_bottom">
      <div class="widget-area no-padding blank border-dark-gray">
        <div class="social-widget">
          <span id="fb">
            <i class="fa fa-users">
            </i>
          </span>
          <ul>
            <li>
              <p>808,316
                <i>
                </i>
              </p>
              <h4>
                <i>Total members
                </i>
              </h4>
              <p>
              </p>
            </li>
            <li>
              <p>203
                <i>
                </i>
              </p>
              <h4>
                <i>Total countries
                </i>
              </h4>
              <p>
              </p>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div> 
<script type="text/javascript">
      if (location.hash === '#success') {
         alertify.set('notifier','delay', 100000000);
         alertify.set('notifier','position', 'top-right');
         alertify.success('Create user successfull !!!');
      }
      
   </script>
<?php echo $self->load->controller('common/footer') ?>

